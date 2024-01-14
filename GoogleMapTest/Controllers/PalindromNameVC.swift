//
//  PalindromNameVC.swift
//  GoogleMapTest
//
//  Created by MACMINI on 03/03/23.
//

import UIKit

class PalindromNameVC: UIViewController {
    
    @IBOutlet weak var tfName: UITextField!
    @IBOutlet weak var lblMessage: UILabel!
    
    @IBOutlet weak var lblWordCount: UILabel!
    var dict:[String:Int] = [String:Int]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
    }
    
    @IBAction func actionCheckName(_ sender: Any) {
      
            lblMessage.text! = "My name is \(tfName.text!) and \(tfName.text!) having tea at evening and \(tfName.text!) have done the work."
        let data = lblMessage.text!.components(separatedBy: .whitespaces)
        for i in data {
            dict[i] = (dict[i] ?? 0) + 1
            let repeateValue = dict.filter({$0.key == tfName.text!})
            lblWordCount.text! = "\(repeateValue)"
          
           
        }
}

}
