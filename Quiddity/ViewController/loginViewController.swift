//
//  loginViewController.swift
//  Quiddity
//
//  Created by piyushMac on 03/11/16.
//  Copyright © 2016 piyushMac. All rights reserved.
//

import UIKit

class loginViewController: AbstractViewController,UITextFieldDelegate {

    @IBOutlet weak var txtUsername: TextFieldValidator!
    
    @IBOutlet weak var txtPassword: TextFieldValidator!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        configureUI()
        configValidation()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - UI
    func configureUI() {
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 60, height: self.txtUsername.frame.height))
        let subView = UIView(frame: CGRect(x: 0, y: 0, width: 50, height: self.txtUsername.frame.height))
        let imgIcon = UIImageView(image: UIImage(named: "ic_email"))
        imgIcon.frame = CGRect(x: 15, y: 15, width: 20, height: 20)
        subView.backgroundColor = themeBlueColor
        paddingView.addSubview(subView)
        paddingView.addSubview(imgIcon)
        txtUsername.leftView = paddingView
        txtUsername.leftViewMode = .always
        txtUsername.layer.cornerRadius = 3.0
        
        let paddingView2 = UIView(frame: CGRect(x: 0, y: 0, width: 60, height: self.txtPassword.frame.height))
        let subView2 = UIView(frame: CGRect(x: 0, y: 0, width: 50, height: self.txtPassword.frame.height))
        let imgIcon2 = UIImageView(image: UIImage(named: "ic_password"))
        imgIcon2.frame = CGRect(x: 15, y: 15, width: 20, height: 20)
        subView2.backgroundColor = themeBlueColor
        paddingView2.addSubview(subView2)
        paddingView2.addSubview(imgIcon2)
        txtPassword.leftView = paddingView2
        txtPassword.leftViewMode = .always
        txtPassword.layer.cornerRadius = 3.0
    }
    
    func configValidation()
    {
        txtUsername.addRegx(REGEX_EMAIL, withMsg: getLocalizedString("Invalid_Email"))
    }

    // MARK: - Action
    
    @IBAction func btnLoginPressed(_ sender: AnyObject) {
        
        login()
    }
    
    func login() {
        if txtUsername.validate() && txtPassword.validate() {
            self.performSegue(withIdentifier: "showDashBoardScreen", sender: self)
        }
        
    }
//    MARK: - TextFeild Delegate
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        
        switch textField {
        case txtUsername:
            txtPassword.becomeFirstResponder()
        case txtPassword:
            login()
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

}
