//
//  SearchUseCase.swift
//  CleanMVVMRxAppStore
//
//  Created by  60117280 on 2021/06/24.
//

import Foundation
import RxSwift

protocol SearchUseCaseProtocol {
    func search(inputText: String) -> Observable<UIImage?>
}

class SearchUseCase: SearchUseCaseProtocol {
    
    var searchDataSource = SearchDataSource(searchAPI: SearchAPI())
    
    func search(inputText: String) -> Observable<UIImage?> {
        return searchDataSource.search(inputText: inputText)
    }
    
    
}
