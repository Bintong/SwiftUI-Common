//
//  Home.swift
//  Telegram_MacApp
//
//  Created by tongbin的mac on 2023/9/10.
//

import SwiftUI

var screen = NSScreen.main!.visibleFrame

struct Home: View {
    @StateObject var homeData = HomeViewModel()
    
    var body: some View {
        HStack {
            // tab
            VStack {
                TabButton(image: "message", title: "All Chats", selectedTab: $homeData.selectedTab)
                TabButton(image: "person", title: "Personal", selectedTab: $homeData.selectedTab)
                TabButton(image: "bubble.middle.bottom", title: "Bots", selectedTab: $homeData.selectedTab)
                TabButton(image: "slider.horizontal.3", title: "Edit", selectedTab: $homeData.selectedTab)
                Spacer()
                TabButton(image: "gear", title: "Settings", selectedTab: $homeData.selectedTab)
            }
            .padding()
            .padding(.top, 35)
            .background(BlurView())
            // tab content
            
            ZStack {
                switch homeData.selectedTab {
                case "All Chats": AllChatsView()
                case "Personal": Text("Personal")
                case "Bots": Text("Bot")
                case "Edit": Text("Edit")
                case "Settings": Text("Settings")
                default : Text("")
                }
            }
            .frame(maxHeight: .infinity)
            .frame(maxWidth: .infinity)
            Spacer()
        }
        .ignoresSafeArea(.all, edges: .all)
        .frame(width: screen.width / 1.2 ,height:  screen.height  - 60)
        .environmentObject(homeData)
        
        
        
    }
        
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
