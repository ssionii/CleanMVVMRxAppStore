//
//  SearchResultCell.swift
//  CleanMVVMRxAppStore
//
//  Created by 양시연 on 2021/07/05.
//

import UIKit
import RxSwift
import RxCocoa

class SearchResultCell: UITableViewCell {
    
    static let ID = "SearchResultCell"
    
    @IBOutlet weak var iconImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var categoryLabel: UILabel!
    @IBOutlet weak var previewStackView: UIStackView!
    
    @IBOutlet weak var previewImageView1: UIImageView!
    @IBOutlet weak var previewImageView2: UIImageView!
    @IBOutlet weak var previewImageView3: UIImageView!
    
    
    private var viewModel = SearchResultViewModel()
    private var disposeBag = DisposeBag()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        configureUI()
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        disposeBag = DisposeBag()
        
        preparePreviewForReuse(imageView: previewImageView1)
        preparePreviewForReuse(imageView: previewImageView2)
        preparePreviewForReuse(imageView: previewImageView3)
        
    }
    
    func bind(appInfo: AppInfo){

        let output = viewModel.transform(input: SearchResultViewModel.Input(appInfo: appInfo))
        
        output.name
            .drive(titleLabel.rx.text)
            .disposed(by: disposeBag)
        
        output.categories
            .drive(categoryLabel.rx.text)
            .disposed(by: disposeBag)
        
        output.logoImage
            .drive(iconImageView.rx.image)
            .disposed(by: disposeBag)
        
        output.previewImage1
            .subscribe(onNext: { [weak self] image in
                guard let self = self else { return }
                self.previewImageView1.image = image
            })
            .disposed(by: disposeBag)
        
        output.previewImage2?
            .subscribe(onNext: { [weak self] image in
                guard let self = self else { return }
                
                if image.size.width > image.size.height {
                    self.previewImageView2.isHidden = true
                    return
                }
                
                self.previewImageView2.image = image
                
                
            })
            .disposed(by: disposeBag)
        
        output.previewImage3?
            .subscribe(onNext: { [weak self] image in
                guard let self = self else { return }
                
                if image.size.width > image.size.height {
                    self.previewImageView3.isHidden = true
                    return
                }
                
                self.previewImageView3.image = image
            })
            .disposed(by: disposeBag)
        
        
    }
    
    private func configureUI() {
        iconImageView.layer.cornerRadius = 10.0
        
        configurePreview(imageView: previewImageView1)
        configurePreview(imageView: previewImageView2)
        configurePreview(imageView: previewImageView3)
    }
    
    private func configurePreview(imageView: UIImageView) {
        imageView.layer.cornerRadius = 10
        imageView.layer.borderWidth = 0.5
        imageView.layer.borderColor = UIColor.systemGray4.cgColor
        imageView.layer.masksToBounds = true
        imageView.clipsToBounds = true
    }
    
    private func preparePreviewForReuse(imageView: UIImageView) {
        imageView.isHidden = false
        imageView.image = nil
    }
}
