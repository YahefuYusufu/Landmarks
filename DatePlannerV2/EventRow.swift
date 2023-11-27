//
//  EventRow.swift
//  DatePlannerV2
//
//  Created by yusufyakuf on 2023-11-15.
//

import SwiftUI

struct EventRow: View {
   let event: Event
   
    var body: some View {
       HStack {
          Image(systemName: event.symbol)
             .sfSymbolStyling()
             .foregroundColor(event.color)
          
          VStack(alignment: .leading, spacing: 5) {
             Text(event.title)
                .fontWeight(.bold)
             
             Text(event.date.formatted(date: .abbreviated, time: .shortened))
                .font(.caption2)
                .foregroundStyle(.secondary)
          }
          if event.isComplete {
             Spacer()
             Image(systemName: "person")
                .foregroundStyle(.secondary)
          }
       }
       .badge(event.remainingTaskCount)
    }
}

#Preview {
   EventRow(event: Event.example)
}
