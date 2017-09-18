//
//  PhoneViewController.swift
//  Sellova
//
//  Created by Pierre Yam on 13/09/2017.
//  Copyright © 2017 PierreYam. All rights reserved.
//

import UIKit

class PhoneViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    @IBOutlet weak var collectionView: UICollectionView!
    struct Storyboard {
        static let categoryCell = "PhoneCell"
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.collectionView.isScrollEnabled = false
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    let reuseIdentifier = "cell" // also enter this string as the cell identifier in the storyboard

    
    // MARK: - UICollectionViewDataSource protocol
    
    // tell the collection view how many cells to make
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 8
    }
    
    // make a cell for each cell index path
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        // get a reference to our storyboard cell
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Storyboard.categoryCell, for: indexPath as IndexPath) as! CategoryCollectionViewCell
        
        // Use the outlet in our custom class to get a reference to the UILabel in the cell
        return cell
    }
    
    // MARK: - UICollectionViewDelegate protocol
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        // handle tap events
        self.performSegue(withIdentifier: "selectPhone", sender: self)
        // var controller = InfoOneViewController()
        // self.navigationController?.pushViewController(controller, animated: true)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize
    {
        let layout = collectionViewLayout as! UICollectionViewFlowLayout
        layout.minimumLineSpacing = 30.0
        layout.minimumInteritemSpacing = 20.0
        layout.sectionInset = UIEdgeInsetsMake(0, 10, 0, 10)
        
        let numberOfItemsPerRow: CGFloat = 2.0
        let itemWidth = (collectionView.bounds.width - layout.minimumLineSpacing - 20) / numberOfItemsPerRow
        
        return CGSize(width: itemWidth, height: itemWidth + 50)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "selectPhone" {

            let chosenPerson = InfoOneViewController()

            
                chosenPerson.navigationController?.title = "Help"
                
            }
        
            
            
            
        }
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */


