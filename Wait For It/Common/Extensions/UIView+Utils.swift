//
//  UIView+Utils.swift
//  Wait For It
//
//  Created by Brian Anderson on 6/17/15.
//  Copyright (c) 2015 Solstice Mobile. All rights reserved.
//

import UIKit

extension UIView {
    class func loadFromNibNamed(nibNamed: String, bundle : NSBundle? = nil) -> UIView? {
        return UINib(
            nibName: nibNamed,
            bundle: bundle
            ).instantiateWithOwner(nil, options: nil)[0] as? UIView
    }
}