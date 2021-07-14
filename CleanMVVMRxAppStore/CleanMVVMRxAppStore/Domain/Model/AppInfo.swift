//
//  SearchResult.swift
//  CleanMVVMRxAppStore
//
//  Created by 양시연 on 2021/07/05.
//

import Foundation

struct AppInfo: Codable {
    
    var logo: URL
    var name: String
    var categories: [String]
    var previewUrls: [URL]
    
    enum CodingKeys: String, CodingKey {
        case logo = "artworkUrl100"
        case name = "trackName"
        case categories = "genres"
        case previewUrls = "screenshotUrls"
        
    }
}
