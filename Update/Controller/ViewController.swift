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
    }

    @IBAction func onTimerTrapped() {
        print("timer")
        UNService.shared.timerRequest(with: 5)
    }
    
    @IBAction func onDateTrapped() {
        print("date")
    }
    
    @IBAction func onLocationTrapped() {
        print("location")
    }


}

