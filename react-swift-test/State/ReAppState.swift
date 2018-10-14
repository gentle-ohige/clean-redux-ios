//
//  MainState.swift
//  react-swift-test
//
//  Created by ShichoChin on 2018/09/10.
//  Copyright © 2018 Chin ShiCho. All rights reserved.
//

import UIKit
import ReSwift

enum AddTodoDialogState {
    case hide
    case show
    case showed
    case cancel
    case save(AddTodoDialogDataProtocol)
}

enum DetailDialogState {
    case hide
    case show(TodoModel)
    case showed
    case cancel
    case upDate(TodoModel)
}

struct ReAppState:StateType {
    var datas: [TodoModel] = []
    var addDialogState: AddTodoDialogState = .hide
    var detailDialogState: DetailDialogState = .hide
}

