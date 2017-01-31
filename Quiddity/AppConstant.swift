//
//  AppConstant.swift
//  Quiddity
//
//  Created by piyushMac on 03/11/16.
//  Copyright © 2016 piyushMac. All rights reserved.
//

import UIKit

let themeBlueColor = UIColor(red: 0.0/255.0, green: 178.0/255.0, blue: 235.0/255.0, alpha: 1.0)

let REGEX_EMAIL = "[A-Z0-9a-z._%+-]{3,}+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}"

enum AppScreenType: Int {
    case sub_DOMAIN_SCREEN_TYPE
    case login_SCREEN_TYPE
    case dashboard_SCREEN_TYPE
    case contacts_LIST_SCREEN_TYPE
    case lead_LIST_SCREEN_TYPE
    case task_LIST_SCREEN_TYPE
    case todo_LIST_SCREEN_TYPE
}
