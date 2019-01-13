//
//  CacheImage.swift
//  SplitView
//
//  Created by daicudu on 1/13/19.
//  Copyright © 2019 daicudu. All rights reserved.
//

import UIKit
class CacheImage {
    static var shared = CacheImage()
    let cache = NSCache<NSString, UIImage>()
    
    func downLoadImage(withURL url: URL, Completion: @escaping (UIImage?) -> () ) {
        let datatask = URLSession.shared.dataTask(with: url) { (data, response, error) in
            var dowloadImage: UIImage?
            if let data = data {
                dowloadImage = UIImage(data: data)
            }
            if dowloadImage != nil {
                self.cache.setObject(dowloadImage!, forKey: url.absoluteString as NSString)
            }
            DispatchQueue.main.async {
                Completion(dowloadImage)
            }
        }
        datatask.resume()
    }
    
    func getImage(withURl url: URL, completion: @escaping (UIImage?) -> () ) {
        if let image = cache.object(forKey: url.absoluteString as NSString) {
            completion(image)
        } else {
            downLoadImage(withURL: url, Completion: completion)
        }
    }
}
