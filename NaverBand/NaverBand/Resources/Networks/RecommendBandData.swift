//
//  RecommendBandData.swift
//  NaverBand
//
//  Created by 김성은 on 2020/06/12.
//  Copyright © 2020 김성은. All rights reserved.
//

import Foundation
import UIKit

struct RecommendBandData: Codable {
    var status: Int
    var success: Bool
    var message: String
    var data: [RecBand]?
    
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
        data = (try? values.decode([RecBand].self, forKey: .data)) ?? []
    }
}

struct RecBand: Codable {
    var band_name: String
    var band_num_of_member: String
    var band_img: String
    var user_nickname: String
}
