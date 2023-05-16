//
//  AuthCoordinator.swift
//  WorkinOut
//
//  Created by Carlos Marcelo Tonisso Junior on 16/05/23.
//

import Foundation
import UIKit

class AuthCoordinator: Coordinator {

    var parentCoordinator: Coordinator?
    var children: [Coordinator] = []
    var navigationController: UINavigationController
    var shouldUpdate: ((_: Bool) -> Void)?

    init(_ navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    func start() {
        navigationController.setViewControllers([LoginViewController(viewModel: LoginViewModel(self))], animated: true)
    }

    func goToRegister() {
        // TODO
    }

    func pop() {
        navigationController.popViewController(animated: true)
    }

}
