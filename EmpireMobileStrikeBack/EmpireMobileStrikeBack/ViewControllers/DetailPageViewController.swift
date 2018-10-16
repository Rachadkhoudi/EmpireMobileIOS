//
//  DetailPageViewController.swift
//  EmpireMobileStrikeBack
//
//  Created by Badr Choukri on 15/10/2018.
//  Copyright © 2018 Badr Choukri. All rights reserved.
//

import UIKit

class DetailPageViewController: UIViewController {

    @IBOutlet var imageDriver: UIImageView!
    @IBOutlet var nameDriver: UILabel!
    @IBOutlet var destinationStart: UILabel!
    @IBOutlet var destinationEnd: UILabel!
    @IBOutlet var timeStart: UILabel!
    @IBOutlet var timeEnd: UILabel!
    @IBOutlet var destinationDistance: UILabel!
    @IBOutlet var destinationTripDuration: UILabel!
    @IBOutlet var stackViewRating: UIStackView!
    @IBOutlet var messageNoRating: UILabel!
    var driver:Driver? = nil
    
    // MARK: override function
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        fillData()
    }
    
    // MARK: Function for fill the view.

    func fillData(){
        if let driverVerified = driver{
            imageDriver.image = driverVerified.imageDriver.image
            nameDriver.text = driverVerified.nameDriver
            destinationStart.text = driverVerified.destinationStart
            destinationEnd.text = driverVerified.destinationEnd
            timeStart.text = driverVerified.timeStart
            timeEnd.text = driverVerified.timeEnd
            destinationDistance.text = driverVerified.destinationDistance
            destinationTripDuration.text = driverVerified.destinationTripDuration
            if (driverVerified.rating > 0)
            {
                stackViewRating.isHidden = false
                messageNoRating.isHidden = true
            } else{
                stackViewRating.isHidden = true
                messageNoRating.isHidden = false
            }
            for note in 1...5 {
                let star = UIImageView()
                if (note <= driverVerified.rating){
                    star.image = #imageLiteral(resourceName: "filled")
                }else{
                    star.image = #imageLiteral(resourceName: "empty")
                }
                stackViewRating.addArrangedSubview(star)
            }
        }else{
            navigationController?.popViewController(animated: true)
            //It's mean I got an error with my driver object and I should not be here. Need to push a warning/explaination to my user.
        }
    }
    
    // MARK: Event function

    @IBAction func btnback(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
}
