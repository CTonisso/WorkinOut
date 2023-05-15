//
//  Exercise+CoreDataProperties.swift
//  WorkinOut
//
//  Created by Carlos Marcelo Tonisso Junior on 15/05/23.
//
//

import Foundation
import CoreData


extension Exercise {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Exercise> {
        return NSFetchRequest<Exercise>(entityName: "Exercise")
    }

    @NSManaged public var id: UUID?
    @NSManaged public var image: URL?
    @NSManaged public var name: String?
    @NSManaged public var notes: String?
    @NSManaged public var workout: NSSet?

}

// MARK: Generated accessors for workout
extension Exercise {

    @objc(addWorkoutObject:)
    @NSManaged public func addToWorkout(_ value: Workout)

    @objc(removeWorkoutObject:)
    @NSManaged public func removeFromWorkout(_ value: Workout)

    @objc(addWorkout:)
    @NSManaged public func addToWorkout(_ values: NSSet)

    @objc(removeWorkout:)
    @NSManaged public func removeFromWorkout(_ values: NSSet)

}

extension Exercise : Identifiable {

}
