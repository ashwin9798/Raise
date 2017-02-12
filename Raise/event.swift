//
//  event.swift
//  Raise
//
//  Created by Sachin Saxena on 2/11/17.
//  Copyright © 2017 AshwinVivek. All rights reserved.
//

import UIKit
import Firebase


class event: NSObject {

    let key: String
    let lat: Double
    let long: Double
    let question: String
    let active: Bool
    let yes: Int
    let no: Int
    let users: Int
    
    let klat = "lat"
    let klong = "long"
    let kquestion = "question"
    let kactive = "active"
    let kyes = "yes"
    let kno = "no"
    let kusers = "users"
    
    
    init (key: String, lat: Double, long: Double, question: String)
    {
        self.key = key
        self.lat = lat
        self.long = long
        self.question = question
        self.active = true
        self.yes = 0
        self.no = 0
        self.users = 0
    }
    
    init(snapshot: FIRDataSnapshot)
    {
        self.key = snapshot.key
        self.question = (snapshot.value as! NSDictionary)[self.kquestion] as! String
        self.active = (snapshot.value as! NSDictionary)[self.kactive] as! Bool
        self.lat = (snapshot.value as! NSDictionary)[self.klat] as! Double
        self.long = (snapshot.value as! NSDictionary)[self.klong] as! Double
        self.yes = (snapshot.value as! NSDictionary)[self.kyes] as! Int
        self.no = (snapshot.value as! NSDictionary)[self.kno] as! Int
        self.users = (snapshot.value as! NSDictionary)[self.kusers] as! Int
    }
    
    func getSnapshotValue() -> NSDictionary {
        return ["question": question, "active": active, "lat": lat, "long": long, "yes": yes, "no": no, "users": users]
    }
}
