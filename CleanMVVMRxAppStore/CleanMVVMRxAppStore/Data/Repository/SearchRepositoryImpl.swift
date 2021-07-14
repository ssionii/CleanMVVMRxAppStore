//
//  SearchRepositoryImpl.swift
//  CleanMVVMRxAppStore
//
//  Created by 양시연 on 2021/07/05.
//

import Foundation
import RxSwift

class SearchRepository: SearchRepositoryProtocol {
    
    let searchDataSource: SearchDataSourceProtocol = SearchDataSource()
    
    func search(request: SearchUseCaseModels.Request) -> Observable<SearchUseCaseModels.Response> {
        searchDataSource.search(inputText: request.inputText, limits: String(request.limits))
            .asObservable()
            .map { appInfos in
                return SearchUseCaseModels.Response(appInfos: appInfos)
            }
    }
}
