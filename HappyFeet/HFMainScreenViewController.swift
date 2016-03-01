//
//  HFMainScreenViewController.swift
//  HappyFeet
//
//  Created by Phil Meyers IV on 2/29/16.
//  Copyright © 2016 happyfeet. All rights reserved.
//

import UIKit

class HFMainScreenViewController: UIViewController {
	let userInfo = HFUserSingleton.sharedInstance;

	@IBOutlet weak var logRunButton: UIView!
	@IBOutlet weak var titleLabel: UILabel!

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
		self.titleLabel.text = "Welcome back, " + self.userInfo.name + "!";
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
