//
//  SearchDataSource.swift
//  CleanMVVMRxAppStore
//
//  Created by  60117280 on 2021/06/24.
//

import Foundation
import RxSwift

protocol SearchDataSourceProtocol {
    func search(inputText: String, limit: String) -> Observable<[AppInfo]>
}

class SearchDataSource: SearchDataSourceProtocol {
    var searchAPI: SearchAPIProtocol = SearchAPI()
    
    func search(inputText: String, limit: String) -> Observable<[AppInfo]> {
        return searchAPI.search(inputText: inputText, limit: limit)
            .asObservable()
            .map { response in
                response.toEntity()
            }
    }
}
