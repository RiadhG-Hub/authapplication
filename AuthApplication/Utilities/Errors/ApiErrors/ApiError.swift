//
//  ApiError.swift
//  HeroQuiz
//
//  Created by riadh gharbi on 14/8/2024.
//

import Foundation


struct ApiError : Error {
    var apiErrorType : ApiErrorType
    init(apiErrorType: ApiErrorType) {
        self.apiErrorType = apiErrorType
    }
}


enum ApiErrorType {
    case nilResult
    case unknownError
}
