//
//  UITableview+Empty.swift
//  MovieSearchingAssigment
//
//  Created by Duc Nguyen on 3/18/20.
//  Copyright © 2020 HMLet. All rights reserved.
//

import Foundation
import UIKit

public extension UITableView {
    /// Set bg tableview when there is no data
    func setBackgroundEmpty(title: String? = nil, subTitle: String? = nil) {
        if title == nil && subTitle == nil{
            self.backgroundView = nil
            return
        }
        guard let emptyView = EmptyView.instanceFromNibAuthen() else { return }
        emptyView.lbTitle.text = title
        if subTitle != nil {
            emptyView.lbDetailTitle.text = subTitle!
        }
        self.backgroundView = emptyView
    }
}
