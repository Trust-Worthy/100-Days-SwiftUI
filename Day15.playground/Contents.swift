import Cocoa

/**
 *
 * @Author: Trust-Worthy
 * 100 Days of SwiftUI: Day 15
 * Topic: Review!
 */

/// Throwing error from function review

enum PasswordError: Error {
    case short,obvious
}

func checkPassword(_ password:String) throws -> String {
    if password.count < 5 {
        throw PasswordError.short
    }
    if password == "12345" {
        throw PasswordError.obvious
    }
    
    if password.count < 10 {
        return "OK"
    } else {return "Good"}
}

do {
    let result = try checkPassword("12345")
    print("Rating \(result)")
} catch PasswordError.obvious {
    print("I have the same password on my luggage!")
} catch {
    print("There was an error.")
}

/// Closures Review: I really need this

let sayHello = { (name: String) -> String in
    "Hi \(name)"
}
let aye = sayHello("bro") /// Remember, closures kinda reminds me of function pointers in C at the most basic level.
print(aye)

let team = ["Gloria","Jaime","Gunter","Gus","Jack","Bub","Doug"]

let onlyG = team.filter( { (name: String) -> Bool in
    return name.hasPrefix("G")
})

print(onlyG)


/// Computed properties

struct Employee {
    let name:String
    var vacationAllowed = 14
    var vacationTaken = 0
    
    /// computed property
    /// calculated dynamically
    var vacationRemaining: Int {
        get {
            vacationAllowed - vacationTaken
        }
        
        set {
            vacationAllowed = vacationTaken + newValue
        }
    }
    
    
}
