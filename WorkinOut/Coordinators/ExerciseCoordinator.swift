//
//  ExerciseCoordinator.swift
//  WorkinOut
//
//  Created by Carlos Marcelo Tonisso Junior on 16/05/23.
//

import FirebaseStorage
import FirebaseFirestore
import Foundation
import UIKit

class ExerciseCoordinator: Coordinator, UINavigationControllerDelegate {

    private var shouldUpdate: ((_: Bool) -> Void)?
    private var updateWithImage: ((_: UIImage) -> Void)?
    
    private let storage = Storage.storage()
    private let firestoreDatabase: Firestore

    override internal init(_ navigationController: UINavigationController = UINavigationController()) {
        self.firestoreDatabase = Firestore.firestore()
        super.init(navigationController)
    }

    override internal func start() {
        navigationController.setViewControllers([ExercisesViewController(viewModel: ExercisesViewModel(self))], animated: true)
        NavBarUtils.configureNavigationBar(for: navigationController)
    }

    func goToAddExercise() {
        let storageRef = storage.reference().child("exercise_images")
        let viewModel = AddExerciseViewModel(self, storageRef: storageRef, firestore: firestoreDatabase.collection("exercises"))
        navigationController.present(AddExerciseViewController(viewModel: viewModel), animated: true)
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
