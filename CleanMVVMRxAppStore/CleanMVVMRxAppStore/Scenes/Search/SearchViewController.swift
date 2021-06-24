//
//  ViewController.swift
//  CleanMVVMRxAppStore
//
//  Created by  60117280 on 2021/06/24.
//

import UIKit
import RxSwift

class SearchViewController: UIViewController {

    @IBOutlet weak var searchTextField: UITextField!
    @IBOutlet weak var searchResultImageView: UIImageView!
    
    let disposeBag = DisposeBag()
    
    var viewModel = SearchViewModel(searchDataStore: SearchDataSource(searchAPI: SearchAPI()))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bindViewModel()
    }
    
    private func bindViewModel(){
        let output = viewModel.transform(
            input: SearchViewModel.Input(
                searchInputText: searchTextField.rx.text.asObservable()
            )
        )
        
        output.searchResultImage
            .drive(searchResultImageView.rx.image)
            .disposed(by: disposeBag)
    }
}

