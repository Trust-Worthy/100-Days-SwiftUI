import Cocoa

/**
 * @Author: Trust-Worthy
 * 100 Days of SwiftUI Day 11
 * Topic: Structs Part 2 & Access Controls
 */

struct BankAccount {
    var funds = 0
    
    mutating func deposit(amount:Int) {
        funds += amount
    }
    
    mutating func withdraw(amount:Int) -> Bool{
        if funds > amount {
            funds -= amount
            return true
        } else {
            return false
        }
    }
}
// Testing out the struct functionality

var account = BankAccount()

let success = account.withdraw(amount: 200)

if success {
    print("Withdrew money successfully")
} else {
    print("Failed to get the money")
}
