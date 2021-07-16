//
//  SearchViewModel.swift
//  CleanMVVMRxAppStore
//
//  Created by  60117280 on 2021/06/24.
//

import Foundation
import RxSwift
import RxCocoa


class SearchViewModel {
    
    struct Input {
        var searchButtonClicked: Observable<Void>
        var searchInputText: Observable<String?>
    }
    
    struct Output {
        var searchResults: Driver<[AppInfo]>
    }
    
    private let searchUseCase: SearchUseCaseProtocol
    
    // FIXME: 일단 DI는 신경쓰지 말고 이렇게 해놓자.
    init() {
        self.searchUseCase = SearchUseCase()
    }
    
    func transform(input: Input) -> Output {

        let results = input.searchButtonClicked
            .withLatestFrom(input.searchInputText)
            .flatMap { inputText in
                self.searchUseCase.execute(
                    request: SearchUseCaseModels.Request(
                        inputText: inputText ?? "",
                        limit: 20
                    )
                )
            }
            .map { response in
                return response.appInfos
            }
            .asDriver(onErrorJustReturn: [])
        
        return Output(searchResults: results)
    }
}
