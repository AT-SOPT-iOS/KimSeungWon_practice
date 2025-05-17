//
//  AuthService.swift
//  CarrotMarket
//
//  Created by 김승원 on 5/8/25.
//

import Foundation

final class AuthService: BaseService<AuthTargetType> {
    
    static let shared = AuthService()
    private override init() {}
    
    // MARK: - Functions
    
    func signup(requestBody: RegisterRequestDTO) async throws -> BaseResponseBody<RegisterResponseDTO>? {
        return try await request(with: .signup(requestBody: requestBody))
    }
    
    func signin(requestBody: SigninRequestDTO) async throws -> BaseResponseBody<SigninResponseDTO>? {
        return try await request(with: .signin(requestBody: requestBody))
    }
}
