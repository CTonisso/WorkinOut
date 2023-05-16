//
//  WorkoutsCoordinator.swift
//  WorkinOut
//
//  Created by Carlos Marcelo Tonisso Junior on 16/05/23.
//

import Foundation
import UIKit

class WorkoutsCoordinator: Coordinator {

    var parentCoordinator: Coordinator?
    var children: [Coordinator] = []
    var navigationController: UINavigationController
    var shouldUpdate: ((_: Bool) -> Void)?

    init(_ navigationController: UINavigationController) {
        self.navigationController = navigationController
        start()
    }

    func start() {
        navigationController.setViewControllers([WorkoutsViewController(viewModel: WorkoutsViewModel(self))], animated: true)
        NavBarUtils.configureNavigationBar(for: navigationController)
    }

    func goToMain() {
        navigationController.popToRootViewController(animated: true)
    }

    func goToAddWorkout(completion: ((_: Bool) -> Void)? = nil) {
        navigationController.present(AddWorkoutViewController(viewModel: AddWorkoutViewModel(self)), animated: true)
        shouldUpdate = completion
    }

    func goToWorkoutDetails(workout: Workout) {
        navigationController.pushViewController(WorkoutDetailsViewController(viewModel: WorkoutDetailsViewModel(self, workout: workout)), animated: true)
    }

    func dismiss(shouldUpdateParent: Bool = false) {
        navigationController.dismiss(animated: true) { [weak self] in
            self?.shouldUpdate?(shouldUpdateParent)
        }
    }

}
