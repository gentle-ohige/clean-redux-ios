//
//  TodoModel.swift
//  react-swift-test
//
//  Created by ShichoChin on 2018/10/07.
//  Copyright © 2018 Chin ShiCho. All rights reserved.
//

import UIKit


struct TodoModel{
    var title: String? = ""
    var todo: String? = ""
    var date: Date? = nil
}

extension TodoModel{
    
    static func fetchTodoGeneres(complition: @escaping ([TodoModel]) -> Void){
        let usecase:TodoListUsecase = TodoListUsecase()
        complition( usecase.getTodoListData())
    }
    
    static func saveTodo(_ todoModel:TodoModel,complition: (() -> Void)?) {
        let usecase:TodoListUsecase = TodoListUsecase()
        usecase.addTodo(todoModel)
        if complition != nil {
            complition!()
        }
       
    }
}
extension TodoModel:Equatable {
    static func == (lhs: TodoModel, rhs: TodoModel) -> Bool{
        let isEqual = lhs.title == rhs.title &&
                       lhs.todo == rhs.todo &&
                        lhs.date == rhs.date
        
        return isEqual
    }
}

