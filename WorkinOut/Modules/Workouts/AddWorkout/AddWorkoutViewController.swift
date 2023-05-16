//
//  AddWorkoutViewController.swift
//  WorkinOut
//
//  Created by Carlos Marcelo Tonisso Junior on 16/05/23.
//

import Foundation
import UIKit

class AddWorkoutViewController: UIViewController {
    
    private let viewModel: AddWorkoutViewModel
    
    init(viewModel: AddWorkoutViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
    }
}
