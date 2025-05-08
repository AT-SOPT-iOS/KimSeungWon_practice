//
//  SigninRequestDTO.swift
//  CarrotMarket
//
//  Created by 김승원 on 5/8/25.
//

import Foundation

struct SigninRequestDTO: RequestModelType {
    let loginId: String
    let password: String
}
