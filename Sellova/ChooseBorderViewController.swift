//
//  ChooseBorderViewController.swift
//  Sellova
//
//  Created by Pierre Yam on 15/09/2017.
//  Copyright © 2017 PierreYam. All rights reserved.
//

import UIKit

class ChooseBorderViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func next(_ sender: UIButton) {
        
        self.performSegue(withIdentifier: "ScreenSegue", sender: sender)
    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
