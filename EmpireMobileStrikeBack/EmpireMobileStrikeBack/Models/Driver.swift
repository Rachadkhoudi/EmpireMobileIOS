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
    var destinationDistance: String
    var timeStart: String
    var timeEnd: String
    var destinationTripDuration: String
    let rating: Int
    
    init(json: JSON) {
        self.id = json["id"].intValue
        self.nameDriver = json["pilot"]["name"].stringValue
        self.destinationStart = json["pick_up"]["name"].stringValue
        self.destinationEnd = json["drop_off"]["name"].stringValue
        self.rating = json["pilot"]["rating"].intValue
        self.timeStart = ""
        self.timeEnd = ""
        self.destinationTripDuration = ""
        self.destinationDistance = ""
        self.timeStart = convertDateFormatter(date: json["pick_up"]["date"].stringValue)
        self.timeEnd = convertDateFormatter(date: json["drop_off"]["date"].stringValue)
        self.destinationDistance = String(getComa(number: json["distance"]["value"].intValue))   + " " + json["distance"]["unit"].stringValue
        self.destinationTripDuration = self.stringFromTimeInterval(interval: json["duration"].doubleValue / 1000) as String
        self.imageDriver.image = getImage(name: self.nameDriver)
    }
    
    func getComa(number: Int) -> String {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = NumberFormatter.Style.decimal
        return numberFormatter.string(from: NSNumber(value:number))!
    }
    
    func getImage(name:String) -> UIImage {
        if let image = UIImage(named: name){
            return image
        }
        else
        {
           return  #imageLiteral(resourceName: "noUser")
        }
    }
    
    func stringFromTimeInterval(interval: TimeInterval) -> String {
        
        let ti = NSInteger(interval)
        let seconds = ti % 60
        let minutes = (ti / 60) % 60
        let hours = (ti / 3600)
        
        return String(format: "%0.2d:%0.2d:%0.2d",hours,minutes,seconds)
    }
    
    private func convertDateFormatter(date: String) -> String
    {
        let dateFormatter = DateFormatter()

        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm.ssZ"//this your string date format
        dateFormatter.timeZone = NSTimeZone(name: "UTC") as TimeZone!
        let date = dateFormatter.date(from: date)
        dateFormatter.dateFormat = "yyyy MMM EEEE HH:mm"///this is what you want to convert format
        dateFormatter.timeZone = NSTimeZone(name: "UTC") as TimeZone!
        _ = dateFormatter.string(from: date!)
        let hour = String(Calendar.current.component(.hour, from: date!))
        var minute = String(Calendar.current.component(.minute, from: date!))
        if (Calendar.current.component(.minute, from: date!) <= 9){
            minute = "0" + minute
        }
        return "\(hour):\(minute)"
    }
}
