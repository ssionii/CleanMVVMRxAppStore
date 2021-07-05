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
    }
    
    struct Output {
        var searchResults: Driver<[AppInfo]>
    }
    
    var disposeBag: DisposeBag = DisposeBag()
    var searchAPI = SearchAPI()
    
    func transform(input: Input) -> Output {
        
        let results = input.searchButtonClicked
            .withLatestFrom(input.searchInputText)
            .flatMap { inputText in
                return self.search(inputText: inputText ?? "" )
                
        }.asDriver(onErrorJustReturn: [])
        
        return Output(searchResults: results)
    }
    
    func search(inputText: String) -> Observable<[AppInfo]> {
        
        searchAPI.search(inputText: inputText)
            .asObservable()
            .map { response in
                
                let results = response.results
                var tempResults = [AppInfo]()
                
                var index = 0
                for app in results {
                    tempResults.append(app)
                    
                    index += 1
                    if index == 10 {
                        break
                    }
                }
                
                return tempResults
            }
    }
}



