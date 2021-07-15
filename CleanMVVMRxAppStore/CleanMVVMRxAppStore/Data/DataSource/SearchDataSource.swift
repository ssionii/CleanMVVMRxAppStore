//
//  SearchDataSource.swift
//  CleanMVVMRxAppStore
//
//  Created by  60117280 on 2021/06/24.
//

import Foundation
import RxSwift

protocol SearchDataSourceProtocol {
<<<<<<< HEAD
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
=======
    func search(inputText: String, limits: String) -> Observable<[AppInfo]>
}

class SearchDataSource: SearchDataSourceProtocol {
    var searchAPI: SearchAPIProtocol = SearchAPI()
    
    func search(inputText: String, limits: String) -> Observable<[AppInfo]> {
        return searchAPI.search(inputText: inputText, limits: limits)
            .asObservable()
            .map { response in
                return response.results
>>>>>>> 79a382b113736718896704e93404b72138cd0654
            }
    }
}
