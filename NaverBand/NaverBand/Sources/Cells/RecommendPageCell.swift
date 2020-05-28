//
//  RecommendPageCell.swift
//  NaverBand
//
//  Created by 김성은 on 2020/05/28.
//  Copyright © 2020 김성은. All rights reserved.
//

import UIKit

class RecommendPageCell: UICollectionViewCell {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var commentLabel: UILabel!
    
    func setPageInfo(imageName: String, title: String, comment: String) {
        imageView.image = UIImage(named: imageName)
        titleLabel.text = title
        commentLabel.text = comment
    }
}
