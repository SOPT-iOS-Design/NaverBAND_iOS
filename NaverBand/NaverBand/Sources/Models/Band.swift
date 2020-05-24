//
//  Band.swift
//  NaverBand
//
//  Created by 박주연 on 2020/05/24.
//  Copyright © 2020 박주연. All rights reserved.
//

import UIKit

struct Band{
    
    var image : UIImage?
    var title : String
    var number : String
    var name : String
    
    init(imageName: String, title: String, number: String, name: String){
        
        self.image = UIImage(named: imageName)
        self.title = title
        self.number = number
        self.name = name
    }
}


