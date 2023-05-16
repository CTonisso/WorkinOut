//
//  AddWorkoutViewModel.swift
//  WorkinOut
//
//  Created by Carlos Marcelo Tonisso Junior on 16/05/23.
//

import Foundation

class AddWorkoutViewModel: ViewModel {

    weak var coordinator: AppCoordinator?
    
    init(_ coordinator: AppCoordinator) {
        self.coordinator = coordinator
    }
    
    func addWorkout(name: String, description: String, date: Date) {
        let _ = DataManager.shared.createWorkout(name: name, description: description, date: date)
        coordinator?.pop(shouldUpdateParent: true)
    }

    func cancel() {
        coordinator?.pop()
    }

}
