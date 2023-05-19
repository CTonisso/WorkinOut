//
//  AuthCoordinator.swift
//  WorkinOut
//
//  Created by Carlos Marcelo Tonisso Junior on 16/05/23.
//

import Foundation
import UIKit

class AuthCoordinator: Coordinator {

    private let defaults = UserDefaults.standard
    private let service = AuthenticationService()

    override internal func start() {
        navigationController.setViewControllers([LoginViewController(viewModel: LoginViewModel(self, service: service))], animated: true)
    }

    func goToRegister() {
        navigationController.navigationBar.tintColor = .highlightYellow
        let viewModel = RegisterViewModel(self, service: service)
        navigationController.pushViewController(RegisterViewController(viewModel: viewModel), animated: true)
    }

    func login() {
        defaults.set(true, forKey: "isLoggedIn")
        parentCoordinator?.start()
    }
    
    func pop() {
        navigationController.popViewController(animated: true)
    }

}
