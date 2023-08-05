//
//  CategoryItem.swift
//  SwiftTutorial
//
//  Created by yusufyakuf on 2023-08-05.
//

import SwiftUI

struct CategoryItem: View {
    var landmark: Landmark
    
    var body: some View {
        VStack(){
            landmark.image
                .resizable()
                .frame(width: 155,height: 155)
                .cornerRadius(7)
            Text(landmark.name)
                .font(.caption)
        }
        .padding(.leading,15)
    }
}

struct CategoryItem_Previews: PreviewProvider {
    static var previews: some View {
        CategoryItem(landmark: ModelData().landmarks[0])
    }
}
