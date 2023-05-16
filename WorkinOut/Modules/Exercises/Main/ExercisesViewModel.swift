//
//  ExercisesViewModel.swift
//  WorkinOut
//
//  Created by Carlos Marcelo Tonisso Junior on 16/05/23.
//

import Foundation
protocol ExercisesViewModelDelegate: AnyObject {
    func didFetchExercises()
}

class ExercisesViewModel {

    weak var coordinator: ExerciseCoordinator?
    weak var delegate: ExercisesViewModelDelegate?
    private var exercises: [Exercise] = []
    
    init(_ coordinator: ExerciseCoordinator) {
        self.coordinator = coordinator
    }
    
    func fetchExercises() {
        exercises = DataManager.shared.fetchExercises()
        delegate?.didFetchExercises()
    }

    func addExercise() {
        coordinator?.goToAddExercise()
    }

    func workoutAt(_ indexPath: IndexPath) -> Exercise {
        return exercises[indexPath.row]
    }

    func numberOfWorkouts() -> Int {
        return exercises.count
    }

}
