//
//  NumbersViewCell.swift
//  VHRotaryDial
//
//  Created by Vinay on 12/06/20.
//  Copyright © 2020 com. All rights reserved.
//

import UIKit

class NumbersViewCell: UICollectionViewCell {

    @IBOutlet weak var numberText: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        contentView.layer.cornerRadius = self.frame.size.width/2
        contentView.layer.borderColor = UIColor.black.cgColor
        contentView.layer.borderWidth = 1
//        contentView.clipsToBounds = true
    }

}
