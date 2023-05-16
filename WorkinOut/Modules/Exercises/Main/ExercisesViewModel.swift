//
//  ExercisesViewModel.swift
//  WorkinOut
//
//  Created by Carlos Marcelo Tonisso Junior on 16/05/23.
//

import Foundation

class ExercisesViewModel {

    weak var coordinator: ExerciseCoordinator?
    
    init(_ coordinator: ExerciseCoordinator) {
        self.coordinator = coordinator
    }
    
}
