//
//  HTTPMethod.swift
//  CarrotMarket
//
//  Created by 김승원 on 5/8/25.
//

import Foundation

public struct HTTPMethod: RawRepresentable {
    
    public let rawValue: String
    
    public init(rawValue: String) {
        self.rawValue = rawValue
    }
    
    public static let post = HTTPMethod(rawValue: "POST")
    
    public static let get = HTTPMethod(rawValue: "GET")
    
    public static let patch = HTTPMethod(rawValue: "PATCH")
    
    public static let delete = HTTPMethod(rawValue: "DELETE")
}
