//
//  Driver.swift
//  EmpireMobileStrikeBack
//
//  Created by Badr Choukri on 15/10/2018.
//  Copyright © 2018 Badr Choukri. All rights reserved.
//

import Foundation
import SwiftyJSON

class Driver {
    
    let id: Int
    let imageDriver: UIImageView = UIImageView()
    let nameDriver: String
    let destinationStart: String
    let destinationEnd: String
    var destinationDistance: String = ""
    var timeStart: String = ""
    var timeEnd: String = ""
    var destinationTripDuration: String = ""
    let rating: Int
    
    init(json: JSON) {
        id = json["id"].intValue
        nameDriver = json["pilot"]["name"].stringValue
        destinationStart = json["pick_up"]["name"].stringValue
        destinationEnd = json["drop_off"]["name"].stringValue
        rating = json["pilot"]["rating"].intValue
        timeStart = convertDateFormatter(date: json["pick_up"]["date"].stringValue)
        timeEnd = convertDateFormatter(date: json["drop_off"]["date"].stringValue)
        destinationDistance = String(getComa(number: json["distance"]["value"].intValue))   + " " + json["distance"]["unit"].stringValue
        destinationTripDuration = stringFromTimeInterval(interval: json["duration"].doubleValue / 1000) as String
        imageDriver.image = getImage(name: nameDriver)
    }
    
    private func getComa(number: Int) -> String {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = NumberFormatter.Style.decimal
        return numberFormatter.string(from: NSNumber(value:number))!
    }
    
    private func getImage(name:String) -> UIImage {
        if let image = UIImage(named: name){
            return image
        }else{
           return  #imageLiteral(resourceName: "noUser")
        }
    }
    
    private func stringFromTimeInterval(interval: TimeInterval) -> String {
        let ti = NSInteger(interval)
        let seconds = ti % 60
        let minutes = (ti / 60) % 60
        let hours = (ti / 3600)
        
        return String(format: "%0.2d:%0.2d:%0.2d",hours,minutes,seconds)
    }
    
    private func convertDateFormatter(date: String) -> String
    {
        let dateFormatter = DateFormatter()

        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm.ssZ"
        dateFormatter.timeZone = NSTimeZone(name: "UTC") as TimeZone!
        let date = dateFormatter.date(from: date)
        let hour = String(Calendar.current.component(.hour, from: date!))
        var minute = String(Calendar.current.component(.minute, from: date!))
        if (Calendar.current.component(.minute, from: date!) <= 9){
            minute = "0" + minute
        }
        return "\(hour):\(minute)"
    }
}
