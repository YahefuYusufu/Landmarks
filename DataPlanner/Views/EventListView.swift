//
//  EventListView.swift
//  DataPlanner
//
//  Created by yusufyakuf on 2023-11-08.
//

import SwiftUI

struct EventListView: View {
   @EnvironmentObject var eventData: EventData
   @State private var isAddingNewEvent = false
   @State private var newEvent = Event()
   
   var body: some View {
      List {
         ForEach(Period.allCases) { period in
            if !eventData.sortedEvents(period: period).isEmpty {
               Section(content: {
                  ForEach(eventData.sortedEvents(period: period)) { $event in
                     NavigationLink {
                        EventEditorView(event: $event)
                     } label: {
                        EventRowView(event: event)
                     }
                     .swipeActions {
                        Button(role: .destructive) {
                           eventData.delete(event)
                        } label: {
                           Label("Delete", systemImage: "trash")
                        }
                     }
                  }
               }, header: {
                  Text(period.name)
                     .font(.callout)
                     .foregroundColor(.secondary)
                     .fontWeight(.bold)
               })
            }
         }
      }
      .navigationTitle("Plan something here🍺🍺")
      .toolbar {
         ToolbarItem {
            Button {
               newEvent = Event()
               isAddingNewEvent = true
            } label: {
               Image(systemName: "plus")
            }
         }
      }
      .sheet(isPresented: $isAddingNewEvent) {
         NavigationView {
            EventEditorView(event: $newEvent, isNew: true)
         }
      }
   }
}

struct EventList_Previews: PreviewProvider {
   static var previews: some View {
      NavigationView {
         EventListView().environmentObject(EventData())
         
      }
   }
}
