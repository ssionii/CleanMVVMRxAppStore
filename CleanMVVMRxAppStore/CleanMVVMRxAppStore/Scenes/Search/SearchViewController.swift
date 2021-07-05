//
//  ViewController.swift
//  CleanMVVMRxAppStore
//
//  Created by  60117280 on 2021/06/24.
//

import UIKit
import RxSwift

class SearchViewController: UIViewController {
    
    let disposeBag = DisposeBag()
    var viewModel = SearchViewModel()
    
    var searchBar: UISearchBar!
    @IBOutlet var searchResultTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUI()
        configureKeypad()
        bindViewModel()
        
    }
    
    private func configureUI() {
        
        // search bar 만들기
        searchBar = UISearchBar()
        searchBar?.placeholder = "Search App"
        searchBar?.setImage(UIImage(named: ""), for: .search, state: .normal)
        searchBar?.setImage(UIImage(named: ""), for: .clear, state: .normal)
        
        self.navigationController?.navigationBar.topItem?.titleView = searchBar
        
        
        // register cell
        self.searchResultTableView.register(UINib(nibName: "SearchResultCell", bundle: nil), forCellReuseIdentifier: SearchResultCell.ID)
        
    }
    
    private func bindViewModel() {
        
        let output = viewModel.transform(
            input: SearchViewModel.Input(
                searchButtonClicked: searchBar.rx.searchButtonClicked.asObservable(),
                searchInputText: searchBar.rx.text.asObservable()
            )
        )
        output.searchResults
            .drive(searchResultTableView.rx.items(cellIdentifier: SearchResultCell.ID, cellType: SearchResultCell.self)) { index, element, cell in
                cell.bind(appInfo: element)
            }
            .disposed(by: disposeBag)
    }
    
    private func configureKeypad() {
        searchBar.rx.searchButtonClicked
            .subscribe({ _ in
                self.searchBar.endEditing(true)
            })
            .disposed(by: disposeBag)
    }
}

