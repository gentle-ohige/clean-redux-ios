//
//  TodoListUsecase.swift
//  react-swift-test
//
//  Created by ShichoChin on 2018/10/07.
//  Copyright © 2018 Chin ShiCho. All rights reserved.
//

import UIKit
import CoreData
class TodoListUsecase: NSObject {
    var convertWorker = ConvertWorker()
    
    func getTodoListData ()-> [TodoModel]{

        let requeset:NSFetchRequest = UserAction.fetchRequest()
        var results:[UserAction] = []
        do{
            try  results  = StorageManager.getManagedContext().fetch(requeset)
        }catch{
            
        }
        return  results.compactMap({ entity -> TodoModel in
            return convertWorker.convertUserAvtionEntityToModel(entity)
        })
    
    }
    
    func addTodo (_ todo:TodoModel) {
        
        let entity = StorageManager.makeEntity(UserAction.self)
        let action = UserAction(entity: entity, insertInto:StorageManager.getManagedContext())
        action.title = todo.title
        action.todo = todo.todo
        if todo.date != nil{
            action.date = todo.date! as NSDate
        }
        
        do{
            try StorageManager.save()
        }catch{
            
        }
    }
}
