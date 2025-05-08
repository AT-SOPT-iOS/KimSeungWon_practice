//
//  UserTargetType.swift
//  CarrotMarket
//
//  Created by 김승원 on 5/8/25.
//

import Foundation

enum UserTargetType {
    case fetchNickname(keyword: String)
    case changeNickname(requestBody: ChangeNicknameRequestDTO, userId: Int)
    case fetchMyNickname(userId: Int)
}

extension UserTargetType: TargetType {
    var baseURL: String {
        return Environment.baseURL
    }
    
    var path: String {
        switch self {
        case .fetchNickname:
            return "users"
        case .changeNickname:
            return "users"
        case .fetchMyNickname:
            return "users/me"
        }
    }
    
    var method: HTTPMethod {
        switch self {
        case .fetchNickname:
            return .get
        case .changeNickname:
            return .patch
        case .fetchMyNickname:
            return .get
        }
    }
    
    var task: NetworkTask {
        switch self {
        case .fetchNickname(let keyword):
            let parameters: [String: Any]
            parameters = ["keyword": keyword]
            return .requestParameters(parameters: parameters, encoding: .queryString)
        case .changeNickname(let requestBody, _):
            return .requestJSONEncodable(encodable: requestBody)
        case .fetchMyNickname:
            return .requestPlain
        }
    }
    
    var headers: [String : String]? {
        switch self {
        case .fetchNickname:
            return ["Content-Type": "application/json"]
        case .changeNickname(_, let userId):
            return ["Content-Type": "application/json", "userId": String(userId)]
        case .fetchMyNickname(let userId):
            return ["Content-Type": "application/json", "userId": String(userId)]
        }
    }
}
