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

internal protocol AddExerciseViewModelDelegate: AnyObject {
    func didSelectImage(_ image: UIImage)
}

class AddExerciseViewModel {
    
    weak private var coordinator: ExerciseCoordinator?
    weak internal var delegate: AddExerciseViewModelDelegate?
    private let storageReference: StorageReference
    private let firestore: CollectionReference
    
    internal init(_ coordinator: ExerciseCoordinator, storageRef: StorageReference, firestore: CollectionReference) {
        self.coordinator = coordinator
        self.storageReference = storageRef
        self.firestore = firestore
    }

    internal func addExercise(name: String, notes: String, imageData: Data?) {
        guard let unwrapedImageData = imageData else { return }
        uploadMedia(imageData: unwrapedImageData) { url in
            let exercise = DataManager.shared.createExercise(name: name, image: url, notes: notes, workout: nil)
            self.uploadExerciseData(exercise: exercise)
        }
    }

    private func uploadMedia(imageData: Data, completion: @escaping (_ url: URL) -> Void) {
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

    private func uploadExerciseData(exercise: Exercise) {
        guard let uuid = exercise.id?.uuidString,
              let name = exercise.name,
              let url = exercise.image?.absoluteString else { return }
        let docData: [String: Any] = [
            "name": name,
            "imageURL": url
        ]

        firestore.document(uuid).setData(docData) { [weak self] error in
            if let error = error {
                // TODO: Implement crashlytics
            }
            self?.coordinator?.dismiss(shouldUpdateParent: true)
        }
    }

    internal func presentImagePicker() {
        coordinator?.presentImagePicker() { image in
            self.delegate?.didSelectImage(image)
        }
    }

    internal func cancel() {
        coordinator?.dismiss()
    }
    
}
