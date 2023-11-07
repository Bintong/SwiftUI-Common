//
//  Card.swift
//  CardScroll
//
//  Created by tongbin的mac on 2023/11/7.
//

import SwiftUI
struct Card: Identifiable {
    var id: UUID = .init()
    var bgColor: Color
    var balance: String
}


var cards: [Card] = [
    Card(bgColor: .red, balance: "$125,06"),
    Card(bgColor:.blue, balance: "$25 000"),
    Card(bgColor:.orange, balance: "$25,808"),
    Card(bgColor:.purple, balance: "$5.000")
]

