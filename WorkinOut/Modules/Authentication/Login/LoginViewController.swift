//
//  LoginViewController.swift
//  WorkinOut
//
//  Created by Carlos Marcelo Tonisso Junior on 15/05/23.
//

import Foundation
import GoogleSignIn
import UIKit

class LoginViewController: UIViewController {

    private var viewModel: LoginViewModel
    
    private let titleView = UILabel()
    private let emailTextView = UITextView()
    private let passwordTextView = UITextView()
    private let loginButton = UIButton()
    private let registerButton = UIButton()
    private let divisionLabel = UILabel()
    private let googleSignInButon = GIDSignInButton()

    init(viewModel: LoginViewModel = LoginViewModel()) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
        self.viewModel.delegate = self
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        view.backgroundColor = .blue
        super.viewDidLoad()
    }
    
}

extension LoginViewController: LoginViewModelDelegate {
    
}
