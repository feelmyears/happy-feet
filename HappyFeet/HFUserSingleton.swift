//
//  HFUserSingleton.swift
//  HappyFeet
//
//  Created by Phil Meyers IV on 2/29/16.
//  Copyright © 2016 happyfeet. All rights reserved.
//

import UIKit
import RealmSwift

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


	var bio: String! {
		get {
			return prefs.stringForKey("bio");
		} set {
			prefs.setValue(newValue, forKey: "bio");
			prefs.synchronize();
		}
	}

	var image: UIImage! {
		get {
			if let data = prefs.valueForKey("image") {
				if let image = UIImage(data: data as! NSData) {
					return image
				}
			}
			return nil;
		}
		set {
			prefs.setValue(UIImagePNGRepresentation(newValue), forKey: "image");
			prefs.synchronize();
		}
	}


	override init() {

	}

	func addRun(run: HFRunModel) {
		let realm = try! Realm()
		try! realm.write {
			realm.add(run);
		}
	}

	func getRuns() -> Results<HFRunModel> {
		let realm = try! Realm()
		let results = realm.objects(HFRunModel).sorted("date", ascending: false);
		return results;
	}

	func resetUser() {
		NSUserDefaults.resetStandardUserDefaults();

		let realm = try! Realm()
		try! realm.write {
			realm.deleteAll();
		}

	}



}
