//
//  EnterNameVC.swift
//  GoogleMapTest
//
//  Created by MACMINI on 06/03/23.
//

import UIKit

class EnterNameVC: UIViewController {
    
    @IBOutlet weak var lblOriginalName: UILabel!
    @IBOutlet weak var lblEnterName: UILabel!
    @IBOutlet weak var tfEnterName: UITextField!
    
    var whiteSpace = [String]()
    var arraydata = [String]()
    var appendData:[String] = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        lblOriginalName.text = "My name is kavita"
    }
    
    @IBAction func actionName(_ sender: Any) {
        
        let data = "This is the best picture in the world"
        print("data: \(data.count)")
        for i in data {
            if i == "a" {
                let first = "\(i)"
                appendData.append(first)
                print("vowel: \(first.count)")
            }else if i == "e" {
                let second = "\(i)"
                appendData.append(second)
                print("vowel: \(second.count)")
            }else if i == "i" {
                let third = "\(i)"
                appendData.append(third)
                print("vowel: \(third.count)")
            }else if i == "o" {
                let fourth = "\(i)"
                appendData.append(fourth)
                print("vowel: \(fourth.count)")
            }else if i == "u" {
                let five = "\(i)"
                appendData.append(five)
                print("vowel: \(five.count)")
            }else{
                print("constant value:  \(i)")
                 if i.isWhitespace {
                    let six = "\(i)"
                    let whitespaces = appendData.count - six.count
                    whiteSpace.append("\(whitespaces)")
                    print("whitespace: \(whitespaces)")
                 }else {
                    print("No space count")
                 }
            }
        }

        print("vowel: \(appendData.count)")
        let consotant = data.count - whiteSpace.count - appendData.count
        print("totol constant: \(consotant)")
        
        }
    }
    
    
    
    











