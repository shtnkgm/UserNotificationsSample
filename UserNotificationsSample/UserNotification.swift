//
//  UserNotification.swift
//  UserNotificationsSample
//
//  Created by Shota Nakagami on 2019/03/17.
//  Copyright © 2019 Shota Nakagami. All rights reserved.
//

import UserNotifications

// UNUserNotificationCenterDelegateに準拠するためにNSObjectを継承する必要がある
class UserNotification: NSObject {
    let center: UNUserNotificationCenter
    
    init(center: UNUserNotificationCenter) {
        self.center = center
        super.init()
        center.delegate = self
    }
    
    func requestNotificationAuthorization() {
        print(#function)
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
    
    func notify() {
        let content = UNMutableNotificationContent()
        content.title = "タイトル"
        content.subtitle = "サブタイトル"
        content.body = "通知の本文です"
        content.sound = UNNotificationSound.default
        
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 3, repeats: false)
        let request = UNNotificationRequest(identifier: Date().description,
                                            content: content,
                                            trigger: trigger)
        center.add(request, withCompletionHandler: nil)
    }
}

extension UserNotification: UNUserNotificationCenterDelegate {
    func userNotificationCenter(_ center: UNUserNotificationCenter,
                                willPresent notification: UNNotification,
                                withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        print(#function)
        
        let trigger = notification.request.trigger
        
        if trigger is UNPushNotificationTrigger {
            print("Push")
        } else if trigger is UNTimeIntervalNotificationTrigger {
            print("Time Interval")
        } else if trigger is UNCalendarNotificationTrigger {
            print("Calendar")
        } else if trigger is UNLocationNotificationTrigger {
            print("Location")
        }
        
        completionHandler([.alert, .sound, .badge])
    }
}
