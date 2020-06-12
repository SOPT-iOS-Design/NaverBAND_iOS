//
//  RecommendBandCell.swift
//  NaverBand
//
//  Created by 김성은 on 2020/05/28.
//  Copyright © 2020 김성은. All rights reserved.
//

import UIKit

class RecommendBandCell: UICollectionViewCell {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var infoLabel: UILabel!
    
    func setBandInfo(image: UIImage, title: String, info: String) {
        imageView.image = image
        titleLabel.text = title
        infoLabel.text = info
    }
}
