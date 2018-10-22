//
//  AddActionDialogController.swift
//  react-swift-test
//
//  Created by ShichoChin on 2018/09/30.
//  Copyright © 2018 Chin ShiCho. All rights reserved.
//

import UIKit
import ReSwift

class AddTodoDialogController: DialogViewController,DialogViewProtocol{

    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var todoTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view
    }
    
    override func viewWillAppear(_ animated: Bool) {
        mainStore.subscribe(self){$0.select(AddTodoDialogViewState.init)}
        titleTextField.text = ""
        todoTextField.text = ""
    }
    override func viewWillDisappear(_ animated: Bool) {
      mainStore.unsubscribe(self)
    }
    static func makeDialog() -> UIViewController {
        let storyboard  =  UIStoryboard.init(name: "Dialog", bundle: nil)
        let controller = storyboard.instantiateViewController(withIdentifier: "AddTodoDialog")
        controller.modalPresentationStyle = .overCurrentContext
        controller.modalTransitionStyle = .crossDissolve
        return controller
    }
    
    
    @IBAction func addUserTodo (_ any:AnyObject) {
       var model = TodoModel()
       model.title = titleTextField.text
       model.todo = todoTextField.text
       model.date = Date()
       mainStore.dispatch(AddTodoDialogState.addTodoData(model))
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

// MARK: ViewState
struct AddTodoDialogViewState{
    var todoTitle: String?
    var todo: String?
    var date: Date?
    
    init(_ state:ReAppState) {
        switch  state.addDialogState.viewState {
        default:
            break
        }
    }
}

extension AddTodoDialogState: SubscriberRepeat {
    typealias viewState = AddTodoDialogState
    static func isSkip () -> isRepeatClosure {
        return {(pre,next) in
            return false}
    }
}
