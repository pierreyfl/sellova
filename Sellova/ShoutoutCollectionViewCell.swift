//
//  ShoutoutCollectionViewCell.swift
//  Sellova
//
//  Created by Pierre Yam on 08/09/2017.
//  Copyright © 2017 PierreYam. All rights reserved.
//

import UIKit

class ShoutoutCollectionViewCell: UICollectionViewCell {
    
    
    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var label: UILabel!
    
    
    var image: UIImage! {
        didSet {
            self.imageView.image = image
            self.setNeedsLayout()
        }
    }
}
