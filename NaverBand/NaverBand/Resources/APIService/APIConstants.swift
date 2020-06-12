//
//  APIConstants.swift
//  NaverBand
//
//  Created by 김성은 on 2020/06/12.
//  Copyright © 2020 김성은. All rights reserved.
//

import Foundation

struct APIConstants {
    static let baseURL = "http://52.79.107.126:3000"
    static let newURL = APIConstants.baseURL + "/newBand"
    static let recPageURL = APIConstants.baseURL + "/recommendPage"
    static let recBandURL = APIConstants.baseURL + "/recommendBand"
    static let noticeURL = APIConstants.baseURL + "/newNotice"
}
