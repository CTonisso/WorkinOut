//
//  ExercisesViewModel.swift
//  WorkinOut
//
//  Created by Carlos Marcelo Tonisso Junior on 16/05/23.
//

import Foundation
internal protocol ExercisesViewModelDelegate: AnyObject {
    func didFetchExercises()
}

internal class ExercisesViewModel {

    private weak var coordinator: ExerciseCoordinator?
    internal weak var delegate: ExercisesViewModelDelegate?
    private var exercises: [DetailedExercise] = []
    private let service: FirebaseDataService
    
    internal init(_ coordinator: ExerciseCoordinator, service: FirebaseDataService) {
        self.coordinator = coordinator
        self.service = service
    }
    
    internal func fetchExercises() {
        service.getExercises { [weak self] exercises in
            self?.exercises = exercises
            self?.delegate?.didFetchExercises()
        }
    }

    internal func addExercise() {
        coordinator?.goToAddExercise() { update in
            if update {
                self.fetchExercises()
            }
        }
    }

    internal func exerciseAt(_ indexPath: IndexPath) -> DetailedExercise {
        return exercises[indexPath.row]
    }

    internal func numberOfExercises() -> Int {
        return exercises.count
    }

}
