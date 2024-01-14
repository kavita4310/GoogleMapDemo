//
//  CalculatorVC.swift
//  GoogleMapTest
//
//  Created by MACMINI on 01/03/23.
//

import UIKit

class CalculatorVC: UITabBarController {
    
    @IBOutlet weak var tfValue: UITextField!
    @IBOutlet weak var lblMessage: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
      
     
    }
    
    @IBAction func actionCheckValue(_ sender: Any) {
     
     
        for i in 0...tfValue.text!.count {
            if i/i == 0 {
                print("this is prime Value")
            }else {
                print("this is not prime Value")
            }
        }
    }
    
}
