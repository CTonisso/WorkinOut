//
//  AddExerciseViewModel.swift
//  WorkinOut
//
//  Created by Carlos Marcelo Tonisso Junior on 16/05/23.
//

import Foundation
import FirebaseStorage
import UIKit

class AddExerciseViewModel {
    
    weak var coordinator: ExerciseCoordinator?
    let storageReference: StorageReference
    
    init(_ coordinator: ExerciseCoordinator, storageRef: StorageReference) {
        self.coordinator = coordinator
        self.storageReference = storageRef
    }

    func addExercise(name: String, notes: String, imageData: Data?) {
        guard let unwrapedImageData = imageData else { return }
        uploadMedia(imageData: unwrapedImageData) { url in
            
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

}
