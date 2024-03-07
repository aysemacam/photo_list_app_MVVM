//
//  UIImageView-Extensions.swift
//  amani_task
//
//  Created by Aysema Çam on 5.03.2024.
//

import UIKit

public extension UIImageView {
    
    func setImage(_ string: String?, placeholder: UIImage? = nil) {
        guard let string = string else {
            return
        }
        
        ImageProvider.shared.fetchImage(imgeURL: string) { image in
            guard image != nil else {
                DispatchQueue.main.async {
                    self.image = placeholder
                }
                return
            }
            DispatchQueue.main.async {
                self.image = image
            }
        }
    }
}


