//
//  NewBandData.swift
//  NaverBand
//
//  Created by 박주연 on 2020/06/09.
//  Copyright © 2020 박주연. All rights reserved.
//

import Foundation

struct NewBandData: Codable {
    let success: Bool
    let message: String
    let data: [NewBandDataClass]
    
    // MARK: - Datum
    struct NewBandDataClass: Codable {
        let bandName: String
        let bandImg: String
        
        enum CodingKeys: String, CodingKey {
            case bandName = "band_name"
            case bandImg = "band_img"
        }
    }
    
}
