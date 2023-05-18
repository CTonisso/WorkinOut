//
//  ExerciseCoordinator.swift
//  WorkinOut
//
//  Created by Carlos Marcelo Tonisso Junior on 16/05/23.
//

import Foundation
import UIKit

class ExerciseCoordinator: Coordinator, UINavigationControllerDelegate {

    private var shouldUpdate: ((_: Bool) -> Void)?
    private var updateWithImage: ((_: UIImage) -> Void)?
    private let service = FirebaseDataService()

    override internal func start() {
        let viewModel = ExercisesViewModel(self, service: service)
        navigationController.setViewControllers([ExercisesViewController(viewModel: viewModel)], animated: true)
        NavBarUtils.configureNavigationBar(for: navigationController)
    }

    func goToAddExercise(completion: ((_: Bool) -> Void)? = nil) {
        let viewModel = AddExerciseViewModel(self, service: FirebaseDataService())
        navigationController.present(AddExerciseViewController(viewModel: viewModel), animated: true)
        shouldUpdate = completion
    }

    func presentImagePicker(_ completion: @escaping ((_: UIImage) -> Void)) {
        let imagePickerController = UIImagePickerController()
        imagePickerController.delegate = self
        imagePickerController.sourceType = UIImagePickerController.SourceType.photoLibrary
        imagePickerController.allowsEditing = true
        updateWithImage = completion

        navigationController.presentedViewController?.present(imagePickerController, animated: true)
    }

    func pop() {
        navigationController.popViewController(animated: true)
    }

    func dismiss(shouldUpdateParent: Bool = false) {
        navigationController.dismiss(animated: true) { [weak self] in
            // TODO: Passar no init
            self?.shouldUpdate?(shouldUpdateParent)
        }
    }

}

extension ExerciseCoordinator: UIImagePickerControllerDelegate {
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        guard let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage else { return }
        self.updateWithImage?(image)

        navigationController.presentedViewController?.dismiss(animated: true, completion: nil)
    }

}
