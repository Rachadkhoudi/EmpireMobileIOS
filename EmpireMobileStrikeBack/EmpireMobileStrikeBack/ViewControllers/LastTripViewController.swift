//
//  LastTripViewController.swift
//  EmpireMobileStrikeBack
//
//  Created by Badr Choukri on 15/10/2018.
//  Copyright © 2018 Badr Choukri. All rights reserved.
//

import UIKit

class LastTripViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet var tableView: UITableView!
    let network = Network()
    var arrayOfDrivers: [Driver] = []
    
    // MARK: override function
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.isHidden = true
        NotificationCenter.default.addObserver(forName:NSNotification.Name("ListTripLoadNotification"), object: nil, queue: nil, using: notificationFinish)
        NotificationCenter.default.addObserver(forName:NSNotification.Name("ListTripFailledNotification"), object: nil, queue: nil, using: notificationFinish)
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        network.getListTrips()
    }
    
    // MARK: Datasource method
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayOfDrivers.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "goToDetailPage", sender: indexPath.row)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = Bundle.main.loadNibNamed("TripTableViewCell", owner: self, options: nil)?.first as! TripTableViewCell
        cell.fillCell(driver: arrayOfDrivers[indexPath.row])
        return cell
    }
    
    // MARK: Events function
    func notificationFinish(notification:Notification) -> Void {
        if (notification.name.rawValue == "ListTripLoadNotification")
        {
            arrayOfDrivers = notification.object as! [Driver]
            tableView.reloadData()
        }else if (notification.name.rawValue == "ListTripFailledNotification")
        {
            //Display componante warning
        }else{
            //Should Never happen "an unknown error occurred"
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "goToDetailPage"){
            let vc = segue.destination as! DetailPageViewController
            let pos = sender as! Int
            vc.driver = arrayOfDrivers[pos]
        }
    }
}
