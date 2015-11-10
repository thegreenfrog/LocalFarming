//
//  SignUpViewController.swift
//  LocalFarming
//
//  Created by Chris Lu on 11/8/15.
//  Copyright © 2015 Bowdoin College. All rights reserved.
//

import UIKit

class SignUpViewController: UIViewController, UITextFieldDelegate {
    
    @IBAction func dismissAttempt(sender: UIBarButtonItem) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }

    @IBOutlet weak var firstNameTextField: UITextField!
    @IBOutlet weak var lastNameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var retypePassTextField: UITextField!
    @IBOutlet weak var signupButton: UIButton!
    
    @IBAction func signupButton(sender: UIButton) {
        //make sure inputs are filled in properly
        if firstNameTextField.textColor == UIColor.lightGrayColor() {
            errorMessages.append(Constants.noFirstName)
            firstNameTextField.layer.borderWidth = Constants.errorBorderWidth
            firstNameTextField.layer.borderColor = UIColor.redColor().CGColor
        }
        if lastNameTextField.textColor == UIColor.lightGrayColor() {
            errorMessages.append(Constants.noLastName)
            lastNameTextField.layer.borderWidth = Constants.errorBorderWidth
            lastNameTextField.layer.borderColor = UIColor.redColor().CGColor
        }
        if emailTextField.textColor == UIColor.lightGrayColor() {
            errorMessages.append(Constants.noemail)
            emailTextField.layer.borderWidth = Constants.errorBorderWidth
            emailTextField.layer.borderColor = UIColor.redColor().CGColor
        }
        if passwordTextField.textColor == UIColor.lightGrayColor() || passwordTextField.text!.characters.count < 6 {
            errorMessages.append(Constants.noPassword)
            passwordTextField.layer.borderWidth = Constants.errorBorderWidth
            passwordTextField.layer.borderColor = UIColor.redColor().CGColor
        }
        if retypePassTextField.textColor == UIColor.lightGrayColor() || retypePassTextField.text!.characters.count != passwordTextField.text!.characters.count {
            errorMessages.append(Constants.noretypePassword)
            retypePassTextField.layer.borderWidth = Constants.errorBorderWidth
            retypePassTextField.layer.borderColor = UIColor.redColor().CGColor
        }
        
        //submit user or post error message
        if errorMessages.count > 0 {
            let frame = CGRect(origin: CGPointZero, size: CGSize(width: Constants.errorMessageWidth, height: Constants.errorMessageProportionHeight * CGFloat(errorMessages.count)))
            let errorSubView = UIView(frame: frame)
            errorSubView.center.x = signupButton.center.x
            errorSubView.center.y = signupButton.center.y + Constants.errorMessageProportionHeight * CGFloat(errorMessages.count)
            errorSubView.layer.borderColor = UIColor.redColor().CGColor
            errorSubView.layer.borderWidth = Constants.errorBorderWidth
            var count = 0
            for error in errorMessages {
                let labelOrigin = CGPoint(x: errorSubView.layer.bounds.origin.x, y: errorSubView.layer.bounds.origin.y + Constants.errorMessageProportionHeight * CGFloat(count))
                let errorFrame = CGRect(origin: labelOrigin, size: CGSize(width: Constants.errorMessageWidth, height: Constants.errorMessageProportionHeight))
                let label = UILabel(frame: errorFrame)
                label.text = error
                label.lineBreakMode = NSLineBreakMode.ByWordWrapping
                label.font = UIFont(name: label.font.fontName, size: 10)
                errorSubView.addSubview(label)
                count++
            }
            self.view.addSubview(errorSubView)
            
        } else {
            //attempt to log in
            let user = PFUser()
            user.username = emailTextField.text
            user.email = emailTextField.text
            user.password = passwordTextField.text
            user["firstName"] = firstNameTextField.text
            user["lastName"] = lastNameTextField.text
            user.signUpInBackgroundWithBlock({
                (succeeded: Bool, error: NSError?) -> Void in
                if let error = error {
                    let errorString = error.userInfo["error"] as? NSString
                } else {
                    
                }
            })
        }
        
        //clear all so no left over for next sign up attempt
        errorMessages.removeAll()
    }
    
    struct Constants {
        static let noFirstName = "Please enter your first name"
        static let noLastName = "Please enter your last name"
        static let noemail = "Please enter your email address"
        static let noPassword = "Please enter a password with at least 6 characters"
        static let noretypePassword = "Please re-enter the same password"
        
        static let errorBorderWidth:CGFloat = 1.0
        static let errorMessageProportionHeight:CGFloat = 20.0
        static let errorMessageWidth:CGFloat = 200.0
    }
    
    var errorMessages = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        firstNameTextField.text = "First Name"
        lastNameTextField.text = "Last Name"
        emailTextField.text = "Email Address"
        passwordTextField.text = "Enter Password (at least 6 characters)"
        retypePassTextField.text = "re-Enter Password"
        firstNameTextField.textColor = UIColor.lightGrayColor()
        lastNameTextField.textColor = UIColor.lightGrayColor()
        emailTextField.textColor = UIColor.lightGrayColor()
        passwordTextField.textColor = UIColor.lightGrayColor()
        retypePassTextField.textColor = UIColor.lightGrayColor()
        self.firstNameTextField.delegate = self
        self.lastNameTextField.delegate = self
        self.emailTextField.delegate = self
        self.passwordTextField.delegate = self
        self.retypePassTextField.delegate = self
        
    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func textFieldDidBeginEditing(textField: UITextField) {
        if textField.textColor == UIColor.lightGrayColor() {
            textField.text = nil
            textField.textColor = UIColor.blackColor()
        }
    }
    
    func textFieldDidEndEditing(textField: UITextField) {
        if textField.text!.isEmpty {
            textField.text = "Placeholder"
            textField.textColor = UIColor.lightGrayColor()
        }
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
