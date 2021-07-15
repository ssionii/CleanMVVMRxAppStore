//
//  SearchResultCell.swift
//  CleanMVVMRxAppStore
//
//  Created by 양시연 on 2021/07/05.
//

import UIKit

class SearchResultCell: UITableViewCell {
    
    static let ID = "SearchResultCell"
    
    @IBOutlet weak var iconImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var categoryLabel: UILabel!
    @IBOutlet weak var previewStackView: UIStackView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func prepareForReuse() {
        super.prepareForReuse()
        
        for preview in self.previewStackView.arrangedSubviews {
            preview.removeFromSuperview()
        }
    }
    
    func bind(appInfo: AppInfo){
        
        do {
            let data = try Data(contentsOf: appInfo.logo)
            iconImageView.image = UIImage(data: data)
            iconImageView.layer.cornerRadius = 10.0
        } catch {
            print("image logo 못 불러옴")
        }
        
        titleLabel.text = appInfo.name
        
        categoryLabel.text = ""
        for category in appInfo.categories {
            categoryLabel.text?.append("\(category) ")
        }
        
        for preview in appInfo.previewUrls {
            do {
                let data = try Data(contentsOf: preview)
                let imageView = UIImageView(image: UIImage(data:data))
                imageView.layer.cornerRadius = 10
                imageView.layer.borderWidth = 0.5
                imageView.layer.borderColor = UIColor.lightGray.cgColor
                imageView.clipsToBounds = true
                
                previewStackView.addArrangedSubview(imageView)
                
                if previewStackView.arrangedSubviews.count == 3 {
                    break
                }
                
                if imageView.frame.width > imageView.frame.height {
                    
                    // TODO: 크기 조절
                    break
                }
                
                
            } catch {
                print("preview 못 불러옴")
            }
        }
    }
    
}
