//
//  HomeViewModel.swift
//  Telegram_MacApp
//
//  Created by tongbin的mac on 2023/9/11.
//

import Foundation


class HomeViewModel: ObservableObject {
    
    @Published var selectedTab = "All Chats"
    @Published var msgs : [RecentMessage] = recentMsgs
    
    
    // selected recent tab ..
    @Published var selectedRecentMsg : String? = recentMsgs.first?.id
    @Published var searchString = ""

}
