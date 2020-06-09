//
//  NewNoticeData.swift
//  NaverBand
//
//  Created by 박주연 on 2020/06/09.
//  Copyright © 2020 박주연. All rights reserved.
//

import Foundation

struct NewNoticeData: Codable {
    let status: Int
    let success: Bool
    let message: String
    let data: [NewNoticeDataClass]
    
    
    // MARK: - Datum
    struct NewNoticeDataClass: Codable {
        let noticeTitle, noticeSub: String
        let noticeThumbnail: String
        
        enum CodingKeys: String, CodingKey {
            case noticeTitle = "notice_title"
            case noticeSub = "notice_sub"
            case noticeThumbnail = "notice_thumbnail"
        }
    }
}
