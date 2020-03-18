//
//  UIImage+Caching.swift
//  MovieSearchingAssigment
//
//  Created by Duc Nguyen on 3/18/20.
//  Copyright © 2020 HMLet. All rights reserved.
//

import Foundation
import UIKit

var imageCache = NSCache<AnyObject, AnyObject>()

extension UIImageView {
    
    func loadImage(urlString: String) {
        if let cacheImage = imageCache.object(forKey: urlString as AnyObject) as? UIImage {
            self.image = cacheImage
            return
        }
        guard let url = URL(string: urlString) else { return }
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let error = error {
                print("Couldn't download image: ", error)
                return
            }
            
            guard let data = data else { return }
            if let imageGenerated = UIImage(data: data) {
                imageCache.setObject(imageGenerated, forKey: urlString as AnyObject)
                
                DispatchQueue.main.async {
                    self.image = imageGenerated
                }
            }
        }.resume()
    }
}
