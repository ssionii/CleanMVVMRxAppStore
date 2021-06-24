//
//  APIError.swift
//  CleanMVVMRxAppStore
//
//  Created by  60117280 on 2021/06/24.
//

import Foundation

enum APIError: Error {
    case bodyCreateError
    case urlCreateError
    case decodingError
    case emptyDataError
}
