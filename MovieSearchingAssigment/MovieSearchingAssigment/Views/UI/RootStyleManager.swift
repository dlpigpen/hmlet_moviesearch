//
//  RootStyleManager.swift
//  MovieSearchingAssigment
//
//  Created by Duc Nguyen on 3/18/20.
//  Copyright © 2020 HMLet. All rights reserved.
//

import Foundation
import UIKit

class RootStyleManager {
    static let shared = RootStyleManager()
    
    func setupThem() {
        self.setupNavigationBar()
        self.setSearchBarStyle()
    }
    
    
    private func setupNavigationBar() {
        
        if #available(iOS 13.0, *) {
            let appearance = UINavigationBarAppearance()
            appearance.titleTextAttributes = [.foregroundColor: UIColor.white]
            appearance.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
            
            self.setNavigationGradient(bar: appearance)
            
            UINavigationBar.appearance().tintColor = .white
            UINavigationBar.appearance().standardAppearance = appearance
            UINavigationBar.appearance().compactAppearance = appearance
            UINavigationBar.appearance().scrollEdgeAppearance = appearance
        } else {
            UINavigationBar.appearance().isTranslucent = false
            
            UINavigationBar.appearance().titleTextAttributes = [
                NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 17.0),
                NSAttributedString.Key.foregroundColor: UIColor.white
            ]
            
            self.setNavigationGradient()
        }
        
        // assign white color for title
        UINavigationBar.appearance().titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
    }
    
    private func setSearchBarStyle() {
        UITextField.appearance(whenContainedInInstancesOf: [UISearchBar.self]).backgroundColor = .white
        UITextField.appearance(whenContainedInInstancesOf: [UISearchBar.self]).defaultTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.black]
    }
        
    private func setNavigationGradient(bar: UINavigationBarAppearance? = nil){
        // Set gradient for bg view
        let gradientColors = [UIColor(red: 161/255, green: 0, blue: 79/255, alpha: 1.0), UIColor(red: 209/255, green: 0, blue: 60/255, alpha: 1.0)]
        let gradient = CAGradientLayer()
        let defaultNavigationBarFrame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: 64)
        
        gradient.frame = defaultNavigationBarFrame
        gradient.startPoint = CGPoint(x: 0.0, y: 0.0)
        gradient.endPoint = CGPoint(x: 1.0,y: 0.0)
        gradient.colors = gradientColors.map({ $0.cgColor })
        
        if let gradientImage = gradient.snapshotImage() {
            let image =  gradientImage.resizableImage(withCapInsets: UIEdgeInsets(top: 1, left: 1, bottom: 1, right: 1), resizingMode: UIImage.ResizingMode.stretch)
            if bar == nil {
                UINavigationBar.appearance().setBackgroundImage(image, for: .default)
            } else {
                bar!.backgroundImage = image
            }
        }
        
    }
}
