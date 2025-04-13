//
//  UITextField+.swift
//  CarrotMarket
//
//  Created by 김승원 on 4/8/25.
//

import UIKit

extension UITextField {
    func configureDefaultTextField() {
        self.autocorrectionType = .no
        self.spellCheckingType = .no
        self.autocapitalizationType = .none
        self.clearButtonMode = .always
        self.clearsOnBeginEditing = false
    }
    
    func addLeftView(_ padding: CGFloat = 16) {
        let leftView = UIView(frame: CGRect(x: 0, y: 0, width: padding, height: padding))
        self.leftView = leftView
        self.leftViewMode = .always
    }
}

