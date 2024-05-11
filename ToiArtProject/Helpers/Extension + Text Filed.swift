//
//  Extension + Text Filed.swift
//  ToiArtProject
//
//  Created by Nurtilek on 5/9/24.
//

import UIKit

class PaddedTextField: UITextField {
    
    
    var textInsets = UIEdgeInsets(top: 0, left: 30, bottom: 0, right: 30)

    override func textRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: textInsets)
    }

    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        return textRect(forBounds: bounds)
    }

    override func rightViewRect(forBounds bounds: CGRect) -> CGRect {
        var rect = super.rightViewRect(forBounds: bounds)
        rect.origin.x -= 10
        return rect
    }
    
    override func layoutSubviews() {
           super.layoutSubviews()
           layer.cornerRadius = 16
           layer.masksToBounds = true
       }
}
