//
//  ExerciseCollectionViewCell.swift
//  WorkinOut
//
//  Created by Carlos Marcelo Tonisso Junior on 17/05/23.
//

import Foundation
import UIKit

class ExerciseCollectionViewCell: UICollectionViewCell {

    private let cellBackgroundView: UIView = {
        let view = UIView()
        view.layer.borderColor = UIColor.highlightYellow.cgColor
        view.layer.borderWidth = 2
        view.layer.cornerRadius = 16
        view.backgroundColor = .cellGray
        return view
    }()
    
    private let exerciseImageView: UIImageView = {
        let view = UIImageView()
        return view
    }()

    private let nameLabel: UILabel = {
        let view = UILabel()
        view.font = UIFont(name: "Avenir-Medium", size: 12)
        view.textColor = .highlightYellow
        view.layer.borderColor = UIColor.highlightYellow.cgColor
        view.layer.borderWidth = 2
        view.clipsToBounds = true
        return view
    }()

    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureFor(_ exercise: Exercise) {
        nameLabel.text = exercise.name
        exerciseImageView.imageFromUrl(exercise.image)
    }

}

extension ExerciseCollectionViewCell: ViewCodable {
    func buildHierarchy() {
        contentView.addSubview(cellBackgroundView)
        cellBackgroundView.addSubview(exerciseImageView)
        cellBackgroundView.addSubview(nameLabel)
    }
    
    func buildConstraints() {
        cellBackgroundView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            cellBackgroundView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 4),
            cellBackgroundView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -4),
            cellBackgroundView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 4),
            cellBackgroundView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -4)
        ])

        exerciseImageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            exerciseImageView.topAnchor.constraint(equalTo: cellBackgroundView.topAnchor),
            exerciseImageView.leadingAnchor.constraint(equalTo: cellBackgroundView.leadingAnchor),
            exerciseImageView.trailingAnchor.constraint(equalTo: cellBackgroundView.trailingAnchor)
        ])
        
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            nameLabel.topAnchor.constraint(equalTo: exerciseImageView.bottomAnchor),
            nameLabel.leadingAnchor.constraint(equalTo: exerciseImageView.leadingAnchor),
            nameLabel.trailingAnchor.constraint(equalTo: exerciseImageView.trailingAnchor),
            nameLabel.bottomAnchor.constraint(equalTo: cellBackgroundView.bottomAnchor)
        ])
    }
    
    func setupUI() {
        backgroundView?.backgroundColor = .clear
        contentView.backgroundColor = .clear
        backgroundColor = .clear
    }
    
}

