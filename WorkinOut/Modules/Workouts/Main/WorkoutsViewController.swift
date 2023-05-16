//
//  WorkoutsViewController.swift
//  WorkinOut
//
//  Created by Carlos Marcelo Tonisso Junior on 15/05/23.
//

import Foundation
import UIKit

class WorkoutsViewController: UIViewController {
    
    private var viewModel: WorkoutsViewModel
    private let tableView: UITableView = {
        let tableView = UITableView()
        tableView.registerWithClass(WorkoutTableViewCell.self)
        tableView.backgroundColor = .clear
        return tableView
    }()
    
    init(viewModel: WorkoutsViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .darkGray
        viewModel.delegate = self
        setup()
    }

    @objc
    func addWorkout() {
        viewModel.addWorkout()
    }
}

extension WorkoutsViewController: ViewCodable {
    
    func buildHierarchy() {
        view.addSubview(tableView)
    }
    
    func buildConstraints() {
        tableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])

        updateViewConstraints()
    }
    
    func setupUI() {
        title = "Workouts"
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addWorkout))
        navigationItem.rightBarButtonItem?.tintColor = .highlightYellow
        
        tableView.delegate = self
        tableView.dataSource = self

        viewModel.fetchWorkouts(for: nil)
    }
    
}

extension WorkoutsViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfWorkouts()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: WorkoutTableViewCell = tableView.dequeueReusableCell(forIndexPath: indexPath)
        cell.configureFor(viewModel.workoutAt(indexPath))
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        viewModel.showWorkoutDetails(at: indexPath)
    }
}

extension WorkoutsViewController: WorkoutsViewModelDelegate {
    
    func didFetchWorkouts() {
        tableView.reloadData()
    }

}
