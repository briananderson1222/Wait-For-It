//
//  SignInViewController.swift
//  Wait For It
//
//  Created by Brian Anderson on 6/10/15.
//  Copyright (c) 2015 Solstice Mobile. All rights reserved.
//

import UIKit

class SignInViewController: BaseViewController, UITextFieldDelegate {

    // MARK: IBOutlets
    @IBOutlet weak var scrollViewContainer: UIScrollView!
    @IBOutlet weak var viewContainer: UIView!
    @IBOutlet weak var bottomScrollViewConstraint: NSLayoutConstraint!
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var usernameBottomBorder: UIView!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var passwordBottomBorder: UIView!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var visitCuesButton: UIButton!

    // MARK: Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()

        NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardShown:", name: UIKeyboardDidShowNotification, object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardHidden:", name: UIKeyboardDidHideNotification, object: nil)

        setupViews()
    }

    func keyboardShown(notification: NSNotification) {
        if let keyboardSize = (notification.userInfo?[UIKeyboardFrameBeginUserInfoKey] as? NSValue)?.CGRectValue() {
            self.bottomScrollViewConstraint.constant = keyboardSize.height
            scrollViewContainer.setContentOffset(CGPointMake(0, keyboardSize.height * 0.5), animated: true)
        }
    }

    func keyboardHidden(notification: NSNotification) {
        self.bottomScrollViewConstraint.constant = 0
        self.view.setNeedsUpdateConstraints()
        UIView.animateWithDuration(0.3, animations: { () -> Void in
            self.view.layoutIfNeeded()
        })
        scrollViewContainer.setContentOffset(CGPointMake(0, 0), animated: true)
    }

    // MARK: View Setup
    func setupViews() {
        setupUsernameTextField()
        setupPasswordTextField()
        setupLoginButton()
        setupVisitCuesButton()
    }

    func setupUsernameTextField() {
        usernameTextField.delegate = self
        usernameTextField.addTarget(self, action: "textFieldChanged", forControlEvents: UIControlEvents.EditingChanged)
        usernameTextField.borderStyle = UITextBorderStyle.None
        usernameTextField.attributedPlaceholder = NSAttributedString(string: SignInConstants.StringKeys.UsernamePlaceholder.localized(tableName: Constants.StringFiles.SignIn), attributes: [ NSForegroundColorAttributeName: Constants.Colors.LightGrayInactive])
        usernameTextField.textColor = Constants.Colors.GrayCopy
        usernameBottomBorder.backgroundColor = Constants.Colors.LightGrayInactive
    }

    func setupPasswordTextField() {
        passwordTextField.delegate = self
        passwordTextField.addTarget(self, action: "textFieldChanged", forControlEvents: UIControlEvents.EditingChanged)
        passwordTextField.borderStyle = UITextBorderStyle.None
        passwordTextField.attributedPlaceholder = NSAttributedString(string: SignInConstants.StringKeys.PasswordPlaceholder.localized(tableName: Constants.StringFiles.SignIn), attributes: [ NSForegroundColorAttributeName: Constants.Colors.LightGrayInactive])
        passwordTextField.textColor = Constants.Colors.GrayCopy
        passwordBottomBorder.backgroundColor = Constants.Colors.LightGrayInactive
    }

    func setupLoginButton() {
        colorLoginButton()
        loginButton.layer.borderWidth = 1
        loginButton.setTitle(SignInConstants.StringKeys.LoginButton.localized(tableName: Constants.StringFiles.SignIn), forState: .Normal)
    }

    func setupVisitCuesButton() {
        visitCuesButton.setTitle(SignInConstants.StringKeys.VisitCUES.localized(tableName: Constants.StringFiles.SignIn), forState: .Normal)
        visitCuesButton.setTitleColor(Constants.Colors.BlueLinks, forState: .Normal)
    }

    func colorLoginButton() {
        if usernameTextField.text.isEmpty || passwordTextField.text.isEmpty {
            loginButton.layer.borderColor =  Constants.Colors.LightGrayInactive.CGColor
            loginButton.setTitleColor(Constants.Colors.LightGrayInactive, forState: .Normal)
        } else {
            loginButton.layer.borderColor =  Constants.Colors.OrangeActiveButton.CGColor
            loginButton.setTitleColor(Constants.Colors.OrangeActiveButton, forState: .Normal)
        }
    }

    func textFieldChanged() {
        colorLoginButton()
    }

    // MARK: Sign In Logic Methods
    func signInError() {
        alert(SignInConstants.StringKeys.ErrorTitle.localized(tableName: Constants.StringFiles.SignIn), message: SignInConstants.StringKeys.ErrorMessage.localized(tableName: Constants.StringFiles.SignIn), alertActions: [
                UIAlertAction(title: SignInConstants.StringKeys.ErrorOk.localized(tableName: Constants.StringFiles.SignIn), style: UIAlertActionStyle.Default, handler: nil),
                UIAlertAction(title: SignInConstants.StringKeys.ErrorHelp.localized(tableName: Constants.StringFiles.SignIn), style: UIAlertActionStyle.Cancel, handler: { action in
                    self.visitCuesWebsite()
                })
            ]
        )
    }

    func login() {
        if !usernameTextField.text.isEmpty && !passwordTextField.text.isEmpty {
            if (usernameTextField.text == "error") {
                signInError()
            } else {
                self.navigateAndReplaceRootWithStoryboard(Constants.Storyboards.Main)
//                self.navigateAndReplaceRootWithStoryboard("Content Feed")
            }
            //        SessionDAO.sharedInstance.login(username, password: password).response() {
            //            (_, _, _, error) in
            //            if error != nil {
            //                self.navigateAndReplaceRootWithStoryboard("Content Feed")
            //            }
            //        }
        }
    }

    func visitCuesWebsite() {
        UIApplication.sharedApplication().openURL(NSURL(string: SignInConstants.CuesWebsiteUrl)!)
    }

    // MARK: UITextFieldDelegate Methods
    func textFieldDidBeginEditing(textField: UITextField) {
        if textField.isEqual(usernameTextField) {
            if passwordTextField.text.isEmpty {
                textField.returnKeyType = UIReturnKeyType.Next
            } else {
                textField.returnKeyType = UIReturnKeyType.Go
            }
        }
        if textField.isEqual(passwordTextField) {
            if usernameTextField.text.isEmpty {
                textField.returnKeyType = UIReturnKeyType.Next
            } else {
                textField.returnKeyType = UIReturnKeyType.Go
            }
        }
    }

    func textFieldShouldReturn(textField: UITextField) -> Bool {
        if !usernameTextField.text.isEmpty && !passwordTextField.text.isEmpty {
            login()
        } else {
            if textField.isEqual(usernameTextField) && passwordTextField.text.isEmpty {
                passwordTextField.becomeFirstResponder()
            } else if textField.isEqual(passwordTextField) && usernameTextField.text.isEmpty {
                usernameTextField.becomeFirstResponder()
            } else {
                textField.resignFirstResponder()
            }
        }
        return true
    }

    // MARK: IBActions
    @IBAction func login(sender: UIButton) {
        login()
    }

    @IBAction func visitCuesWebsite(sender: UIButton) {
        visitCuesWebsite()
    }

    // MARK: CuesViewController Overrides
    override func screenNameForAnalytics() -> String {
        return "Sign In"
    }

}