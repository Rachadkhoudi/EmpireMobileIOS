//
//  network.swift
//  EmpireMobileStrikeBack
//
//  Created by Badr Choukri on 15/10/2018.
//  Copyright © 2018 Badr Choukri. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

struct Network {
    
    let URL_LIST_TRIPS = "https://starwars.chauffeur-prive.com/trips"
    let URL_DETAIL_TRIP = "https://starwars.chauffeur-prive.com/trips/"
    
    func getListTrips() -> Void {
        let url = URL_LIST_TRIPS
        Alamofire.request(url, method: .get).responseJSON
        { response in
            if (response.result.error == nil)
            {
                let json = JSON(response.result.value!)
                var arrayOfDriver : [Driver] = []
                for elem in json{
                    arrayOfDriver.append(Driver(json: elem.1))
                }
                NotificationCenter.default.post(name:NSNotification.Name("ListTripLoadNotification"), object: arrayOfDriver, userInfo: nil)

                
            }else{
                NotificationCenter.default.post(name:NSNotification.Name("ListTripFailledNotification"), object: nil, userInfo: nil)
            }
        }
    }
    

    
}
