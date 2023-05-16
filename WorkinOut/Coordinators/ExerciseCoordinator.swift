//
//  ExerciseCoordinator.swift
//  WorkinOut
//
//  Created by Carlos Marcelo Tonisso Junior on 16/05/23.
//

import FirebaseStorage
import Foundation
import UIKit

class ExerciseCoordinator: Coordinator {

    weak var parentCoordinator: Coordinator?
    var children: [Coordinator] = []
    var navigationController: UINavigationController
    var shouldUpdate: ((_: Bool) -> Void)?
    
    private let storage = Storage.storage()

    init(_ navigationController: UINavigationController = UINavigationController()) {
        self.navigationController = navigationController
        start()
    }

    func start() {
        navigationController.setViewControllers([ExercisesViewController(viewModel: ExercisesViewModel(self))], animated: true)
        NavBarUtils.configureNavigationBar(for: navigationController)
    }

    func goToAddExercise() {
        let storageRef = storage.reference().child("exercise_images")
        var viewModel = AddExerciseViewModel(self, storageReference: storegeRef)
        navigationController.present(AddExerciseViewController(viewModel: viewModel), animated: true)
    }

    func pop() {
        navigationController.popViewController(animated: true)
    }

}

