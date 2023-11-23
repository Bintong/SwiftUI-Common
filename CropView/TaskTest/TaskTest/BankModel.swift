//
//  File.swift
//  TaskTest
//
//  Created by tongbin的mac on 2023/11/21.
//

import Foundation

actor BankAccount {
    private var balance: Int
    
    init(initialBalance: Int) {
        balance = initialBalance
    }
    
    func deposit(amount: Int) {
        balance += amount
    }
    
    func withdraw(amount: Int) -> Int {
        if balance >= amount {
            balance -= amount
            return amount
        } else {
            let available = balance
            balance = 0
            return available
        }
    }
    
    func balanceConfig() -> Int {
        return self.balance
    }
}



actor CircleCount {
    private var count: Int
    
    init(initcount: Int) {
        count = initcount
    }
    func countPlus() {
        count += 1
    }
    
    func countSubtract() {
        count -= 1
    }
    
    func countConfig() -> Int {
        return self.count
    }
}
