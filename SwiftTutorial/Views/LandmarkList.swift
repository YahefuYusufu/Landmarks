//
//  LandmarkList.swift
//  SwiftTutorial
//
//  Created by yusufyakuf on 2023-07-31.
//

import SwiftUI

struct LandmarkList: View {
    var body: some View {
        NavigationView{
            List(landmarks){landmark in
                NavigationLink{
                    LandmarkDetail()
                } label: {
                LandmarkRow(landmark: landmark)
                }
            }
            
            navigationTitle("Landmarks")
        }
    }}

struct LandmarkList_Previews: PreviewProvider {
    static var previews: some View {
        LandmarkList()
    }
}
