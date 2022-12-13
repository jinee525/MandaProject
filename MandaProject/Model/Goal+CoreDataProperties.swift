//
//  Goal+CoreDataProperties.swift
//  MandaProject
//
//  Created by 박유진 on 2022/12/12.
//
//

import Foundation
import CoreData


extension Goal {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Goal> {
        return NSFetchRequest<Goal>(entityName: "Goal")
    }

    @NSManaged public var title: String?
    @NSManaged public var due: Date?

}

extension Goal : Identifiable {

}
