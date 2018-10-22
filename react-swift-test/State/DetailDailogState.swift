//
//  DetailDailogState.swift
//  react-swift-test
//
//  Created by ShichoChin on 2018/10/09.
//  Copyright © 2018 Chin ShiCho. All rights reserved.
//

import UIKit
import ReSwift

struct DetailDialogState:StateType {
    enum State:StateType{
        case hide
        case show(TodoModel)
        case showed
        case cancel
    }
    var viewState:State = .hide
    var data: TodoModel?
}

extension DetailDialogState {
    enum Act: Action {
        case showAddDialog(model:TodoModel)
    }
}


extension DetailDialogState {
    public static func reducer (action:Action,state : DetailDialogState?) -> DetailDialogState  {
        var state = state ?? DetailDialogState()
        guard  let action = action as? Act else {
            return state
        }
        
        switch action {
        case let .showAddDialog(model):
            state.data = model
            state.viewState = .hide
        }
  
        return state
    }
}


