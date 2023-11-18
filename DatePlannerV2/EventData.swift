//
//  EventData.swift
//  DatePlannerV2
//
//  Created by yusufyakuf on 2023-11-15.
//

import SwiftUI

class EventData: ObservableObject {
   @Published var events: [Event] = [
      Event(
         color: .red,
         title: "Maya's Birthday",
         tasks: [EventTask(text: "Guava kombucha"),
                 EventTask(text: "Paper cups and plates"),
                 EventTask(text: "Cheese plate"),
                 EventTask(text: "Party poppers"),
                ],
         date: Date.roundedHoursFromNow(60 * 60 * 24 * 30)),
      Event(
         color: .yellow,
         title: "Pagliacci",
         tasks: [EventTask(text: "Buy new tux"),
                 EventTask(text: "Get tickets"),
                 EventTask(text: "Pick up Carmen at the airport and bring her to the show"),
                ],
         date: Date.roundedHoursFromNow(60 * 60 * 22)),
      Event(
         color: .orange,
         title: "Sayulita Trip",
         tasks: [
            EventTask(text: "Buy plane tickets"),
            EventTask(text: "Get a new bathing suit"),
            EventTask(text: "Find a hotel room"),
         ],
         date: Date.roundedHoursFromNow(60 * 60 * 24 * 19)),
   ]
   
   func delete(_ event: Event) {
      events.removeAll() { $0.id == event.id}
   }
   
   func add(_ event: Event) {
      events.append(event)
   }
   
   func exists(_ event: Event) -> Bool {
      events.contains(event)
   }
   
   func sortedEvents(period: Period) -> Binding<[Event]> {
      Binding<[Event]>(
         get: {
            self.events
               .filter {
                  switch period {
                     case .nextSevenDays:
                        return $0.isWithinSevenDays
                     case .nextThirtyDays:
                        return $0.isWithinSevenToThirtyDays
                     case .future:
                        return $0.isDistant
                     case .past:
                        return $0.isPast
                  }
               }
               .sorted { $0.date < $1.date }
         },
         set: { events in
            for event in events {
               if let index = self.events.firstIndex(where: { $0.id == event.id }) {
                  self.events[index] = event
               }
            }
         }
      )
   }
}

enum Period: String, CaseIterable, Identifiable {
   case nextSevenDays = "Next 7 Days"
   case nextThirtyDays = "Next 30 Days"
   case future = "Future"
   case past = "Past"
   
   var id: String { self.rawValue }
   var name: String { self.rawValue }
}

extension Date {
   static func from(month: Int, day: Int, year: Int) -> Date {
      var dateComponents = DateComponents()
      dateComponents.year = year
      dateComponents.month = month
      dateComponents.day = day
      
      let calendar = Calendar(identifier: .gregorian)
      if let date = calendar.date(from: dateComponents) {
         return date
      } else {
         return Date()
      }
   }
   
   static func roundedHoursFromNow(_ hours: Double) -> Date {
      let exactDate = Date(timeIntervalSinceNow: hours)
      guard let hourRange = Calendar.current.dateInterval(of: .hour, for: exactDate) else {
         return exactDate
      }
      return hourRange.end
   }
}
