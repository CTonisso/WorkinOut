//
//  DetailedExercise.swift
//  WorkinOut
//
//  Created by Carlos Marcelo Tonisso Junior on 18/05/23.
//

import Foundation

internal struct DetailedExercise {

    internal let id: UUID
    internal let name: String
    internal let description: String
    internal let imageURL: URL

    public init(id: UUID, name: String, description: String, imageURL: URL) {
        self.id = id
        self.name = name
        self.description = description
        self.imageURL = imageURL
    }

    public init(id: UUID, parameters: [String: Any]) {
        self.id = id
        self.name = String(describing: parameters["name"] ?? "")
        self.description = String(describing: parameters["description"] ?? "")
        self.imageURL = URL(string: String(describing: parameters["imageURL"] ?? ""))!
    }

}
