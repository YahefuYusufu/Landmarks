//
//  FrameworkDetailView.swift
//  apple_framworks
//
//  Created by yusufyakuf on 2023-10-04.
//

import SwiftUI

struct FrameworkDetailView: View {
    var framework: Framework
    @Binding var isShowingDetailView: Bool
    @State private var isShowingSafariView = false
    
    var body: some View {
        VStack{
        
            XDismissButton(isShowingDetailView: $isShowingDetailView)
            
            Spacer()
            
            FrameworkTitleView(framework: framework)
            Text(framework.description)
                .font(.body)
                .padding()
            Spacer()
            Button {
                isShowingSafariView = true
            } label: {
            AFButton(title: "Learn More")
            }
        }
        .sheet(isPresented: $isShowingSafariView  , content: {
            SafariView(url: URL(string: framework.urlString)!)
        })
    }
}

#Preview {
    FrameworkDetailView(framework:MockData.sampleFramework
                        ,isShowingDetailView: .constant(false)
    )
    .preferredColorScheme(.dark)
}
