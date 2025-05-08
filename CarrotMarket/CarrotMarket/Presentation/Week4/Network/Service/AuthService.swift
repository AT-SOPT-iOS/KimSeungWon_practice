//
//  AuthService.swift
//  CarrotMarket
//
//  Created by 김승원 on 5/8/25.
//

import Foundation

final class AuthService: BaseService<AuthTargetType> {
    static let shared = AuthService(provider: NetworkProvider<AuthTargetType>())

    private override init(provider: NetworkProvider<AuthTargetType>) {
        super.init(provider: provider)
    }
    
    // MARK: - Functions
    
    func signup(requestBody: RegisterRequestDTO) async throws -> BaseResponseBody<RegisterResponseDTO>? {
        return try await request(with: .signup(requestBody: requestBody))
    }
    
    func signin(requestBody: SigninRequestDTO) async throws -> BaseResponseBody<SigninResponseDTO>? {
        return try await request(with: .signin(requestBody: requestBody))
    }
}
