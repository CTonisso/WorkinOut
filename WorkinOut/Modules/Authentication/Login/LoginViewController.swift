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
    
    private let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        return scrollView
    }()
    
    private let stackView: UIStackView = {
        let view = UIStackView()
        view.spacing = 12
        view.distribution = .fill
        view.axis = .vertical
        view.alignment = .center
        view.backgroundColor = .clear
        return view
    }()

    private let titleView: UILabel = {
        let view = UILabel()
        view.backgroundColor = .clear
        view.textAlignment = .center
        view.font = UIFont(name: "Avenir-Book", size: 58)
        view.textColor = .highlightYellow
        return view
    }()
    
    private let emailTextField: WOTextField = {
        let view = WOTextField()
        view.backgroundColor = .clear
        view.layer.borderColor = UIColor.highlightYellow.cgColor
        view.layer.borderWidth = 3
        view.font = UIFont(name: "Avenir-Book", size: 16)
        view.textColor = .highlightYellow
        view.attributedPlaceholder = NSAttributedString(string: "E-mail", attributes: [NSAttributedString.Key.foregroundColor: UIColor.highlightYellow])
        view.keyboardType = .emailAddress
        view.leftPadding = 20
        view.clipsToBounds = true
        return view
    }()
    
    private let passwordTextField: WOTextField = {
        let view = WOTextField()
        view.backgroundColor = .clear
        view.layer.borderColor = UIColor.highlightYellow.cgColor
        view.layer.borderWidth = 3
        view.font = UIFont(name: "Avenir-Book", size: 16)
        view.textColor = .highlightYellow
        view.attributedPlaceholder = NSAttributedString(string: "Senha", attributes: [NSAttributedString.Key.foregroundColor: UIColor.highlightYellow])
        view.keyboardType = .default
        view.isSecureTextEntry = true
        view.leftPadding = 20
        view.clipsToBounds = true
        return view
    }()
    
    private let loginButton: UIButton = {
        let button = UIButton()
        button.addTarget(self, action: #selector(login), for: .touchUpInside)
        button.setTitle("Entrar", for: .normal)
        button.backgroundColor = .highlightYellow
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = UIFont(name: "Avenir-Black", size: 18)
        button.clipsToBounds = true
        return button
    }()
    
    private let registerButton: UIButton = {
        let button = UIButton()
        button.addTarget(self, action: #selector(register), for: .touchUpInside)
        button.setTitle("Cadastrar", for: .normal)
        button.backgroundColor = .clear
        button.setTitleColor(.highlightYellow, for: .normal)
        button.titleLabel?.font = UIFont(name: "Avenir-Heavy", size: 18)
        button.clipsToBounds = true
        return button
    }()
    
    private let divisionLabel: UILabel = {
        let view = UILabel()
        view.backgroundColor = .clear
        view.textAlignment = .center
        view.font = UIFont(name: "Avenir-Heavy", size: 18)
        view.textColor = .white
        return view
    }()
    
    private let googleSignInButon: GIDSignInButton = {
        let view = GIDSignInButton()
        view.addTarget(self, action: #selector(loginWithGoogle), for: .touchUpInside)
        return view
    }()
    

    init(viewModel: LoginViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
        view.backgroundColor = .darkGray
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    @objc func login() {
        guard let email = emailTextField.text, let password = passwordTextField.text else { return }
        viewModel.loginUserWithEmail(email: email, password: password)
    }

    @objc func loginWithGoogle() {
        viewModel.loginUserWithGoogle()
    }
    
    @objc func register() {
        viewModel.goToRegister()
    }
    
}

extension LoginViewController: ViewCodable {

    func buildHierarchy() {
        view.addSubview(scrollView)
        scrollView.addSubview(stackView)
        stackView.addArrangedSubview(titleView)
        stackView.addArrangedSubview(emailTextField)
        stackView.addArrangedSubview(passwordTextField)
        stackView.addArrangedSubview(loginButton)
        stackView.addArrangedSubview(registerButton)
        stackView.addArrangedSubview(divisionLabel)
        stackView.addArrangedSubview(googleSignInButon)
        stackView.setCustomSpacing(64, after: titleView)
        stackView.setCustomSpacing(18, after: passwordTextField)
        stackView.setCustomSpacing(18, after: divisionLabel)
    }
    
    func buildConstraints() {
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            scrollView.widthAnchor.constraint(equalTo: view.widthAnchor),
            scrollView.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: scrollView.safeAreaLayoutGuide.topAnchor),
            stackView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16)
        ])

        titleView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            titleView.heightAnchor.constraint(equalToConstant: 64),
            titleView.leadingAnchor.constraint(equalTo: stackView.leadingAnchor),
            titleView.trailingAnchor.constraint(equalTo: stackView.trailingAnchor),
        ])
        
        emailTextField.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            emailTextField.heightAnchor.constraint(equalToConstant: 52),
            emailTextField.leadingAnchor.constraint(equalTo: stackView.leadingAnchor),
            emailTextField.trailingAnchor.constraint(equalTo: stackView.trailingAnchor),
        ])
        emailTextField.layer.cornerRadius = 8
        
        passwordTextField.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            passwordTextField.heightAnchor.constraint(equalToConstant: 52),
            passwordTextField.leadingAnchor.constraint(equalTo: stackView.leadingAnchor),
            passwordTextField.trailingAnchor.constraint(equalTo: stackView.trailingAnchor),
        ])
        passwordTextField.layer.cornerRadius = 8
        
        loginButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            loginButton.heightAnchor.constraint(equalToConstant: 40),
            loginButton.leadingAnchor.constraint(equalTo: stackView.leadingAnchor),
            loginButton.trailingAnchor.constraint(equalTo: stackView.trailingAnchor),
        ])
        loginButton.layer.cornerRadius = 8
        
        registerButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            registerButton.heightAnchor.constraint(equalToConstant: 40),
            registerButton.leadingAnchor.constraint(equalTo: stackView.leadingAnchor),
            registerButton.trailingAnchor.constraint(equalTo: stackView.trailingAnchor),
        ])
        registerButton.layer.cornerRadius = 8
        
        divisionLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            divisionLabel.heightAnchor.constraint(equalToConstant: 24),
            divisionLabel.widthAnchor.constraint(equalTo: stackView.widthAnchor),
            divisionLabel.centerXAnchor.constraint(equalTo: stackView.centerXAnchor)
        ])
        
        googleSignInButon.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            googleSignInButon.heightAnchor.constraint(equalToConstant: 40),
            googleSignInButon.widthAnchor.constraint(equalTo: stackView.widthAnchor),
            
        ])
        
    }
    
    func setupUI() {
        titleView.text = "WorkinOut"
        divisionLabel.text = "ou"
    }

}
