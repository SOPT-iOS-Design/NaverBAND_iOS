//
//  News.swift
//  NaverBand
//
//  Created by 김성은 on 2020/05/29.
//  Copyright © 2020 김성은. All rights reserved.
//

import Foundation
import UIKit

struct News {
    var imageName: String
    var title: String
    var subTitle: String
    var pageName: String
    
    init(imageName: String, title: String, subTitle: String, pageName: String) {
        self.imageName = imageName
        self.title = title
        self.subTitle = subTitle
        self.pageName = pageName
    }
}
