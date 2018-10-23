//
//  ReSwiftUtil.swift
//  react-swift-test
//
//  Created by ShichoChin on 2018/10/22.
//  Copyright © 2018 Chin ShiCho. All rights reserved.
//

import UIKit

public protocol SubscriberRepeat{
    associatedtype viewState
    typealias isRepeatClosure = (viewState,viewState) -> Bool
    
}
