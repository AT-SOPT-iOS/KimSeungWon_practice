//
//  TargetType.swift
//  CarrotMarket
//
//  Created by 김승원 on 5/8/25.
//

import Foundation

public protocol TargetType {
    var baseURL: String { get }
    var path: String { get }
    var method: HTTPMethod { get }
    var sampleData: Data { get }
    var task: NetworkTask { get }
    var headers: HeaderField { get }
}

public extension TargetType {
    var sampleData: Data { Data() }
}

// MARK: - NetworkTask

public enum NetworkTask {
    case requestPlain
    case requestParameters(parameters: [String : Any], encoding: ParameterEncoding)
    case requestJSONEncodable(encodable: Encodable)
}

// MARK: - ParameterEncoding

public enum ParameterEncoding {
    case queryString
}

// MARK: - HeaderField

public enum HeaderField {
    case contentTypeJSON
    case userId(Int)
    
    var keyValue: [String: String]? {
        switch self {
        case .contentTypeJSON:
            return ["Content-Type": "application/json"]
        case .userId(let id):
            return ["Content-Type": "application/json", "userId": String(id)]
        }
    }
}
