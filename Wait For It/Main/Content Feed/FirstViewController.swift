//
//  FirstViewController.swift
//  Wait For It
//
//  Created by Brian Anderson on 6/10/15.
//  Copyright (c) 2015 Solstice Mobile. All rights reserved.
//

import UIKit

class ContentFeedViewController: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }

    func setupViews() {

    }


    // MARK: CuesViewController Overrides
    override func screenNameForAnalytics() -> String {
        return "First"
    }
    
}

