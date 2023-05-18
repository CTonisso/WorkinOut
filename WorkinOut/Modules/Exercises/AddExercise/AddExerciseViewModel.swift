//
//  AddExerciseViewModel.swift
//  WorkinOut
//
//  Created by Carlos Marcelo Tonisso Junior on 16/05/23.
//

import Foundation

class AddExerciseViewModel {
    
    weak private var coordinator: ExerciseCoordinator?
    weak internal var delegate: AddExerciseViewModelDelegate?
    private let service: FirebaseDataService
    
    internal init(_ coordinator: ExerciseCoordinator, service: FirebaseDataService) {
        self.coordinator = coordinator
        self.service = service
    }

    internal func addExercise(name: String, description: String, imageData: Data?) {
        service.uploadExercise(name: name, description: description, imageData: imageData) {
            self.coordinator?.dismiss(shouldUpdateParent: true)
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
