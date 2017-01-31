//
//  dashBoardViewController.swift
//  Quiddity
//
//  Created by piyushMac on 09/11/16.
//  Copyright © 2016 piyushMac. All rights reserved.
//

import UIKit
import HMSegmentedControl

class dashBoardViewController: AbstractViewController {
    
    @IBOutlet weak var segmentContainer: UIView!
    
    let buttonMenu = XXXRoundMenuButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = getLocalizedString("Dashboard")
        showChildView(AppRouter.sharedRouter().getViewController("ContactListViewController"))
        
        configureNavigationBarShow()
        
        configFloatingMenu()
        // Do any additional setup after loading the view.

    }
    
    override func viewWillAppear(_ animated: Bool) {
        configSegment()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
//    MARK: - Helper method
    func configFloatingMenu() {
//        buttonMenu.frame = CGRectMake((self.view.frame.size.width/2) - 80, self.view.frame.size.height - 200, 160, 160)
        
        buttonMenu.frame = CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: self.view.frame.size.height * 1.6)
//        buttonMenu.centerIconType = .CustomImage
//        buttonMenu.centerIcon = UIImage(named: "error")
        
        if(UIScreen.main.bounds.size.width == 320) {
            buttonMenu.centerButtonSize = CGSize(width: 70, height: 70)
        } else if(UIScreen.main.bounds.size.width == 375) {
            buttonMenu.centerButtonSize = CGSize(width: 81, height: 81)
        } else {
            buttonMenu.centerButtonSize = CGSize(width: 90, height: 90)
        }
        
        buttonMenu.tintColor = UIColor.white
        buttonMenu.jumpOutButtonOnebyOne = true
        buttonMenu.backgroundColor = UIColor.clear

        buttonMenu.load(withIcons: [UIImage(named: "am_sm_todo_icon")!,UIImage(named: "am_sm_task_icon")!,UIImage(named: "am_sm_lead_icon")!,UIImage(named: "am_sm_contact_icon")!], startDegree: 1.8, layoutDegree: 2.65)
//        1.8 2.65
        self.view.addSubview(buttonMenu)
        
        buttonMenu.buttonClickBlock =  {(idx:NSInteger)-> Void in
            NSLog("%d", idx);
        }
    }
    func configSegment() -> HMSegmentedControl {

        var segmentView = HMSegmentedControl()
        
        segmentView = HMSegmentedControl(sectionImages: [UIImage(named: "ic_contact_unselected")!,UIImage(named: "ic_lead_unselected")!,UIImage(named: "ic_task_unselected")!,UIImage(named: "ic_todo_unselected")!], sectionSelectedImages: [UIImage(named: "ic_contact_selected")!,UIImage(named: "ic_lead_selected")!,UIImage(named: "ic_task_selected")!,UIImage(named: "ic_todo_selected")!], titlesForSections: [getLocalizedString("Contacts"),getLocalizedString("Leads"),getLocalizedString("Tasks"),getLocalizedString("Todo")])
        
        segmentView.selectionIndicatorLocation = .none
        segmentView.selectionStyle = .textWidthStripe
        segmentView.frame = CGRect(x: 0, y: 10, width: UIScreen.main.bounds.width, height: 44)
        segmentView.addTarget(self, action: #selector(self.segmentedControlChangedValue), for: .valueChanged)
        
        self.segmentContainer.addSubview(segmentView)
        
        return segmentView
    }
    func segmentedControlChangedValue(_ segmentedControl: HMSegmentedControl) {
        print(segmentedControl.selectedSegmentIndex)
        
        let router = AppRouter.sharedRouter()
        var viewController: AbstractViewController?
        self.removeChildviews()
        
        switch segmentedControl.selectedSegmentIndex {
        case 0:
            viewController = router.getViewController("ContactListViewController")
            break
        case 1:
            viewController = router.getViewController("LeadListViewController")
            break
        case 2:
            viewController = router.getViewController("TaskListViewController")
            break
        case 3:
            viewController = router.getViewController("TodoListViewController")
            break
        default:
            break
        }
        
        if viewController != nil {
            showChildView(viewController!)
        }
    }
    func removeChildviews() {
        if self.childViewControllers.count > 0 {
            for vc: UIViewController in self.childViewControllers {
                vc.removeFromParentViewController()
                vc.view.removeFromSuperview()
            }
        }
    }
    
    func showChildView(_ VC: UIViewController) {
        self.addChildViewController(VC)
        VC.view.frame = CGRect(x: 0, y: self.segmentContainer.frame.height, width: UIScreen.main.bounds.width, height: self.view.frame.height - 64)
        self.view.addSubview(VC.view)
        self.view.bringSubview(toFront: buttonMenu)
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

extension dashBoardViewController: SlideNavigationControllerDelegate {
    func slideNavigationControllerShouldDisplayLeftMenu() -> Bool
    {
        return true
    }
    func slideNavigationControllerShouldDisplayRightMenu() -> Bool
    {
        return false
    }
}
