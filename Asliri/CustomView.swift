//
//  CustomView.swift
//  ceria
//
//  Created by PROSIA on 06/03/20.
//  Copyright © 2020 PROSIA. All rights reserved.
//

import Foundation
import UIKit

extension UIView {
    @IBInspectable var cornerRadius: CGFloat {
        get {
            return layer.cornerRadius
        }
        set {
            layer.cornerRadius = newValue
            layer.masksToBounds = newValue > 0
        }
    }
}


