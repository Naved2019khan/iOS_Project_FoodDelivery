//
//  DeliveryTableViewCell4.swift
//  Food Delivery Task 16
//
//  Created by Naved Khan on 13/04/23.
//

import UIKit

class DeliveryTableViewCell4: UITableViewCell {

    @IBOutlet weak var myView: UIView!
    @IBOutlet weak var myBtn: UIButton!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        myView.layer.shadowColor = UIColor.black.cgColor
        myView.layer.shadowOpacity = 0.3
        myView.layer.shadowOffset = CGSize(width: 2, height: 2)
        myView.layer.shadowRadius = 5.0
        myView.layer.cornerRadius = 30
        myView.layer.maskedCorners = [.layerMinXMinYCorner,.layerMaxXMinYCorner]
        
        myBtn.layer.cornerRadius = 10
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
