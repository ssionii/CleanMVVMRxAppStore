//
//  SearchAPI.swift
//  CleanMVVMRxAppStore
//
//  Created by  60117280 on 2021/06/24.
//

import Foundation
import RxSwift

protocol SearchAPIProtocol {
    func search(inputText: String, limits: String) -> Single<SearchResponse>
}

class SearchAPI: API, SearchAPIProtocol {
    
    func search(inputText: String, limits: String) -> Single<SearchResponse> {
        
        urlRequest(
            path: "/search",
            httpMethod: .get,
            query: [
                "term" : inputText,
                "country" : "KR",
                "media" : "software",
                "entity" : "software",
                "limits" : limits
            ],
            body: nil
        ).flatMap { urlRequest in
            Single.create { single in
                let task = URLSession.shared.dataTask(with: urlRequest) { data, response, error in
                    
                    if let error = error {
                        single(.failure(error))
                        return
                    }
                    
                    if let data = data {
                        do {
                            let json = try JSONDecoder().decode(SearchResponse.self, from: data)
                            single(.success(json))
                        } catch {
                            single(.failure(APIError.decodingError))
                            return
                        }
                    } else {
                        single(.failure(APIError.emptyDataError))
                        return
                    }
                }
                
                task.resume()
                
                return Disposables.create {
                    task.cancel()
                }
            }
        }
    }
}
