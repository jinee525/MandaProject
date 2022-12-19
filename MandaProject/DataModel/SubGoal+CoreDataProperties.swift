//
//  SubGoal+CoreDataProperties.swift
//  MandaProject
//
//  Created by 박유진 on 2022/12/12.
//
//

import Foundation
import CoreData


extension SubGoal {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<SubGoal> {
        return NSFetchRequest<SubGoal>(entityName: "SubGoal")
    }

    @NSManaged public var id: UUID?
    @NSManaged public var title: String?
    @NSManaged public var action: NSSet?

}

// MARK: Generated accessors for action
extension SubGoal {

    @objc(addActionObject:)
    @NSManaged public func addToAction(_ value: Action)

    @objc(removeActionObject:)
    @NSManaged public func removeFromAction(_ value: Action)

    @objc(addAction:)
    @NSManaged public func addToAction(_ values: NSSet)

    @objc(removeAction:)
    @NSManaged public func removeFromAction(_ values: NSSet)

}

extension SubGoal : Identifiable {

}
