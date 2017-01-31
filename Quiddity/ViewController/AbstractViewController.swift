//
//  AbstractViewController.swift
//  G3Telecom
//
//  Created by Dhiren Shah on 21/06/16.
//  Copyright © 2016 Dhiren Shah. All rights reserved.
//

import UIKit

protocol Controller {
    var view: View? { get set }
}

protocol View {
    var controller: Controller? { get set }
}

class AbstractViewController: UIViewController, View {
    
    var controller: Controller?
    var screenType: AppScreenType?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func configureNavigationBarHide() {
        self.navigationController?.navigationBar.isHidden = true
    }
    func configureNavigationBarShow() {
        self.navigationController?.navigationBar.isHidden = false
    }
    func configureBackButtonOnNavigationBar() {
        if let navController = (self.navigationController as? SlideNavigationController) {
            self.navigationItem.setHidesBackButton(true, animated: false)
//            self.navigationItem.leftBarButtonItem = navController.btnBarBack
        }
    }
    /*
    // MARK: - Navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    }
    */
    
    // MARK: - Action Methods -
    
    
    // MARK: - Helper Methods -
}
