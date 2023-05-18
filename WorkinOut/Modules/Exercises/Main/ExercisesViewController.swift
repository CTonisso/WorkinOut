//
//  ExercisesViewController.swift
//  WorkinOut
//
//  Created by Carlos Marcelo Tonisso Junior on 16/05/23.
//

import Foundation
import UIKit

internal class ExercisesViewController: UIViewController {
    
    private var viewModel: ExercisesViewModel
    private var collectionView: UICollectionView = {
        let view = UICollectionView(frame: CGRect.zero, collectionViewLayout: UICollectionViewFlowLayout())
        view.registerWithClass(ExerciseCollectionViewCell.self)
        view.backgroundColor = .clear
        return view
    }()
    
    internal init(viewModel: ExercisesViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    internal required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .darkGray
        setup()
    }
    
    @objc
    private func addExercise() {
        viewModel.addExercise()
    }

}

extension ExercisesViewController: ViewCodable {
    
    internal func buildHierarchy() {
        view.addSubview(collectionView)
    }
    
    internal func buildConstraints() {
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])

        updateViewConstraints()
    }

    internal func setupUI() {
        title = "Exercícios"
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addExercise))
        navigationItem.rightBarButtonItem?.tintColor = .highlightYellow
        configureCollectionView()
    }

    internal func configureCollectionView() {
        collectionView.delegate = self
        collectionView.dataSource = self
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: view.frame.width / 2 - 6, height: view.frame.width / 2 - 6)
        collectionView.collectionViewLayout = layout
    }

}

extension ExercisesViewController: UICollectionViewDelegate, UICollectionViewDataSource {

    internal func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.numberOfExercises()
    }

    internal func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: ExerciseCollectionViewCell = collectionView.dequeueReusableCell(forIndexPath: indexPath)
        cell.configureFor(viewModel.exerciseAt(indexPath))
        return cell
    }

}
