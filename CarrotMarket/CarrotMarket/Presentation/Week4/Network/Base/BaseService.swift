//
//  BaseService.swift
//  CarrotMarket
//
//  Created by 김승원 on 5/8/25.
//

import Foundation

class BaseService<Target: TargetType> {
    let provider: NetworkProvider<Target>

    init(provider: NetworkProvider<Target>) {
        self.provider = provider
    }

    func request<T: ResponseModelType>(
        with target: Target
    ) async throws -> BaseResponseBody<T> {
        let urlRequest = try provider.request(target)
        
        NetworkLogger.logRequest(urlRequest, target: target)
        
        do {
            let (data, response) = try await URLSession.shared.data(for: urlRequest)
            NetworkLogger.logResponse(data: data, response: response, target: target)
            
            guard let httpResponse = response as? HTTPURLResponse,
                  200..<300 ~= httpResponse.statusCode else {
                throw NetworkError.responseError
            }
            
            return try JSONDecoder().decode(BaseResponseBody<T>.self, from: data)
            
        } catch {
            NetworkLogger.logError(error)
            throw error
        }
    }
}
