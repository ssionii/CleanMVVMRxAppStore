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
        var searchButtonClicked: Observable<Void>
        var searchInputText: Observable<String?>
        var searchButtonClicked: Observable<Void>
    }
    
    struct Output {
<<<<<<< HEAD
        var searchResults: Observable<[SearchResult]>
    }
    
    private let searchUseCase: SearchUseCaseProtocol
    
    // FIXME: 일단 DI는 신경쓰지 말고 이렇게 해놓자.
    init() {
        self.searchUseCase = SearchUseCase()
=======
        var searchResults: Driver<[AppInfo]>
>>>>>>> 79a382b113736718896704e93404b72138cd0654
    }
    
    var disposeBag: DisposeBag = DisposeBag()
    
    var searchUseCase = SearchUseCase()
    
    func transform(input: Input) -> Output {
        
<<<<<<< HEAD
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
=======
        let results = input.searchButtonClicked
            .withLatestFrom(input.searchInputText)
            .flatMap { inputText in
                return self.search(inputText: inputText ?? "" )
                
        }.asDriver(onErrorJustReturn: [])
        
        return Output(searchResults: results)
    }
    
    func search(inputText: String) -> Observable<[AppInfo]> {
        searchUseCase.execute(
            request: SearchUseCaseModels.Request(inputText: inputText, limits: 20)
        ).asObservable()
        .map { appInfos in
            
        }
    
>>>>>>> 79a382b113736718896704e93404b72138cd0654
    }
}



