//
//  TodoListState.swift
//  react-swift-test
//
//  Created by ShichoChin on 2018/10/04.
//  Copyright © 2018 Chin ShiCho. All rights reserved.
//

import UIKit

enum TodoListState {
    case set([TodoModel])
    case reload([TodoModel])
}

struct TodoListViewState {
    let datas:[TodoModel]
    
    init(_ state: ReAppState) {
        datas = state.datas
        
        //ViewState
    }
}
