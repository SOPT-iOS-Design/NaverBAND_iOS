//
//  PageCell.swift
//  NaverBand
//
//  Created by 박주연 on 2020/05/24.
//  Copyright © 2020 박주연. All rights reserved.
//

import UIKit

class PageCell: UICollectionViewCell{
    
    static let identifier: String = "PageCell"
    
    @IBOutlet weak var Img: UIImageView!
    @IBOutlet weak var TitleLabel: UILabel!
    @IBOutlet weak var subTitleLabel: UILabel!
    @IBOutlet weak var Button: UIButton!
    
    func set(_ pageInformation: Page){
        Img.image = pageInformation.image
        TitleLabel.text = pageInformation.title
        subTitleLabel.text = pageInformation.subtitle
        
    }
}
