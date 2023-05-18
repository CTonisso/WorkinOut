//
//  AppCoordinator.swift
//  WorkinOut
//
//  Created by Carlos Marcelo Tonisso Junior on 15/05/23.
//

import Foundation
import UIKit

class Coordinator: NSObject {

    internal var parentCoordinator: Coordinator?
    internal var children: [Coordinator] = []
    internal var navigationController: UINavigationController

    public init(_ navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    internal func start() {
        preconditionFailure("This method needs to be overriden by concrete subclass.")
    }

}

class AppCoordinator: Coordinator {

    private let defaults = UserDefaults.standard

    override internal func start() {
        if defaults.bool(forKey: "isLoggedIn") {
            navigationController.navigationBar.isHidden = true
            let coordinator = TabBarCoordinator(navigationController)
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
