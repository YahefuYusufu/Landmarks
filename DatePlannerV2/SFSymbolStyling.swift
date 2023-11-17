//
//  SFSymbolStyling.swift
//  DatePlannerV2
//
//  Created by yusufyakuf on 2023-11-15.
//

import SwiftUI

struct SFSymbolStyling: ViewModifier {
   func body(content: Content) -> some View {
      content
         .imageScale(.large)
         .symbolRenderingMode(.monochrome)
   }
}

extension View {
   func sfSymbolStyling() -> some View {
      modifier(SFSymbolStyling())
   }
}
