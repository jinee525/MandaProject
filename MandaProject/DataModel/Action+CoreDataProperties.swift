//
//  Action+CoreDataProperties.swift
//  MandaProject
//
//  Created by 박유진 on 2022/12/12.
//
//

import Foundation
import CoreData


extension Action {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Action> {
        return NSFetchRequest<Action>(entityName: "Action")
    }

    @NSManaged public var id: UUID?
    @NSManaged public var title: String?
    @NSManaged public var due: Date?
    @NSManaged public var repeatDay: String?
    @NSManaged public var subGoal: SubGoal?

}

extension Action : Identifiable {

}
