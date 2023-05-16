//
//  WorkoutDetailsViewModel.swift
//  WorkinOut
//
//  Created by Carlos Marcelo Tonisso Junior on 16/05/23.
//

import Foundation

class WorkoutDetailsViewModel {
    
    weak var coordinator: WorkoutsCoordinator?
    private var workout: Workout
    
    init(_ coordinator: WorkoutsCoordinator, workout: Workout) {
        self.coordinator = coordinator
        self.workout = workout
    }

}
