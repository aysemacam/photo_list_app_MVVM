//
//  ImageProvider.swift
//  amani_task
//
//  Created by Aysema Çam on 5.03.2024.
//

import UIKit

final class ImageProvider {
    
    static let shared = ImageProvider()
    
    private let cache = NSCache<NSString, UIImage>()
    
    private init() {}
    
    public func fetchImage(imgeURL: String, completion: @escaping (UIImage?) -> Void) {
        if let image = cache.object(forKey: imgeURL as NSString) {
            print("Using cache")
            completion(image)
            return
        }
        guard let url = URL(string: imgeURL) else {
            completion(nil)
            return
        }
        print("fetching image")
        let task = URLSession.shared.dataTask(with: url) { [weak self] data, _, error in
            guard let data = data, error == nil else {
                completion(nil)
                return
            }
            
            DispatchQueue.main.async {
                guard let image = UIImage(data: data) else {
                    completion(nil)
                    return
                }
                self?.cache.setObject(image, forKey: imgeURL as NSString)
                completion(image)
            }
        }
        task.resume()
    }
}
