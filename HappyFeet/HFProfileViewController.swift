//
//  HFProfileViewController.swift
//  HappyFeet
//
//  Created by Phil Meyers IV on 2/25/16.
//  Copyright © 2016 happyfeet. All rights reserved.
//

import UIKit
import ImagePicker

class HFProfileViewController: UIViewController, ImagePickerDelegate {
	let userInfo = HFUserSingleton.sharedInstance;
	let imagePickerController = ImagePickerController()

	@IBOutlet weak var imageView: UIImageView!
	@IBOutlet weak var nameLabel: UILabel!
	@IBOutlet weak var bioTextView: UITextView!
	@IBOutlet weak var activityTableView: UITableView!


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

    override func viewDidLoad() {
        super.viewDidLoad()
		self.loadUserData();
    }

	func loadUserData() {
		self.imageView.image = self.userInfo.image;
		self.nameLabel.text = self.userInfo.name;
		self.bioTextView.text = self.userInfo.bio;
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

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
