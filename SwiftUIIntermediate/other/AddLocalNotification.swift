//
//  AddLocalNotification.swift
//  SwiftUIIntermediate
//
//  Created by prg on 2024-04-27.
//

import SwiftUI
import UserNotifications
import CoreLocation

class NotificationManager {
    static let instance = NotificationManager() //Singleton
    
    func requestAuthorization() {
        let option: UNAuthorizationOptions = [.alert, .sound, .badge]
        UNUserNotificationCenter.current().requestAuthorization(options: option){success,error in
            if let error = error {
                print("ERROR: \(error)")
                      } else {
                          print("Success")
                }
        }
    }
    
    func scheduleNotification() {
        let content = UNMutableNotificationContent()
        content.title = "It's time Baby"
        content.subtitle = "Let's work for your goal.."
        content.sound = .defaultRingtone
        content.badge = 1
        
        //time
//        let trigger = UNTimeIntervalNotificationTrigger(
//            timeInterval: 5.0,
//            repeats: false
//        )
        //calender
//        var dateComponents = DateComponents()
//        dateComponents.hour = 09
//        dateComponents.minute = 46
////        dateComponents.weekday = 2
//        let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: true)
        
//        //location
        let cordinates = CLLocationCoordinate2D(
            latitude: 40.00, longitude: 50.00)
        let region = CLCircularRegion(
                center: cordinates,
                radius: 100,
                identifier: UUID().uuidString)
        region.notifyOnEntry = true
        region.notifyOnExit = true
            
        let trigger = UNLocationNotificationTrigger(
            region: region,
            repeats: true)
        
        let request = UNNotificationRequest(
            identifier: UUID().uuidString,
            content: content,
            trigger: trigger)
        UNUserNotificationCenter.current().add(request)
    }
    
    func cancelNotification() {
        UNUserNotificationCenter.current().removeAllPendingNotificationRequests()
        UNUserNotificationCenter.current().removeAllDeliveredNotifications()
    }
}

struct AddLocalNotification: View {
    var body: some View {
        
        //request permission
        //based on the time
        //based on the date
        //based on the location
        VStack(spacing: 40) {
            Button("Request permission") {
                NotificationManager.instance.requestAuthorization()
            }
            Button("Schedule Notification") {
                NotificationManager.instance.scheduleNotification()
            }
            Button("Cancel Notification") {
                NotificationManager.instance.cancelNotification()
            }
        }
        //make the padge to 0 after checkiing the notification
        .onAppear {
            UNUserNotificationCenter.current().setBadgeCount(0, withCompletionHandler: nil)
        }
    }
}

#Preview {
    AddLocalNotification()
}
