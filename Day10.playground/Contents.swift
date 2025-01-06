import Cocoa

/**
 * Author: Trust-Worthy
 * Date: 2/5/2025
 * 100 Days of SwiftUI Day 10
 *
 * Lesson: Structs
 */

// Structs in swift are very similar to structs in C
struct Album {
    let title: String
    let artist: String
    let year: Int
    
    func printSummary() {
        print("\(title) (\(year)) by \(artist)")
    }
}

let andy = Album(title: "The Arrow", artist: "Andy Mineo", year: 2018)
let lecrae = Album(title: "Restoration", artist: "Lecrae", year: 2020)

andy.printSummary()
lecrae.printSummary()


struct Employee {
    let name: String // becomes fully constant so you can't change it
    var vacayRemain: Int = 23 // default value
    
    // must use mutating if a variable will be changed via a func inside a struct
    mutating func takeVacation(days: Int) {
        if vacayRemain > days {
            vacayRemain -= days
            print("I'm going on vacation")
            print("Days remaining: \(vacayRemain)")
        } else {
            print("Oops!  NO more days left")
        }
    }
}

var bro = Employee(name: "bro", vacayRemain: 13)
bro.takeVacation(days: 5)

print(bro.vacayRemain)
print("_____________________________________")
// How to compute property values dynamically

struct EmployeeEx2 {
    let name: String
    var vacayAllocated = 14
    var vacationTaken = 0
    
    /// Dynamically calculated property
    /// This automatically updates whenever vacayAllocated or vacationTaken changes
    var vacationRemaining: Int {
        // create 'getter' for vacationRemaining
        // reading value
        get {
            vacayAllocated - vacationTaken
        }
        // writing value
        set {
            vacayAllocated = vacationTaken + newValue
            
        }
    }
    
}

var jim = EmployeeEx2(name: "Jim")
jim.vacationTaken += 4
jim.vacationRemaining = 5
print(jim.vacayAllocated)


print("_____________________________")

// How to take action when a property changes
// Property Observers

struct Game {
    var score = 0 {
        /// Property observer didSet
        /// Whenever score changes
        didSet {
            print("Score is now \(score)")
        }
    }
}

var game = Game()
game.score += 10
game.score -= 3
game.score += 1

struct App {
    var contacts = [String]() {
        /// Don't put too much work in property observers
        willSet {
            print("Current value is \(contacts)")
            print("New value will be: \(newValue)")
        }
        
        didSet {
            print("There are now \(contacts.count) contacts")
            print("Old value was: \(oldValue)")
        }
    }
}

var app = App()
app.contacts.append("Due")
app.contacts.append("Drew")
app.contacts.append("Heater")


print("_______________________________")
/// Creating custom initializers
/// 1 Rule: must ensure every property in struct has a value once initialized

struct Player {
    let name: String
    let number: Int
    
    /// This next part reminds of python
    /// but no func keyword, not return type, use self like in Python
    /// all values must be initialized after running init
    init (name:String) {
        self.name = name
        self.number = Int.random(in: 1...99)
    }
    
    
}

let player = Player(name: "June")
print(player.number)
