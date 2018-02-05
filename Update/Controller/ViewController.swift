//
//  ViewController.swift
//  Update
//
//  Created by Ken Sr on 1/17/18.
//  Copyright © 2018 Ken Sr. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        UNService.shared.authorize()
        CLService.shared.authorize()
        
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(didEnterRegion),
                                               name: NSNotification.Name("internalNotification.enteredRegion"),
                                               object: nil)
        
    }

    @IBAction func onTimerTrapped() {
        print("timer")
        AlertService.actionSheet(in: self, title: "5 seconds") {
             UNService.shared.timerRequest(with: 5)
        }
       
    }
    
    @IBAction func onDateTrapped() {
        print("date")
        AlertService.actionSheet(in: self, title: "Some future time") {
            var componts = DateComponents()
            componts.second = 0
            
            UNService.shared.dateRequest(with: componts)
        }
        
    }
    
    @IBAction func onLocationTrapped() {
        print("location")
        AlertService.actionSheet(in: self, title: "When I return") {
            CLService.shared.updateLocation()
        }
    }
    
    @objc
    func didEnterRegion() {
        UNService.shared.locationRequest()
    }

}

