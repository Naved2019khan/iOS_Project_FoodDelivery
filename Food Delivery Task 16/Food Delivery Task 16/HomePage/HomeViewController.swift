//
//  HomeViewController.swift
//  Food Delivery Task 16
//
//  Created by Naved Khan on 13/04/23.
//

import UIKit

class HomeViewController: UIViewController {
    @IBOutlet weak var HomeTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()

    }
}

extension HomeViewController : UITableViewDelegate,UITableViewDataSource{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0
        {
            let cell = HomeTableView.dequeueReusableCell(withIdentifier: "homeCell1", for: indexPath) as! HomeTableViewCell1
            return cell
        }
        
        let cell = HomeTableView.dequeueReusableCell(withIdentifier: "homeCell2", for: indexPath) as! HomeTableViewCell2
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0
        {
            return 300
        }
        return 380
    }
}
