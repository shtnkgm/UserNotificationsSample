//
//  ViewController.swift
//  UserNotificationsSample
//
//  Created by Shota Nakagami on 2019/03/17.
//  Copyright © 2019 Shota Nakagami. All rights reserved.
//

import UIKit
import UserNotifications

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    func requestNotificationAuthorization() {
        let center = UNUserNotificationCenter.current()
        center.requestAuthorization(options: [.badge, .sound, .alert]) { granted, error in
            if let error = error {
                print(error)
                return
            }
            
            guard granted else  {
                print("Not granted")
                return
            }
            
            print("Granted")
        }
    }

}

