//
//  RecommendBand.swift
//  NaverBand
//
//  Created by 이재용 on 2020/05/29.
//  Copyright © 2020 jaeyong Lee. All rights reserved.
//

import Foundation
import UIKit

struct RecommendBand {
    var bandImg: UIImage?
    var bandName: String?
    var bandDetail: String?
    
    init(bandImgName: String, name: String, detail: String) {
        bandImg = UIImage(named: bandImgName)
        bandName = name
        bandDetail = detail
    }
}
