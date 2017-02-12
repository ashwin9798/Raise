//
//  studentVC.swift
//  Raise
//
//  Created by Sachin Saxena on 2/11/17.
//  Copyright © 2017 AshwinVivek. All rights reserved.
//

import UIKit
import Firebase

class studentVC: UIViewController {

    var refYes: FIRDatabaseReference!
    var refNo: FIRDatabaseReference!
    var result: Int!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        refYes = FIRDatabase.database().reference().child("Active").child("yes")
        
        refNo = FIRDatabase.database().reference().child("Active").child("no")


        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onRaise(_ sender: Any) {
        
        self.refYes.observeSingleEvent(of: FIRDataEventType.value, with: { (snapshot) in
                if !snapshot.exists(){
                    print("waiting on color")
                }
                else{
                    self.result = snapshot.value as! Int
                    print("Result = \(self.result)")
                    self.refYes.setValue(self.result+1)
                }
            })
        self.performSegue(withIdentifier: "toResult", sender: self)
    }
    
}
