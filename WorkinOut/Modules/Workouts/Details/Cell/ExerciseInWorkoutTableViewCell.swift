//
//  ExerciseInWorkoutTableViewCell.swift
//  WorkinOut
//
//  Created by Carlos Marcelo Tonisso Junior on 18/05/23.
//

import Foundation
import UIKit

class ExerciseInWorkoutTableViewCell: UITableViewCell {

    private let nameLabel: UILabel = {
        let view = UILabel()
        view.backgroundColor = .clear
        view.textAlignment = .left
        view.font = UIFont(name: "Avenir-Black", size: 18)
        view.textColor = .highlightYellow
        return view
    }()
    
    private let notesLabel: UILabel = {
        let view = UILabel()
        view.backgroundColor = .clear
        view.textAlignment = .left
        view.font = UIFont(name: "Avenir-Book", size: 16)
        view.textColor = .highlightYellow
        view.numberOfLines = 2
        return view
    }()

    internal func configureFor(_ exercise: Exercise) {
        nameLabel.text = exercise.name
        notesLabel.text = exercise.notes
    }

}

extension ExerciseInWorkoutTableViewCell: ViewCodable {

    func buildHierarchy() {
        contentView.addSubview(nameLabel)
        contentView.addSubview(notesLabel)
    }
    
    func buildConstraints() {
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            nameLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 2),
            nameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 4),
            nameLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -4),
        ])
        
        notesLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            notesLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 4),
            notesLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 4),
            notesLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -4),
            notesLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -4)
        ])
        
    }
    
    func setupUI() {
        
    }
    
}
