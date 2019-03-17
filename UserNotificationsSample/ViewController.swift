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
    let userNotification = UserNotification(center: .current())
    
    override func viewDidLoad() {
        super.viewDidLoad()
        userNotification.requestNotificationAuthorization()
    }
    
    @IBAction func notify(_ sender: Any) {
        userNotification.notify()
    }
    
    @IBAction func getNotificationInNotificationCenter(_ sender: Any) {
        userNotification.getNotification()
    }
}

