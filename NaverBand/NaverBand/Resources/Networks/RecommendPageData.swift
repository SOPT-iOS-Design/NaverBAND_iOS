//
//  RecommendPageData.swift
//  NaverBand
//
//  Created by 김성은 on 2020/06/12.
//  Copyright © 2020 김성은. All rights reserved.
//

import Foundation
import UIKit

struct RecommendPageData: Codable {
    var status: Int
    var success: Bool
    var message: String
    var data: [RecPage]?
    
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
        data = (try? values.decode([RecPage].self, forKey: .data)) ?? []
    }
}

struct RecPage: Codable {
    var page_name: String
    var page_detail: String
    var page_img: String
}
