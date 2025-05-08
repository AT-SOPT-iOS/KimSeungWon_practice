//
//  RegisterResponseDTO.swift
//  CarrotMarket
//
//  Created by 김승원 on 5/3/25.
//

import Foundation

struct RegisterResponseDTO: ResponseModelType {
    let userId: Int
    let nickname: String
}
