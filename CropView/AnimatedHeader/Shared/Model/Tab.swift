//
//  Tab.swift
//  AnimatedHeader
//
//  Created by tongbin的mac on 2023/9/8.
//

import Foundation


struct Tab: Identifiable {
    var id = UUID().uuidString
    var tab: String
    var foods: [Food]
}

var tabsItems = [
    Tab(tab: "Order Again", foods: foods .shuffled()),
    Tab( tab: "Picked For You", foods: foods.shuffled()),
    Tab(tab: "Starters", foods: foods .shuffled()),
    Tab( tab: "Gimpub Sushi", foods: foods . shuffled())
]
