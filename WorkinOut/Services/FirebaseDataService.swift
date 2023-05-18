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

    internal func uploadExercise(name: String, notes: String, imageData: Data?, completion: @escaping (() -> Void)) {
        guard let unwrapedImageData = imageData else { return }
        uploadMedia(imageData: unwrapedImageData) { url in
            let exercise = DataManager.shared.createExercise(name: name, image: url, notes: notes, workout: nil)
            self.uploadExerciseData(exercise: exercise, completion: completion)
        }
    }

    private func uploadMedia(imageData: Data, completion: @escaping (_ url: URL) -> Void) {
        let storageReference = storage.reference().child("exercise_images")
        storageReference.child(UUID().uuidString).putData(imageData, metadata: nil) { (metadata, error) in
            guard let unwrapedMetadata = metadata,
                  let path = unwrapedMetadata.path,
                  let url = URL(string: path) else {
                      //TODO: Implement crashlytics
                      return
                  }
            completion(url)
        }
    }

    private func uploadExerciseData(exercise: Exercise, completion: @escaping (() -> Void)) {
        let firestoreReference = firestoreDatabase.collection("exercises")

        guard let uuid = exercise.id?.uuidString,
              let name = exercise.name,
              let url = exercise.image?.absoluteString else { return }
        let docData: [String: Any] = [
            "name": name,
            "imageURL": url
        ]

        firestoreReference.document(uuid).setData(docData) { error in
            if let error = error {
                // TODO: Implement crashlytics
            }
            completion()
        }
    }

}
