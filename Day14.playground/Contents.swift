import Cocoa

/**
 * @Author: Trust-Worthy
 * 100 Days of SwiftUI: Day 14
 * Topic: Optionals, nil coalescing, and checkpoint 9
 */


/// How to handle missing data with optionals

let opposites = ["Mario":"Wario","Luigi":"Waluigi"]

let peachOpposite = opposites["Peach"] /// What value will peachOpposite have if Peach doesn't exist in dictionary

// How to handle missing data with optionals

if let marioOpposite = opposites["Mario"] { // if let means we unwrap and check. if there is a value, then it's placed in the variable
    print("Mario's opposite is \(marioOpposite).") // will execute if there is a value inside marioOpposite
}

var username: String? = nil

if let unwrappedName = username {
    print("We got a user: \(unwrappedName)")
} else {
    print("The optional was empty.")
}

var num1 = 1_000_000
var num2 = 0
var num3: Int? = nil

var str1 = "Hello"
var str2 = ""
var str3: String? = nil

var arr1 = [0]
var arr2 = [Int]() /// This is definitely an integer array there just isn't anything inside of it
var arr3: [Int]? = nil /// Optionals: maybe it has a value, maybe it doesn't

func square(num: Int) -> Int {
    num * num
}

var number: Int? = nil

if let unwrappedNumber = number {
    
    print(square(num: unwrappedNumber)) /// This throws an error because the square func expects a non-optional integer.
    ///But now I placed it in an optional. Before it was just: print(square(num: number))
}

var number2: Int? = nil
/// It's the style and standard in swift to name the unwrapped version of a variable the same thing
if let number2 = number2 {
    print(square(num: number2)) /// Shadowing: unwrapped optional is only in the context of the brackets
}
