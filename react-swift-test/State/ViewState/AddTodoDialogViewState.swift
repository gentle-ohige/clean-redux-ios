//
//  AddTodoDialogState.swift
//  react-swift-test
//
//  Created by ShichoChin on 2018/10/07.
//  Copyright © 2018 Chin ShiCho. All rights reserved.
//

import UIKit


protocol AddTodoDialogDataProtocol {
    var todoTitle:String? {get set}
    var todo:String? {get set}
    var date:Date? {get set}
}

//Action
struct AddTodoDialogViewState:AddTodoDialogDataProtocol{
    
    var todoTitle: String?
    var todo: String?
    var date: Date?
    
    
    init(_ state:ReAppState) {
        switch  state.addDialogState {
        case .save(let proto):
            self.todoTitle = proto.todoTitle
            self.todo = proto.todo
            self.date = proto.date
            break
        default:
            break
        }
    }
}



