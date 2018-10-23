//
//  TodoListState.swift
//  react-swift-test
//
//  Created by ShichoChin on 2018/10/04.
//  Copyright © 2018 Chin ShiCho. All rights reserved.
//

import UIKit
import ReSwift

struct TodoListState:StateType {
    var datas: [TodoModel] = []
}

extension TodoListState {
    enum  Act:ReSwift.Action {
        case setFetchedTodoData(datas:[TodoModel])
    }
}

extension TodoListState {
    public static func reducer (action:Action,state : TodoListState?) -> TodoListState  {
        var state = state ?? TodoListState()
        guard let action = action as? TodoListState.Act else { return state }
        switch action {
        case let .setFetchedTodoData(datas) :
             state.datas = datas
        }
        return state
    }
}


