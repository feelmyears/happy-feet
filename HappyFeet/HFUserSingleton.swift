//
//  HFUserSingleton.swift
//  HappyFeet
//
//  Created by Phil Meyers IV on 2/29/16.
//  Copyright © 2016 happyfeet. All rights reserved.
//

import UIKit

class HFUserSingleton: NSObject {
	static let sharedInstance = HFUserSingleton();
	let prefs = NSUserDefaults.standardUserDefaults();

	var name: String! {
		get {
			let name = prefs.stringForKey("name");
			return name;
		}
		set {
			prefs.setValue(newValue, forKey: "name");
			prefs.synchronize();
		}
	}

	var email: String! {
		get {
			return prefs.stringForKey("email");
		}
		set {
			prefs.setValue(newValue, forKey: "email");
			prefs.synchronize();
		}
	}

	var password: String! {
		get {
			return prefs.stringForKey("password");
		} set {
			prefs.setValue(newValue, forKey: "password");
			prefs.synchronize();
		}
	}

	override init() {

	}

	func resetUser() {

	}



}
