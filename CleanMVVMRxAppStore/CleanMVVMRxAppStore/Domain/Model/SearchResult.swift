//
//  SearchResult.swift
//  CleanMVVMRxAppStore
//
//  Created by  60117280 on 2021/06/29.
//

import Foundation

struct SearchResult: Codable {
    let appName: String
    let appIcon: URL?
    let screenshots: [URL]
    let genres: [String]
    
    enum CodingKeys: String, CodingKey {
        case appName = "trackName"
        case appIcon = "artworkUrl100"
        case screenshots = "screenshotUrls"
        case genres
    }
    
}
