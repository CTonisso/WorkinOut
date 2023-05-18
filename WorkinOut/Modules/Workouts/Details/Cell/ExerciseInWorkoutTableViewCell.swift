//
//  ExerciseInWorkoutTableViewCell.swift
//  WorkinOut
//
//  Created by Carlos Marcelo Tonisso Junior on 18/05/23.
//

import Foundation
import UIKit

class ExerciseInWorkoutTableViewCell: UITableViewCell {

    private let cellBackgroundView: UIView = {
        let view = UIView()
        view.layer.borderColor = UIColor.highlightYellow.cgColor
        view.layer.borderWidth = 2
        view.layer.cornerRadius = 8
        view.backgroundColor = .cellGray
        return view
    }()

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

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}

extension ExerciseInWorkoutTableViewCell: ViewCodable {

    func buildHierarchy() {
        contentView.addSubview(cellBackgroundView)
        cellBackgroundView.addSubview(nameLabel)
        cellBackgroundView.addSubview(notesLabel)
    }
    
    func buildConstraints() {
        
        cellBackgroundView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            cellBackgroundView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 4),
            cellBackgroundView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -4),
            cellBackgroundView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 2),
            cellBackgroundView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -2)
        ])

        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            nameLabel.topAnchor.constraint(equalTo: cellBackgroundView.topAnchor, constant: 2),
            nameLabel.leadingAnchor.constraint(equalTo: cellBackgroundView.leadingAnchor, constant: 8),
            nameLabel.trailingAnchor.constraint(equalTo: cellBackgroundView.trailingAnchor, constant: -8),
        ])
        
        notesLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            notesLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 4),
            notesLabel.leadingAnchor.constraint(equalTo: cellBackgroundView.leadingAnchor, constant: 8),
            notesLabel.trailingAnchor.constraint(equalTo: cellBackgroundView.trailingAnchor, constant: -8),
            notesLabel.bottomAnchor.constraint(equalTo: cellBackgroundView.bottomAnchor, constant: -4)
        ])
        
    }
    
    func setupUI() {
        contentView.backgroundColor = .clear
        backgroundView?.backgroundColor = .clear
        backgroundColor = .clear
        selectionStyle = .none
    }

}
