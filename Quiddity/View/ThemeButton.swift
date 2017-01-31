//
//  ThemeButton.swift
//  Quiddity
//
//  Created by piyushMac on 03/11/16.
//  Copyright © 2016 piyushMac. All rights reserved.
//

import UIKit

class ThemeButton: UIButton {
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.layer.cornerRadius = 3.0
        self.backgroundColor = themeBlueColor
        self.setTitleColor(UIColor.white, for: UIControlState())
        self.titleLabel?.font = UIFont(name: "Helvetica", size: 16)
    }
}

class ThemeTextField: UITextField {
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.layer.cornerRadius = 3.0
    }
    let padding = UIEdgeInsets(top: 0, left: 60, bottom: 0, right: 5);
    
    override func textRect(forBounds bounds: CGRect) -> CGRect {
        return UIEdgeInsetsInsetRect(bounds, padding)
    }
    
    override func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        return UIEdgeInsetsInsetRect(bounds, padding)
    }
    
    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        return UIEdgeInsetsInsetRect(bounds, padding)
    }
}
