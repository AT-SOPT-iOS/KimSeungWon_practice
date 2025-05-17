//
//  RegisterRequestDTO.swift
//  CarrotMarket
//
//  Created by 김승원 on 5/3/25.
//

import Foundation

struct RegisterRequestDTO: RequestModelType {
    let loginId: String
    let password: String
    let nickname: String
}
