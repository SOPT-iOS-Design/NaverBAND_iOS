//
//  BandCell.swift
//  NaverBand
//
//  Created by 이재용 on 2020/05/27.
//  Copyright © 2020 jaeyong Lee. All rights reserved.
//

import UIKit

class NewBandCell: UICollectionViewCell {
    static let identifier: String = "NewBandCell"
    @IBOutlet weak var bandImageView: UIImageView!
    @IBOutlet weak var bandLabel: UILabel!
    
    func set(_ bandInformation: Band) {
        bandImageView.image = bandInformation.bandImg
        bandLabel.text = bandInformation.bandLabelName
    }
}
