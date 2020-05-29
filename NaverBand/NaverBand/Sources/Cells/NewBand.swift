//
//  Band.swift
//  NaverBand
//
//  Created by 이재용 on 2020/05/27.
//  Copyright © 2020 jaeyong Lee. All rights reserved.
//

import Foundation
import UIKit
struct NewBand {
    var bandImg: UIImage?
    var bandLabelName: String?
    
    init(bandImgName: String, bandName: String) {
        bandImg = UIImage(named: bandImgName)
        bandLabelName = bandName
    }
}
