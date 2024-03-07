//
//  ListCellModel.swift
//  amani_task
//
//  Created by Aysema Çam on 4.03.2024.
//

import Foundation

public protocol ListTableViewCellDataSource: AnyObject {
    var product: Product {get}
}

public protocol ListTableViewCellEventSource: AnyObject {}

public protocol ListTableViewCellProtocol: ListTableViewCellDataSource, ListTableViewCellEventSource {}

public final class ListTableViewCellModel: ListTableViewCellProtocol {
    public var product: Product
    
    public init(product: Product) {
        self.product = product
    }
}


