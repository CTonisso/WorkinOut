//
//  LoginViewModel.swift
//  WorkinOut
//
//  Created by Carlos Marcelo Tonisso Junior on 15/05/23.
//

import Foundation

final class LoginViewModel {

    weak var coordinator: AuthCoordinator?
    var service: AuthenticationService

    init(_ coordinator: AuthCoordinator, service: AuthenticationService) {
        self.coordinator = coordinator
        self.service = service
    }

    func loginUserWithEmail(email: String, password: String) {
        service.loginUserWithEmail(email: email, password: password) { [weak self] didSucceed in
            if didSucceed {
                self?.coordinator?.login()
            } else {
                // self?.delegate?.loginFailed()
            }
        }
    }

    func loginUserWithGoogle() {
        service.loginUserWithGoogle(viewController: coordinator?.navigationController.topViewController) { [weak self] didSucceed in
            if didSucceed {
                self?.coordinator?.login()
            } else {
                // self?.delegate?.loginFailedForGoogle()
            }
        }
    }
    
    func goToRegister() {
        coordinator?.goToRegister()
    }

}
