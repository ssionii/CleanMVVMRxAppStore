//
//  SearchDataSource.swift
//  CleanMVVMRxAppStore
//
//  Created by  60117280 on 2021/06/24.
//

import Foundation
import RxSwift

protocol SearchDataSourceProtocol {
    func search(inputText: String) -> Observable<UIImage?>
}

class SearchDataSource: SearchDataSourceProtocol {
    var searchAPI: SearchAPIProtocol
    
    init(searchAPI: SearchAPIProtocol) {
        self.searchAPI = searchAPI
    }
    
    func search(inputText: String) -> Observable<UIImage?> {
        return searchAPI.search(inputText: inputText)
            .asObservable()
            .map { (response: SearchResponse) in
                
                if response.results.count > 0 {
                    if let imageUrl = response.results[0].artworkUrl100 {
                        let data = try Data(contentsOf: imageUrl)
                        
                        return UIImage(data: data)
                    }
                }
                return nil
            }
    }
}
