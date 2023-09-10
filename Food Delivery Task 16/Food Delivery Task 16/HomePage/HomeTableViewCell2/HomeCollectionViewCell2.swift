//
//  HomeCollectionViewCell2.swift
//  Food Delivery Task 16
//
//  Created by Naved Khan on 14/04/23.
//

import UIKit

class HomeCollectionViewCell2: UICollectionViewCell {
    
    @IBOutlet weak var imgFood: UIImageView!
    
    @IBOutlet weak var backView: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
        imgFood.layer.cornerRadius = imgFood.frame.width/2
        backView.layer.cornerRadius =
            backView.frame.width/2
        
        
        // Initialization code
    }
}
