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
<<<<<<< HEAD
    
    var searchBar: UISearchBar!
    @IBOutlet var searchResultCollectionView: UICollectionView!
=======
    var viewModel = SearchViewModel()
>>>>>>> 79a382b113736718896704e93404b72138cd0654
    
    var searchBar: UISearchBar!
    @IBOutlet var searchResultTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
<<<<<<< HEAD
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
=======
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
//        output.searchResults
//            .drive(searchResultTableView.rx.items(cellIdentifier: SearchResultCell.ID, cellType: SearchResultCell.self)) { index, element, cell in
//                cell.bind(appInfo: element)
//            }
//            .disposed(by: disposeBag)
        
    }
    
    private func configureKeypad() {
        searchBar.rx.searchButtonClicked
            .subscribe({ _ in
                self.searchBar.endEditing(true)
            })
            .disposed(by: disposeBag)
>>>>>>> 79a382b113736718896704e93404b72138cd0654
    }
}
