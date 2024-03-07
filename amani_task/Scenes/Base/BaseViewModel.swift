//
//  BaseViewModel.swift
//  amani_task
//
//  Created by Aysema Çam on 5.03.2024.
//

import Foundation

protocol BaseViewModelDataSource: AnyObject {}

protocol BaseViewModelEventSource: AnyObject {}

protocol BaseViewModelProtocol: BaseViewModelDataSource, BaseViewModelEventSource {}

class BaseViewModel: BaseViewModelProtocol {
    
    #if DEBUG
    deinit {
        debugPrint("deinit \(self)")
    }
    #endif
}
