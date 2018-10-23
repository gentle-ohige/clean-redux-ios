//
//  MainState.swift
//  react-swift-test
//
//  Created by ShichoChin on 2018/09/10.
//  Copyright © 2018 Chin ShiCho. All rights reserved.
//

import UIKit
import ReSwift

struct ReAppState:StateType {
    var todoListState = TodoListState()
    var addDialogState = AddTodoDialogState()
    var detailDialogState = DetailDialogState()
}

extension ReAppState {
    public static func reducer (action:Action,state : ReAppState?) -> ReAppState {
        var state = state ?? ReAppState()
        state.todoListState = TodoListState.reducer( action: action,
                                                     state: state.todoListState)
        state.addDialogState = AddTodoDialogState.reducer( action: action,
                                                     state: state.addDialogState)
        state.detailDialogState = DetailDialogState.reducer( action: action,
                                                     state: state.detailDialogState)
        
        return state
    }
}

let mainStore = Store( reducer: ReAppState.reducer, state: nil, middleware: [logMiddleware] )


let logMiddleware: Middleware<ReAppState> = {dispatch,getState in
    return {
        next in
        return {
            action in
            //print(action)
            return next(action)
        }
    
    }}

