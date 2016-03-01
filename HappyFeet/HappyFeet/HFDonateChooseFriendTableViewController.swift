//
//  HFDonateChooseFriendTableViewController.swift
//  HappyFeet
//
//  Created by Phil Meyers IV on 2/29/16.
//  Copyright © 2016 happyfeet. All rights reserved.
//

import UIKit



class HFDonateChooseFriendTableViewController: UITableViewController {
	let SegueIdentifier = "Payment Segue"

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

	override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
		let cell = tableView.cellForRowAtIndexPath(indexPath);
		let name = cell?.textLabel?.text;

		self.performSegueWithIdentifier(SegueIdentifier, sender: name);
	}

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
		let donateVC = segue.destinationViewController as! HFPaymentInfoTableViewController;
		donateVC.recipientName = sender as! String;
    }

}
