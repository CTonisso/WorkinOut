//
//  WorkoutDetailsViewController.swift
//  WorkinOut
//
//  Created by Carlos Marcelo Tonisso Junior on 16/05/23.
//

import Foundation
import UIKit

class WorkoutDetailsViewController: UIViewController {
    
    private var viewModel: WorkoutDetailsViewModel
    
    private let nameLabel: UILabel = {
        let view = UILabel()
        view.backgroundColor = .clear
        view.textAlignment = .left
        view.font = UIFont(name: "Avenir-Black", size: 32)
        view.textColor = .highlightYellow
        return view
    }()
    
    private let descriptionLabel: UILabel = {
        let view = UILabel()
        view.backgroundColor = .clear
        view.textAlignment = .left
        view.font = UIFont(name: "Avenir-Book", size: 20)
        view.textColor = .highlightYellow
        return view
    }()
    
    private let dateLabel: UILabel = {
        let view = UILabel()
        view.backgroundColor = .clear
        view.textAlignment = .left
        view.font = UIFont(name: "Avenir-Book", size: 20)
        view.textColor = .highlightYellow
        return view
    }()

    private let addExerciseButton: UIButton = {
        let button = UIButton()
        button.addTarget(self, action: #selector(addExercise), for: .touchUpInside)
        button.setTitle("Adicionar Exercício", for: .normal)
        button.backgroundColor = .highlightYellow
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = UIFont(name: "Avenir-Black", size: 18)
        button.clipsToBounds = true
        return button
    }()
    
    private let exercisesTableView: UITableView = {
        let view = UITableView()
        view.backgroundColor = .clear
        return view
    }()
    
    init(viewModel: WorkoutDetailsViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
        title = "Detalhes"
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        viewModel.delegate = self
        viewModel.getCurrentWorkout()
    }

    @objc
    private func addExercise() {
        viewModel.addExercise()
    }

}

extension WorkoutDetailsViewController: ViewCodable {

    func buildHierarchy() {
        view.addSubview(nameLabel)
        view.addSubview(descriptionLabel)
        view.addSubview(dateLabel)
        view.addSubview(addExerciseButton)
        view.addSubview(exercisesTableView)
    }
    
    func buildConstraints() {
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            nameLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 4),
            nameLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 8),
            nameLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -8),
        ])
        
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            descriptionLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 4),
            descriptionLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 8),
            descriptionLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -8),
        ])
        
        dateLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            dateLabel.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 4),
            dateLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 8),
            dateLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -8),
        ])

        addExerciseButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            addExerciseButton.heightAnchor.constraint(equalToConstant: 40),
            addExerciseButton.leadingAnchor.constraint(equalTo: dateLabel.leadingAnchor),
            addExerciseButton.trailingAnchor.constraint(equalTo: dateLabel.trailingAnchor)
        ])
        
        exercisesTableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            exercisesTableView.topAnchor.constraint(equalTo: addExerciseButton.bottomAnchor, constant: 8),
            exercisesTableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 8),
            exercisesTableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -8),
            exercisesTableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -8)
        ])
        
    }
    
    func setupUI() {
        view.backgroundColor = .darkGray
        exercisesTableView.delegate = self
        exercisesTableView.dataSource = self
    }
    
}

extension WorkoutDetailsViewController: UITableViewDelegate, UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfExercises()
    }
    
    // TODO: Placeholder for emptylist
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: ExerciseInWorkoutTableViewCell = tableView.dequeueReusableCell(forIndexPath: indexPath)
        cell.configureFor(viewModel.exerciseAt(indexPath))
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        // TODO: Automatic dimension
        return 100
    }

}

extension WorkoutDetailsViewController: WorkoutDetailsViewModelDelegate {

    func updateViewWith(_ workout: Workout) {
        nameLabel.text = workout.name
        descriptionLabel.text = workout.workoutDescription
        dateLabel.text = DateHelper.formatDate(date: workout.date!)
    }

}
