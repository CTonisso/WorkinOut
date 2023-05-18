//
//  ExercisesViewController.swift
//  WorkinOut
//
//  Created by Carlos Marcelo Tonisso Junior on 16/05/23.
//

import Foundation
import UIKit

class ExercisesViewController: UIViewController {
    
    private var viewModel: ExercisesViewModel
    private var collectionView = UICollectionView()
    
    init(viewModel: ExercisesViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .darkGray
        setup()
    }
    
    @objc
    func addExercise() {
        viewModel.addExercise()
    }

}

extension ExercisesViewController: ViewCodable {
    
    func buildHierarchy() {
        view.addSubview(collectionView)
    }
    
    func buildConstraints() {
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])

        updateViewConstraints()
    }
    
    func setupUI() {
        title = "Exercícios"
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addExercise))
        navigationItem.rightBarButtonItem?.tintColor = .highlightYellow
    }
    
}

extension ExercisesViewController: UICollectionViewDelegate, UICollectionViewDataSource {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.numberOfExercises()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: ExerciseCollectionViewCell = collectionView.dequeueReusableCell(forIndexPath: indexPath)
        cell.configureFor(viewModel.exerciseAt(indexPath))
        return cell
    }
    
}
