//
//  NewBandCell.swift
//  NaverBand
//
//  Created by 김성은 on 2020/05/28.
//  Copyright © 2020 김성은. All rights reserved.
//

import UIKit

class NewBandCell: UICollectionViewCell {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    
    func setNewBandInfo(image: UIImage, name: String) {
        imageView.image = image
        nameLabel.text = name
    }
}
