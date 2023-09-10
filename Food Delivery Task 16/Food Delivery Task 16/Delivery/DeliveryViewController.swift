//
//  DeliveryViewController.swift
//  Food Delivery Task 16
//
//  Created by Naved Khan on 12/04/23.
//

import UIKit

class DeliveryViewController: UIViewController {
    @IBOutlet weak var deliveryTableView: UITableView!
    
    var delData1 = [
    ["icon" : "c","text1": "Delivery - " ,  "text2" : "2nd May'2021',7:36 pm","img":"i1", "textfood" : "Hotdogs","price": "7.99"],
    ["icon" : "b","text1": "Menu Details - " ,  "text2" : "item"  , "img":"i2", "textfood" : "burger","price":  "6.55" ],
    ["icon" : "a","text1": "Billing Details" ,  "text2" : "" ,"img":"i3", "textfood" : "pizza","price":   "12" ],
        
//    ["icon" : "c","text1": "Delivery - " ,  "text2" : "2nd May'2021',7:36 pm","img":"i1", "textfood" : "Hotdogs","price": "7.99"],
//    ["icon" : "b","text1": "Menu Details - " ,  "text2" : "item"  , "img":"i2", "textfood" : "burger","price":  "6.55" ],
//    ["icon" : "a","text1": "Billing Details" ,  "text2" : "" ,"img":"i3", "textfood" : "pizza","price":   "12" ]
//
    ]
    
    var billingData = ["Items Total", "Taxes and Charges","Delivery Charges", "Coupon Discount"]
    
    var totalItem = Int()
    var totalSum = Float()
    var totalStringResult = String()
    var tapTimes = [Int]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tapTimes = Array(repeating: 0, count: delData1.count)
        totalItem = delData1.count
        
        
       
//        display number of items
        delData1[1]["text2"] = "\(totalItem) " + "item"
    }

    func formatRes(_ v : Float) -> String {
        if v.truncatingRemainder(dividingBy: 1) == 0{
            return String(format: "%.0f", v)
        }
        else{
            return String(format: "%.02f", v)
        }
    }
    func  calculateResult()  {
    
        var ind = 0
        var sum = Float()
        for i in delData1
        {
            sum  += Float(i["price"]!)! * Float(tapTimes[ind])
            ind += 1
        }
        totalSum = sum
        
    }
    
}

//      MARK : structure
//        0 order || delCell0
//        1 delivery  || DeliveryTableViewCell1
//        2 Lazy flamingo || DeliveryTableViewCell6
//        3 Menu detail  || DeliveryTableViewCell1
//        4 food img with count row || DeliveryTableViewCell2
//        5 billing  || DeliveryTableViewCell1
//        6 Extra with row || "delcellnew" || DeliveryTableViewCellNew
//        7 total with row DeliveryTableViewCell3
//        8 repeat  ||  DeliveryTableViewCell4




extension DeliveryViewController : UITableViewDelegate,UITableViewDataSource
{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 9
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 4
        {
            return delData1.count
        }
        if section  == 6
        {
            return billingData.count
        }
       
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 1 || indexPath.section == 3 || indexPath.section == 5
        {
            let cell = deliveryTableView.dequeueReusableCell(withIdentifier: "delcell1", for: indexPath) as! DeliveryTableViewCell1
            cell.smallImg.setImage( UIImage(named: delData1[indexPath.section/2]["icon"]!), for: .normal)
            cell.text1st.text = delData1[indexPath.section/2]["text1"]!
            cell.text2nd.text = delData1[indexPath.section/2]["text2"]!
            return cell
        }
        
        
        if indexPath.section == 4{
            let cell = deliveryTableView.dequeueReusableCell(withIdentifier: "delcell2", for: indexPath) as! DeliveryTableViewCell2
            cell.imgFood.image = UIImage(named: delData1[indexPath.row]["img"]! )
            cell.priceText.text = "$ \(delData1[indexPath.row]["price"]!)"
            cell.nameFood.text = delData1[indexPath.row]["textfood"]!
            cell.numOfItem.text = "\(tapTimes[indexPath.row])"
            
            
            cell.btnMinus.tag =  indexPath.row
            cell.btnPlus.tag = indexPath.row
            cell.btnPlus.addTarget(self, action: #selector(increaseItem(sender:)), for: .touchUpInside)
            cell.btnMinus.addTarget(self, action: #selector(decreaseItem(sender:)), for: .touchUpInside)
            return cell
        }
        
        
        if indexPath.section == 7
        {
            let cell = deliveryTableView.dequeueReusableCell(withIdentifier: "delcell3", for: indexPath) as! DeliveryTableViewCell3
          
                cell.tagTotal.text = "$ " + formatRes(totalSum)
            
            return cell
        }
        if indexPath.section == 0
        {
        let cell = deliveryTableView.dequeueReusableCell(withIdentifier: "delcell0", for: indexPath)
        return cell
        }
        
            
        if indexPath.section == 8
        {
            let cell = deliveryTableView.dequeueReusableCell(withIdentifier: "delcell6", for: indexPath) as! DeliveryTableViewCell4
             return cell
        }
        if indexPath.section == 6
        {
            let cell = deliveryTableView.dequeueReusableCell(withIdentifier: "delcellnew", for: indexPath) as! DeliveryTableViewCellNew
            cell.textCharges.text = billingData[indexPath.row]
            if indexPath.row == 0
            {
                cell.textChangeOutput.text = "$ " + formatRes(totalSum)
            }
           
             return cell
        }
//        Lazy Flamingo
        let cell = deliveryTableView.dequeueReusableCell(withIdentifier: "delcell5", for: indexPath) as! DeliveryTableViewCell5
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        1 3 5 0
        if indexPath.section == 2
        {
            return 150
        }
        if indexPath.section == 4
        {
            return 120
        }
        if indexPath.section == 6
        {
            return 45
        }
        if indexPath.section == 7
        {
            return 100
        }
        if indexPath.section == 8
        {
            return 80
        }
        return 50
    }
    
    
//    MARK : AddTargets
    
    @objc func increaseItem(sender : UIButton)
    {
        tapTimes[sender.tag] += 1
        calculateResult()
        deliveryTableView.reloadData()
//        deliveryTableView.reloadRows(at: [[4,sender.tag],[7,0]], with: UITableView.RowAnimation.none)
    }
    @objc func decreaseItem(sender : UIButton)
    {
        if tapTimes[sender.tag] != 0
        {
            tapTimes[sender.tag] -= 1
        }
        deliveryTableView.reloadData()
        calculateResult()
//        deliveryTableView.reloadRows(at: [[4,sender.tag],[7,0]], with: UITableView.RowAnimation.none)
    }
    
}
