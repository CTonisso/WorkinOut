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
    
    init(viewModel: WorkoutDetailsViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
        title = "Detalhes"
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
