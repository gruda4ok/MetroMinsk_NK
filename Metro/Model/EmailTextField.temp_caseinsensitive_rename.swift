//
//  textShakeError.swift
//  Metro
//
//  Created by air on 14.11.2017.
//  Copyright © 2017 Nikita Kuratnik. All rights reserved.
//

import UIKit

class emailTextField: UITextField {

    func shake(){
        let animation = CABasicAnimation(keyPath: "position")
        animation.duration = 0.05
        animation.repeatCount = 2
        animation.autoreverses = true
        animation.fromValue = NSValue(cgPoint: CGPoint(x: self.center.x - 5, y: self.center.y))
        animation.toValue = NSValue(cgPoint: CGPoint(x: self.center.x + 5, y: self.center.y))
        
        self.layer.add(animation, forKey: "position")
        
    }
    
    
}
