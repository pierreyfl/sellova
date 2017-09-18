//
//  InfoOneViewController.swift
//  Sellova
//
//  Created by Pierre Yam on 13/09/2017.
//  Copyright © 2017 PierreYam. All rights reserved.
//

import UIKit

class InfoOneViewController: UIViewController {

    @IBOutlet weak var scroller: UIScrollView!
    @IBOutlet weak var button1: UIButton!

    @IBOutlet weak var button2: UIButton!
    
    @IBOutlet weak var button3: UIButton!
    
    @IBOutlet weak var button4: UIButton!
    
    @IBOutlet weak var button5: UIButton!
    
    @IBOutlet weak var button6: UIButton!
    
    @IBOutlet weak var button7: UIButton!
    
    
    @IBOutlet weak var button8: UIButton!
    
    @IBOutlet weak var button9: UIButton!
    
    
    @IBOutlet weak var button10: UIButton!
    
    
    @IBOutlet weak var button11: UIButton!
    

    @IBOutlet weak var nextButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Select Issues of Your Phone (If any)"
        // Do any additional setup after loading the view.
        
        view.addSubview(scroller)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillLayoutSubviews(){
        super.viewWillLayoutSubviews()
         scroller.contentSize = CGSize(width: scroller.contentSize.width, height: 650)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    @IBAction func backBt(_ sender: Any) {
        
        self.performSegue(withIdentifier: "unwindToMenu", sender: self)
    }
    
    
    @IBAction func next(_ sender: UIButton) {
        
      
    }

    @IBAction func button1(_ sender: UIButton) {
        
        if sender.isSelected {
        
        sender.isSelected = false
        sender.backgroundColor = UIColor.white
        sender.layer.borderWidth = 0.0
        
        } else {
        sender.isSelected = true
        sender.backgroundColor = UIColor.blue
        sender.tintColor = UIColor.clear
        sender.layer.borderColor = UIColor.blue.withAlphaComponent(0.5).cgColor
        sender.layer.borderWidth = 2.0
        nextButton.setTitle("Next Step", for: .normal)
        }
    }

}


extension UIButton {
    
    func setBackgroundColor(color: UIColor, forState: UIControlState) {
        
        UIGraphicsBeginImageContext(CGSize(width: 1, height: 1))
        UIGraphicsGetCurrentContext()!.setFillColor(color.cgColor)
        UIGraphicsGetCurrentContext()!.fill(CGRect(x: 0, y: 0, width: 1, height: 1))
        let colorImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        self.setBackgroundImage(colorImage, for: forState)
    }
}
