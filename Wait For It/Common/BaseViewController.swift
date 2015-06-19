//
//  CuesViewController.swift
//  Wait For It
//
//  Created by Brian Anderson on 6/10/15.
//  Copyright (c) 2015 Solstice Mobile. All rights reserved.
//

import Foundation
import UIKit

class BaseViewController: GAITrackedViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        if let navigationController = self.navigationController {
            navigationController.navigationBar.hidden = !showNavigationBar()
            navigationController.navigationBar.translucent = showNavigationBar()
        }
        
        UITabBar.appearance().tintColor = Constants.Colors.OrangeActiveButton
    }

    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        self.screenName = screenNameForAnalytics()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func screenNameForAnalytics() -> String {
        fatalError("Sub-classed Cues View Controller should override screenNameForAnalytics method.")
    }

    func showNavigationBar() -> Bool {
        return false
    }

    func alert(title: String, message: String, preferredStyle: UIAlertControllerStyle = UIAlertControllerStyle.Alert, alertActions: [UIAlertAction]){
        let alert = UIAlertController(title: title, message: message, preferredStyle: preferredStyle)
        for alertAction in alertActions {
            alert.addAction(alertAction)
        }
        self.presentViewController(alert, animated: true, completion: nil)
    }
    
    func navigateAndReplaceRootWithStoryboard(storyboardName: String, andViewControllerId viewControllerId: String? = nil) {
        if let navigationController = self.navigationController {
            let storyboard = UIStoryboard(name: storyboardName, bundle: NSBundle.mainBundle())
            var viewController: AnyObject
            if let viewControllerId = viewControllerId {
                viewController = storyboard.instantiateViewControllerWithIdentifier(viewControllerId)
            } else {
                viewController = storyboard.instantiateInitialViewController()
            }
            navigationController.setViewControllers([viewController], animated: true)
        }
    }

    func navigateToViewControllerIdentifierFromRoot(storyboardIdentifier: String, storyboardName: String) {
        if let navigationController = self.navigationController {
            navigationController.popToRootViewControllerAnimated(true)
            let storyboard = UIStoryboard(name: storyboardName, bundle: NSBundle.mainBundle())
            let viewController: AnyObject = storyboard.instantiateViewControllerWithIdentifier(storyboardIdentifier)
            navigationController.pushViewController(viewController as! UIViewController, animated: true)
        }
    }
    
}