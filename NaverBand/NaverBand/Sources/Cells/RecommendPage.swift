//
//  RecommendPage.swift
//  NaverBand
//
//  Created by 이재용 on 2020/05/29.
//  Copyright © 2020 jaeyong Lee. All rights reserved.
//

import Foundation
import UIKit

struct RecommendPage {
    var recommendPageImg: UIImage?
    var pageName: String?
    var pageDetail: String?
    init(recommendPageImgName: String, name: String, detail: String) {
        recommendPageImg = UIImage(named: recommendPageImgName)
        pageName = name
        pageDetail = detail
    }
}
