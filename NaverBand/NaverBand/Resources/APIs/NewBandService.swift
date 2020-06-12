//
//  NewBandService.swift
//  NaverBand
//
//  Created by 이재용 on 2020/06/10.
//  Copyright © 2020 jaeyong Lee. All rights reserved.
//

import Foundation
import Alamofire

struct NewBandService {
    static let shared = NewBandService()
    
    func getNewBand(completion: @escaping (NetworkResult<Any>) -> Void) {
        let header: HTTPHeaders = ["Content-Type": "application/json"]
        
        let dataRequest = Alamofire.request(APIConstants.newBandURL, method: .get, encoding: JSONEncoding.default, headers: header)
        
        dataRequest.responseData { (dataResponse) in
            switch dataResponse.result {
            case .success:
                guard let statusCode = dataResponse.response?.statusCode else { return }
                guard let value = dataResponse.result.value else { return }
                let networkResult = self.judge(by: statusCode, value)
                completion(networkResult)
            case .failure: completion(.networkFail)
            
            }
            
        }
    }
    
    private func judge(by statusCode: Int, _ data: Data) -> NetworkResult<Any> {
        switch statusCode {
        case 200: return getNewB(by: data)
        case 400: return .pathErr
        case 500: return .serverErr
        default: return .networkFail
        }
    }
    
    private func getNewB(by data: Data) -> NetworkResult<Any> {
        let decoder = JSONDecoder()
        
        guard let decodedData = try? decoder.decode(NewBandData.self, from: data) else { return .pathErr }
        
        if decodedData.success {
            return .success(decodedData.data ?? [])
        } else {
            return .requestErr(decodedData.message)
        }
        
    }
    
}
