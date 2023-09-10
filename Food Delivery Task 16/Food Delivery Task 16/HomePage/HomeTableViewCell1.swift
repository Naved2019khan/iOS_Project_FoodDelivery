//
//  HomeTableViewCell1.swift
//  Food Delivery Task 16
//
//  Created by Naved Khan on 13/04/23.
//

import UIKit

class HomeTableViewCell1: UITableViewCell, UICollectionViewDelegate, UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    @IBOutlet weak var HomeCollectionviewTop: UICollectionView!
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = HomeCollectionviewTop.dequeueReusableCell(withReuseIdentifier: "homeTop1", for: indexPath)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let w = collectionView.frame.size.width
        return CGSize(width: w, height: collectionView.frame.size.height)
    }
    

    
    override func awakeFromNib() {
        super.awakeFromNib()
        HomeCollectionviewTop.delegate = self
        HomeCollectionviewTop.dataSource = self
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
