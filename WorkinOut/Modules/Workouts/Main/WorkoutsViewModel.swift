//
//  WorkoutsViewModel.swift
//  WorkinOut
//
//  Created by Carlos Marcelo Tonisso Junior on 15/05/23.
//

import Foundation

protocol WorkoutsViewModelDelegate: AnyObject {
    func didFetchWorkouts(workouts: [Workout])
}

class WorkoutsViewModel: ViewModel {
    
    weak var coordinator: AppCoordinator?
    weak var delegate: WorkoutsViewModelDelegate?
    private var date = Date()

    init(_ coordinator: AppCoordinator) {
        self.coordinator = coordinator
    }

    func fetchWorkouts(for date: Date) {
        let workouts = DataManager.shared.fetchWorkouts(for: date)
        self.date = date
        delegate?.didFetchWorkouts(workouts: workouts)
    }

    func addWorkout() {
        coordinator?.goToAddWorkout(completion: { update in
            if update {
                self.fetchWorkouts(for: self.date)
            }
        })
    }

}
