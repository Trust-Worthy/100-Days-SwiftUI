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


/// How to unwrap optionals with guard

func printSquare(of number: Int?) {
    guard let number = number else { /// Unwrap number into shadow content else print "missing input"
        print("Missing input")
        return
    }
    
    print("\(number) x \(number) is \(number * number)")
}

/// if let vs guard let

var myVar: Int? = 3

if let unwrapped = myVar {
    /// Run if myVar has a value inside
}

//guard let unwrapped = myVar else {
//    /// Run if myVar doesn't have a value inside
//    throw Error
//}

/// Swift requires a return if the guard check fails
/// if optional passed it's made available after the guard check


/// How to unwrap optionals with nil coalescing
/// nil coalescing attemps to unwrap a value. if it's empty it will provide a default value

let captains = [
    "Enterprise":"Picard",
    "Voyager": "Janeway",
    "Defiant": "Sisko"
]

let new = captains["Serenity"] ?? "N/A" /// There won't be a value. If there isn't a value it will send back "N/A"
/// ["Serenity",default: "N/A"] also works

let tvShows = ["Arrow","Flash","Legends of Tomorrow"]
let favorite = tvShows.randomElement() ?? "None" // randomElement return an optional

struct Book {
    let title: String
    let author: String?
}

let book = Book(title: "Hebrews", author: nil)
let author = book.author ?? "Anonymous" /// Another example of using

print(author)

let input = ""
let convertedNumber = Int(input) ?? 0
print("The string was the number \(convertedNumber)")

/// How to handle multiple optionals using optional chaining

let names = ["Jim","Ben","Becky","Jessica"]
let chosen = names.randomElement()?.uppercased() ?? "No one" /// Optional chaining. if there is a random element then run uppercased.
/// As soon as any part of the chain sends back nil, the whole thing breaks down. You could create long queries to ensure the value is "safe"
print("Next in line: \(chosen)")

/// Better example: optional instance of book struct
/// The book might have an author or the book might be anonymous
/// If if has an author, attempt to read the first letter
/// If the first letter is there, uppercase it.

var book2: Book? = nil
let authorOfBook = book2?.author?.first?.uppercased() ?? "A"
print(authorOfBook)

/// How to handle function failure with optionals
/// Don't use try? if you want to know the exact error that was thrown

enum UserError: Error {
    case badID, networkFailed
}

func getUser(id: Int) throws -> String {
    throw UserError.networkFailed
}

if let user5 = try? getUser(id: 23) {
    print("User: \(user5)")
}

/// Using nil coalescing with the try? operator
let user = (try? getUser(id: 23)) ?? "Anonymous" /// If getUser fails use "Anonymous"
print(user)

/// Summary of today's learnings
/// Optionals allow us to represent the absence of data
/// everything that isn't an optional def has a value inside
/// unqrapping looks inside the opitonal: if there's a vlaue it's sent back
/// if let runs code if the optional has a value
/// guard let runs code if the optional doesn't have a value
/// ?? unwraps and returns an optional's value: or a default value instead
/// Optional chaining reads an optional inside another optional
/// try? can convert throwing functions so they return an optional
