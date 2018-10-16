//
//  TripTableViewCell.swift
//  EmpireMobileStrikeBack
//
//  Created by Badr Choukri on 15/10/2018.
//  Copyright © 2018 Badr Choukri. All rights reserved.
//

import UIKit

class TripTableViewCell: UITableViewCell {

    @IBOutlet var imageDriver: UIImageView!
    @IBOutlet var nameDriver: UILabel!
    @IBOutlet var destinationStart: UILabel!
    @IBOutlet var destinationEnd: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func fillCell(driver: Driver) -> Void {
        self.imageDriver.image = driver.imageDriver.image
        self.nameDriver.text = driver.nameDriver
        self.destinationStart.text = driver.destinationStart
        self.destinationEnd.text = driver.destinationEnd
    }
}
