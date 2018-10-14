//
//  ShowTestLabel.swift
//  react-swift-test
//
//  Created by ShichoChin on 2018/09/10.
//  Copyright © 2018 Chin ShiCho. All rights reserved.
//

import ReSwift

enum MainAction:Action {
    case setFetchedTodoData(datas:[TodoModel])
    
    //MainController
    case showAddDialog
    case setAddTodoState(_ proto:AddTodoDialogDataProtocol)
    case hideAddDialog
    
    case showDetailDialog(_ todoModel:TodoModel)
    case hideDetailDialog
    
}
