//
//  SearchDataSource.swift
//  CleanMVVMRxAppStore
//
//  Created by  60117280 on 2021/06/24.
//

import Foundation
import RxSwift

protocol SearchDataSourceProtocol {
    func search(inputText: String) -> Observable<SearchResponse>
}

class SearchDataSource: SearchDataSourceProtocol {
    private var searchAPI: SearchAPIProtocol
    
    init() {
        self.searchAPI = SearchAPI()
    }
    
    func search(inputText: String) -> Observable<SearchResponse> {
        return searchAPI.search(inputText: inputText)
            .asObservable()
            .map { response in
                return response
            }
    }
}
