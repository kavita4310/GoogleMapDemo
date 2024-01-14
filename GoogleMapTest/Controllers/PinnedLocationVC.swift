//
//  PinnedLocationVC.swift
//  GoogleMapTest
//
//  Created by MACMINI on 22/02/23.
//

import UIKit

  // MARK :- Delegate Protocol

protocol DataPass {
    func dataPassing(nindex:Int,data:String)
}


class PinnedLocationVC: UIViewController{
    
    // MARK :- IBOutlets
    
    @IBOutlet weak var tablaView: UITableView!
    
    // MARK :- Properties

    var addressArray = [LocationProperties]()
    var delegate:DataPass?
    var newIndex = 0
    
    // MARK :- ViewController life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
     
        // MARK :- Register Nib file
        
        let nib = UINib(nibName: "PinnedLocationTableCell", bundle: nil)
        tablaView.register(nib, forCellReuseIdentifier: "PinnedLocationTableCell")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.addressArray = Location.shared.getAddresses()
        self.tablaView.reloadData()
    }
  
   
}

// MARK :- Table View delegate and datasource

extension PinnedLocationVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return addressArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "PinnedLocationTableCell", for: indexPath) as! PinnedLocationTableCell
        
        cell.currentIndex = indexPath.row
        cell.lblPinnedLocation.text = addressArray[indexPath.row].address
        cell.deleteTapped = {
            cIndex in
            Location.shared.deleteAddress(at: cIndex)
            self.addressArray = Location.shared.getAddresses()
            self.tablaView.reloadData()
        }
        
        return cell
    }
    // MARK :- Function Delete TableCell
    
   
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
     return 60
    }
    
}

