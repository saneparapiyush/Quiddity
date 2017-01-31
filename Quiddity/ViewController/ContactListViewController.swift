//
//  ContactListViewController.swift
//  Quiddity
//
//  Created by piyushMac on 10/11/16.
//  Copyright © 2016 piyushMac. All rights reserved.
//

import UIKit

class ContactListViewController: AbstractViewController {

    @IBOutlet weak var tblContactList: UITableView!
    
    
    var dSContactName = [String]()
    var dSContactDetail = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        dSContactName = ["Beehive Solution","Mark Johnson","Lawrence Willis","Global Web Design","The Bus"]
        dSContactDetail = ["Owner Vivek Trivedi","Owner Vivek Trivedi","Owner Vivek Trivedi","Owner Vivek Trivedi","Owner Vivek Trivedi"]
        /*
        var i = 1
        while i <= 25 {
            
            dSContactName.append("Contact Name \(i)")
            dSContactDetail.append("Contact Info...")
            
            i = i + 1
        }
        */
        tblContactList.delegate = self
        tblContactList.dataSource = self
    }
    
}
extension ContactListViewController:UITableViewDataSource,UITableViewDelegate {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dSContactName.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tblContactList.dequeueReusableCell(withIdentifier: "ContactListCell") as! ContactListCell
        
        cell.ContactName = dSContactName[indexPath.row]
        cell.ContactDetail = dSContactDetail[indexPath.row]
        cell.setUpUI()
        
        return cell
    }    
}

class ContactListCell: UITableViewCell {
    @IBOutlet weak var lblStatusColor: UILabel!
    
    @IBOutlet weak var imgContact: UIImageView!
    
    @IBOutlet weak var lblContactName: UILabel!
    
    @IBOutlet weak var lblContactDetail: UILabel!
    
    var ContactName: String?
    var ContactDetail: String?
    
    func setUpUI() {
        lblContactName.text = ContactName
        lblContactDetail.text = ContactDetail
    }
}
