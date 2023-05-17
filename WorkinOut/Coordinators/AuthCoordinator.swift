//
//  AuthCoordinator.swift
//  WorkinOut
//
//  Created by Carlos Marcelo Tonisso Junior on 16/05/23.
//

import Foundation
import UIKit

class AuthCoordinator: Coordinator {

    weak var parentCoordinator: Coordinator?
    var children: [Coordinator] = []
    var navigationController: UINavigationController
    var shouldUpdate: ((_: Bool) -> Void)?
    private let defaults = UserDefaults.standard

    init(_ navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    func start() {
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
