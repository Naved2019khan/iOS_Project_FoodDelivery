//
//  DeliveryTableViewCell2.swift
//  Food Delivery Task 16
//
//  Created by Naved Khan on 13/04/23.
//

import UIKit

class DeliveryTableViewCell2: UITableViewCell {

    @IBOutlet weak var imgFood: UIImageView!
    @IBOutlet weak var nameFood: UILabel!
    @IBOutlet weak var priceText: UILabel!
    
    @IBOutlet weak var viewBtn: UIView!
    
    @IBOutlet weak var numOfItem: UILabel!
    @IBOutlet weak var btnMinus: UIButton!
    @IBOutlet weak var btnPlus: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        imgFood.layer.cornerRadius = 10
        viewBtn.layer.cornerRadius = 15
        viewBtn.layer.borderWidth = 2
        viewBtn.layer.borderColor = UIColor(red: 239/255, green: 109/255, blue: 52/255, alpha: 1).cgColor
//        btnMinus.backgroundColor = .red
//        btnPlus.backgroundColor = .red
        cornerButton()
        // Initialization code
    }
    
    func cornerButton(){
        if #available(iOS 11.0, *) {
            btnMinus.layer.cornerRadius = 15
            btnMinus.layer.maskedCorners = [.layerMinXMinYCorner, .layerMinXMaxYCorner]
            btnPlus.layer.cornerRadius = 15
            btnPlus.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMaxXMaxYCorner]
            } else {
               
        btnMinus.roundCorners(corners: [.bottomLeft,.topLeft], radius: 15)
                btnPlus.roundCorners(corners: [.bottomRight,.topRight], radius: 15)
            }
    }
    
 

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
extension UIView{
    func roundCorners(corners:UIRectCorner, radius: CGFloat) {
        let path = UIBezierPath(roundedRect: self.bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        let mask = CAShapeLayer()
        mask.path = path.cgPath
        self.layer.mask = mask
    }
}
