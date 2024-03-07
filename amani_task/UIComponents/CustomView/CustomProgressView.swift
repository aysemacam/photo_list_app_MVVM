//
//  CustomProgressView.swift
//  amani_task
//
//  Created by Aysema Çam on 6.03.2024.
//

import Foundation
import UIKit

class CustomProgressView: UIView {
    
    private let spinner = UIActivityIndicatorView(style: .large)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupView()
    }
    
    private func setupView() {
        backgroundColor = .listCellBckColor
        
        spinner.translatesAutoresizingMaskIntoConstraints = false
        spinner.color = .orangeColor
        addSubview(spinner)
        
        NSLayoutConstraint.activate([
            spinner.centerXAnchor.constraint(equalTo: centerXAnchor),
            spinner.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
        
        spinner.startAnimating()
    }
    
    override func didMoveToSuperview() {
        super.didMoveToSuperview()
        if superview != nil {
            spinner.startAnimating()
        } else {
            spinner.stopAnimating()
        }
    }
}
