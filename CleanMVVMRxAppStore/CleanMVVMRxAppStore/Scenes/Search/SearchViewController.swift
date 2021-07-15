//
//  ViewController.swift
//  CleanMVVMRxAppStore
//
//  Created by  60117280 on 2021/06/24.
//

import UIKit
import RxSwift

class SearchViewController: UIViewController {
    
    var viewModel = SearchViewModel()
    let disposeBag = DisposeBag()
    
    var searchBar: UISearchBar!
    @IBOutlet var searchResultCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initUI()
        bindViewModel()
    }
    
    private func initUI() {
        
        searchBar = UISearchBar()
        searchBar.placeholder = "Search app"
        searchBar.setImage(UIImage(named: "magnifyingglass"), for: .search, state: .normal)
        searchBar.setImage(UIImage(named: "cancel"), for: .clear, state: .normal)
        
        self.navigationController?.navigationBar.topItem?.titleView = searchBar
        
        self.searchResultCollectionView.register(
            UINib(nibName: SearchResultCollectionViewCell.ID, bundle: nil),
            forCellWithReuseIdentifier: SearchResultCollectionViewCell.ID)
    }
    
    private func bindViewModel(){
        
        searchBar.rx.searchButtonClicked
        
//        searchBar.rx.searchButtonClicked
//            .do( onNext: {
//                print(self.searchBar.text)
//            })
//            .bind(onNext: {
//                self.viewModel.search(
//                    input: SearchViewModel.Input(
//                        searchInputText: self.searchBar.text ?? "")
//                )
//            }).disposed(by: disposeBag)
        
        
        
        ouput.searchResults
            .do(onNext: { _ in
                print("hello")
            }).bind(to: searchResultCollectionView.rx.items(
                cellIdentifier: SearchResultCollectionViewCell.ID,
                cellType: SearchResultCollectionViewCell.self
            )) { row, element, cell in
                cell.bind(searchResult: element)
            }.disposed(by: disposeBag)
        
        
        
//        let output = viewModel.transform(
//            input: SearchViewModel.Input(
//                searchButtonClicked: searchBar.rx.searchButtonClicked.asObservable(),
//                searchInputText: searchBar.rx.text.asObservable()
//            ))
//
//        output.searchResults
//            .drive(searchResultCollectionView.rx.items(
//                cellIdentifier: SearchResultCollectionViewCell.ID,
//                cellType: SearchResultCollectionViewCell.self
//            )) { row, element, cell in
//                cell.bind(searchResult: element)
//            }.disposed(by: disposeBag)
    }
}

