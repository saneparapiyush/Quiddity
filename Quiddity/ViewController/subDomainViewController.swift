//
//  subDomainViewController.swift
//  Quiddity
//
//  Created by piyushMac on 03/11/16.
//  Copyright © 2016 piyushMac. All rights reserved.
//

import UIKit

class subDomainViewController: AbstractViewController {

    @IBOutlet weak var txtSubDomain: TextFieldValidator!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUI()
        configureNavigationBarHide()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - UI
    func configureUI() {
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 60, height: self.txtSubDomain.frame.height))
        let subView = UIView(frame: CGRect(x: 0, y: 0, width: 50, height: self.txtSubDomain.frame.height))
        let imgIcon = UIImageView(image: UIImage(named: "ic_subdomain"))
        imgIcon.frame = CGRect(x: 15, y: 15, width: 20, height: 20)
        subView.backgroundColor = themeBlueColor
        paddingView.addSubview(subView)
        paddingView.addSubview(imgIcon)
        txtSubDomain.leftView = paddingView
        txtSubDomain.leftViewMode = .always
        txtSubDomain.layer.cornerRadius = 3.0
        
        self.txtSubDomain.attributedPlaceholder! = self.multipleColorPlaceHolder("Subdomain.quiddity.net.au", Range: 9)        
    }
    func multipleColorPlaceHolder(_ str: String, Range Rannge: Int) -> NSAttributedString {
        let attString = NSMutableAttributedString(string: str)
//        attString.addAttribute(NSForegroundColorAttributeName, value: UIColor.darkGrayColor(), range: NSMakeRange(0, Rannge))
        attString.addAttribute(NSForegroundColorAttributeName, value: themeBlueColor, range: NSMakeRange(Rannge + 1, str.characters.count - Rannge - 1))
        return attString
    }
    
    // MARK: - Action
    
    
    @IBAction func btnNextPressed(_ sender: AnyObject) {
        nextLogin()
    }
    
    func nextLogin() {
        if txtSubDomain.validate() {
            self.performSegue(withIdentifier: "showLoginScreen", sender: self)
        }
    }
    
    //    MARK: - TextFeild Delegate
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        
        switch textField {
        case txtSubDomain:
            nextLogin()
            break
        default:
            break
        }
        
        return true
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
//    let padding = UIEdgeInsets(top: 0, left: 60, bottom: 0, right: 5);
//    
//    func textRectForBounds(bounds: CGRect) -> CGRect {
//        return UIEdgeInsetsInsetRect(bounds, padding)
//    }
//    
//    func placeholderRectForBounds(bounds: CGRect) -> CGRect {
//        return UIEdgeInsetsInsetRect(bounds, padding)
//    }
//    
//    func editingRectForBounds(bounds: CGRect) -> CGRect {
//        return UIEdgeInsetsInsetRect(bounds, padding)
//    }

}
