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
    private let scrollView = UIScrollView()
    private let stackView = UIStackView()
    private let view1 = UIView()
    private let view2 = UIView()
//    private let
    
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
        setup()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.backgroundColor = .clear
        navigationController?.navigationBar.isHidden = false
        navigationController?.navigationBar.prefersLargeTitles = true
        tabBarController?.tabBar.isHidden = false
    }

    @objc
    func addWorkout() {
        viewModel.addWorkout()
    }
}

extension WorkoutsViewController: ViewCodable {
    
    func buildHierarchy() {
        view.addSubview(scrollView)
        scrollView.addSubview(stackView)
        stackView.addArrangedSubview(view1)
        stackView.addArrangedSubview(view2)
    }
    
    func buildConstraints() {
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])

        stackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            stackView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            stackView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor)
        ])
        updateViewConstraints()
    }
    
    func setupUI() {
        stackView.distribution = .fillEqually
        stackView.axis = .vertical
        view1.backgroundColor = .black
        view2.backgroundColor = .gray
        title = "Workouts"
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addWorkout))
    }
    
}
