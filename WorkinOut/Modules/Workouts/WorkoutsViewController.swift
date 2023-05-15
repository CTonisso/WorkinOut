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
    
    init(_ viewModel: WorkoutsViewModel) {
        self.viewModel = viewModel
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
