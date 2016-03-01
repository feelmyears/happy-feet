//
//  ViewController.swift
//  HappyFeet
//
//  Created by Phil Meyers IV on 2/25/16.
//  Copyright © 2016 happyfeet. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController, UITextFieldDelegate {
    let userInfo = HFUserSingleton.sharedInstance;

    @IBOutlet weak var signupLabel: UILabel!

    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!

	override func viewDidLoad() {
		super.viewDidLoad()
		dispatch_async(dispatch_get_main_queue()) {
			if (self.userInfo.name != nil) {
				self.segueToMainScreen(false);
			}
		}
		// Handle the text field's user input through delegate callbacks.
		nameTextField.delegate = self
		emailTextField.delegate = self
		passwordTextField.delegate = self
	}

	override func viewWillAppear(animated: Bool) {
		super.viewWillAppear(animated);

	}
	
	@IBAction func signupAction(sender: AnyObject) {
		if (self.validateTextFields()) {
			self.signUpUser();
			self.segueToMainScreen(true);
		}
	}

	func validateTextFields() -> Bool {
		return	self.nameTextField.text?.characters.count > 0 &&
				self.emailTextField.text?.characters.count > 0 &&
				self.passwordTextField.text?.characters.count > 0;

	}

	func signUpUser() {
		self.userInfo.name = self.nameTextField.text;
		self.userInfo.email = self.emailTextField.text;
		self.userInfo.password = self.passwordTextField.text;
	}

	func segueToMainScreen(animated: Bool) {
		if (animated) {
			self.performSegueWithIdentifier("Signup Segue", sender: nil);
		} else {
			self.performSegueWithIdentifier("Main Screen Segue", sender: nil);
		}
	}

	//UITextFieldDelegate
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        // Hide the keyboard.
        textField.resignFirstResponder()
        return true
    }

    /*
    let alert = UIAlertController(title: "Invalid", message: "Password must contain at least 8 characters", preferredStyle: UIAlertControllerStyle.Alert)
    alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil))
    self.presentViewController(alert, animated: true, completion: nil)
*/
    
}