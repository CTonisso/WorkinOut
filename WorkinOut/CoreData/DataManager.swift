//
//  DataManager.swift
//  WorkinOut
//
//  Created by Carlos Marcelo Tonisso Junior on 15/05/23.
//

import Foundation
import CoreData

class DataManager {

    static let shared = DataManager()

    lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "WorkinOut")
        container.loadPersistentStores { storeDescription, error in
            if let error = error as NSError? {
                // TODO: Implement crashlytics
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        }
        return container
    }()

    func save() {
        let context = persistentContainer.viewContext
        
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                // TODO: Implement crashlytics
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
        }
    }

    func createWorkout(name: String, description: String, date: Date) -> Workout {
        let workout = Workout(context: persistentContainer.viewContext)
        workout.id = UUID()
        workout.name = name
        workout.workoutDescription = description
        workout.date = date
        save()
        return workout
    }

    func createExercise(name: String, image: URL, notes: String, workout: Workout?) -> Exercise {
        let exercise = Exercise(context: persistentContainer.viewContext)
        exercise.id = UUID()
        exercise.name = name
        exercise.image = image
        exercise.notes = notes
        if let unwrapedWorkout = workout {
            exercise.addToWorkout(unwrapedWorkout)
        }
        return exercise
    }

    func fetchWorkouts(for date: Date? = nil) -> [Workout] {
        let request: NSFetchRequest<Workout> = Workout.fetchRequest()
        // TODO: Test date filter
        if let unwrapedDate = date {
            request.predicate = NSPredicate(format: "date = %@", unwrapedDate as NSDate)
        }
        var fetchedWorkouts: [Workout] = []
        
        do {
            fetchedWorkouts = try persistentContainer.viewContext.fetch(request)
        } catch let error {
            // TODO Implement crashlytics
            print("Error fetching workouts \(error)")
        }
        
        return fetchedWorkouts
    }

    func fetchExercises(_ workout: Workout? = nil) -> [Exercise] {
        let request: NSFetchRequest<Exercise> = Exercise.fetchRequest()
        if let unwrapedWorkout = workout {
            request.predicate = NSPredicate(format: "workout = %@", unwrapedWorkout)
        }
        var fetchedExercises: [Exercise] = []

        do {
            fetchedExercises = try persistentContainer.viewContext.fetch(request)
        } catch let error {
            // TODO Implement crashlytics
            print("Error fetching exercises \(error)")
        }
        
        return fetchedExercises
    }

    func clearContext() {
        let context = persistentContainer.viewContext
        context.reset()
    }

    func deleteWorkout(_ workout: Workout) {
        let context = persistentContainer.viewContext
        context.delete(workout)
        save()
    }
    
    func deleteExercise(_ exercise: Exercise) {
        let context = persistentContainer.viewContext
        context.delete(exercise)
        save()
    }

}
