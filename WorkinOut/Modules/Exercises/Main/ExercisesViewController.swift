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
        
    }
    
    func buildConstraints() {
        
    }
    
    func setupUI() {
        title = "Exercícios"
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addExercise))
        navigationItem.rightBarButtonItem?.tintColor = .highlightYellow
    }
    
}
