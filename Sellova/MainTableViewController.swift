//
//  ViewController.swift
//  Sellova
//
//  Created by Pierre Yam on 03/09/2017.
//  Copyright © 2017 PierreYam. All rights reserved.
//

import UIKit
import PageMenu
import BWWalkthrough
import ImageSlideshow

class MainTableViewController: UITableViewController, BWWalkthroughViewControllerDelegate {
    
    var featureImage: FeatureImage!
    var pageMenu : CAPSPageMenu?
    lazy   var searchBars:UISearchBar = UISearchBar(frame: CGRect(x: 0, y: 0, width: 200, height: 20))

    @IBOutlet weak var slideshow: ImageSlideshow!
    @IBAction func unwindToMenu(segue: UIStoryboardSegue) {}
    @IBOutlet weak var featureImagesHeaderView: FeatureImagesHeaderView!
    
    let localSource = [ImageSource(imageString: "muiti-control-1")!, ImageSource(imageString: "phone-deliver")!]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Home"
        // searchBars.searchBarStyle = UISearchBarStyle.minimal
        // UITextField.appearance(whenContainedInInstancesOf: UISearchBar)
        // [[UItextField, appearanceWhenContainedIn,: [UISearchBar class], nil], setFont,:[UIFont fontWithName:@"avenirNext-ultraLight" size:16]];
        // var leftNavBarButton = UIBarButtonItem(customView: searchBars)
        
        //self.navigationItem.rightBarButtonItem = leftNavBarButton
        
        self.tableView.estimatedRowHeight = self.tableView.rowHeight
        self.tableView.rowHeight = UITableViewAutomaticDimension
        
        slideshow.backgroundColor = UIColor.white
        slideshow.slideshowInterval = 5.0
        slideshow.pageControlPosition = PageControlPosition.insideScrollView
        slideshow.pageControl.currentPageIndicatorTintColor = UIColor.white
        slideshow.pageControl.pageIndicatorTintColor = UIColor.lightGray
        slideshow.contentScaleMode = UIViewContentMode.scaleAspectFill
        
        // optional way to show activity indicator during image load (skipping the line will show no activity indicator)
        slideshow.activityIndicator = DefaultActivityIndicator()
        slideshow.currentPageChanged = { page in
            print("current page:", page)
        }
        
        // can be used with other sample sources as `afNetworkingSource`, `alamofireSource` or `sdWebImageSource` or `kingfisherSource`
        slideshow.setImageInputs(localSource)
        
        
        let recognizer = UITapGestureRecognizer(target: self, action: #selector(MainTableViewController.didTap))
        slideshow.addGestureRecognizer(recognizer)
        
        
        // Get view controllers and build the walkthrough
        if let isFirstStart = UserDefaults.standard.value(forKey: "isFirstLaunch") as? Bool {
            print("this is not the first launch")
            UserDefaults.standard.set(false, forKey: "isFirstLaunch")
            UserDefaults.standard.synchronize()
            
            let stb = UIStoryboard(name: "Main", bundle: nil)
            let walkthrough = stb.instantiateViewController(withIdentifier: "walk0") as! BWWalkthroughViewController
            let page_one = stb.instantiateViewController(withIdentifier: "walk1") as UIViewController
            let page_two = stb.instantiateViewController(withIdentifier: "walk2") as UIViewController
            
            // Attach the pages to the master
            walkthrough.delegate = self
            walkthrough.add(viewController:page_one)
            walkthrough.add(viewController:page_two)
            self.present(walkthrough, animated: true, completion: nil)
        } else {
            print("this is the first launch")
            
        }
        
    
    }
    
    override func scrollViewDidScroll(_ scrollView: UIScrollView) {
      //  UIView.animate(withDuration: 2.0) {
          //  self.navigationController?.navigationBar.barTintColor = UIColor.blue
          //  self.navigationController?.navigationBar.tintColor = UIColor.white
          //  self.navigationController?.navigationBar.layoutIfNeeded()
      //  }
    }
    



    func didTap() {
        let fullScreenController = slideshow.presentFullScreenController(from: self)
        // set the activity indicator for full screen controller (skipping the line will show no activity indicator)
        fullScreenController.slideshow.activityIndicator = DefaultActivityIndicator(style: .white, color: nil)
    }
    
    
    func walkthroughCloseButtonPressed() {
        self.dismiss(animated: true, completion: nil)
    }
    
    struct Storyboard {
        static let headlineCell = "headlineCell"
        static let categoryCell = "CategoryCell"
        static let shoutoutCell = "ShoutoutCell"
        static let categoryCollectionView = "CategoryCollectionView"
        static let inviteCell = "InviteCell"
        static let informationCell = "InformationCell"

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    

    


}

extension MainTableViewController
{
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        return 5
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: Storyboard.headlineCell, for: indexPath) as! HeadlineCell
            cell.headlineLabel.text = "Today's headline: Sample text or descriptions here..."
            cell.selectionStyle = .none
            
            return cell
        } else if indexPath.row == 1 {
            let cell = tableView.dequeueReusableCell(withIdentifier: Storyboard.categoryCell, for: indexPath) as! CategoryTableViewCell
            
            return cell
        } else if indexPath.row == 2 {
            let cell = tableView.dequeueReusableCell(withIdentifier: Storyboard.shoutoutCell, for: indexPath) as! ShoutoutTableViewCell
            
            return cell
        } else if indexPath.row == 3 {
            let cell = tableView.dequeueReusableCell(withIdentifier: Storyboard.inviteCell, for: indexPath) as! InviteCell
            
            cell.title.text = "Invite Friends And Earn Rebate"
            cell.subtitle.text = "Get Your Rebate Now"
            
            return cell
            
        } else if indexPath.row == 4 {
            let cell = tableView.dequeueReusableCell(withIdentifier: Storyboard.informationCell, for: indexPath) as! InformationCell
            
            cell.title.text = "Categories"
            cell.title.padding = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 0)
            cell.title.layer.addBorder(edge: UIRectEdge.left, color: UIColor.blue, thickness: 5.0)
            
            var controllerArray : [UIViewController] = []
            
            // Create variables for all view controllers you want to put in the
            // page menu, initialize them, and add each to the controller array.
            // (Can be any UIViewController subclass)
            // Make sure the title property of all view controllers is set
            // Example:
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let controller = storyboard.instantiateViewController(withIdentifier: "Demo")
            let controller2 = storyboard.instantiateViewController(withIdentifier: "Demo2")
            controller.title = "Phones"
            controller2.title = "Tablets"
            controllerArray.append(controller)
            controllerArray.append(controller2)
            
            // Customize page menu to your liking (optional) or use default settings by sending nil for 'options' in the init
            // Example:
            var parameters: [CAPSPageMenuOption] = [
                .useMenuLikeSegmentedControl(true),
                .viewBackgroundColor(UIColor.blue),
                .scrollMenuBackgroundColor(UIColor.white),
                .selectionIndicatorColor(UIColor.blue),
                .selectedMenuItemLabelColor(UIColor.black),
                .unselectedMenuItemLabelColor(UIColor.black),
                .menuItemFont(UIFont(name: "Georgia", size: 13)!)
            ]
            
            // Initialize page menu with controller array, frame, and optional parameters
            pageMenu = CAPSPageMenu(viewControllers: controllerArray, frame: CGRect(x: 0.0, y: 40.0, width: self.view.frame.width, height: self.view.frame.width * 2 + 400), pageMenuOptions: parameters)
            
            
            // Lastly add page menu as subview of base view controller view
            // or use pageMenu controller in you view hierachy as desired
            cell.addSubview(pageMenu!.view)
            
            return cell
            
        }


        return UITableViewCell()
    }
    
    override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath)
    {
        if indexPath.row == 1 {
            if let cell = cell as? CategoryTableViewCell {
                cell.CategoryCollectionView.dataSource = self
                cell.CategoryCollectionView.delegate = self
                cell.CategoryCollectionView.reloadData()
                cell.CategoryCollectionView.isScrollEnabled = false
            }
        } else if indexPath.row == 2 {
            if let cell = cell as? ShoutoutTableViewCell {
                cell.collectionView.dataSource = self
                cell.collectionView.delegate = self
                cell.collectionView.reloadData()
                cell.collectionView.isScrollEnabled = false
            }
        
        }
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt
        indexPath: IndexPath) -> CGFloat
    {
        if indexPath.row == 1 {
            return tableView.bounds.width + 15
        } else if indexPath.row == 2 {
            return tableView.bounds.width / 4
        } else if indexPath.row == 3 {
            return 75
        } else if indexPath.row == 4 {
            return tableView.bounds.width * 2 + 350
        } else {
            return UITableViewAutomaticDimension
        }
    }
    


    
}

extension MainTableViewController : UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout
{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        if collectionView == collectionView as? CategoryCollectionView {
            
            return 4 } else
        {
            return 4
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell
    {
        
        if collectionView == collectionView as? CategoryCollectionView {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Storyboard.categoryCell, for: indexPath) as! CategoryCollectionViewCell
            // TODO: - get your data model...
            let images = FeatureImage.fetchImages()
            
            let titles: [String] = ["Phones", "Tablets", "Computers", "Others"]
        
            cell.image = images.first?.images?.first
            
            cell.layer.addBorder(edge: UIRectEdge.bottom, color: UIColor.lightGray, thickness: 0.5)
            cell.layer.addBorder(edge: UIRectEdge.right, color: UIColor.lightGray, thickness: 0.5)
            cell.label.text = titles[indexPath.row]

            return cell } else {
            
            var titles: [String] = ["Sell", "Buy", "Tradein", "Repair"]
            
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Storyboard.shoutoutCell, for: indexPath) as! ShoutoutCollectionViewCell
            cell.layer.addBorder(edge: UIRectEdge.right, color: UIColor.lightGray, thickness: 0.1)
            cell.label.text = titles[indexPath.row]
            
            return cell
            
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize
    {
        let layout = collectionViewLayout as! UICollectionViewFlowLayout
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 0
        
        if collectionView == collectionView as? CategoryCollectionView {
            let numberOfItemsPerRow: CGFloat = 2.0
            let itemWidth = (collectionView.bounds.width - layout.minimumLineSpacing) / numberOfItemsPerRow
            return CGSize(width: itemWidth, height: itemWidth)
            
        } else {
            let numberOfItemsPerRow: CGFloat = 4.0
            let itemWidth = (collectionView.bounds.width - (layout.minimumLineSpacing * 4)) / numberOfItemsPerRow
            return CGSize(width: itemWidth, height: itemWidth)
        }
        
        
        
    }
    
}

extension CALayer {
    
    func addBorder(edge: UIRectEdge, color: UIColor, thickness: CGFloat) {
        
        var border = CALayer()
        
        switch edge {
        case UIRectEdge.top:
            border.frame = CGRect(x: 0, y: 0, width: self.frame.height, height: thickness)
            break
        case UIRectEdge.bottom:
            border.frame = CGRect(x: 0, y: self.frame.height - thickness, width: UIScreen.main.bounds.width, height: thickness)
            break
        case UIRectEdge.left:
            border.frame = CGRect(x: 0, y: 0, width: thickness, height: self.frame.height)
            break
        case UIRectEdge.right:
            border.frame = CGRect(x: self.frame.width - thickness, y: 0, width: thickness, height: self.frame.height)
            break
        default:
            break
        }
        
        border.backgroundColor = color.cgColor;
        
        self.addSublayer(border)
    }
    
}

extension UILabel
{
    private struct AssociatedKeys {
        static var padding = UIEdgeInsets()
    }
    
    var padding: UIEdgeInsets? {
        get {
            return objc_getAssociatedObject(self, &AssociatedKeys.padding) as? UIEdgeInsets
        }
        set {
            if let newValue = newValue {
                objc_setAssociatedObject(self, &AssociatedKeys.padding, newValue as UIEdgeInsets!, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN_NONATOMIC)
            }
        }
    }
    
    override open func draw(_ rect: CGRect) {
        if let insets = padding {
            self.drawText(in: UIEdgeInsetsInsetRect(rect, insets))
        } else {
            self.drawText(in: rect)
        }
    }
    
    override open var intrinsicContentSize: CGSize {
        get {
            var contentSize = super.intrinsicContentSize
            if let insets = padding {
                contentSize.height += insets.top + insets.bottom
                contentSize.width += insets.left + insets.right
            }
            return contentSize
        }
    }
}


