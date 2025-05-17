//
//  AuthTargetType.swift
//  CarrotMarket
//
//  Created by 김승원 on 5/8/25.
//

import Foundation

enum AuthTargetType {
    case signup(requestBody: RegisterRequestDTO)
    case signin(requestBody: SigninRequestDTO)
}

extension AuthTargetType: TargetType {
    var baseURL: String {
        return Environment.baseURL
    }
    
    var path: String {
        switch self {
        case .signup:
            return "auth/signup"
        case .signin:
            return "auth/signin"
        }
    }
    
    var method: HTTPMethod {
        switch self {
        case .signup:
            return .post
        case .signin:
            return .post
        }
    }
    
    var task: NetworkTask {
        switch self {
        case .signup(let requestBody):
            return .requestJSONEncodable(encodable: requestBody)
        case .signin(let requestBody):
            return .requestJSONEncodable(encodable: requestBody)
        }
    }
    
    var headers: HeaderField {
        return .contentTypeJSON
    }
}
