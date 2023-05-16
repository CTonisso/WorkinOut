//
//  ExerciseCoordinator.swift
//  WorkinOut
//
//  Created by Carlos Marcelo Tonisso Junior on 16/05/23.
//

import Foundation
import UIKit

class ExerciseCoordinator: Coordinator {

    weak var parentCoordinator: Coordinator?
    var children: [Coordinator] = []
    var navigationController: UINavigationController
    var shouldUpdate: ((_: Bool) -> Void)?

    init(_ navigationController: UINavigationController = UINavigationController()) {
        self.navigationController = navigationController
        start()
    }

    func start() {
        navigationController.setViewControllers([ExercisesViewController(viewModel: ExercisesViewModel(self))], animated: true)
    }

    func goToRegister() {
        // TODO
    }

    func pop() {
        navigationController.popViewController(animated: true)
    }

}

