//
//  String+Utils.swift
//  Wait For It
//
//  Created by Brian Anderson on 6/15/15.
//  Copyright (c) 2015 Solstice Mobile. All rights reserved.
//

import Foundation

extension String {

    func localized(tableName: String = "Common", comment: String = "") -> String {
        return NSLocalizedString(self, tableName: tableName, bundle: NSBundle.mainBundle(), value: "", comment: comment)
    }

    var floatValue: Float {
        return (self as NSString).floatValue
    }

    subscript (i: Int) -> Character {
        return self[advance(self.startIndex, i)]
    }

    subscript (i: Int) -> String {
        return String(self[i] as Character)
    }

    subscript (r: Range<Int>) -> String {
        return substringWithRange(Range(start: advance(startIndex, r.startIndex), end: advance(startIndex, r.endIndex)))
    }
}
