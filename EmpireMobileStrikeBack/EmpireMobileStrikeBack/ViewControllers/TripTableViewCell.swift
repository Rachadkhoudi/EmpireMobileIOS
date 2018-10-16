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
    
    
    func fillCell(driver: Driver) -> Void {
        imageDriver.image = driver.imageDriver.image
        nameDriver.text = driver.nameDriver
        destinationStart.text = driver.destinationStart
        destinationEnd.text = driver.destinationEnd
        self.selectionStyle = .none
    }
}
