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
    var shouldUpdate: ((_: Bool) -> Void)?

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

    func goToAddWorkout(completion: ((_: Bool) -> Void)? = nil) {
        navigationController.present(AddWorkoutViewController(viewModel: AddWorkoutViewModel(self)), animated: true)
        shouldUpdate = completion
    }

    func dismiss(shouldUpdateParent: Bool = false) {
        navigationController.dismiss(animated: true) { [weak self] in
            self?.shouldUpdate?(shouldUpdateParent)
        }
    }

    func viewController() -> UIViewController {
        guard let viewController = navigationController.topViewController else { return navigationController.viewControllers[0] }
        return viewController
    }

}
