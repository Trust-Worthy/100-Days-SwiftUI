import Cocoa

/**
 * @Author: Trust-Worthy
 * 100 Days of SwiftUI Day 11
 * Topic: Structs Part 2 & Access Controls
 */

struct BankAccount {
    private(set) var funds = 0
    
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
// How do we prevent account.funds -= 1000... by making funds private. This is an access control.
// properties & methods are dictated by the access control: 
// private, fileprivate, public, private(set) "let anyone read, but only let my funcs modify"

var account = BankAccount()

let success = account.withdraw(amount: 200)

if success {
    print("Withdrew money successfully")
} else {
    print("Failed to get the money")
}

/// Static Properties and methods
/// Sometimes you want to add a property or method to the struct itself (not to an instance)
/// 1. Example data
/// 2. Store constant data that has to be accessed in various places of program


struct School {
    /// studentCount and add func belong to the School struct itself not to individual instances.
    /// One instance across all instances
    static var studentCount = 0
    
    static func add(student: String) {
        print("\(student) joined the school.")
        studentCount += 1 /// No mutating because this is a static function.
    }
}

School.add(student: "Taylor Swift") /// That's trippy. Adding data directly to the struct without an instance
print(School.studentCount) /// But it kinda makes sense because this is a school and you are adding students to the School struct

// 1. Acess non-static from static stuff... You can't. Doesn't make sense
// 2. Acess static stuff from a non-static instance. It's almost like the static makes it globally accessible from all instances.
// Self.studentCount --> current type of struct or School.studentCount
/// Self: current type of struct vs self: current values of struct

struct AppData {
    /// This fixed data below makes a lot of sense to make static
    static let version = "1.3 beta 2"
    static let saveFilename = "settings.json"
    static let homeURL = "https://myserv.com"
}

struct Employee {
    let username: String
    let password: String
    
    /// This is a use of a static field for displaying the data when working in swiftui
    /// Sometimes you want to SEE what you're coding.
    static let example = Employee(username: "useruseruser", password: "123412342")
}

/**
 * Checkpoint 6: Structs
 *
 *  Create a struct to store information about a car. Include:
 *  - Model -> I'm thinking make this static because it doesn't change
 *  - Number of seats -> I'm thinking make this static because it doesn't change
 *  - Current Gear -> Use a mutating function to validate the gear change and change it
 *  - Don't allow invalid gears
 */

struct Car {
    
    enum Gears:CaseIterable {
        case firstGear, secondGear, thirdGear, fourthGear,fithGear,sixthGear,seventhGear
    }
    
    static let model: String = "Audi S4"
    static let numSeats: Int = 5
    
    
     var currentGear: Gears {
        didSet {
            print("Gear just changed!")
        }
    }
    
    init(startingGear: Gears) {
        self.currentGear = startingGear
    }
    
    mutating func changeGear (gear: Gears) -> Void {
        
        currentGear = gear
        
    }
}

var vroom = Car(startingGear: .fithGear)
vroom.changeGear(gear: .fourthGear)

