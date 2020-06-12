//
//  CircularLayoutAttributes.swift
//  VHRotaryDial
//
//  Created by Vinay on 12/06/20.
//  Copyright © 2020 com. All rights reserved.
//

import UIKit

class CircularLayoutAttributes: UICollectionViewLayoutAttributes {
    var anchorPoint = CGPoint(x: 0.5, y: 0.5)
     var angle: CGFloat = 0 {
       // 2
       didSet {
//         zIndex = Int(angle * 1000000)
        transform = CGAffineTransform(rotationAngle: angle)
       }
     }
    
   override func copy(with zone: NSZone? = nil) -> Any {
       let copiedAttr : CircularLayoutAttributes = super.copy(with: zone) as! CircularLayoutAttributes
       
       copiedAttr.anchorPoint = self.anchorPoint
       copiedAttr.angle = self.angle
       return copiedAttr
     }

}
