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
		let run = HFRunModel();
		run.distance = 100;
		run.date = NSDate();
		run.location = "Location";
		self.userInfo.addRun(run);

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
		cell.textLabel?.text = run.location + " " + run.date.toString()!;
		cell.detailTextLabel?.text = "\(run.distance)";
		return cell;
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
