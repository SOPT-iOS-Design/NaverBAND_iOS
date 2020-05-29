//
//  News.swift
//  NaverBand
//
//  Created by 이재용 on 2020/05/29.
//  Copyright © 2020 jaeyong Lee. All rights reserved.
//

import Foundation
import UIKit

struct News {
    var newsImg: UIImage?
    var newsName: String?
    var newsDetail: String?
    
    init(imgName: String, name: String, detail: String) {
        newsImg = UIImage(named: imgName)
        newsName = name
        newsDetail = detail
    }
}
