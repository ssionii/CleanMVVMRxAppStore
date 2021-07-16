//
//  SearchResultViewModel.swift
//  CleanMVVMRxAppStore
//
//  Created by  60117280 on 2021/07/15.
//

import Foundation
import RxSwift
import RxCocoa
import UIKit

class SearchResultViewModel {
    struct Input {
        var appInfo: AppInfo
    }
    
    struct Output {
        var logoImage: Driver<UIImage>
        var name: Driver<String>
        var categories: Driver<String>
        var previewImage1: Observable<UIImage>
        var previewImage2: Observable<UIImage>?
        var previewImage3: Observable<UIImage>?
    }
    
    private let loadImageUseCase: LoadImageUseCaseProtocol
    
    init() {
        self.loadImageUseCase = LoadImageUseCase()
    }
    
    func transform(input: Input) -> Output {
        
        let name = Observable.of(input.appInfo.name).asDriver(onErrorJustReturn: "")
        let categories = Observable.of(input.appInfo.categories.first ?? "").asDriver(onErrorJustReturn: "")
        
        let logoImage = self.loadImageUseCase.excute(
            request: LoadImageUseCaseModels.Request(
                url: input.appInfo.logo
            ))
            .map { $0.image }
            .asDriver(onErrorJustReturn: UIImage())
    
        let previewImage1 = self.loadImageUseCase.excute(
            request: LoadImageUseCaseModels.Request(
                url: input.appInfo.previewUrls[0]
            )).map { $0.image }
        
        var previewImage2: Observable<UIImage>?
        if input.appInfo.previewUrls.count > 1 {
            previewImage2 = self.loadImageUseCase.excute(
                request: LoadImageUseCaseModels.Request(
                    url: input.appInfo.previewUrls[1]
                )).map { $0.image }
        }
        
        var previewImage3: Observable<UIImage>?
        if input.appInfo.previewUrls.count > 2 {
            previewImage3 = self.loadImageUseCase.excute(
                request: LoadImageUseCaseModels.Request(
                    url: input.appInfo.previewUrls[2]
                )).map { $0.image }
        }
        
        return Output(
            logoImage: logoImage,
            name: name,
            categories: categories,
            previewImage1: previewImage1,
            previewImage2: previewImage2,
            previewImage3: previewImage3
        )
    }
}
