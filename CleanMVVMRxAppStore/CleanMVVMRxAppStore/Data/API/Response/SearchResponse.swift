//
//  SearchResponse.swift
//  CleanMVVMRxAppStore
//
//  Created by  60117280 on 2021/06/24.
//

import Foundation
import UIKit

struct SearchResponse: Codable {
    let results: [SearchResult]
    
    struct SearchResult: Codable {
        let appName: String
        let appIcon: URL
        let screenshots: [URL]
        let genres: [String]
        
        enum CodingKeys: String, CodingKey {
            case appName = "trackName"
            case appIcon = "artworkUrl100"
            case screenshots = "screenshotUrls"
            case genres
        }
    }
}

extension SearchResponse {
    func toEntity() -> [AppInfo] {
        results.map { result in
            return AppInfo(
                logo: result.appIcon,
                name: result.appName,
                categories: result.genres,
                previewUrls: result.screenshots
            )
        }
    }
}
