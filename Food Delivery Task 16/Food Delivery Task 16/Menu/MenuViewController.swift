//
//  MenuViewController.swift
//  Food Delivery Task 16
//
//  Created by Naved Khan on 10/04/23.
//

import UIKit

class MenuViewController: UIViewController{
    @IBOutlet weak var menuTableView: UITableView!
    var selectedMenu = [Int]()
    var menuData = [
        ["cuisine": "chinese", "subText" : "Noodles,Spring Rolls,Soup", "background" : UIColor(red: 240/255, green: 159/255, blue: 92/255, alpha: 1), "rowData" : ["Noodles", "Spring Rolls","Soups","Rice","Snacks"],"imgPlate" : "1"    ],
         
         ["cuisine": "sea food", "subText" : "Prawns,Crabs,Fishes,Lobsters,...", "background" : UIColor(red: 255/255, green: 195/255, blue: 178/255, alpha: 1), "rowData" : ["Prawns", "Crabs","Fishes","Lobsters"],"imgPlate" : "2"  ],
        ["cuisine": "Italian", "subText" : "Pizza, Pasta, Breads.." , "background" : UIColor(red: 184/255, green: 231/255, blue: 223/255, alpha: 1), "rowData" : ["Pizza", "Pasta","Breads"],"imgPlate" : "3"  ]
        ]
    override func viewDidLoad() {
        super.viewDidLoad()
        selectedMenu = Array(repeating: 1, count: 4) // size of section - 1
        // Do any additional setup after loading the view.
    }
}

extension MenuViewController : UITableViewDelegate,UITableViewDataSource{
//    Main Page Menu
    func numberOfSections(in tableView: UITableView) -> Int {
//        section - 1 menu
        return 4
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section != 0
        {
            return selectedMenu[section]
        }
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0
        {
            let cell =  menuTableView.dequeueReusableCell(withIdentifier: "menuCell1", for: indexPath) as!
            MenuTableViewCell1
            return cell
        }
        if indexPath.row ==  0
        {
            let cell =  menuTableView.dequeueReusableCell(withIdentifier: "menuCell2", for: indexPath) as!
            MenuTableViewCell2
            
            cell.menuText.text = (menuData[indexPath.section - 1]["cuisine"]! as? String)?.uppercased()
            cell.subText.text = menuData[indexPath.section - 1]["subText"]! as? String
            cell.imgPlate.image = UIImage(named:  menuData[indexPath.section - 1]["imgPlate"]! as? String ?? "")
            cell.imgBg.backgroundColor =  menuData[indexPath.section - 1]["background"] as? UIColor
            cell.arrowImg.isHidden = selectedMenu[indexPath.section] != 1 ? false : true

            return cell
        }
        
        let cell =  menuTableView.dequeueReusableCell(withIdentifier: "menuCell3", for: indexPath) as!
        MenuTableViewCell3
        if let rwData = menuData[indexPath.section - 1]["rowData"] as? [String]
        {
            cell.insideText.text = rwData[indexPath.row - 1]
        }
            return cell
            
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
       
        if indexPath.section == 0
        {
                return 80
        }
        
        if indexPath.row == 0
        {
            return 130
        }
        if let rwData = menuData[indexPath.section - 1]["rowData"] as? [String]
        {
            if indexPath.row == rwData.count
                {
                    return 60
                }
        }
        return 51
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        For menu Card
        if indexPath.row == 0 && indexPath.section > 0
        {
            if selectedMenu[indexPath.section] == 1
            {
                if let size = menuData[indexPath.section - 1]["rowData"]! as? [String]
                {
                    selectedMenu[indexPath.section] = size.count + 1 // including 1st there is 6 row ,5 sub , 1 main
                }
            }
            else{
                selectedMenu[indexPath.section] = 1
            }
            menuTableView.reloadData()
        }
        
        
//        navigation code here
        
        if indexPath == [1,1]
        {
//            let vc = self.storyboard?.instantiateViewController(withIdentifier: "") 
        }
        
        
        
        
     
        
    }
    

    
    
    
}

