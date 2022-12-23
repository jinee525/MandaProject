//
//  DataController.swift
//  MandaProject
//
//  Created by 박유진 on 2022/12/18.
//

import Foundation
import CoreData

class DataController: ObservableObject {
    let container = NSPersistentContainer(name: "Model")
    
    init(){
        container.loadPersistentStores { desc, error in
            if let error = error {
                print("Failed to load the data \(error.localizedDescription)")
            }
        }
    }
    
    func save(context: NSManagedObjectContext){
        do {
            try context.save()
            print("Data saved!")
        } catch {
            print("Save failed :(")
        }
    }
    
    func addGoal(title: String, due: Date, context: NSManagedObjectContext){
        let goal = Goal(context: context)
        goal.title = title
        goal.due = due
        
        save(context: context)
    }
    
    func editGoal(goal: Goal, title: String, due: Date, context: NSManagedObjectContext){
        goal.title = title
        goal.due = due
        
        save(context: context)
    }
    
    func addSubGoal(title: String, context: NSManagedObjectContext){
        let subGoal = SubGoal(context: context)
        subGoal.title = title
        
        save(context: context)
    }
    
    func editSubGoal(subGoal: SubGoal, title: String, context: NSManagedObjectContext){
        subGoal.title = title
        
        save(context: context)
    }
    
    func addAction(title: String, due: Date, repeatDay: String, subGoal: SubGoal, context: NSManagedObjectContext){
        let action = Action(context: context)
        action.due = due
        action.repeatDay = repeatDay
        action.title = title
        action.subGoal = subGoal
        
        
        save(context: context)
    }
    
    func editAction(action: Action, title: String, due: Date, repeatDay: String, context: NSManagedObjectContext){
        action.due = due
        action.repeatDay = repeatDay
        action.title = title
        
        save(context: context)
    }
}
