//
//  PropertyStatusWidget.swift
//  PropInvest AI
//
//  Created by Danilo Urrutia on 2/9/26.
//
import SwiftUI

struct PropertyStatusWidget: View {
    let propertyStatus: Int
    var body: some View {
        if(propertyStatus < 2) {
            Text(formatStatusText())
                .font(.caption2).bold()
                .padding(.horizontal, 6)
                .padding(.vertical, 3)
                .background(formatStatusColor())
                .foregroundColor(.white)
                .clipShape(Capsule())
        }
        Spacer()
        Button {
            // Favorite action
        } label: {
            Image(systemName: "heart")
                .foregroundColor(.white)
                .padding(8)
                .background(Color.black.opacity(0.4))
                .clipShape(Circle())
        }
    }
    
    private func formatStatusText() -> String {
        switch propertyStatus {
        case 0:
            return "New Property"
        case 1:
            return "Reduced Property"
        default:
            return ""
        }
    }
    private func formatStatusColor() -> Color {
        switch propertyStatus {
        case 0:
            return Color.red
        case 1:
            return Color.purple
        default:
            return Color.green
        }
    }
}
