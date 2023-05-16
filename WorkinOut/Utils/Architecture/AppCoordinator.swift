//
//  AppCoordinator.swift
//  WorkinOut
//
//  Created by Carlos Marcelo Tonisso Junior on 15/05/23.
//

import Foundation
import UIKit

protocol Coordinator {
    var parentCoordinator: Coordinator? { get set }
    var children: [Coordinator] { get set }
    var navigationController: UINavigationController { get set }

    func start()
}

class AppCoordinator: Coordinator {

    var parentCoordinator: Coordinator?
    var children: [Coordinator] = []
    var navigationController: UINavigationController

    init(_ navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    func start() {
        goToWorkouts()
    }

    func goToLogin() {
        navigationController.pushViewController(LoginViewController(viewModel: LoginViewModel(self)), animated: true)
    }

    func goToRegister() {
        // TODO
    }

    func goToWorkouts() {
        navigationController.setViewControllers([WorkoutsViewController(viewModel: WorkoutsViewModel(self))], animated: true)
    }

    func goToAddWorkout() {
        navigationController.present(AddWorkoutViewController(viewModel: AddWorkoutViewModel(self)), animated: true)
    }

    func viewController() -> UIViewController {
        guard let viewController = navigationController.topViewController else { return navigationController.viewControllers[0] }
        return viewController
    }

}
