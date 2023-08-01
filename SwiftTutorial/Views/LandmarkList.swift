//
//  LandmarkList.swift
//  SwiftTutorial
//
//  Created by yusufyakuf on 2023-07-31.
//

import SwiftUI

struct LandmarkList: View {
    @State private var showFavoritesOnly = false
    
    var filteredLandmarks : [Landmark] {
        landmarks.filter {landmark in
            (!showFavoritesOnly || landmark.isFavorite)
        }
    }
    
    var body: some View {
        NavigationView{
            List{
                Toggle(isOn: $showFavoritesOnly){
                    Text("Favorites Only")
                }
            ForEach(filteredLandmarks) { landmark in
                NavigationLink {
                    LandmarkDetail(landmark: landmark)
                } label: {
                LandmarkRow(landmark: landmark)
                }
            }
            }
            
            .navigationTitle("Landmark")
        }
    }}

struct LandmarkList_Previews: PreviewProvider {
    static var previews: some View {
              LandmarkList()
          }
      }

