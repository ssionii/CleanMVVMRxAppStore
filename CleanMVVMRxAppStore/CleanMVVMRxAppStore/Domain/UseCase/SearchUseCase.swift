//
//  SearchUseCase.swift
//  CleanMVVMRxAppStore
//
//  Created by  60117280 on 2021/06/24.
//

import Foundation
import RxSwift

protocol SearchUseCaseProtocol {
    func execute(request: SearchUseCaseModels.Request) -> Observable<SearchUseCaseModels.Response>
}

enum SearchUseCaseModels {
    struct Request {
        var inputText: String
        var limits: Int
    }
    
    struct Response {
        var appInfos: [AppInfo]
    }
}

class SearchUseCase: SearchUseCaseProtocol {
    var searchRepository: SearchRepositoryProtocol = SearchRepository()
    
    func execute(request: SearchUseCaseModels.Request) -> Observable<SearchUseCaseModels.Response> {
        return searchRepository.search(request: request)
    }
}
