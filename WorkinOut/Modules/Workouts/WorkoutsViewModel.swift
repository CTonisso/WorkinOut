//
//  WorkoutsViewModel.swift
//  WorkinOut
//
//  Created by Carlos Marcelo Tonisso Junior on 15/05/23.
//

import Foundation

class WorkoutsViewModel: ViewModel {
    weak var coordinator: AppCoordinator?
    
    init(_ coordinator: AppCoordinator) {
        self.coordinator = coordinator
    }

}
