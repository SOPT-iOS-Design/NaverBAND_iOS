//
//  NewBand.swift
//  NaverBand
//
//  Created by 김성은 on 2020/05/28.
//  Copyright © 2020 김성은. All rights reserved.
//

import Foundation
import UIKit

struct NewBand {
    var imageName: String
    var bandName: String
    
    init(imageName: String, bandName: String) {
        self.imageName = imageName
        self.bandName = bandName
    }
}
