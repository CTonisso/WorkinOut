//
//  RegisterViewController.swift
//  WorkinOut
//
//  Created by Carlos Marcelo Tonisso Junior on 18/05/23.
//

import Foundation
import UIKit

class RegisterViewController: UIViewController {
    
    private let viewModel: RegisterViewModel
    
    private let stackView: UIStackView = {
        let view = UIStackView()
        view.spacing = 12
        view.distribution = .fill
        view.axis = .vertical
        view.alignment = .center
        view.backgroundColor = .clear
        return view
    }()
    
    private let titleLabel: UILabel = {
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
        view.layer.cornerRadius = 8
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
        view.layer.cornerRadius = 8
        view.leftPadding = 20
        view.clipsToBounds = true
        return view
    }()
    
    private let registerButton: UIButton = {
        let button = UIButton()
        button.addTarget(self, action: #selector(register), for: .touchUpInside)
        button.setTitle("Cadastrar", for: .normal)
        button.backgroundColor = .clear
        button.setTitleColor(.highlightYellow, for: .normal)
        button.titleLabel?.font = UIFont(name: "Avenir-Heavy", size: 18)
        button.clipsToBounds = true
        button.layer.cornerRadius = 8
        return button
    }()

    init(viewModel: RegisterViewModel) {
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
    
    @objc func register() {
        guard let email = emailTextField.text, let password = passwordTextField.text else { return }
        viewModel.register(withEmail: email, password: password)
    }

}

extension RegisterViewController: ViewCodable {
    
    func buildHierarchy() {
        view.addSubview(stackView)
        stackView.addArrangedSubview(titleLabel)
        stackView.addArrangedSubview(emailTextField)
        stackView.addArrangedSubview(passwordTextField)
        stackView.addArrangedSubview(registerButton)
        stackView.setCustomSpacing(64, after: titleLabel)
        stackView.setCustomSpacing(18, after: passwordTextField)
    }
    
    func buildConstraints() {
        stackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16)
        ])

        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            titleLabel.heightAnchor.constraint(equalToConstant: 64),
            titleLabel.leadingAnchor.constraint(equalTo: stackView.leadingAnchor),
            titleLabel.trailingAnchor.constraint(equalTo: stackView.trailingAnchor),
        ])
        
        emailTextField.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            emailTextField.heightAnchor.constraint(equalToConstant: 52),
            emailTextField.leadingAnchor.constraint(equalTo: stackView.leadingAnchor),
            emailTextField.trailingAnchor.constraint(equalTo: stackView.trailingAnchor),
        ])
        
        passwordTextField.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            passwordTextField.heightAnchor.constraint(equalToConstant: 52),
            passwordTextField.leadingAnchor.constraint(equalTo: stackView.leadingAnchor),
            passwordTextField.trailingAnchor.constraint(equalTo: stackView.trailingAnchor),
        ])
        
        registerButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            registerButton.heightAnchor.constraint(equalToConstant: 40),
            registerButton.leadingAnchor.constraint(equalTo: stackView.leadingAnchor),
            registerButton.trailingAnchor.constraint(equalTo: stackView.trailingAnchor),
        ])
    }
    
    func setupUI() {
        titleLabel.text = "WorkinOut"
    }

}
