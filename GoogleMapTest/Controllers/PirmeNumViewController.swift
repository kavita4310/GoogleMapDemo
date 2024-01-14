//
//  PirmeNumViewController.swift
//  GoogleMapTest
//
//  Created by MACMINI on 01/03/23.
//

import UIKit

class PirmeNumViewController: UIViewController {
    
    @IBOutlet weak var lblOriginalName: UILabel!
    @IBOutlet weak var tfValue: UITextField!
    @IBOutlet weak var lblMessage: UILabel!
    
//    var stringdata = ""
//       var appendData = [Int:Int]()
//       var data = [Int:Int]()
//       var numberdata = Int()
       var string = ""
//       var dictionary = [Int:Int]()
  
    var array = [Int]()
    var dictionary = [Int:Character]()
    
    var arrData = [Int]()
    var arrofDict = [[String:Int]]()
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func actionCheckValue(_ sender: Any) {
         
        let data = [100,200,300,400,500,600,700,800,900,1000]
        let result = Array(data)
        for i in result {
            print(i)
            for j in "\(i)"{
                
                print("value: \(j)")
                
                }
        }
        
        
//
//        let data = [23,34,34,23,45,65,43,12,23,87,54,52,23]
//        let ndata = data.reversed()
//        print(ndata.reversed())
        
//        let numberArr  = [1,2,2,4,4,6,7,8,6,10,11,15,12,20,45,56,23,23,50,55,76,56,56,45,23,24,2,36,4,54,35,76,97,43,23,12,34,12,76,54,76,54,98,76,100]
////        let afirst = numberArr.first
//        for index in numberArr {
//            let newdata = numberArr.filter({$0 == index})
//            if newdata.count > 1 {
//                array.append(contentsOf: newdata)
//            }
//    }
//    let arrd = Set(array)
//        print(arrd.sorted())
//
        }
   
}

//
//let num = tfValue.text
//let n = Int(num!)!
// if n < 2 {
//     lblMessage.textColor = .blue
//     lblMessage.text = ("\(n) niether comPosit and nor Prime number")
// } else {
//     for y in 2...n {
//         print(y)
//         if y == n {
//             lblMessage.text = ("\(n) is Prime Number")
//             break
//         }
//         if n % y == 0{
//             lblMessage.text = ("\(n) is composit Number")
//             break
//         }
//
//     }
// }

//                let numberArr = [1,2,3,4,5,6,7,8,10]
//                let nd = numberArr.count
//                let number = numberArr.last
//                let data = number! * ( number! + 1)/2
////                print("valueCount: \(data)")
//                let presentdata = nd * (nd + 1)/2
//                let newdata = (data - presentdata)
//
//                print("missing Value: \(newdata)")
//
//                for i in numberArr {
//                    let plusValue = i + i
//                    print("plusValue: \(plusValue)")
//                }
////
////                for num in numberArr {
////
////                         for i in 1...10 {
////                             let dict = [i:num]
////                            dictionary = dict
////                            let newdata = dictionary.filter({$0.value != $0.key})
////                            print(newdata)
////                         }
////
////                }
