//
//  AppCoordinator.swift
//  WorkinOut
//
//  Created by Carlos Marcelo Tonisso Junior on 15/05/23.
//

import Foundation
import UIKit

protocol Coordinator: AnyObject {
    var parentCoordinator: Coordinator? { get set }
    var children: [Coordinator] { get set }
    var navigationController: UINavigationController { get set }

    func start()
}

class AppCoordinator: Coordinator {

    var parentCoordinator: Coordinator?
    var children: [Coordinator] = []
    var navigationController: UINavigationController
    private var isLoggedIn: Bool

    init(_ navigationController: UINavigationController, isLoggedIn: Bool = true) {
        self.navigationController = navigationController
        self.isLoggedIn = isLoggedIn
    }

    func start() {
        if isLoggedIn {
            navigationController.navigationBar.isHidden = true
            let coordinator = TabBarCoordinator(navigationController: navigationController)
            children.removeAll()
            coordinator.parentCoordinator = self
            coordinator.start()
        } else {
            let coordinator = AuthCoordinator(navigationController)
            coordinator.parentCoordinator = self
            children.append(coordinator)
            coordinator.start()
        }
    }

}

extension AppCoordinator {

    func configureTabBar(workouts: UINavigationController, exercise: UINavigationController) -> UITabBarController {
        let tabBarController = UITabBarController()
        
//        let workoutsViewController = WorkoutsViewController(viewModel: WorkoutsViewModel(self))
//        let exercisesViewController = ExercisesViewController(viewModel: ExercisesViewModel(self))
        
        let tabBarControllers = [workouts,
                                 exercise]
        
        tabBarController.setViewControllers(tabBarControllers, animated: false)
        tabBarController.selectedViewController = workouts
        
        return tabBarController
    }

    func configureNavigationBarAppearance() {
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
