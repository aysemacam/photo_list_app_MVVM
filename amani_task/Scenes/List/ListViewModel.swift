//
//  ListViewModel.swift
//  amani_task
//
//  Created by Aysema Çam on 5.03.2024.
//

import Foundation


protocol ListViewDataSource {
    func numberOfItemsAtTableView(section: Int) -> Int
    func cellItemAtTableView(indexPath: IndexPath) -> ListTableViewCellProtocol
    var products: [ListTableViewCellModel] { get }
}

protocol ListViewEventSource {
    var reloadTableViewClosure: ReloadDataClosure? { get }
    var showError: ErrorHandlerClosure? { get }
}

protocol ListViewProtocol: ListViewDataSource, ListViewEventSource {}

final class ListViewModel:BaseViewModel, ListViewProtocol {
    
    var reloadTableViewClosure: ReloadDataClosure?
    var showError: ErrorHandlerClosure?
    var products: [ListTableViewCellModel] = []
    
    func fetchProducts() {
        let urlString = Constants.apiUrl
        ServiceManager.shared.fetchProducts(from: urlString) { [weak self] result in
            DispatchQueue.main.async {
                switch result {
                case .success(let products):
                    self?.products = products.map { ListTableViewCellModel(product: $0) }
                    self?.reloadTableViewClosure?()
                case .failure(let error):
                    print(error)
                    self?.showError!(error)
                }
            }
        }
    }
}

// MARK: - TableView
extension ListViewModel {
    func numberOfItemsAtTableView(section: Int) -> Int {
        return products.count
    }
    
    func cellItemAtTableView(indexPath: IndexPath) -> ListTableViewCellProtocol {
        return products[indexPath.row]
    }
}

