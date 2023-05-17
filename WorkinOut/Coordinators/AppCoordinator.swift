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
    private let defaults = UserDefaults.standard

    init(_ navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    func start() {
        if defaults.bool(forKey: "isLoggedIn") {
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
