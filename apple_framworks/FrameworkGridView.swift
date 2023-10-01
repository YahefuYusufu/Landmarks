//
//  FrameworkGridView.swift
//  apple_framworks
//
//  Created by yusufyakuf on 2023-10-01.
//

import SwiftUI

struct FrameworkGridView: View {
    var body: some View {
        VStack{
            Image("app-clip")
                .resizable()
                .frame(width: 90,height: 90,alignment: .center)
        Text("App Clip")
                .font(.title2)
                .fontWeight(.semibold)
                .scaledToFit()
                .minimumScaleFactor(0.6)
                
        }
    }
}

#Preview {
    FrameworkGridView()
}
