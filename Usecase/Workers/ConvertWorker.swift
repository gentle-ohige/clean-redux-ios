//
//  ConvertWorker.swift
//  react-swift-test
//
//  Created by ShichoChin on 2018/10/07.
//  Copyright © 2018 Chin ShiCho. All rights reserved.
//

import UIKit

class ConvertWorker: NSObject {

    func convertUserAvtionEntityToModel(_ action:UserAction) -> TodoModel{
        var todoModelData:TodoModel = TodoModel()
        if action.date != nil {
            todoModelData.date = action.date! as Date
        }
        
        todoModelData.todo = action.todo
        todoModelData.title = action.title
        return todoModelData
    }
}

