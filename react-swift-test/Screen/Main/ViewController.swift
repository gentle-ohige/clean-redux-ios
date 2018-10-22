//
//  ViewController.swift
//  react-swift-test
//
//  Created by ShichoChin on 2018/09/09.
//  Copyright © 2018 Chin ShiCho. All rights reserved.
//

import UIKit
import ReSwift

import RxCocoa
import RxSwift

import CoreData

// MARK: ViewController
class ViewController: UIViewController {

    var todos:[TodoModel]?
    let diposeBag = DisposeBag ()

    let addTodoDialog = AddTodoDialogController.makeDialog()
    let detailDialog = DetailDialogController.makeDialog()

    @IBOutlet weak var tableview: UITableView! {
        didSet {
            tableview.rx.itemSelected.bind(onNext: {_ in
            
            }).disposed(by:diposeBag)
            
            tableview.rx.willDisplayCell.bind(onNext: {_ in
               
            }).disposed(by:diposeBag)
        }
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func viewWillAppear(_ animated: Bool) {
        mainStore.subscribe(self){$0.select(ViewState.init).skipRepeats(ViewState.isSkip())}
    }
    

    override func viewWillDisappear(_ animated: Bool) {
        mainStore.unsubscribe(self)
    }

    override func viewDidAppear(_ animated: Bool) {
        print("viewDidAppear")
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return todos?.count ?? 0
    }
}
// MARK: ViewAction
extension ViewController  {
    @IBAction func showAddDialog () {
        present(addTodoDialog, animated: true, completion: nil)
    }
}



// MARK: StoreSubscriber
extension ViewController : StoreSubscriber {
    
    typealias StoreSubscriberStateType = ViewState
    
    func newState(state: ViewState) {
        print("ViewController-newState")
        todos = state.datas
        tableview.reloadData()
    }
}

// MARK: DataSource
extension ViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")
        cell?.textLabel?.text = todos?[indexPath.row].title
        cell?.detailTextLabel?.text = todos?[indexPath.row].todo
        return cell!
    }
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        mainStore.dispatch(DetailDialogState.Act.showAddDialog(model:todos?[indexPath.row] ?? TodoModel()))
        present(detailDialog, animated: true, completion: nil)
    }
}

// MARK: ViewState
struct ViewState {
    let datas:[TodoModel]
    init(_ state: ReAppState) {
        datas = state.todoListState.datas
    }
}


extension  ViewState: SubscriberRepeat {
    typealias viewState = ViewState
    static func isSkip () -> isRepeatClosure {
        return {(pre,next) in
            return pre.datas == next.datas
        }
    }
}






