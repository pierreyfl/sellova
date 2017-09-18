//
//  PhoneCollectionView.swift
//  Sellova
//
//  Created by Pierre Yam on 12/09/2017.
//  Copyright © 2017 PierreYam. All rights reserved.
//

import UIKit



class PhoneCollectionView: UICollectionView {

    
    
    struct Storyboard {
        static let categoryCell = "CategoryCell"
        
    }
    
    
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell
    {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Storyboard.categoryCell, for: indexPath) as! CategoryCollectionViewCell
        // TODO: - get your data model...
        let images = FeatureImage.fetchImages()
        
        cell.image2 = images.first?.images?.first
        
        cell.backgroundColor = UIColor.black
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize
    {
        let layout = collectionViewLayout as! UICollectionViewFlowLayout
        layout.minimumLineSpacing = 0.5
        layout.minimumInteritemSpacing = 0.5
        
        let numberOfItemsPerRow: CGFloat = 2.0
        let itemWidth = (collectionView.bounds.width - layout.minimumLineSpacing) / numberOfItemsPerRow
        
        return CGSize(width: itemWidth, height: itemWidth)
    }

}
