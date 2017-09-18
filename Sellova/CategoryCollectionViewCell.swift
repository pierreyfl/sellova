//
//  CategoryCollectionViewCell.swift
//  Sellova
//
//  Created by Pierre Yam on 07/09/2017.
//  Copyright © 2017 PierreYam. All rights reserved.
//

import UIKit

class CategoryCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var button: UIButton!
    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var imageView2: UIImageView!
    var image: UIImage! {
        didSet {
            self.imageView.image = image
            self.setNeedsLayout()
        }
    }
    
    var image2: UIImage! {
        didSet {
            self.imageView2.image = image
            self.setNeedsLayout()
        }
    }
    

}
