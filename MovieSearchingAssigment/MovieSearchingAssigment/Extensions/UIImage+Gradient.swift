//
//  UIImage+Gradient.swift
//  MovieSearchingAssigment
//
//  Created by Duc Nguyen on 3/18/20.
//  Copyright © 2020 HMLet. All rights reserved.
//

import Foundation
import UIKit

/// Generate a nimage from a UIView
public extension CALayer {
    func snapshotImage() -> UIImage? {
        return UIGraphicsImageRenderer(bounds: frame).image { (imageContext) in
            render(in: imageContext.cgContext)
        }
    }
}
