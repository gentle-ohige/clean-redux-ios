//
//  AddTodoDialogState.swift
//  react-swift-test
//
//  Created by ShichoChin on 2018/10/07.
//  Copyright © 2018 Chin ShiCho. All rights reserved.
//

import UIKit
import ReSwift

struct AddTodoDialogState:StateType {
    enum State{
        case hide
        case show
        case showed
        case cancel
    }
    var viewState:State = .hide
}
// MEMO: ACTION
extension AddTodoDialogState {
    enum Act: Action {
    }
    
    static public func addTodoData(_ model:TodoModel) -> Store<ReAppState>.ActionCreator {
        return {(state: ReAppState, store: Store<ReAppState>) in
            var modelData = TodoModel()
            modelData.title = model.title
            modelData.todo = model.todo
            modelData.date = model.date
            TodoModel.saveTodo(modelData, complition: {
                mainStore.dispatch(fetchTodoData)
            })
            return nil
        }
    }
}

// MARK: REDUCER
extension AddTodoDialogState {
    public static func reducer (action:Action,state : AddTodoDialogState?) -> AddTodoDialogState  {
        var state = state ?? AddTodoDialogState()
        return state
    }
}





