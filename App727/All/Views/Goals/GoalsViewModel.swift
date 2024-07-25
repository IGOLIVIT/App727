//
//  GoalsViewModel.swift
//  App727
//
//  Created by IGOR on 23/07/2024.
//

import SwiftUI
import CoreData

final class GoalsViewModel: ObservableObject {

    @Published var isAdd: Bool = false
    @Published var isCurr: Bool = false
    @Published var isDetail: Bool = false
    @Published var isDelete: Bool = false
    
    @Published var goalTitle: String = ""
    @Published var goalDescr: String = ""
    @Published var goalAch: String = ""
    
    @Published var goals: [GoalModel] = []
    @Published var selectedGoal: GoalModel?
    
    func addGoal() {
        
        let context = CoreDataStack.shared.persistentContainer.viewContext
        let loan = NSEntityDescription.insertNewObject(forEntityName: "GoalModel", into: context) as! GoalModel
        
        loan.goalTitle = goalTitle
        loan.goalDescr = goalDescr
        loan.goalAch = goalAch

        CoreDataStack.shared.saveContext()
    }
    
    func fetchGoals() {
        
        let context = CoreDataStack.shared.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<GoalModel>(entityName: "GoalModel")
        
        do {
            
            let result = try context.fetch(fetchRequest)
            
            self.goals = result
            
        } catch let error as NSError {
            
            print("catch")
            
            print("Error fetching persons: \(error), \(error.userInfo)")
            
            self.goals = []
        }
    }
}
