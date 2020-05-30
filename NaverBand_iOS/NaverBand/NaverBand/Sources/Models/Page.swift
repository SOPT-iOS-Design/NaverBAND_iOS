//
//  Page.swift
//  NaverBand
//
//  Created by 박주연 on 2020/05/24.
//  Copyright © 2020 박주연. All rights reserved.
//

import UIKit

struct Page {
    
    var image : UIImage?
    var title : String
    var subtitle : String
    
    init(imageName: String, title: String, subtitle: String){
        
        self.image = UIImage(named: imageName)
        self.title = title
        self.subtitle = subtitle
    }
    
}


