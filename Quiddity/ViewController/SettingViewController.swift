//
//  SettingViewController.swift
//  Quiddity
//
//  Created by piyushMac on 30/01/17.
//  Copyright © 2017 piyushMac. All rights reserved.
//

import UIKit

class SettingViewController: AbstractViewController {
        
    let sectionHeader = ["Synchronization","Documents","Notifications","iPhone Contacts integration", "Calender integration","Account","About"]
    
//    let arrSynchronization = ["Sync automatically":"Automatic sync", "Sync over WiFi only":"Conserves data usage","Clear Cache":"Remove local copies of documents","Show reminders": "Show reminders for tasks and appointments","Contacts":"Show notifications for contacts","Leads":"Show notifications for leads","Tasks":"Show notifications for tasks","Todo":"Show notifications for todo","iPhone Contact integration":"Check to enable iPhone Contacts integration","Calender integration":"Check to enable Calender integration","User":"testios@gmail.com","Sign Out": "Clear all your account data from this device","Build version":"1.1","Help":"Get help using Quiddity","Feedback":"We'd love to hear you! send us an email with your feedback"]
    let arrSynchronization = ["Sync automatically":"Automatic sync", "Sync over WiFi only":"Conserves data usage"]
    let arrDocuments = ["Clear Cache":"Remove local copies of documents"]
    let arrNotifications = ["Show reminders": "Show reminders for tasks and appointments","Contacts":"Show notifications for contacts","Leads":"Show notifications for leads","Tasks":"Show notifications for tasks","Todo"
        :"Show notifications for todo"]
    let arriPhoneContactsintegration = ["iPhone Contact integration":"Check to enable iPhone Contacts integration"]
    let arrCalenderIntegration = ["Calender integration":"Check to enable Calender integration"]
    let arrAccount = ["User":"testios@gmail.com","Sign Out": "Clear all your account data from this device"]
    let arrAbout = ["Build version":"1.1","Help":"Get help using Quiddity","Feedback":"We'd love to hear you! send us an email with your feedback"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = getLocalizedString("Setting")
        // Do any additional setup after loading the view.
    }
}

extension SettingViewController: UITableViewDelegate,UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 7
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
        return sectionHeader[section]
    }

    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        let header = view as! UITableViewHeaderFooterView
        header.backgroundView?.backgroundColor = UIColor.white
        header.textLabel?.textColor = themeBlueColor
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0,5:
            return 2
        case 1,3,4:
            return 1
        case 2:
            return 5
        case 6:
            return 3
        default:
            return 0
        }
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "SettingViewCell") as! SettingViewCell
        
        switch indexPath.section {
        case 0:
            cell.setDataSource(Title: [String](arrSynchronization.keys)[indexPath.row], Subtitle: [String](arrSynchronization.values)[indexPath.row],isSwitchVisible: true,isStatus: true)
        case 1:
            cell.setDataSource(Title: [String](arrDocuments.keys)[indexPath.row], Subtitle: [String](arrDocuments.values)[indexPath.row],isSwitchVisible: false,isStatus: true)
        case 2:
            cell.setDataSource(Title: [String](arrNotifications.keys)[indexPath.row], Subtitle: [String](arrNotifications.values)[indexPath.row],isSwitchVisible: true,isStatus: true)
        case 3:
            cell.setDataSource(Title: [String](arriPhoneContactsintegration.keys)[indexPath.row], Subtitle: [String](arriPhoneContactsintegration.values)[indexPath.row],isSwitchVisible: true,isStatus: false)
        case 4:
            cell.setDataSource(Title: [String](arrCalenderIntegration.keys)[indexPath.row], Subtitle: [String](arrCalenderIntegration.values)[indexPath.row],isSwitchVisible: true,isStatus: true)
        case 5:
            cell.setDataSource(Title: [String](arrAccount.keys)[indexPath.row], Subtitle: [String](arrAccount.values)[indexPath.row],isSwitchVisible: false,isStatus: false)
        case 6:
                cell.setDataSource(Title: [String](arrAbout.keys)[indexPath.row], Subtitle: [String](arrAbout.values)[indexPath.row],isSwitchVisible: false,isStatus: true)
        default:
            print("section none")
        }
        
        return cell
    }

}

extension SettingViewController: SlideNavigationControllerDelegate {
    func slideNavigationControllerShouldDisplayLeftMenu() -> Bool
    {
        return true
    }
    func slideNavigationControllerShouldDisplayRightMenu() -> Bool
    {
        return false
    }
}

class SettingViewCell: UITableViewCell {
    @IBOutlet var lblTitle: UILabel!
    @IBOutlet var lblSubtitle: UILabel!
    
    @IBOutlet var switchStatus: UISwitch!
    
    func setDataSource(Title: String, Subtitle: String, isSwitchVisible: Bool, isStatus:Bool) {
        lblTitle.text = Title
        lblSubtitle.text = Subtitle
        switchStatus.isHidden = !isSwitchVisible
        switchStatus.isOn = isStatus
    }
    
}
