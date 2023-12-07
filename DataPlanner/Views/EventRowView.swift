//
//  EventRowView.swift
//  DataPlanner
//
//  Created by yusufyakuf on 2023-11-08.
//

import SwiftUI

struct EventRowView: View {
   let event: Event
    var body: some View {
       HStack {
          Image(systemName: event.symbol)
             .sfSymbolStyling()
             .foregroundStyle(event.color)
          
          VStack(alignment: .leading,spacing: 5) {
             Text(event.title)
                .fontWeight(.bold)
             
             Text(event.date.formatted(date: .abbreviated, time: .shortened))
                .font(.caption2)
                .foregroundStyle(.secondary)
          }
          if event.isComplete {
             Spacer()
             Image(systemName: "checkmark")
                .foregroundStyle(.secondary)
          }
             
       }
       .badge(event.remainingTaskCount)
    }
}

#Preview {
   EventRowView(event: Event.example)
}
