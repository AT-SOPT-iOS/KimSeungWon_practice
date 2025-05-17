//
//  UserService.swift
//  CarrotMarket
//
//  Created by 김승원 on 5/8/25.
//

import Foundation

final class UserService: BaseService<UserTargetType> {
    
    static let shared = UserService()
    private override init() {}
    
    // MARK: - Functions
    
    func fetchNickname(keyword: String) async throws -> BaseResponseBody<NicknameListResponseDTO>? {
        return try await request(with: .fetchNickname(keyword: keyword))
    }
    
    func changeNickname(requestBody: ChangeNicknameRequestDTO, userId: Int) async throws -> BaseResponseBody<EmptyResponseDTO>? {
        return try await request(with: .changeNickname(requestBody: requestBody, userId: userId))
    }
    
    func fetchMyNickname(userId: Int) async throws -> BaseResponseBody<FetchMyNicknameResponseDTO>? {
        return try await request(with: .fetchMyNickname(userId: userId))
    }
}
