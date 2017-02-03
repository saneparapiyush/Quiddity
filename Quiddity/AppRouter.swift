//
//  AppRouter.swift
//  G3Telecom
//
//  Created by Dhiren Shah on 24/06/16.
//  Copyright © 2016 Dhiren Shah. All rights reserved.
//

import UIKit

let _sharedRouter: AppRouter = { AppRouter() }()

class AppRouter: NSObject, Controller {
    
    var appWindow : UIWindow?
    var container: UIViewController?
    var subContainerInTabbar: UINavigationController?
    var view: View?
    var shouldOpenPushNotification:Bool?
    
    // Singleton class
    class func sharedRouter() -> AppRouter {
        return _sharedRouter
    }
    
    func segueInitiatedForViewController(_ viewController: AbstractViewController) {
        viewController.controller = self
    }
    
    func getViewController(_ screenName: String) -> AbstractViewController {
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        let viewController = storyBoard.instantiateViewController(withIdentifier: screenName) as! AbstractViewController
        return viewController
    }
    
    // MARK: - Screen Navigation Methods -
    
    
}
