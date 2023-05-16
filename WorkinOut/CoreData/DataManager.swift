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
                // TODO  Implement crashlytics
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
                // TODO Implement crashlytics
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

    func createExercise(name: String, image: URL, notes: String, workout: Workout) -> Exercise {
        let exercise = Exercise(context: persistentContainer.viewContext)
        exercise.id = UUID()
        exercise.name = name
        exercise.image = image
        exercise.notes = notes
        exercise.addToWorkout(workout)
        return exercise
    }

    func fetchWorkouts(for date: Date? = nil) -> [Workout] {
        let request: NSFetchRequest<Workout> = Workout.fetchRequest()
        // TODO: Test date filter
        if let unwrapedDate = date {
            let dateFormat = DateFormatter()
            dateFormat.dateFormat = "yyyy-MM-dd"
            request.predicate = NSPredicate(format: "date = %@", dateFormat.string(from: unwrapedDate))
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

    func fetchExercises(_ workout: Workout) -> [Exercise] {
        let request: NSFetchRequest<Exercise> = Exercise.fetchRequest()
        request.predicate = NSPredicate(format: "workout = %@", workout)
        var fetchedExercises: [Exercise] = []

        do {
            fetchedExercises = try persistentContainer.viewContext.fetch(request)
        } catch let error {
            // TODO Implement crashlytics
            print("Error fetching exercises \(error)")
        }
        
        return fetchedExercises
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
