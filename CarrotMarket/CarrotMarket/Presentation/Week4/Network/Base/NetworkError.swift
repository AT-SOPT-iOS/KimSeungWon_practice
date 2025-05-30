//
//  NetworkError.swift
//  CarrotMarket
//
//  Created by 김승원 on 5/3/25.
//

import Foundation

enum NetworkError: Error, CustomStringConvertible {
    case invalidURLComponents
    case invalidURLString
    case requestEncodingError
    case responseDecodingError
    case responseError
    case unknownError
    case loginFailed(statusCode: Int)
    case notFoundError
    case internalServerError

    var description: String {
        switch self {
        case .invalidURLComponents:
            return "URL 구성을 만들 수 없습니다."
        case .invalidURLString:
            return "잘못된 URL입니다."
        case .requestEncodingError:
            return "요청 인코딩에 실패했습니다."
        case .responseDecodingError:
            return "응답 디코딩에 실패했습니다."
        case .responseError:
            return "서버로부터 에러 응답을 받았습니다."
        case .unknownError:
            return "알 수 없는 네트워크 오류가 발생했습니다."
        case .loginFailed(let statusCode):
            return "로그인 실패 (HTTP \(statusCode))"
        case .notFoundError:
            return "요청한 리소스를 찾을 수 없습니다. (404)"
        case .internalServerError:
            return "서버 내부 오류입니다. (500)"
        }
    }
}
