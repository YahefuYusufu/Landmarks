//
//  CategoruHome.swift
//  SwiftTutorial
//
//  Created by yusufyakuf on 2023-08-05.
//

import SwiftUI

struct CategoruHome: View {
    @EnvironmentObject var modelData: ModelData
    
    var body: some View {
        NavigationView{
            List{
                ForEach(modelData.categories.keys.sorted(),id: \.self){ key in
            Text(key)
            }
            }
                .navigationTitle("Featured")
        }
        
    }
}

struct CategoruHome_Previews: PreviewProvider {
    static var previews: some View {
        CategoruHome()
            .environmentObject(ModelData())
    }
}
