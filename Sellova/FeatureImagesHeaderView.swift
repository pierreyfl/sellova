//
//  FeatureImagesHeaderView.swift
//  Sellova
//
//  Created by Pierre Yam on 07/09/2017.
//  Copyright © 2017 PierreYam. All rights reserved.
//

import UIKit

class FeatureImagesHeaderView: UIView
{
    @IBOutlet weak var pageControl: UIPageControl!
}

extension FeatureImagesHeaderView : FeatureImagesPageViewControllerDelegate
{
    func setupPageController(numberOfPages: Int)
    {
        pageControl.numberOfPages = numberOfPages
    }
    
    func turnPageController(to index: Int)
    {
        pageControl.currentPage = index
    }
}


