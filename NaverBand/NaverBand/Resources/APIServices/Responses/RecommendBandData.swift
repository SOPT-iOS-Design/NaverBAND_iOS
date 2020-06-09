//
//  RecommendBandData.swift
//  NaverBand
//
//  Created by 박주연 on 2020/06/09.
//  Copyright © 2020 박주연. All rights reserved.
//

import Foundation

struct RecommendBandData: Codable {
    let status: Int
    let success: Bool
    let message: String
    let data: [RecommendBandDataClass]
    
    
    // MARK: - Datum
    struct RecommendBandDataClass: Codable {
        let bandName, bandNumOfMember: String
        let bandImg: String
        let userNickname: String
        
        enum CodingKeys: String, CodingKey {
            case bandName = "band_name"
            case bandNumOfMember = "band_num_of_member"
            case bandImg = "band_img"
            case userNickname = "user_nickname"
        }
    }
}

