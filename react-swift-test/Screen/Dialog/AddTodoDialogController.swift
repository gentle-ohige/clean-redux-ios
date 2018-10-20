//
//  AddActionDialogController.swift
//  react-swift-test
//
//  Created by ShichoChin on 2018/09/30.
//  Copyright © 2018 Chin ShiCho. All rights reserved.
//

import UIKit
import ReSwift

class AddTodoDialogController: DialogViewController,DialogViewProtocol,AddTodoDialogDataProtocol{
    var todoTitle: String? = ""
    var todo: String? = ""
    var date: Date? = nil
    

    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var todoTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view
    }
    
    override func viewWillAppear(_ animated: Bool) {
        mainStore.subscribe(self, transform: {$0.select(AddTodoDialogViewState.init)})
        //init Data
        titleTextField.text = ""
        todoTextField.text = ""
    }
    override func viewWillDisappear(_ animated: Bool) {
      mainStore.unsubscribe(self)
      mainStore.dispatch(MainAction.hideAddDialog)
    }
    static func makeDialog() -> UIViewController {
        let storyboard  =  UIStoryboard.init(name: "Dialog", bundle: nil)
        let controller = storyboard.instantiateViewController(withIdentifier: "AddTodoDialog")
        controller.modalPresentationStyle = .overCurrentContext
        controller.modalTransitionStyle = .crossDissolve
        return controller
    }
    
    
    @IBAction func addUserTodo (_ any:AnyObject) {
       self.todoTitle = titleTextField.text
       self.todo = todoTextField.text
       self.date = Date()
       mainStore.dispatch(MainAction.setAddTodoState(self))
       mainStore.dispatch(addTodoData)
       dismiss(animated: true, completion: nil)
    }
    
    @IBAction func closeDialog(){
       dismiss(animated: true, completion: nil)
    }
}

extension AddTodoDialogController: StoreSubscriber {
    typealias StoreSubscriberStateType = AddTodoDialogViewState
    func newState(state: AddTodoDialogViewState) {
        
    }
}


