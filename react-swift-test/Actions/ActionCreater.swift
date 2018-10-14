//
//  ActionCreater.swift
//  react-swift-test
//
//  Created by ShichoChin on 2018/10/08.
//  Copyright © 2018 Chin ShiCho. All rights reserved.
//

import ReSwift

func fetchTodoData(state: ReAppState, store: Store<ReAppState>) -> Action? {
    
    TodoModel.fetchTodoGeneres(complition: { todos in
        mainStore.dispatch(MainAction.setFetchedTodoData(datas: todos))
    })
    
    return nil
}

func addTodoData(state: ReAppState, store: Store<ReAppState>) -> Action? {
    guard case let .save(data) = state.addDialogState else {
        return nil
    }
    
    //convertdata to model
    var modelData = TodoModel()
    modelData.title = data.todoTitle
    modelData.todo = data.todo
    modelData.date = data.date
    TodoModel.saveTodo(modelData, complition: nil)
    return nil
}
