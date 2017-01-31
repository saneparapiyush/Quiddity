//
//  TodoListViewController.swift
//  Quiddity
//
//  Created by piyushMac on 10/11/16.
//  Copyright © 2016 piyushMac. All rights reserved.
//

import UIKit

class TodoListViewController: AbstractViewController {

    @IBOutlet weak var tblTodoList: UITableView!
    
    var dSTodoName = [String]()
    var dSTodoDetail = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var i = 1
        while i <= 25 {
            
            dSTodoName.append("Todo \(i)")
            dSTodoDetail.append("Todo info...")
            
            i = i + 1
        }
        
        tblTodoList.delegate = self
        tblTodoList.dataSource = self
    }
    
}
extension TodoListViewController:UITableViewDataSource,UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dSTodoName.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tblTodoList.dequeueReusableCell(withIdentifier: "TodoListCell") as! TodoListCell
        
        cell.TodoName = dSTodoName[indexPath.row]
        cell.TodoDetail = dSTodoDetail[indexPath.row]
        cell.setUpUI()
        
        return cell
    }
}

class TodoListCell: UITableViewCell {
    @IBOutlet weak var lblStatusColor: UILabel!
    
    @IBOutlet weak var imgTodo: UIImageView!
    
    @IBOutlet weak var lblTodoName: UILabel!
    
    @IBOutlet weak var lblTodoDetail: UILabel!
    
    var TodoName: String?
    var TodoDetail: String?
    
    func setUpUI() {
        lblTodoName.text = TodoName
        lblTodoDetail.text = TodoDetail
    }
}
