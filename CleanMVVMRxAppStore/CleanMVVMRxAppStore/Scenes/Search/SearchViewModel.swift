//
//  SearchViewModel.swift
//  CleanMVVMRxAppStore
//
//  Created by  60117280 on 2021/06/24.
//

import Foundation
import RxSwift
import RxCocoa

protocol ViewModelType {
    
}

class SearchViewModel: ViewModelType {
    
    struct Input {
        var searchInputText: Observable<String?>
        var searchButtonClicked: Observable<Void>
    }
    
    struct Output {
        var searchResults: Observable<[SearchResult]>
    }
    
    private let searchUseCase: SearchUseCaseProtocol
    
    // FIXME: 일단 DI는 신경쓰지 말고 이렇게 해놓자.
    init() {
        self.searchUseCase = SearchUseCase()
    }
    
    var disposeBag: DisposeBag = DisposeBag()
    
    func transform(input: Input) -> Output {
        
        let results = input.searchInputText
            .flatMap { inputText in
                
            }
        
        
        let results = input.searchButtonClicked
            .map {
                self.searchUseCase.execute(
                    request: SearchUseCaseRequest(inputText: input.searchInputText))
            }
            
            .flatMap { _ in
            return self.searchUseCase.execute(
                request: SearchUseCaseRequest(inputText: input.searchInputText ?? ""))
        }

        return Output(searchResults: results)
    }
}



