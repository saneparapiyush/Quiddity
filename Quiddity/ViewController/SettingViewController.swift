//
//  SettingViewController.swift
//  Quiddity
//
//  Created by piyushMac on 30/01/17.
//  Copyright © 2017 piyushMac. All rights reserved.
//

import UIKit

class SettingViewController: AbstractViewController {
        
    let sectionHeader = ["Synchronization","Documents","Notifications","iPhone Contacts integration", "Calender Integration","Account","About"]
    
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
        case 0:
            return 2
        case 1,5:
            return 1
        case 2,3,4:
            return 5
        case 6:
            return 3
        default:
            return 0
        }
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "SettingViewCell") as! SettingViewCell
        
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
    
}
