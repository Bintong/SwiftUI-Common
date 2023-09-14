//
//  Message.swift
//  TelMac
//
//  Created by tongbin的mac on 2023/9/11.
//

import Foundation


struct RecentMessage : Identifiable  {
    
    
    var id = UUID().uuidString
    var lastMsg : String
    var lastMsgTime : String
    var pendingMsgs : String
    var userName : String
    var userImage : String
    var allMsgs: [Message]
}


var recentMsgs: [RecentMessage] = [
    
    RecentMessage ( lastMsg: "Apple Tech", lastMsgTime: "15:00", pendingMsgs: "9", userName:
    "Justine", userImage: "7", allMsgs: Eachmsg.shuffled()),
    RecentMessage (lastMsg: "New Album Is Going To Be Released!!!!", lastMsgTime: "14:32", pendingMsgs: "2", userName: "Taylor", userImage: "13", allMsgs: Eachmsg.shuffled ()),
    RecentMessage ( lastMsg: "Apple Tech", lastMsgTime: "15:00", pendingMsgs: "9", userName:
    "Justine", userImage: "11", allMsgs: Eachmsg.shuffled()),
    RecentMessage (lastMsg: "New Album Is Going To Be Released!!!!", lastMsgTime: "14:32", pendingMsgs: "2", userName: "Taylor", userImage: "19", allMsgs: Eachmsg.shuffled ()),
    RecentMessage ( lastMsg: "Apple Tech", lastMsgTime: "15:00", pendingMsgs: "9", userName:
    "Justine", userImage: "13", allMsgs: Eachmsg.shuffled()),
    RecentMessage (lastMsg: "New Album Is Going To Be Released!!!!", lastMsgTime: "14:32", pendingMsgs: "2", userName: "Taylor", userImage: "99", allMsgs: Eachmsg.shuffled ()),
    RecentMessage ( lastMsg: "Apple Tech", lastMsgTime: "15:00", pendingMsgs: "9", userName:
    "Justine", userImage: "20", allMsgs: Eachmsg.shuffled()),
    RecentMessage (lastMsg: "New Album Is Going To Be Released!!!!", lastMsgTime: "14:32", pendingMsgs: "2", userName: "Taylor", userImage: "102", allMsgs: Eachmsg.shuffled ())
    
]
