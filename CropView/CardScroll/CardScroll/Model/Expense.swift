//
//  Expense.swift
//  CardScroll
//
//  Created by tongbin的mac on 2023/11/7.
//

import Foundation


struct Expense: Identifiable {
    var id: UUID = UUID()
    var amountSpent: String
    var product: String
    var spendType:String
}

var expenses:[Expense] = [
    Expense(amountSpent: "$128", product: "Amazon Purchase", spendType: "Croceries"),
    Expense(amountSpent: "$10", product: "Youtube Premium", spendType: "Streaming"),
    Expense(amountSpent: "$10", product: "Dribbble", spendType: "Membership"),
    Expense(amountSpent: "$99", product: "Magic keyboard", spendType: "Products"),
    Expense(amountSpent: "$9", product: "Patreon", spendType: "Membership"),
    Expense(amountSpent: "$109", product: "Instagram", spendType: "Ad Publish"),
    Expense(amountSpent: "$13", product: "Netflix", spendType: "Streaming"),
    Expense(amountSpent: "$1358", product: "PhotoShip", spendType: "Editing"),
    Expense(amountSpent: "$88", product: "Figma", spendType: "Pro Member"),
    Expense(amountSpent: "$1100", product: "Magic Mouse", spendType: "Products"),
    Expense(amountSpent: "$39", product: "Studio Display", spendType: "Products"),
    Expense(amountSpent: "$33", product: "Sketch Subscription", spendType: "Membership"),
]
