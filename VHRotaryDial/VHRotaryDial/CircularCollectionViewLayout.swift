//
//  CircularCollectionViewLayout.swift
//  VHRotaryDial
//
//  Created by Vinay on 12/06/20.
//  Copyright © 2020 com. All rights reserved.
//

import UIKit

class CircularCollectionViewLayout: UICollectionViewLayout {
    let itemSize = CGSize(width: 50, height: 50)
    var attributesList = [CircularLayoutAttributes]()
    
    var anglePerItem: CGFloat {
      return atan(itemSize.height / radius)
    }
    
    var angleAtExtreme: CGFloat {
      return collectionView!.numberOfItems(inSection: 0) > 0 ?
        CGFloat(collectionView!.numberOfItems(inSection: 0) - 1) * anglePerItem : 0
    }
    
    var angle: CGFloat {
//        print(angleAtExtreme)
//        print(collectionView!.contentOffset.y)
//        print(collectionViewContentSize.height)
       return angleAtExtreme * collectionView!.contentOffset.y / (collectionViewContentSize.height)
     }
    
    var radius: CGFloat = 90{
      didSet{
        invalidateLayout()
      }
    }
    
    override func prepare() {
        super.prepare()

        let centerY = collectionView!.contentOffset.y + collectionView!.bounds.height/2.0
        let centerX = collectionView!.contentOffset.x + collectionView!.bounds.width/2.0
        let anchorPointY = ((itemSize.height / 2.0) + radius) / itemSize.height
        
        attributesList = (0..<collectionView!.numberOfItems(inSection: 0)).map{(i)->CircularLayoutAttributes in
          let attr = CircularLayoutAttributes(forCellWith:NSIndexPath(item:i,section:0) as IndexPath)
          attr.size = self.itemSize
          attr.center = CGPoint(x:centerX,y:centerY)
//            print(attr.center)
//            attr.angle = self.anglePerItem*CGFloat(i)
          attr.angle = self.angle - (self.anglePerItem * CGFloat(i))
//            attr.angle =
//            print(attr.angle)
          attr.anchorPoint = CGPoint(x: anchorPointY, y: anchorPointY)
//          print(attr)
          return attr
        }
    }
    
    override var collectionViewContentSize: CGSize{
        return CGSize(width: (collectionView?.bounds.size.width)!, height: (collectionView?.bounds.size.height)!+500)
    }
    
    override class var layoutAttributesClass: AnyClass{
        return CircularLayoutAttributes.self
    }
    
    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        return attributesList
    }
    
    override func layoutAttributesForItem(at indexPath: IndexPath) -> UICollectionViewLayoutAttributes? {
        return attributesList[indexPath.row]
    }
    
    override func shouldInvalidateLayout(forBoundsChange newBounds: CGRect) -> Bool {
      return true
    }
}
