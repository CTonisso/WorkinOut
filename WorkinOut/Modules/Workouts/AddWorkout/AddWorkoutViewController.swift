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
        view.font = UIFont(name: "Avenir-Book", size: 32)
        view.textColor = .highlightYellow
        return view
    }()
    
    private let workoutNameTextField: WOTextField = {
        let view = WOTextField()
        view.backgroundColor = .clear
        view.layer.borderColor = UIColor.highlightYellow.cgColor
        view.layer.borderWidth = 3
        view.font = UIFont(name: "Avenir-Book", size: 16)
        view.textColor = .highlightYellow
        view.attributedPlaceholder = NSAttributedString(string: "Nome", attributes: [NSAttributedString.Key.foregroundColor: UIColor.highlightYellow])
        view.keyboardType = .default
        view.leftPadding = 20
        view.layer.cornerRadius = 8
        view.clipsToBounds = true
        return view
    }()
    
    private let workoutDescriptionTextView: UITextView = {
        let view = UITextView()
        view.backgroundColor = .clear
        view.layer.borderColor = UIColor.highlightYellow.cgColor
        view.layer.borderWidth = 3
        view.font = UIFont(name: "Avenir-Book", size: 16)
        view.textColor = .highlightYellow
        view.keyboardType = .default
        view.textContainer.lineFragmentPadding = 20
        view.layer.cornerRadius = 8
        view.clipsToBounds = true
        return view
    }()
    
    private let workoutDateTextField: WOTextField = {
        let view = WOTextField()
        view.backgroundColor = .clear
        view.layer.borderColor = UIColor.highlightYellow.cgColor
        view.layer.borderWidth = 3
        view.font = UIFont(name: "Avenir-Book", size: 16)
        view.textColor = .highlightYellow
        view.attributedPlaceholder = NSAttributedString(string: "Data", attributes: [NSAttributedString.Key.foregroundColor: UIColor.highlightYellow])
        view.leftPadding = 20
        view.layer.cornerRadius = 8
        view.clipsToBounds = true
        return view
    }()

    private let buttonsContainerView: UIView = {
        let view = UIView()
        view.backgroundColor = .clear
        return view
    }()
    
    private let addButton: UIButton = {
        let button = UIButton()
        button.setTitle("Adicionar", for: .normal)
        button.backgroundColor = .highlightYellow
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = UIFont(name: "Avenir-Black", size: 18)
        button.layer.cornerRadius = 8
        button.clipsToBounds = true
        return button
    }()
    
    private let cancelButton: UIButton = {
        let button = UIButton()
        button.setTitle("Cancelar", for: .normal)
        button.backgroundColor = .clear
        button.setTitleColor(.highlightYellow, for: .normal)
        button.titleLabel?.font = UIFont(name: "Avenir-Black", size: 18)
        button.layer.borderWidth = 3
        button.layer.borderColor = UIColor.highlightYellow.cgColor
        button.clipsToBounds = true
        return button
    }()
    
    private let datePicker = UIDatePicker()
    
    init(viewModel: AddWorkoutViewModel) {
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
    private func dateChanged(datePicker: UIDatePicker) {
        workoutDateTextField.text = DateHelper.formatDate(date: datePicker.date)
    }

    @objc
    private func addWorkout() {
        guard let name = workoutNameTextField.text, let description = workoutDescriptionTextView.text else { return }
        viewModel.addWorkout(name: name, description: description, date: datePicker.date)
    }
    
    @objc
    private func cancel() {
        viewModel.cancel()
    }

}

extension AddWorkoutViewController: ViewCodable {
    func buildHierarchy() {
        view.addSubview(stackView)
        stackView.addArrangedSubview(titleLabel)
        stackView.addArrangedSubview(workoutNameTextField)
        stackView.addArrangedSubview(workoutDescriptionTextView)
        stackView.addArrangedSubview(workoutDateTextField)
        buttonsContainerView.addSubview(addButton)
        buttonsContainerView.addSubview(cancelButton)
        stackView.addArrangedSubview(buttonsContainerView)
    }
    
    func buildConstraints() {
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16),
            stackView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            stackView.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -32),
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            titleLabel.leadingAnchor.constraint(equalTo: stackView.leadingAnchor),
            titleLabel.trailingAnchor.constraint(equalTo: stackView.trailingAnchor)
        ])
        
        workoutNameTextField.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            workoutNameTextField.heightAnchor.constraint(equalToConstant: 56),
            workoutNameTextField.leadingAnchor.constraint(equalTo: stackView.leadingAnchor),
            workoutNameTextField.trailingAnchor.constraint(equalTo: stackView.trailingAnchor)
        ])
        
        workoutDescriptionTextView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            workoutDescriptionTextView.heightAnchor.constraint(equalToConstant: 256),
            workoutDescriptionTextView.leadingAnchor.constraint(equalTo: stackView.leadingAnchor),
            workoutDescriptionTextView.trailingAnchor.constraint(equalTo: stackView.trailingAnchor)
        ])
        
        workoutDateTextField.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            workoutDateTextField.heightAnchor.constraint(equalToConstant: 56),
            workoutDateTextField.leadingAnchor.constraint(equalTo: stackView.leadingAnchor),
            workoutDateTextField.trailingAnchor.constraint(equalTo: stackView.trailingAnchor)
        ])
        
        cancelButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            cancelButton.leadingAnchor.constraint(equalTo: buttonsContainerView.leadingAnchor),
            cancelButton.trailingAnchor.constraint(equalTo: buttonsContainerView.centerXAnchor, constant: -2)
        ])
        
        addButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            addButton.leadingAnchor.constraint(equalTo: buttonsContainerView.centerXAnchor, constant: 2),
            addButton.trailingAnchor.constraint(equalTo: buttonsContainerView.trailingAnchor)
        ])

        buttonsContainerView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            buttonsContainerView.leadingAnchor.constraint(equalTo: stackView.leadingAnchor),
            buttonsContainerView.trailingAnchor.constraint(equalTo: stackView.trailingAnchor)
        ])
    }
    
    func setupUI() {
        datePicker.datePickerMode = .dateAndTime
        datePicker.addTarget(self, action: #selector(dateChanged(datePicker:)), for: .valueChanged)
        datePicker.preferredDatePickerStyle = .wheels
        workoutDateTextField.inputView = datePicker
        titleLabel.text = "Adicionar Workout"
        workoutDescriptionTextView.delegate = self
        workoutDescriptionTextView.text = "Descrição"
        addButton.addTarget(self, action: #selector(addWorkout), for: .touchUpInside)
        cancelButton.addTarget(self, action: #selector(cancel), for: .touchUpInside)
    }

}

extension AddWorkoutViewController: UITextViewDelegate {
    
    internal func textViewDidBeginEditing(_ textView: UITextView) {
        if textView.text == "Descrição" {
            textView.text = nil
        }
    }

    internal func textViewDidEndEditing(_ textView: UITextView) {
        if textView.text.isEmpty {
            textView.text = "Descrição"
            textView.textColor = UIColor.highlightYellow
        }
    }

}
