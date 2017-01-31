//
//  LeadListViewController.swift
//  Quiddity
//
//  Created by piyushMac on 10/11/16.
//  Copyright © 2016 piyushMac. All rights reserved.
//

import UIKit

class LeadListViewController: AbstractViewController {
    
    @IBOutlet weak var tblLeadList: UITableView!
    
    fileprivate var oldStoredCell:PKSwipeTableViewCell?
    
    var dSLeadName = [String]()
    var dSLeadDetail = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        dSLeadName = ["Beehive Solution","Mark Johnson","Lawrence Willis","Global Web Design","The Bus"]
//        dSLeadDetail = ["Owner Vivek Trivedi","Owner Vivek Trivedi","Owner Vivek Trivedi","Owner Vivek Trivedi","Owner Vivek Trivedi"]
        
        var i = 1
        while i <= 25 {
            
            dSLeadName.append("Lead Title \(i)")
            dSLeadDetail.append("Lead info...")
            
            i = i + 1
        }
        
        tblLeadList.delegate = self
        tblLeadList.dataSource = self
    }
    
}
extension LeadListViewController:UITableViewDataSource,UITableViewDelegate,PKSwipeCellDelegateProtocol {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dSLeadName.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tblLeadList.dequeueReusableCell(withIdentifier: "LeadListCell") as! LeadListCell
        cell.delegate = self
//        cell.LeadName = dSLeadName[indexPath.row]
//        cell.LeadDetail = dSLeadDetail[indexPath.row]
        cell.configureCell(dSLeadName[indexPath.row],LeadDetail: dSLeadDetail[indexPath.row])
//        cell.setUpUI()
        
        return cell
    }
    
    func swipeBeginInCell(_ cell: PKSwipeTableViewCell) {
        oldStoredCell = cell
    }
    
    func swipeDoneOnPreviousCell() -> PKSwipeTableViewCell? {
        guard let cell = oldStoredCell else {
            return nil
        }
        return cell
    }
}

class LeadListCell: PKSwipeTableViewCell {
    @IBOutlet weak var lblStatusColor: UILabel!
    
    @IBOutlet weak var imgLead: UIImageView!
    
    @IBOutlet weak var lblLeadName: UILabel!
    
    @IBOutlet weak var lblLeadDetail: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        self.addRightViewInCell()
        // Initialization code
    }
    
    func configureCell(_ LeadName:String,LeadDetail:String) {
        lblLeadName.text = LeadName
        lblLeadDetail.text = LeadDetail
    }
    func addRightViewInCell() {
        let detailView = LeadListView().instanceFromNib()
        
        let lblCreatedDate = detailView.viewWithTag(1) as! UILabel
        lblCreatedDate.text = "28/10/2016"
        
        let lblDueDate = detailView.viewWithTag(2) as! UILabel
        lblDueDate.text = "29/10/2016"
        
        let txtProbability = detailView.viewWithTag(3) as! UITextField
        txtProbability.text = "50"
        
        let txtLeadValue = detailView.viewWithTag(4) as! UITextField
        txtLeadValue.text = "A$ 300.00"
        
        detailView.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: self.bounds.height)
        super.addRightOptionsView(detailView)
    }
    
    func callButtonClicked(){
        //Reset the cell state and close the swipe action
        self.resetCellState()
    }
}

class LeadListView: UIView {
    
   func instanceFromNib() -> UIView {
    
        return UINib(nibName: "LeadDetailView", bundle: nil).instantiate(withOwner: nil, options: nil)[0] as! UIView
    }
}
