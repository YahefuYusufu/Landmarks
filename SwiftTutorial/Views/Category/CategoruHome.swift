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
            List {
                modelData.features[0].image
                    .resizable()
                    .scaledToFill()
                    .frame(height: 200)
                    .clipped()
                    .listRowInsets(EdgeInsets())
                ForEach(modelData.categories.keys.sorted(),id: \.self){ key in
                    CategoryRow(categoryName:key,items:modelData.categories[key]!)
            }
                .listRowInsets(EdgeInsets())
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
