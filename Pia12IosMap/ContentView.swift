//
//  ContentView.swift
//  Pia12IosMap
//
//  Created by yusufyakuf on 2023-12-14.
//

import SwiftUI
import CoreLocation
import CoreLocationUI

struct ContentView: View {
   @StateObject var locationManager = PositionHandler()

    var body: some View {
        VStack {
           if let location = locationManager.location {
              Text("Your Location: \(location.latitude), \(location.longitude) " )
           }
           
           LocationButton {
              locationManager.getPos()
           }
           
           Button(action: {
              locationManager.getPos()

           }, label: {
              Text("where i am ?")
           })
        }
        .frame(height: 44)
        .padding()
        .onAppear(){
           locationManager.getPos()

        }
    }
     
}

#Preview {
    ContentView()
}

class PositionHandler: NSObject, ObservableObject,  CLLocationManagerDelegate {
   let manager = CLLocationManager()
   @Published var location: CLLocationCoordinate2D?

   override init() {
      super.init()
      manager.delegate = self
   }
   
   func getPos() {
      if manager.authorizationStatus == .authorizedWhenInUse {
         print("ok in use")
      }
      if manager.authorizationStatus == .authorizedAlways {
         print("ok in always")
      }
      if manager.authorizationStatus == .notDetermined {
         print("ok not determined")
      }
      if manager.authorizationStatus == .denied {
         print("ok denied")
      }
      if manager.authorizationStatus == .authorizedAlways || manager.authorizationStatus == .authorizedWhenInUse {
         print("ok att hamta pos")
//         manager.requestLocation()
         manager.startUpdatingLocation()
      } else {
         print("for inte hamta")
         manager.requestAlwaysAuthorization()
      }
     
   }
   
   func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
      location = locations.first?.coordinate
   }
   
   func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
      print("error")
      print(error)
   }
   
   func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
      print("auth changed")
      manager.requestLocation()

   }

}
