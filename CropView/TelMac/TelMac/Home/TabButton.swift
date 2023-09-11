//
//  TabButton.swift
//  Telegram_MacApp
//
//  Created by tongbin的mac on 2023/9/10.
//

import SwiftUI

struct TabButton: View {
    
    var image:String
    var title:String
    @Binding var selectedTab: String
    
    var body: some View {
        Button {
            withAnimation {
                selectedTab = title
            }
        } label: {
            VStack(spacing: 7) {
                Image(systemName: image)
                    .font(.system(size: 16, weight: .semibold))
                    .foregroundColor(selectedTab == title ? .white : .gray)
                
                Text(title)
                    .font(.system(size: 11,weight: .semibold))
                    .foregroundColor(selectedTab == title ? .white : .gray)
            }
            .padding(.vertical, 8)
            .frame(width: 70)
            .contentShape(Rectangle())
            .background(Color.primary.opacity(selectedTab == title ? 0.15 : 0))
            .cornerRadius(10)
        }
        .buttonStyle(PlainButtonStyle()) 
    }
        
}

//struct TabButton_Previews: PreviewProvider {
//    static var previews: some View {
//     }
//}
