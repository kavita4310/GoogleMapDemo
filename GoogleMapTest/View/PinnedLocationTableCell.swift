//
//  PinnedLocationTableCell.swift
//  GoogleMapTest
//
//  Created by MACMINI on 24/02/23.
//

import UIKit


class PinnedLocationTableCell: UITableViewCell {
    
    @IBOutlet weak var lblPinnedLocation: UILabel!
    
    var deleteTapped:((_ index:Int)->())?
       var currentIndex = -1
       var tabledata = [String]()
      
    
    override func awakeFromNib() {
        super.awakeFromNib()

    }

  
    
    @IBAction func actionDeleteTapped(_ sender: Any) {
        
      deleteTapped?(currentIndex)

        
    }
}
