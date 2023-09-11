//
//  RecentMessage.swift
//  TelMac
//
//  Created by tongbin的mac on 2023/9/11.
//

import Foundation



struct Message:Identifiable,Equatable {
    var id = UUID().uuidString
    var message : String
    var myMessage : Bool
}

var Eachmsg = [
    Message(message: "New Album Is Going To Be Released!!!!", myMessage: false),
    Message(message:"Discover the innovative world of Apple and shop everything iPhone, ipadApple Watch, Mac, and Apple TV, plus explore accessories, entertainment!!!", myMessage:false),
    Message(message: "Amazon,in: Online Shopping India - Buy mobiles, laptops, cameras, bookswatches, apparel, shoes and e-Gift Cards,", myMessage: false),
    Message(message: "SwiftUI is an innovative, exceptionally simple way to build userinterfaces across all Apple platforms with the power of Swift, Build user interfacesfor any Apple device using just one set of tools and APIs.", myMessage: true),
    Message(message: "At Microsoft our mission and values are to help people and businessesthroughout the world realize their full potential,!!!!", myMessage: false),
    Message(message: "Firebase is Google's mobile platform that helps you quickly develophigh-qualityapps and grow your business.",myMessage: true),
    Message(message: "Kavsoft - SwiftUI Tutorials - Easier Way To Learn SwiftUI With  Downloadble Source Code.!!!!" ,myMessage: true)
]
