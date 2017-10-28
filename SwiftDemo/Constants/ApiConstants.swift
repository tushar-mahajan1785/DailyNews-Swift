//
//  ApiConstants.swift
//  SwiftDemo
//
//  Created by Capternal on 23/10/17.
//  Copyright © 2017 Capternal. All rights reserved.
//

import Foundation

struct APPURL {
    private struct Domains {
        static let DEV = "http://capternal.com"
        static let STAGE = ""
        static let PRODUCTION = ""
    }
    
    private struct Routes {
        static let Api = "/news/"
    }
    
    private static let Domain = Domains.DEV
    private static let Route = Routes.Api
    private static let BaseURL = Domain + Route

    static var DailyNews: String {
        return BaseURL  + "db.json"
    }
}
