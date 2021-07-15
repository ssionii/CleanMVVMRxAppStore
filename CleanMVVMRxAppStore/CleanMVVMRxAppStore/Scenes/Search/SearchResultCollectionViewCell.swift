//
//  SearchResultCollectionViewCell.swift
//  CleanMVVMRxAppStore
//
//  Created by  60117280 on 2021/06/30.
//

import UIKit

class SearchResultCollectionViewCell: UICollectionViewCell {
    
    static let ID = "SearchResultCollectionViewCell"

    @IBOutlet weak var iconImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var categoryLabel: UILabel!
    @IBOutlet weak var downloadButton: UIButton!
    @IBOutlet weak var previewImageStackView: UIStackView!
//
//    override func awakeFromNib() {
//        super.awakeFromNib()
//    }
    
    func bind(searchResult : SearchResult) {
        if let appIcon = searchResult.appIcon {
            do {
                let data = try Data(contentsOf: appIcon)
                iconImageView.image = UIImage(data: data)
                iconImageView.layer.cornerRadius = 4.0
            } catch {
                // image error handling
            }
        }
        
        titleLabel.text = searchResult.appName
        
        for genre in searchResult.genres {
            categoryLabel.text?.append(genre + " ")
        }
        
        for url in searchResult.screenshots {
            do {
                let data = try Data(contentsOf: url)
                if let previewImage = UIImage(data: data) {
                    let imageView = UIImageView(image: previewImage)
                    imageView.layer.cornerRadius = 6.0

                    previewImageStackView.addSubview(imageView)
                }
            } catch {
                // image error handling
            }
        }
    }


}
