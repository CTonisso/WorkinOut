//
//  WOTextField.swift
//  WorkinOut
//
//  Created by Carlos Marcelo Tonisso Junior on 15/05/23.
//

import Foundation
import UIKit

class WOTextField: UITextField {
    
    var leftPadding: CGFloat = 0
    
    override open func textRect(forBounds bounds: CGRect) -> CGRect {
        
        let padding = UIEdgeInsets(top: 0, left: leftPadding, bottom: 0, right: 0)
        return bounds.inset(by: padding)
    }
    
    override open func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        
        let padding = UIEdgeInsets(top: 0, left: leftPadding, bottom: 0, right: 0)
        return bounds.inset(by: padding)
    }
    
    override open func editingRect(forBounds bounds: CGRect) -> CGRect {
        
        let padding = UIEdgeInsets(top: 0, left: leftPadding, bottom: 0, right: 0)
        return bounds.inset(by: padding)
    }
}
