//
//  LoginViewModel.swift
//  WorkinOut
//
//  Created by Carlos Marcelo Tonisso Junior on 15/05/23.
//

import Foundation

enum LoginType {
    case email
    case google
}

protocol LoginViewModelDelegate: AnyObject {
    
}

final class LoginViewModel: ViewModel {

    weak var coordinator: AppCoordinator?

    init(_ coordinator: AppCoordinator) {
        self.coordinator = coordinator
    }

    func loginUserWith(_ type: LoginType, email: String?, password: String?) {
        
    }

    func goToRegister() {
        coordinator?.goToRegister()
    }

}
