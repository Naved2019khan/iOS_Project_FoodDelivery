//
//  HomeTableViewCell2.swift
//  Food Delivery Task 16
//
//  Created by Naved Khan on 14/04/23.
//

import UIKit

class HomeTableViewCell2: UITableViewCell , UICollectionViewDelegate, UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    @IBOutlet weak var HomeCollectionviewTop2: UICollectionView!
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 6
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = HomeCollectionviewTop2.dequeueReusableCell(withReuseIdentifier: "homeTop2", for: indexPath)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let w = collectionView.frame.size.width/3
        return CGSize(width: w, height: collectionView.frame.size.height/2)
    }
    

    
    override func awakeFromNib() {
        super.awakeFromNib()
        HomeCollectionviewTop2.delegate = self
        HomeCollectionviewTop2.dataSource = self
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
