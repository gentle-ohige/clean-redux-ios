//
//  MainState.swift
//  react-swift-test
//
//  Created by ShichoChin on 2018/09/10.
//  Copyright © 2018 Chin ShiCho. All rights reserved.
//

import ReSwift

func mainReducer (action:Action,state : ReAppState?) -> ReAppState {
    var state = state ?? ReAppState()
    
    guard let action = action as? MainAction else {
        return state
    }
    
    switch action {
    case .setFetchedTodoData(let datas):
        state.datas = datas
    case .showAddDialog:
        state.addDialogState = .show
    case .setAddTodoState(let proto):
        state.addDialogState = .save(proto)
        break
    case .hideAddDialog:
        state.addDialogState = .hide
        break
     
     //Todo
    case .showDetailDialog(let todo):
         //state.DetailTodoDialogState.dialogData = todo
        // state.DetailTodoDialogState.dialogState = .show
        break
    case .hideDetailDialog:
        //state.DetailTodoDialogState.dialogState = .hide
        break
    }
    
    return state
}
