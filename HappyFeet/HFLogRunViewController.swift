//
//  HFLogRunViewController.swift
//  HappyFeet
//
//  Created by Phil Meyers IV on 3/1/16.
//  Copyright © 2016 happyfeet. All rights reserved.
//

import UIKit
import UITextField_Shake

class HFLogRunViewController: UIViewController {
	let userInfo = HFUserSingleton.sharedInstance

	@IBOutlet weak var locationTextField: UITextField!
	@IBOutlet weak var distanceTextField: UITextField!
	@IBOutlet weak var datePicker: UIDatePicker!

	override func viewDidLoad() {
		super.viewDidLoad()

	}

	@IBAction func uploadRunAction(sender: AnyObject) {
		self.locationTextField.text = "Lakefill"
		self.distanceTextField.text = "0.12"
		self.datePicker.date = NSDate();
	}

	@IBAction func enterRunAction(sender: AnyObject) {
		self.uploadRunData();
	}

	func uploadRunData() {
		var validInput = true;
		if (self.locationTextField.text?.characters.count == 0) {
			validInput = false;
			locationTextField.shake();
		}

		if (self.distanceTextField.text?.characters.count == 0) {
			validInput = false;
			distanceTextField.shake();
		}

		if (validInput) {
			let run = HFRunModel()
			run.location = self.locationTextField.text!;
			run.distance = Double(self.distanceTextField.text!)!;
			run.date = self.datePicker.date;
			self.userInfo.addRun(run);
			self.navigationController?.popViewControllerAnimated(true);
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
