//
//  WorkoutsViewModel.swift
//  WorkinOut
//
//  Created by Carlos Marcelo Tonisso Junior on 15/05/23.
//

import Foundation

protocol WorkoutsViewModelDelegate: AnyObject {
    func didFetchWorkouts()
}

class WorkoutsViewModel {
    
    weak var coordinator: WorkoutsCoordinator?
    weak var delegate: WorkoutsViewModelDelegate?
    private var date = Date()
    private var workouts: [Workout] = []

    init(_ coordinator: WorkoutsCoordinator) {
        self.coordinator = coordinator
    }

    func fetchWorkouts(for date: Date?) {
        workouts = DataManager.shared.fetchWorkouts(for: date)
        delegate?.didFetchWorkouts()
        guard let unwrapedDate = date else { return }
        self.date = unwrapedDate
    }

    func addWorkout() {
        coordinator?.goToAddWorkout() { update in
            if update {
                self.fetchWorkouts(for: nil)
            }
        }
    }
    
    func showWorkoutDetails(at indexPath: IndexPath) {
        coordinator?.goToWorkoutDetails(workout: workouts[indexPath.row])
    }

    func workoutAt(_ indexPath: IndexPath) -> Workout {
        return workouts[indexPath.row]
    }

    func numberOfWorkouts() -> Int {
        return workouts.count
    }

}
