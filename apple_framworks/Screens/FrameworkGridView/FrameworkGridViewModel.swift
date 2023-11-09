//
//  FrameworkGridViewModel.swift
//  apple_framworks
//
//  Created by yusufyakuf on 2023-10-04.
//

import SwiftUI

final class FrameworkGridViewModel: ObservableObject {

    var selectedFramework: Framework? {
        didSet {isShowingDetailView = true}
    }
    @Published var isShowingDetailView = false
    
    let columns: [GridItem] = [GridItem(.flexible()),
                               GridItem(.flexible()),
                               GridItem(.flexible())
    ]
}
