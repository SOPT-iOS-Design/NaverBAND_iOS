//
//  RecommendBand.swift
//  NaverBand
//
//  Created by 김성은 on 2020/05/28.
//  Copyright © 2020 김성은. All rights reserved.
//

import Foundation
import UIKit

struct RecommendBand {
    var imageName: String
    var title: String
    var info: String
    
    init(imageName: String, title: String, number: Int, id: String) {
        self.imageName = imageName
        self.title = title
        self.info = "멤버 \(number) | \(id)"
    }
}
