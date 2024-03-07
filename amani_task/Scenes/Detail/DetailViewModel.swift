//
//  DetailViewModel.swift
//  amani_task
//
//  Created by Aysema Çam on 5.03.2024.
//

import Foundation

protocol DetailViewDataSource {
    var product: Product? {get set}

}

protocol DetailViewEventSource {}

protocol DetailViewProtocol: DetailViewDataSource, DetailViewEventSource {}

final class DetailViewModel: BaseViewModel, DetailViewProtocol {
    
    var product: Product?
    init(product: Product? = nil) {
        self.product = product
    }
}
