//
//  SearchUseCase.swift
//  CleanMVVMRxAppStore
//
//  Created by  60117280 on 2021/06/24.
//

import Foundation
import RxSwift

protocol SearchUseCaseProtocol {
    func execute(request: SearchUseCaseRequest) -> Observable<[SearchResult]>
}

struct SearchUseCaseRequest {
    let inputText: String
}

class SearchUseCase: SearchUseCaseProtocol {
   
    private let searchRepository: SearchRepositoryProtocol
    
    init() {
        self.searchRepository = SearchRespository()
    }
    
    func execute(request: SearchUseCaseRequest) -> Observable<[SearchResult]> {
        return searchRepository.search(inputText: request.inputText)
            .map { response in
                return response.results
            }
    }
}

