//
//  NewCell.swift
//  NaverBand
//
//  Created by 박주연 on 2020/05/24.
//  Copyright © 2020 박주연. All rights reserved.
//

import UIKit

class NewCell: UICollectionViewCell {
    
    static let identifier: String = "NewCell"
    
    @IBOutlet weak var Img: UIImageView!
    @IBOutlet weak var Label: UILabel!
    
    func set(_ newInformation: New){
        Img.image = newInformation.image
        Label.text = newInformation.title
    }
}
