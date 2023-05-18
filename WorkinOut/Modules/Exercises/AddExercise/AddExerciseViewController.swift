//
//  AddExerciseViewController.swift
//  WorkinOut
//
//  Created by Carlos Marcelo Tonisso Junior on 16/05/23.
//

import Foundation
import UIKit

class AddExerciseViewController: UIViewController, UINavigationControllerDelegate {
    
    private var viewModel: AddExerciseViewModel
    
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
    
    private let exerciseImageView: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: "photo-camera")
        view.contentMode = .center
        view.layer.borderWidth = 3
        view.layer.borderColor = UIColor.white.cgColor
        view.layer.cornerRadius = 8
        view.clipsToBounds = true
        return view
    }()

    private let exerciseNameTextField: WOTextField = {
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
    
    private let exerciseNotesTextView: UITextView = {
        let view = UITextView()
        view.backgroundColor = .clear
        view.layer.borderColor = UIColor.highlightYellow.cgColor
        view.layer.borderWidth = 3
        view.font = UIFont(name: "Avenir-Book", size: 16)
        view.text = "Notas"
        view.textColor = .highlightYellow
        view.keyboardType = .default
        view.textContainer.lineFragmentPadding = 20
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
        button.layer.cornerRadius = 8
        button.layer.borderColor = UIColor.highlightYellow.cgColor
        button.clipsToBounds = true
        return button
    }()
    
    init(viewModel: AddExerciseViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
        self.viewModel.delegate = self
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        definesPresentationContext = true
        setup()
    }

    @objc
    private func addExercise() {
        guard let name = exerciseNameTextField.text, let notes = exerciseNotesTextView.text, let image = exerciseImageView.image else { return }
        viewModel.addExercise(name: name, notes: notes, imageData: image.pngData())
    }
    
    @objc
    private func cancel() {
        viewModel.cancel()
    }
    
    @objc func selectImage() {
        viewModel.presentImagePicker()
    }
}

extension AddExerciseViewController: ViewCodable {
    
    func buildHierarchy() {
        view.addSubview(stackView)
        stackView.addArrangedSubview(titleLabel)
        stackView.addArrangedSubview(exerciseImageView)
        stackView.addArrangedSubview(exerciseNameTextField)
        stackView.addArrangedSubview(exerciseNotesTextView)
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
        
        exerciseImageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            exerciseImageView.heightAnchor.constraint(equalTo: stackView.widthAnchor, constant: -64),
            exerciseImageView.leadingAnchor.constraint(equalTo: stackView.leadingAnchor),
            exerciseImageView.trailingAnchor.constraint(equalTo: stackView.trailingAnchor)
        ])
        
        exerciseNameTextField.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            exerciseNameTextField.heightAnchor.constraint(equalToConstant: 56),
            exerciseNameTextField.leadingAnchor.constraint(equalTo: stackView.leadingAnchor),
            exerciseNameTextField.trailingAnchor.constraint(equalTo: stackView.trailingAnchor)
        ])
        
        exerciseNotesTextView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            exerciseNotesTextView.heightAnchor.constraint(equalToConstant: 256),
            exerciseNotesTextView.leadingAnchor.constraint(equalTo: stackView.leadingAnchor),
            exerciseNotesTextView.trailingAnchor.constraint(equalTo: stackView.trailingAnchor)
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
        view.backgroundColor = .darkGray
        titleLabel.text = "Adicionar Exercício"
        addButton.addTarget(self, action: #selector(addExercise), for: .touchUpInside)
        cancelButton.addTarget(self, action: #selector(cancel), for: .touchUpInside)
        exerciseNotesTextView.delegate = self
        
        let gestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(selectImage))
        exerciseImageView.isUserInteractionEnabled = true
        exerciseImageView.addGestureRecognizer(gestureRecognizer)
    }

}

extension AddExerciseViewController: UITextViewDelegate {
    
    internal func textViewDidBeginEditing(_ textView: UITextView) {
        if textView.text == "Notas" {
            textView.text = nil
        }
    }

    internal func textViewDidEndEditing(_ textView: UITextView) {
        if textView.text.isEmpty {
            textView.text = "Notas"
            textView.textColor = UIColor.highlightYellow
        }
    }

}

extension AddExerciseViewController: AddExerciseViewModelDelegate {

    internal func didSelectImage(_ image: UIImage) {
        exerciseImageView.contentMode = .scaleAspectFill
        exerciseImageView.image = image
    }

}
