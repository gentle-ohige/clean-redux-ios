//
//  DetailDailogState.swift
//  react-swift-test
//
//  Created by ShichoChin on 2018/10/09.
//  Copyright © 2018 Chin ShiCho. All rights reserved.
//

import UIKit

struct DetailDailogViewState {
    var dialogState:DialogBaseState = .hide
    var model:TodoModel?
    var title: String? = ""
    var todo: String? = ""
    var date: Date? = nil
    
    init(_ state:ReAppState) {
        switch  state.detailDialogState {
        case .show(let todo):
            model = todo
            break
        default:
            break
        }
        
        self.title = model?.title
        self.todo = model?.todo
        self.date = model?.date
    }
}
