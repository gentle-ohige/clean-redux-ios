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
        mainStore.dispatch(TodoListState.Act.setFetchedTodoData(datas: todos))
    })
    
    return nil
}





