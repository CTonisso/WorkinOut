//
//  AddExerciseViewModel.swift
//  WorkinOut
//
//  Created by Carlos Marcelo Tonisso Junior on 16/05/23.
//

import Foundation
import FirebaseStorage
import FirebaseFirestore
import UIKit

class AddExerciseViewModel {
    
    weak var coordinator: ExerciseCoordinator?
    let storageReference: StorageReference
    let firestore: CollectionReference
    
    init(_ coordinator: ExerciseCoordinator, storageRef: StorageReference, firestore: CollectionReference) {
        self.coordinator = coordinator
        self.storageReference = storageRef
        self.firestore = firestore
    }

    func addExercise(name: String, notes: String, imageData: Data?) {
        guard let unwrapedImageData = imageData else { return }
        uploadMedia(imageData: unwrapedImageData) { url in
            let exercise = DataManager.shared.createExercise(name: name, image: url, notes: notes, workout: nil)
            self.uploadExerciseData(exercise: exercise)
        }
    }
    
    func uploadMedia(imageData: Data, completion: @escaping (_ url: URL) -> Void) {
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
    
    func uploadExerciseData(exercise: Exercise) {
        guard let uuid = exercise.id?.uuidString,
              let name = exercise.name,
              let notes = exercise.notes,
              let url = exercise.image else { return }
        let docData: [String: Any] = [
            "name": name,
            "notes": notes,
            "imageURL": url
        ]

        firestore.document(uuid).setData(docData) { error in
            // TODO: Implement crashlytics
        }
    }

}
