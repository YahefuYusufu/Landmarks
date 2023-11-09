//
//  SafariView.swift
//  apple_framworks
//
//  Created by yusufyakuf on 2023-10-07.
//

import SwiftUI
    //safari framework
import SafariServices

struct SafariView: UIViewControllerRepresentable {
    let url: URL
    func makeUIViewController(context: UIViewControllerRepresentableContext<SafariView>) ->
  
        SFSafariViewController {
            SFSafariViewController(url: url)
        }
        
        func updateUIViewController(_ uiViewController: SFSafariViewController, context: UIViewControllerRepresentableContext<SafariView>) {
            
        }
    }

