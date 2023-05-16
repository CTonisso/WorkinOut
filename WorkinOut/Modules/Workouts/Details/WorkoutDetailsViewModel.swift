//
//  WorkoutDetailsViewModel.swift
//  WorkinOut
//
//  Created by Carlos Marcelo Tonisso Junior on 16/05/23.
//

import Foundation

class WorkoutDetailsViewModel: ViewModel {
    
    var coordinator: AppCoordinator?
    private var workout: Workout
    
    init(_ coordinator: AppCoordinator, workout: Workout) {
        self.coordinator = coordinator
        self.workout = workout
    }

}
