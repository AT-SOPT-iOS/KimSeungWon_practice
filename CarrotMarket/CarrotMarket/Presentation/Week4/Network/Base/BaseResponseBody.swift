//
//  BaseResponseBody.swift
//  CarrotMarket
//
//  Created by 김승원 on 5/7/25.
//

import Foundation

struct BaseResponseBody<T: ResponseModelType>: ResponseModelType {
    let success: Bool
    let code: String
    let message: String
    let data: T?
}
