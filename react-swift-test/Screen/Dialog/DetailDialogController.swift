//
//  AddActionDialogController.swift
//  react-swift-test
//
//  Created by ShichoChin on 2018/09/30.
//  Copyright © 2018 Chin ShiCho. All rights reserved.
//

import UIKit
import ReSwift

class DetailDialogController: DialogViewController,DialogViewProtocol{
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var todoLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view
    }
    
    override func viewWillAppear(_ animated: Bool) {
        mainStore.subscribe(self, transform: {$0.select(DetailDailogViewState.init)})
    }
    override func viewWillDisappear(_ animated: Bool) {
      mainStore.unsubscribe(self)
      mainStore.dispatch(MainAction.hideAddDialog)
    }
    static func makeDialog() -> UIViewController {
        let storyboard  =  UIStoryboard.init(name: "Dialog", bundle: nil)
        let controller = storyboard.instantiateViewController(withIdentifier: "DetailTodoDialog")
        controller.modalPresentationStyle = .overCurrentContext
        controller.modalTransitionStyle = .crossDissolve
        return controller
    }
    
    @IBAction func editTodo(){
        
    }
    
    @IBAction func closeDialog(){
       dismiss(animated: true, completion: nil)
    }
}

extension DetailDialogController: StoreSubscriber {
    typealias StoreSubscriberStateType = DetailDailogViewState
    func newState(state: DetailDailogViewState) {
        titleLabel.text = state.title
        todoLabel.text = state.todo
        
    }
}


