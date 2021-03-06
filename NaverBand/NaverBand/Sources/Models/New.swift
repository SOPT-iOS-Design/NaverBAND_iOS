//
//  New.swift
//  NaverBand
//
//  Created by 박주연 on 2020/05/24.
//  Copyright © 2020 박주연. All rights reserved.
//

import Foundation
import UIKit

// Model struct파일은 데이터 통신 전에 클라에서 임의로 데이터를 넣을 때
// 서버 통신 시 필요없음
struct New{

    var image: UIImage?
    var title: String

    init(imageName: String, title: String){

        self.image = UIImage(named: imageName)
        self.title = title
    }
}


