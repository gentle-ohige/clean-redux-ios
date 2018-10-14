//
//  UserAction+CoreDataProperties.swift
//  react-swift-test
//
//  Created by ShichoChin on 2018/09/30.
//  Copyright © 2018 Chin ShiCho. All rights reserved.
//
//

import Foundation
import CoreData


extension UserAction {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<UserAction> {
        return NSFetchRequest<UserAction>(entityName: "UserAction")
    }

    @NSManaged public var todo: String?
    @NSManaged public var date: NSDate?
    @NSManaged public var update: NSDate?
    @NSManaged public var title: String?

}
