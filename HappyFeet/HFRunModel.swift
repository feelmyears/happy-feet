//
//  HFRunModel.swift
//  HappyFeet
//
//  Created by Phil Meyers IV on 3/1/16.
//  Copyright © 2016 happyfeet. All rights reserved.
//

import RealmSwift

class HFRunModel: Object {
	dynamic var location = ""
	dynamic var distance = 0.0
	dynamic var date = NSDate.init();
}
