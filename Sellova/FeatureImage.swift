//
//  FeatureImage.swift
//  Sellova
//
//  Created by Pierre Yam on 07/09/2017.
//  Copyright © 2017 PierreYam. All rights reserved.
//

import UIKit


class FeatureImage
{
    var uid: String?
    var images: [UIImage]?


    init(uid: String, images: [UIImage])
    {
        self.uid = uid
        self.images = images
    }
    
    class func fetchImages() -> [FeatureImage]
    {
        var featureImages = [FeatureImage]()
        
        let featureImage1 = FeatureImage(uid: "1", images: [UIImage(named: "vfcon070968")!])
        //let featureImage2 = FeatureImage(uid: "2", images: [UIImage(named: "feature2.jpg")!])

        featureImages.append(featureImage1)
        
        return featureImages
    }




}
