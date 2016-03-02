//
//  HFProfileViewController.swift
//  HappyFeet
//
//  Created by Phil Meyers IV on 2/25/16.
//  Copyright © 2016 happyfeet. All rights reserved.
//

import UIKit
import ImagePicker
import RealmSwift
import SwiftDate
import SCLAlertView

class HFProfileViewController: UIViewController, ImagePickerDelegate, UITableViewDataSource {
	let userInfo = HFUserSingleton.sharedInstance;
	let imagePickerController = ImagePickerController()

	@IBOutlet weak var addImageButton: UIButton!
	@IBOutlet weak var addBioButton: UIView!
	@IBOutlet weak var imageView: UIImageView!
	@IBOutlet weak var nameLabel: UILabel!
	@IBOutlet weak var bioTextView: UITextView!
	@IBOutlet weak var activityTableView: UITableView!
	var recentRuns: Results<HFRunModel>!


	override func viewDidLoad() {
		super.viewDidLoad()
		self.updateUserData();
		self.activityTableView.dataSource = self;

		self.activityTableView.reloadData();
//		self.activityTableView.delegate = self;
	}

	func updateUserData() {
		if let userImage = self.userInfo.image {
			self.imageView.image = userImage;
			self.addImageButton.alpha = 0;
		}

		if let userBio = self.userInfo.bio {
			self.bioTextView.text = userBio;
			self.addBioButton.alpha = 0;
		}

		if let userName = self.userInfo.name {
			self.nameLabel.text = userName;
		}

		self.recentRuns = self.userInfo.getRuns();
	}

	@IBAction func imageViewTapAction(sender: AnyObject) {
		self.presentImagePickerVC();
	}

	func presentImagePickerVC() {
		imagePickerController.delegate = self
		imagePickerController.imageLimit = 1;
		presentViewController(imagePickerController, animated: true, completion: nil)
	}

	func imagePickerControllerDidCancel(picker: UIImagePickerController) {
		dismissViewControllerAnimated(true, completion: nil)
	}

	//ImagePickerDelegate
	func wrapperDidPress(images: [UIImage]) {
		imagePickerController.dismissViewControllerAnimated(true) { () -> Void in

		}
	}

	func doneButtonDidPress(images: [UIImage]) {
		let chosenImage = images.first;
		self.userInfo.image = chosenImage;
		self.imageView.image = chosenImage;

		imagePickerController.dismissViewControllerAnimated(true) { () -> Void in

		}

	}

	func cancelButtonDidPress() {
		imagePickerController.dismissViewControllerAnimated(true) { () -> Void in

		}
	}

	//UITableViewDataSource
	func numberOfSectionsInTableView(tableView: UITableView) -> Int {
		return 1;
	}

	func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return self.recentRuns.count;
	}

	func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
		let run = self.recentRuns[indexPath.row];
		let cell = tableView.dequeueReusableCellWithIdentifier("Run Info Cell", forIndexPath: indexPath) as UITableViewCell
		cell.textLabel?.text = run.location;
		cell.detailTextLabel?.text = "\(run.distance)";
		return cell;
	}

	func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
		return "Recent Runs";
	}

	@IBAction func addCausesAction(sender: AnyObject) {
		self.implementationAlert("Add causes")
	}

	@IBAction func addBioAction(sender: AnyObject) {
		SCLAlertView().showError("Oops!", subTitle: "Add bio functionality not yet implemented. A sample bio has been added to your profile.");
		
		self.userInfo.bio = "Hi! My name is " + self.userInfo.name + " and I love running for fantastic causes! Please support and donate to me as I train for the next Chicago marathon.";

		self.updateUserData();
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
