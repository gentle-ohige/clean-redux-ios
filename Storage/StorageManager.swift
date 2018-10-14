//
//  DBManager.swift
//  react-swift-test
//
//  Created by ShichoChin on 2018/09/21.
//  Copyright © 2018 Chin ShiCho. All rights reserved.
//

import UIKit
import CoreData

class StorageManager {
    
    static let instance:StorageManager = StorageManager()
    var container: NSPersistentContainer = {
        /*
         The persistent container for the application. This implementation
         creates and returns a container, having loaded the store for the
         application to it. This property is optional since there are legitimate
         error conditions that could cause the creation of the store to fail.
         */
        let container = NSPersistentContainer(name: "storage")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                
                /*
                 Typical reasons for an error here include:
                 * The parent directory does not exist, cannot be created, or disallows writing.
                 * The persistent store is not accessible, due to permissions or data protection when the device is locked.
                 * The device is out of space.
                 * The store could not be migrated to the current model version.
                 Check the error message to determine what the actual problem was.
                 */
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()
    
    //static field
    static func getManagedContext () -> NSManagedObjectContext {
        return  instance.container.viewContext
    }
    
    static func makeEntity(_ entityClass:AnyClass) -> NSEntityDescription{
        return NSEntityDescription.entity(forEntityName: String(describing:entityClass.self), in: getManagedContext())!
    }
    
    
    static func save() throws {
        try instance.container.viewContext.save()
    }

}
