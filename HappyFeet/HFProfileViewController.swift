//
//  HFProfileViewController.swift
//  HappyFeet
//
//  Created by Phil Meyers IV on 2/25/16.
//  Copyright © 2016 happyfeet. All rights reserved.
//

import UIKit
import Charts

class HFProfileViewController: UIViewController {

	@IBOutlet weak var lineChartView: LineChartView!
    override func viewDidLoad() {
        super.viewDidLoad()
		self.loadFakeData();
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

	func loadFakeData() {

		var chartData = LineChartData(xVals: [0,1,2,3,4,5]);
		self.lineChartView.lineData = chartData;
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
