//
//  Foot.swift
//  AnimatedHeader
//
//  Created by tongbin的mac on 2023/9/8.
//

import Foundation
import SwiftUI


struct Food: Identifiable {
    var id = UUID().uuidString
    var title : String
    var description: String
    
    var price: String
    var image: String
}

var foods = [
    Food(title: "Choklate Cake", description: "Chocolate cake or chocolate gateau is a cakeflavored with melted chocolate, cocoa powder, or both", price: "$19", image:"choclates"),
    Food(title: "Cookies", description: "A biscuit is a flour-based baked food product. OutsideNorth America the biscuit is typically hard, flat, and unleavened", price: "$10",image:"cookies"),
    Food(title: "Sandwich", description: "Trim the bread from all sides and apply butter on onebread, then apply the green chutney all over.", price: "$9" , image: "sandwich"),
    Food(title: "French Fries", description: "French fries, or simply fries, chips, fingerchips, or French-fried potatoes, are batonnet or allumette-cut deep-fried potatoes",price: "$15", image: "fries"),
    Food(title: "pizza", description: "pizza is a savory dish of Italian origin consisting of ausually round, flattened base of leavened wheat-based dough topped", price:"$39" ,image: "pizza")
]


