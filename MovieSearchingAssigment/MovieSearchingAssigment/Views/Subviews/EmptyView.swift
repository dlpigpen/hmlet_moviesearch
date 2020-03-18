//
//  EmptyView.swift
//  MovieSearchingAssigment
//
//  Created by Duc Nguyen on 3/18/20.
//  Copyright © 2020 HMLet. All rights reserved.
//

import Foundation
import UIKit

public class EmptyView: UIView {
    @IBOutlet weak var lbTitle: UILabel!
    @IBOutlet weak var lbDetailTitle: UILabel!
    
    public class func instanceFromNibAuthen() -> EmptyView? {
        let bundle = Bundle(for: self.classForCoder())
        return bundle.loadNibNamed("EmptyView", owner: nil, options: nil)?.first as? EmptyView
    }
    
}
