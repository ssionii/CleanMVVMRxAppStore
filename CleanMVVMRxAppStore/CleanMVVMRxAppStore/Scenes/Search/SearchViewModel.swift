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
    }
    
    struct Output {
        var searchResultImage: Driver<UIImage?>
    }
    
    var disposeBag: DisposeBag = DisposeBag()
    
    var searchDataStore: SearchDataSourceProtocol
    
    init(searchDataStore: SearchDataSourceProtocol) {
        self.searchDataStore = searchDataStore
    }
    
    
    func transform(input: Input) -> Output {
        
        let resultImage = input.searchInputText.flatMap { inputText in
            return self.searchDataStore.search(inputText: inputText ?? "" )
        }.asDriver(onErrorJustReturn: UIImage(named: "xmark.bin"))
        
        return Output(searchResultImage: resultImage)
        
    }
}

