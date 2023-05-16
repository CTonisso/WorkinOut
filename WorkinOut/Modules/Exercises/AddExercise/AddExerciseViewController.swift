//
//  AddExerciseViewController.swift
//  WorkinOut
//
//  Created by Carlos Marcelo Tonisso Junior on 16/05/23.
//

import Foundation
import UIKit

class AddExerciseViewController: UIViewController {
    
    private var viewModel: AddExerciseViewModel
    
    init(viewModel: AddExerciseViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
