//
//  MenuTableViewCell2.swift
//  Food Delivery Task 16
//
//  Created by Naved Khan on 10/04/23.
//

import UIKit

class MenuTableViewCell2: UITableViewCell {

    @IBOutlet weak var menuText: UILabel!
    
    @IBOutlet weak var subText: UILabel!
    
    @IBOutlet weak var imgPlate: UIImageView!
    
    @IBOutlet weak var imgBg: UIImageView!
    @IBOutlet weak var arrowImg: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
 
    @IBOutlet weak var btnExpandSubMenu: UIButton!
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
