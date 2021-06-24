//
//  SearchResponse.swift
//  CleanMVVMRxAppStore
//
//  Created by  60117280 on 2021/06/24.
//

import Foundation

struct SearchResponse: Codable {
    let results: [SearchResult]
    
    struct SearchResult: Codable {
        let artworkUrl100: URL?
    }
}