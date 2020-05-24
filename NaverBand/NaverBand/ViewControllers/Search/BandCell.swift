//
//  BandCell.swift
//  NaverBand
//
//  Created by 박주연 on 2020/05/24.
//  Copyright © 2020 박주연. All rights reserved.
//

import UIKit

class BandCell: UICollectionViewCell{
    
    static let identifier: String = "BandCell"
    
    @IBOutlet weak var Img: UIImageView!
    @IBOutlet weak var BackImg: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var numberLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var line: UILabel!
    @IBOutlet weak var Button: UIButton!
    
    func set(_ bandInformation: Band){
        Img.image = bandInformation.image
        titleLabel.text = bandInformation.title
        numberLabel.text = bandInformation.number
        nameLabel.text = bandInformation.name
        
    }
}
