//
//  AddWorkoutViewModel.swift
//  WorkinOut
//
//  Created by Carlos Marcelo Tonisso Junior on 16/05/23.
//

import Foundation

class AddWorkoutViewModel {

    weak var coordinator: WorkoutsCoordinator?
    
    init(_ coordinator: WorkoutsCoordinator) {
        self.coordinator = coordinator
    }
    
    func addWorkout(name: String, description: String, date: Date) {
        let _ = DataManager.shared.createWorkout(name: name, description: description, date: date)
        coordinator?.dismiss(shouldUpdateParent: true)
    }

    func cancel() {
        coordinator?.dismiss()
    }

}
