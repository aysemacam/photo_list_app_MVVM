//
//  HomeViewModel.swift
//  amani_task
//
//  Created by Aysema Çam on 5.03.2024.
//

import Foundation

protocol HomeViewDataSource {
    var product: Product? {get set}
}

protocol HomeViewEventSource {}

protocol HomeViewProtocol: HomeViewDataSource, HomeViewEventSource {}

final class HomeViewModel: BaseViewModel, HomeViewProtocol {
    var product: Product?
    
    init(product: Product? = nil) {
        self.product = product
    }
}
