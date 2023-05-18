//
//  WorkoutDetailsViewModel.swift
//  WorkinOut
//
//  Created by Carlos Marcelo Tonisso Junior on 16/05/23.
//

import Foundation

internal protocol WorkoutDetailsViewModelDelegate: AnyObject {
    func updateViewWith(_ workout: Workout)
}

class WorkoutDetailsViewModel {
    
    weak var coordinator: WorkoutsCoordinator?
    weak var delegate: WorkoutDetailsViewModelDelegate?
    private var workout: Workout
    private var exercises: [Exercise] = []
    
    init(_ coordinator: WorkoutsCoordinator, workout: Workout) {
        self.coordinator = coordinator
        self.workout = workout
    }

    func getCurrentWorkout() {
        delegate?.updateViewWith(workout)
    }

    func addExercise() {
        coordinator?.addExerciseToWorkout(workout) {
            
        }
    }

    func exerciseAt(_ indexPath: IndexPath) -> Exercise {
        return exercises[indexPath.row]
    }

    func numberOfExercises() -> Int {
        return exercises.count
    }

}
