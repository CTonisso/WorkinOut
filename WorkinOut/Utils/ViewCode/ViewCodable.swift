//
//  ViewCodable.swift
//  WorkinOut
//
//  Created by Carlos Marcelo Tonisso Junior on 15/05/23.
//

import Foundation

protocol ViewCodable {
    func setup()
    func buildHierarchy()
    func buildConstraints()
    func setupUI()
}

extension ViewCodable {
    
    func setup() {
        buildHierarchy()
        buildConstraints()
        setupUI()
    }

}
