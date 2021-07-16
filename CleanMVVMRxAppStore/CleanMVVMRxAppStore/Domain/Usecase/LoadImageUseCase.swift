//
//  LoadImageUseCase.swift
//  CleanMVVMRxAppStore
//
//  Created by  60117280 on 2021/07/15.
//

import Foundation
import UIKit
import RxSwift

protocol LoadImageUseCaseProtocol {
    func excute(request: LoadImageUseCaseModels.Request) -> Observable<LoadImageUseCaseModels.Response>
}

enum LoadImageUseCaseModels {
    struct Request {
        var url: URL
    }
    
    struct Response {
        var image: UIImage
    }
}

class LoadImageUseCase: LoadImageUseCaseProtocol {
    
    func excute(request: LoadImageUseCaseModels.Request) -> Observable<LoadImageUseCaseModels.Response> {
        
        return Observable.create() { f in
            DispatchQueue.global().async {
                do {
                    let data = try Data(contentsOf: request.url)
                    guard let image = UIImage(data: data) else {
                        DispatchQueue.main.async {
                            print("convert data to image fail")
                            f.onNext(LoadImageUseCaseModels.Response(image: UIImage()))
                        }
                        return
                    }
                    
                    DispatchQueue.main.async {
                        f.onNext(LoadImageUseCaseModels.Response(image: image))
                    }
                } catch  {
                    DispatchQueue.main.async {
                        print("convert url to data fail")
                        f.onNext(LoadImageUseCaseModels.Response(image: UIImage()))
                    }
                }
            }
            return Disposables.create()
        }
    }
}
