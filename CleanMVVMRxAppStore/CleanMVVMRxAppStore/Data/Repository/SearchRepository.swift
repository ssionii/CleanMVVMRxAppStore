//
//  SearchRepository.swift
//  CleanMVVMRxAppStore
//
//  Created by  60117280 on 2021/06/30.
//

import Foundation
import RxSwift

protocol SearchRepositoryProtocol {
    func search(inputText: String) -> Observable<SearchResponse>
}

class SearchRespository: SearchRepositoryProtocol {
    
    private var searchDataSource: SearchDataSourceProtocol
    
    init() {
        self.searchDataSource = SearchDataSource()
    }
    
    func search(inputText: String) -> Observable<SearchResponse> {
        searchDataSource.search(inputText: inputText)
    }
    
    
}
