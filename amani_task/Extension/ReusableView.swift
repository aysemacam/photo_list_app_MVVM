//
//  ReusableView.swift
//  amani_task
//
//  Created by Aysema Çam on 5.03.2024.
//

import UIKit

public protocol ReusableView: AnyObject {
    static var reuseIdentifier: String { get }
}

public extension ReusableView where Self: UIView {
    static var reuseIdentifier: String {
        return String(describing: self)
    }
}
