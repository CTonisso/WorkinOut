//
//  WorkoutTableViewCell.swift
//  WorkinOut
//
//  Created by Carlos Marcelo Tonisso Junior on 16/05/23.
//

import Foundation
import UIKit

class WorkoutTableViewCell: UITableViewCell {

    private let cellBackgroundView: UIView = {
        let view = UIView()
        view.layer.borderColor = UIColor.highlightYellow.cgColor
        view.layer.borderWidth = 4
        view.layer.cornerRadius = 16
        view.backgroundColor = .cellGray
        return view
    }()
    
    private let titleLabel: UILabel = {
        let view = UILabel()
        view.text = "Teste"
        view.font = UIFont(name: "Avenir-Medium", size: 24)
        view.textColor = .highlightYellow
        return view
    }()

    private let descriptionLabel: UILabel = {
        let view = UILabel()
        view.text = "Teste"
        view.font = UIFont(name: "Avenir-Light", size: 16)
        view.textColor = .highlightYellow
        view.numberOfLines = 0
        view.textAlignment = .left
        return view
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureFor(_ workout: Workout) {
        titleLabel.text = workout.name
        descriptionLabel.text = workout.workoutDescription
    }

}

extension WorkoutTableViewCell: ViewCodable {
    func buildHierarchy() {
        contentView.addSubview(cellBackgroundView)
        cellBackgroundView.addSubview(titleLabel)
        cellBackgroundView.addSubview(descriptionLabel)
    }
    
    func buildConstraints() {
        cellBackgroundView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            cellBackgroundView.heightAnchor.constraint(equalToConstant: 100),
            cellBackgroundView.topAnchor.constraint(equalTo: contentView.topAnchor),
            cellBackgroundView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            cellBackgroundView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8),
            cellBackgroundView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8)
        ])

        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: cellBackgroundView.topAnchor, constant: 12),
            titleLabel.leadingAnchor.constraint(equalTo: cellBackgroundView.leadingAnchor, constant: 12),
            titleLabel.trailingAnchor.constraint(equalTo: cellBackgroundView.trailingAnchor, constant: -12)
        ])
        
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            descriptionLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 2),
            descriptionLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            descriptionLabel.trailingAnchor.constraint(equalTo: titleLabel.trailingAnchor),
//            descriptionLabel.bottomAnchor.constraint(equalTo: cellBackgroundView.bottomAnchor, constant: -8)
        ])
    }
    
    func setupUI() {
        backgroundView?.backgroundColor = .clear
        contentView.backgroundColor = .clear
        backgroundColor = .clear
    }
    
    
}
