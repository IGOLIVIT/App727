//
//  TrainingViewModel.swift
//  App727
//
//  Created by IGOR on 23/07/2024.
//

import SwiftUI
import CoreData

final class TrainingViewModel: ObservableObject {
    
    @Published var tphotos: [String] = ["t1", "t2", "t3", "t4"]
    @Published var currTPhoto = ""
    
    @Published var ePhotos: [String] = ["e1", "e2", "e3"]
    @Published var curEPhoto: String = ""
    
    @Published var isAdd: Bool = false
    @Published var isCurr: Bool = false
    @Published var isDetail: Bool = false
    @Published var isDelete: Bool = false
    
    @Published var trPhoto: String = ""
    @Published var trTitle: String = ""
    @Published var trDescr: String = ""
    
    @Published var trainings: [TrainingModel] = []
    @Published var selectedTraining: TrainingModel?
    
    func addTraining() {

        let context = CoreDataStack.shared.persistentContainer.viewContext
        let loan = NSEntityDescription.insertNewObject(forEntityName: "TrainingModel", into: context) as! TrainingModel

        loan.trPhoto = trPhoto
        loan.trTitle = trTitle
        loan.trDescr = trDescr

        CoreDataStack.shared.saveContext()
    }

    func fetchTrainings() {
        
        let context = CoreDataStack.shared.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<TrainingModel>(entityName: "TrainingModel")
        
        do {
            
            let result = try context.fetch(fetchRequest)
            
            self.trainings = result
            
        } catch let error as NSError {
            
            print("catch")
            
            print("Error fetching persons: \(error), \(error.userInfo)")
            
            self.trainings = []
        }
    }
    
    @Published var exName: String = ""
    @Published var exType: String = ""
    @Published var exTraining: String = ""
    @Published var exPhoto: String = ""

    @Published var exercises: [ExercisesModel] = []
    @Published var selectedExercise: ExercisesModel?
    
    func addExercise() {

        let context = CoreDataStack.shared.persistentContainer.viewContext
        let loan = NSEntityDescription.insertNewObject(forEntityName: "ExercisesModel", into: context) as! ExercisesModel

        loan.exName = exName
        loan.exType = exType
        loan.exTraining = exTraining
        loan.exPhoto = exPhoto

        CoreDataStack.shared.saveContext()
    }

    func fetchExercises() {
        
        let context = CoreDataStack.shared.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<ExercisesModel>(entityName: "ExercisesModel")
        
        do {
            
            let result = try context.fetch(fetchRequest)
            
            self.exercises = result
            
        } catch let error as NSError {
            
            print("catch")
            
            print("Error fetching persons: \(error), \(error.userInfo)")
            
            self.exercises = []
        }
    }
}
