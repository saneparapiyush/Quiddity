//
//  TaskListViewController.swift
//  Quiddity
//
//  Created by piyushMac on 10/11/16.
//  Copyright © 2016 piyushMac. All rights reserved.
//

import UIKit

class TaskListViewController: AbstractViewController {
    
    @IBOutlet weak var tblTaskList: UITableView!
    
    var dSTaskName = [String]()
    var dSTaskDetail = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var i = 1
        while i <= 25 {
            
            dSTaskName.append("Task Title \(i)")
            dSTaskDetail.append("Task info...")
            
            i = i + 1
        }
        
        tblTaskList.delegate = self
        tblTaskList.dataSource = self
    }
    
}
extension TaskListViewController:UITableViewDataSource,UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dSTaskName.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tblTaskList.dequeueReusableCell(withIdentifier: "TaskListCell") as! TaskListCell
        
        cell.TaskName = dSTaskName[indexPath.row]
        cell.TaskDetail = dSTaskDetail[indexPath.row]
        cell.setUpUI()
        
        return cell
    }
}

class TaskListCell: UITableViewCell {
    @IBOutlet weak var lblStatusColor: UILabel!
    
    @IBOutlet weak var imgTask: UIImageView!
    
    @IBOutlet weak var lblTaskName: UILabel!
    
    @IBOutlet weak var lblTaskDetail: UILabel!
    
    var TaskName: String?
    var TaskDetail: String?
    
    func setUpUI() {
        lblTaskName.text = TaskName
        lblTaskDetail.text = TaskDetail
    }
}
