//
//  API.swift
//  CleanMVVMRxAppStore
//
//  Created by  60117280 on 2021/06/24.
//

import Foundation
import RxSwift

class API {
    private let scheme = "https"
    private let host = "itunes.apple.com"
    
    func urlRequest(
        path: String,
        httpMethod: HttpMethod,
        query: [String : String]? = nil,
        body: [String : Any]? = nil
    ) -> Single<URLRequest> {
        return Single.create { [weak self] single in
            
            guard let self = self else {
                return Disposables.create()
            }
            
            var urlComponents = URLComponents()
            urlComponents.scheme = self.scheme
            urlComponents.host = self.host
            urlComponents.path = path
            urlComponents.queryItems = query?.map { key, value in
                URLQueryItem(name: key, value: value)
            }
            
            if let url = urlComponents.url {
                var urlRequest = URLRequest(url: url)
                urlRequest.httpMethod = httpMethod.rawValue
                
                do {
                    if let body = body,
                       httpMethod == .post || httpMethod == .put {
                        urlRequest.httpBody = try JSONSerialization.data(withJSONObject: body, options: .prettyPrinted)
                    }
                    single(.success(urlRequest))
                } catch {
                    single(.failure(APIError.bodyCreateError))
                }
            } else {
                single(.failure(APIError.urlCreateError))
            }
            
            return Disposables.create()
        }
    }
}

enum HttpMethod: String {
    case get = "GET"
    case post = "POST"
    case put = "PUT"
    case delete = "DELETE"
}

