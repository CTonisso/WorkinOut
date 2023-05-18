//
//  ExercisesViewModel.swift
//  WorkinOut
//
//  Created by Carlos Marcelo Tonisso Junior on 16/05/23.
//

import Foundation
internal protocol ExercisesViewModelDelegate: AnyObject {
    func didFetchExercises()
}

internal class ExercisesViewModel {

    private weak var coordinator: ExerciseCoordinator?
    private weak var delegate: ExercisesViewModelDelegate?
    private var exercises: [Exercise] = [DataManager.shared.createExercise(name: "Flexão", image: URL(string: "https://png.pngtree.com/png-clipart/20190618/original/pngtree-push-ups-fitness-fitness-man-the-man-png-image_3922517.jpg")!, notes: "", workout: nil),
                                         DataManager.shared.createExercise(name: "Flexão", image: URL(string: "https://png.pngtree.com/png-clipart/20190618/original/pngtree-push-ups-fitness-fitness-man-the-man-png-image_3922517.jpg")!, notes: "", workout: nil),
                                         DataManager.shared.createExercise(name: "Flexão", image: URL(string: "https://png.pngtree.com/png-clipart/20190618/original/pngtree-push-ups-fitness-fitness-man-the-man-png-image_3922517.jpg")!, notes: "", workout: nil),
                                         DataManager.shared.createExercise(name: "Flexão", image: URL(string: "https://png.pngtree.com/png-clipart/20190618/original/pngtree-push-ups-fitness-fitness-man-the-man-png-image_3922517.jpg")!, notes: "", workout: nil),
                                         DataManager.shared.createExercise(name: "Flexão", image: URL(string: "https://png.pngtree.com/png-clipart/20190618/original/pngtree-push-ups-fitness-fitness-man-the-man-png-image_3922517.jpg")!, notes: "", workout: nil),
                                         DataManager.shared.createExercise(name: "Flexão", image: URL(string: "https://png.pngtree.com/png-clipart/20190618/original/pngtree-push-ups-fitness-fitness-man-the-man-png-image_3922517.jpg")!, notes: "", workout: nil),
                                         DataManager.shared.createExercise(name: "Flexão", image: URL(string: "https://png.pngtree.com/png-clipart/20190618/original/pngtree-push-ups-fitness-fitness-man-the-man-png-image_3922517.jpg")!, notes: "", workout: nil),
                                         DataManager.shared.createExercise(name: "Flexão", image: URL(string: "https://png.pngtree.com/png-clipart/20190618/original/pngtree-push-ups-fitness-fitness-man-the-man-png-image_3922517.jpg")!, notes: "", workout: nil),
                                         DataManager.shared.createExercise(name: "Flexão", image: URL(string: "https://png.pngtree.com/png-clipart/20190618/original/pngtree-push-ups-fitness-fitness-man-the-man-png-image_3922517.jpg")!, notes: "", workout: nil)]
    
    internal init(_ coordinator: ExerciseCoordinator) {
        self.coordinator = coordinator
    }
    
    internal func fetchExercises() {
        exercises = DataManager.shared.fetchExercises()
        delegate?.didFetchExercises()
    }

    internal func addExercise() {
        coordinator?.goToAddExercise()
    }

    internal func exerciseAt(_ indexPath: IndexPath) -> Exercise {
        return exercises[indexPath.row]
    }

    internal func numberOfExercises() -> Int {
        return exercises.count
    }

}
