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

    override internal func start() {
        navigationController.setViewControllers([LoginViewController(viewModel: LoginViewModel(self))], animated: true)
    }

    func goToRegister() {
        // TODO
    }

    func login() {
        defaults.set(true, forKey: "isLoggedIn")
        parentCoordinator?.start()
    }
    
    func pop() {
        navigationController.popViewController(animated: true)
    }

}
