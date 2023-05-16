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
        configureNavigationBar()
//        navigationController.becomeFirstResponder()
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

    func configureNavigationBar() {
        let appearance = UINavigationBarAppearance()
        appearance.backgroundColor = .darkGray
        appearance.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.highlightYellow]
        appearance.largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.highlightYellow]
        navigationController.navigationBar.backgroundColor = .darkGray
        navigationController.navigationBar.scrollEdgeAppearance = appearance
        navigationController.navigationBar.standardAppearance = appearance
        navigationController.navigationBar.isHidden = false
        navigationController.navigationBar.prefersLargeTitles = true
    }
}
