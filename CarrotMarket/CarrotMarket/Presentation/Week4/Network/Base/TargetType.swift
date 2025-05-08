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
    var headers: [String: String]? { get }
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
