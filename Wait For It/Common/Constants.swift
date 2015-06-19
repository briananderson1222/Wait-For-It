//
//  Constants.swift
//  Wait For It
//
//  Created by Brian Anderson on 6/12/15.
//  Copyright (c) 2015 Solstice Mobile. All rights reserved.
//

import Foundation
import UIKit

class Constants {

    static let GoogleAnalyticsTrackingId = NSBundle.mainBundle().infoDictionary?["GoogleAnalyticsTrackingId"] as! String
    struct API {
        static let WaitForIt = NSBundle.mainBundle().infoDictionary?["WaitForItHostUrl"] as! String
    }

    struct Storyboards {
        static let SignIn = "Sign In"
        static let Main = "Main"
    }
    
    struct StringFiles {
        static let SignIn = "Sign In"
        static let First = "First"
    }

    struct Colors {

        static let OrangeActiveButton = UIColor(hex: "#ff6600")
        static let OrangeCodingCategories = UIColor(hex: "#ff8500")
        static let YellowCodingCategories = UIColor(hex: "#ffa200")
        static let DarkGrayImportantInformation = UIColor(hex: "#4d4d4d")
        static let GrayCopy = UIColor(hex: "#676767")
        static let LightGrayInactive = UIColor(hex: "#a7a9ac")
        static let WhiteOpaqueBackground = UIColor(hex: "#efefefb3") //0xB3 is 70% opacity
        static let BlueLinks = UIColor(hex: "#005db9")

    }

}