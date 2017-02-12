//
//  teacherVC.swift
//  Raise
//
//  Created by Sachin Saxena on 2/11/17.
//  Copyright © 2017 AshwinVivek. All rights reserved.
//

import UIKit
import Firebase
import Speech
import CoreLocation

class teacherVC: UIViewController, CLLocationManagerDelegate {
    
    var latitude:CLLocationDegrees = 5.0
    var longitude:CLLocationDegrees = 5.0
    var ref: FIRDatabaseReference!
    let manager = CLLocationManager()

    @IBOutlet weak var input: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ref = FIRDatabase.database().reference()
        manager.delegate = self
        manager.requestWhenInUseAuthorization()
        //manager.requestLocation()

        // Do any additional setup after loading the view.
        
        }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onStartPoll(_ sender: Any) {
        let keys = "Active"
        
        let newEvent = event(key: keys, lat: latitude, long: longitude, question: input.text!)
        
        let childUpdates = ["/\(keys)/" : newEvent.getSnapshotValue()]
        
        ref.updateChildValues(childUpdates)
    }

    @IBAction func onStopPoll(_ sender: Any) {
        ref.child("Active").removeValue()
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        //if let location = locations.first {
        
        for location in locations
        {
            if latitude != 0 && longitude != 0
            {
                print("Found user's lat: \(location.coordinate.latitude)")
                print("Found user's long: \(location.coordinate.longitude)")
                
                latitude = location.coordinate.latitude
                longitude = location.coordinate.longitude
                break
            }
        }
        
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("Failed to find user's location: \(error.localizedDescription)")
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
