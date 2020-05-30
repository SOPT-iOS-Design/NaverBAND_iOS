//
//  NewTableInformation.swift
//  NaverBand
//
//  Created by 박주연 on 2020/05/25.
//  Copyright © 2020 박주연. All rights reserved.
//

import Foundation
import UIKit

struct NewTableInformation {

    var image : Image
    var title : String
    var subtitle : String

    init(image: Image, title: String, subtitle: String){
        self.image = image
        self.title = title
        self.subtitle = subtitle
    }
}

enum Image {
    case cell1
    case cell2
    case cell3

    func getImageName() -> String {
        switch self{
        case .cell1: return "icPhoto1"
        case .cell2: return "icPhoto2"
        case .cell3: return "icPhoto3"
        }
    }
}

//struct NewTableInformation {
//
//    var image : UIImage?
//    var title : String
//    var subtitle : String
//
//    init(imageName: String, title: String, subtitle: String){
//        self.image = UIImage(named: imageName)
//        self.title = title
//        self.subtitle = subtitle
//    }
//}


