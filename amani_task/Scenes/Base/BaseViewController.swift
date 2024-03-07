//
//  BaseViewController.swift
//  amani_task
//
//  Created by Aysema Çam on 5.03.2024.
//

import UIKit

class BaseViewController<V: BaseViewModelProtocol>: UIViewController {
    
    var viewModel: V
    
    init(viewModel: V) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    // swiftlint:disable fatal_error unavailable_function
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    #if DEBUG
    deinit {
        NotificationCenter.default.removeObserver(self)
        print("removed notification center")
        debugPrint("deinit \(self)")
    }
    #endif
    
}
