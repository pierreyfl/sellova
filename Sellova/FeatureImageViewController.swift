//
//  FeatureImageViewController.swift
//  Sellova
//
//  Created by Pierre Yam on 07/09/2017.
//  Copyright © 2017 PierreYam. All rights reserved.
//

import UIKit

class FeatureImageViewController: UIViewController {

    @IBOutlet weak var FeatureImage: UIImageView!
    
    var image: UIImage? {
        didSet {
            self.FeatureImage?.image = image
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.FeatureImage.image = image
    }

}
