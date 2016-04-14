//
//  FarmerRegisterViewController.swift
//  LocalFarming
//
//  Created by Chris Lu on 4/13/16.
//  Copyright © 2016 Bowdoin College. All rights reserved.
//

import UIKit

class FarmerRegisterViewController: UIViewController {
    
    struct Constants {
        static let buttonFrame:CGRect = CGRect(origin: CGPoint(x: 0, y: 0), size: CGSize(width: 200, height: 45))
        static let labelFrame:CGRect = CGRect(origin: CGPoint(x: 0, y: 0), size: CGSize(width: 225, height: 100))
    }

    var signInButton: UIButton!
    var signUpButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = Colors.lightBrown
        
        signInButton = UIButton(frame: Constants.buttonFrame)
        signInButton.backgroundColor = UIColor(red: 34/255, green: 139/255, blue: 34/255, alpha: 1.0)
        signInButton.setTitle("Sign In", forState: .Normal)
        signInButton.layer.masksToBounds = true
        signInButton.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(signInButton)
        let farmerXConstraint = NSLayoutConstraint(item: signInButton, attribute: .CenterX, relatedBy: .Equal, toItem: self.view, attribute: .CenterX, multiplier: 1, constant: 0)
        let farmerYConstraint = NSLayoutConstraint(item: signInButton, attribute: .CenterY, relatedBy: .Equal, toItem: self.view, attribute: .CenterY, multiplier: 1, constant: 40)
        self.view.addConstraint(farmerXConstraint)
        self.view.addConstraint(farmerYConstraint)
        signInButton.addTarget(self, action: "showSignIn", forControlEvents: .TouchUpInside)
        
        signUpButton = UIButton(frame: Constants.buttonFrame)
        signUpButton.backgroundColor = UIColor.clearColor()
        signUpButton.setTitleColor(UIColor.blackColor(), forState: .Normal)
        signUpButton.setTitle("Sign Up", forState: .Normal)
        signUpButton.layer.masksToBounds = true
        signUpButton.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(signUpButton)
        let consumerXConstraint = NSLayoutConstraint(item: signUpButton, attribute: .CenterX, relatedBy: .Equal, toItem: self.view, attribute: .CenterX, multiplier: 1, constant: 0)
        let consumerYConstraint = NSLayoutConstraint(item: signUpButton, attribute: .CenterY, relatedBy: .Equal, toItem: self.view, attribute: .CenterY, multiplier: 1, constant: 100)
        self.view.addConstraint(consumerXConstraint)
        self.view.addConstraint(consumerYConstraint)
        signUpButton.addTarget(self, action: "showSignUp", forControlEvents: .TouchUpInside)
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func showSignIn() {
        let signInVC = ConsumerSignInViewController()
        signInVC.modalTransitionStyle = .CoverVertical
        presentViewController(signInVC, animated: true, completion: nil)
    }
    
    func showSignUp() {
        let signUpVC = ConsumerSignUpViewController()
        signUpVC.modalTransitionStyle = .CoverVertical
        presentViewController(signUpVC, animated: true, completion: nil)
    }

}
