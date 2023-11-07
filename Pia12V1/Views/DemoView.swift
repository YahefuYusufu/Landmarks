//
//  DemoView.swift
//  Pia12V1
//
//  Created by yusufyakuf on 2023-10-30.
//

import SwiftUI

struct DemoView: View {
    var body: some View {
        VStack{
            HStack {
                
                VStack {
                                    
                }
                .frame(width: 100,height: 100)
                .background(.white)
                .cornerRadius(50)
                .padding(.leading,50)
                
                    Spacer()
                VStack {
                    Text("Rubriken")
                        .font(.title)
                        .foregroundColor(.white)
                    Text("UnderRubriken")
                        .font(.title3)
                        .foregroundColor(.white)
                }
                Spacer()
            }
            
            .frame(maxWidth: .infinity)
            .frame(height: 200)
            .background(.blue)
            Spacer()
            HStack {
                Spacer()
                Button(action: {
                    //Action
                }, label: {
                    Text("Button")
                        .font(.largeTitle)
                        .foregroundColor(.white)
                })
                .padding(.trailing)
            }
            .frame(maxWidth: .infinity)
            .frame(height: 100)
            .background(.cyan)
        }
        
        
            
    }
}

#Preview {
    DemoView()
}
