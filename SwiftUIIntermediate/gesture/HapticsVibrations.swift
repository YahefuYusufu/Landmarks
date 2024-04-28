//
//  HapticsVibrations.swift
//  SwiftUIIntermediate
//
//  Created by prg on 2024-04-27.
//

import SwiftUI

class HapticManager {
    static let instance = HapticManager()
    
    func notification(type:  UINotificationFeedbackGenerator.FeedbackType) {
        let generator = UINotificationFeedbackGenerator()
        generator.notificationOccurred(type)
    }
    
    func impact(style: UIImpactFeedbackGenerator.FeedbackStyle) {
        let generator = UIImpactFeedbackGenerator(style: style)
        generator.impactOccurred()
    }
}

struct HapticsVibrations: View {
    
    
    var body: some View {
    
        VStack(spacing: 30) {
            HStack(spacing: 30) {
                Button("success") {
                    HapticManager.instance.notification(type: .success)
                }
                Button("warning") {
                    HapticManager.instance.notification(type: .warning)
                }
                Button("error") {
                    HapticManager.instance.notification(type: .error)
                }
                Divider()
            }
            HStack(spacing: 30) {
                Button("success") {
                    HapticManager.instance.impact(style: .soft)
                 }
                Button("warning") {
                    HapticManager.instance.impact(style: .light)
                 }
                Button("error") {
                    HapticManager.instance.impact(style: .heavy)
                 }
                Divider()
            }
        }
    }
}

#Preview {
    HapticsVibrations()
}
