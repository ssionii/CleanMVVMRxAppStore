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
    var searchAPI = SearchAPI()
    
    func transform(input: Input) -> Output {
        
        let resultImage = input.searchInputText.flatMap { inputText in
            return self.search(inputText: inputText ?? "" )
        }.asDriver(onErrorJustReturn: UIImage(named: "xmark.bin"))
        
        return Output(searchResultImage: resultImage)
        
    }
    
    private func search(inputText: String) -> Observable<UIImage?> {
        searchAPI.search(inputText: inputText)
            .asObservable()
            .map { response in
                if response.results.count > 0 {
                    if let imageURL = response.results[0].artworkUrl100 {
                        let data = try Data(contentsOf: imageURL)
                        
                        return UIImage(data: data)
                    }
                }
                return nil
            }
    }
}



