//
//  WorkoutDetailsViewModel.swift
//  WorkinOut
//
//  Created by Carlos Marcelo Tonisso Junior on 16/05/23.
//

import Foundation

internal protocol WorkoutDetailsViewModelDelegate: AnyObject {
    func updateViewWith(_ workout: Workout)
    func updateTableView()
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

    func fetchExercises() {
        guard let _ = workout.exercises else { return }
        self.exercises = DataManager.shared.fetchExercises(for: workout)
    }

    func getCurrentWorkout() {
        delegate?.updateViewWith(workout)
    }

    func addExercise() {
        coordinator?.addExerciseToWorkout(workout) { [weak self] exercise in
            guard let self = self else { return }
            self.exercises.append(DataManager.shared.createExercise(id: exercise.id, name: exercise.name, image: exercise.imageURL, notes: "Teste", workout: self.workout))
            self.delegate?.updateTableView()
        }
    }

    func exerciseAt(_ indexPath: IndexPath) -> Exercise {
        return exercises[indexPath.row]
    }

    func numberOfExercises() -> Int {
        return exercises.count
    }

}
