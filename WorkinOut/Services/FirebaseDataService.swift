//
//  FirebaseDataService.swift
//  WorkinOut
//
//  Created by Carlos Marcelo Tonisso Junior on 18/05/23.
//

import Foundation
import FirebaseStorage
import FirebaseFirestore

internal class FirebaseDataService {
    
    private let storage: Storage
    private let firestoreDatabase: Firestore

    init() {
        self.storage = Storage.storage()
        self.firestoreDatabase = Firestore.firestore()
    }

    internal func uploadExercise(name: String, description: String, imageData: Data?, completion: @escaping (() -> Void)) {
        guard let unwrapedImageData = imageData else { return }
        uploadMedia(imageData: unwrapedImageData) { url in
            let exercise = DetailedExercise(id: UUID(), name: name, description: description, imageURL: url)
            self.uploadExerciseData(exercise: exercise, completion: completion)
        }
    }

    internal func getExercises(completion: @escaping (_ exercises: [DetailedExercise]) -> Void) {
        let firestoreReference = firestoreDatabase.collection("exercises")
        var detailedExercises: [DetailedExercise] = []
        
        firestoreReference.getDocuments { querySnapshot, error in
            if let error = error {
                // TODO: Implement user feedback
            } else {
                for document in querySnapshot!.documents {
                    let exercise = DetailedExercise(id: UUID(uuidString: document.documentID)!, parameters: document.data())
                    detailedExercises.append(exercise)
                }
                completion(detailedExercises)
            }
        }
        
    }

    private func uploadMedia(imageData: Data, completion: @escaping (_ url: URL) -> Void) {
        let storageReference = storage.reference().child("exercise_images").child(UUID().uuidString)
        storageReference.putData(imageData, metadata: nil) { (metadata, error) in
            guard error == nil else {
                      //TODO: Implement user feedback
                      return
                  }
            storageReference.downloadURL { url, error in
                guard let url = url, error == nil else {
                    //TODO: Implement user feedback
                    return
                }
                completion(url)
            }
            
        }
    }

    private func uploadExerciseData(exercise: DetailedExercise, completion: @escaping (() -> Void)) {
        let firestoreReference = firestoreDatabase.collection("exercises")

        let docData: [String: Any] = [
            "name": exercise.name,
            "description": exercise.description,
            "imageURL": exercise.imageURL.absoluteString
        ]

        firestoreReference.document(exercise.id.uuidString).setData(docData) { error in
            guard error == nil else {
                // TODO: Implement user feedback
                return
            }
            completion()
        }
    }

}
