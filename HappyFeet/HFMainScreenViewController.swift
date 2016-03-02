//
//  HFMainScreenViewController.swift
//  HappyFeet
//
//  Created by Phil Meyers IV on 2/29/16.
//  Copyright © 2016 happyfeet. All rights reserved.
//

import UIKit
import SCLAlertView

class HFMainScreenViewController: UIViewController {
	let userInfo = HFUserSingleton.sharedInstance;

	@IBOutlet weak var logRunButton: UIView!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

	override func viewWillAppear(animated: Bool) {
		super.viewWillAppear(animated);
		self.configureView();
	}

	func configureView() {
		self.logRunButton.layer.cornerRadius = (self.logRunButton.bounds.size.height)/2.0;
		self.title = "Welcome back, " + self.userInfo.name + "!";
	}

	@IBAction func causesAction(sender: AnyObject) {
		self.implementationAlert("Causes");
	}

	@IBAction func newsFeetAction(sender: AnyObject) {
		self.implementationAlert("Newsfeet");
	}
	
	func implementationAlert(functionName: String) {
		SCLAlertView().showError("Oops!", subTitle: functionName + " not yet implemented. Sorry!");
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
