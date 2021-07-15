//
//  SearchRepositoryProtocl.swift
//  CleanMVVMRxAppStore
//
//  Created by 양시연 on 2021/07/05.
//

import Foundation
import RxSwift

protocol SearchRepositoryProtocol {
    func search(request: SearchUseCaseModels.Request) -> Observable<SearchUseCaseModels.Response>
}
