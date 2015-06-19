//
//  ThirdViewController.swift
//  Wait For It
//
//  Created by Brian Anderson on 6/11/15.
//  Copyright (c) 2015 Solstice Mobile. All rights reserved.
//

import UIKit

class ThirdViewController: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: CuesViewController Overrides
    override func screenNameForAnalytics() -> String {
        return "Profile"
    }
    
}
