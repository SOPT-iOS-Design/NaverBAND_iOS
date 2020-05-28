//
//  RecommendPage.swift
//  NaverBand
//
//  Created by 김성은 on 2020/05/28.
//  Copyright © 2020 김성은. All rights reserved.
//

import Foundation
import UIKit

struct RecommendPage {
    var imageName: String
    var title: String
    var comment: String
    
    init(imageName: String, title: String, comment: String) {
        self.imageName = imageName
        self.title = title
        self.comment = comment
    }
}
