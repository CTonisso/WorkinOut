//
//  RegisterViewModel.swift
//  WorkinOut
//
//  Created by Carlos Marcelo Tonisso Junior on 18/05/23.
//

import Foundation

class RegisterViewModel {
    
    weak var coordinator: AuthCoordinator?
    var service: AuthenticationService

    init(_ coordinator: AuthCoordinator, service: AuthenticationService) {
        self.coordinator = coordinator
        self.service = service
    }

    func register(withEmail email: String, password: String) {
        service.register(withEmail: email, password: password) { [weak self] didSucceed in
            if didSucceed {
                self?.coordinator?.login()
            } else {
                // self?.delegate?.registrationFailedWithError(error)
            }
        }
    }

}
