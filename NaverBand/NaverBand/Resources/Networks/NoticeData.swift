//
//  NoticeData.swift
//  NaverBand
//
//  Created by 김성은 on 2020/06/12.
//  Copyright © 2020 김성은. All rights reserved.
//

import Foundation
import UIKit

struct NoticeData: Codable {
    var status: Int
    var success: Bool
    var message: String
    var data: [Notice]?
    
    enum CodingKeys: String, CodingKey {
        case status = "status"
        case success = "success"
        case message = "message"
        case data = "data"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        status = (try? values.decode(Int.self, forKey: .status)) ?? -1
        success = (try? values.decode(Bool.self, forKey: .success)) ?? false
        message = (try? values.decode(String.self, forKey: .message)) ?? ""
        data = (try? values.decode([Notice].self, forKey: .data)) ?? []
    }
}

struct Notice: Codable {
    var notice_title: String
    var notice_sub: String
    var notice_thumbnail: String
}
