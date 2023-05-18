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
        view.layer.borderWidth = 3
        view.layer.cornerRadius = 16
        view.backgroundColor = .cellGray
        return view
    }()
    
    private let exerciseImageView: UIImageView = {
        let view = UIImageView()
        view.contentMode = .scaleAspectFit
        view.backgroundColor = .clear
        view.isOpaque = false
        return view
    }()

    private let separationView: UIView = {
        let view = UIView()
        view.backgroundColor = .highlightYellow
        return view
    }()

    private let nameLabel: UILabel = {
        let view = UILabel()
        view.textAlignment = .center
        view.font = UIFont(name: "Avenir-Medium", size: 24)
        view.textColor = .highlightYellow
        view.clipsToBounds = false
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
    internal func buildHierarchy() {
        contentView.addSubview(cellBackgroundView)
        cellBackgroundView.addSubview(exerciseImageView)
        cellBackgroundView.addSubview(separationView)
        cellBackgroundView.addSubview(nameLabel)
    }
    
    internal func buildConstraints() {
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
        
        separationView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            separationView.topAnchor.constraint(equalTo: exerciseImageView.bottomAnchor),
            separationView.leadingAnchor.constraint(equalTo: exerciseImageView.leadingAnchor),
            separationView.trailingAnchor.constraint(equalTo: exerciseImageView.trailingAnchor),
            separationView.heightAnchor.constraint(equalToConstant: 3)
        ])
        
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            nameLabel.topAnchor.constraint(equalTo: separationView.bottomAnchor),
            nameLabel.leadingAnchor.constraint(equalTo: separationView.leadingAnchor),
            nameLabel.trailingAnchor.constraint(equalTo: separationView.trailingAnchor),
            nameLabel.bottomAnchor.constraint(equalTo: cellBackgroundView.bottomAnchor)
        ])
    }
    
    internal func setupUI() {
        backgroundView?.backgroundColor = .clear
        contentView.backgroundColor = .clear
        backgroundColor = .clear
    }
    
}
