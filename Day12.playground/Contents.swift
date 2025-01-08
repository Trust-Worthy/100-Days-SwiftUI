import Cocoa


/**
 * @Author: Trust-Worthy
 * 100 Days of Swift UI: Day 12
 * Topic: Classes & inheritance in Swfit
 *
 */


/// How classes are similar to structs in Swift
/// 1. You can name and create
/// 2. add props, methods, prop observers, access controls
/// 3. Create custom initializers to configure new instances

/// How classes are different to structs in Swift
/// 1. You can make one class build upon the functionality of another class --> Inheritance
/// 2. Swift won't generate memberwise initializer for classes automatically
/// 3. If you copy an instance of a class, both copies share the same data
/// 4. Can create a special function called a deinitializer to run when the final copy is destroyed
/// 5. Constant class instances can have their variable properties changed

/// Point 3 is especially important for Swfit UI. Ex: A user changes their name in one place --> You want that name to change everywhere else too.
/// Deinitializer allows for all data and references to that data to be removed

/// First class
/// The only difference between this class and a struct called came is literally the keyword
class Game {
    var score = 0 {
        didSet {
            print("Score is now \(score)")
        }
    }
}

var newGame = Game()
newGame.score += 10

/// Inheritance
/// syntax --> childClass:parentClass

class Employee { // Parent class
    let hours: Int
    init (hours:Int ){
        self.hours = hours
    }
    
    func printSummary() {
        print("I work \(hours) a day ")
    }
}

final class Developer:Employee { // Child class // Good to make things final by default and open it up when ready
    func work() {
        print("I'm writing code as a chad dev for \(hours) hours")
        // can use hours property because it inherits the Employee parent
    }
    /// Overrinding a function from the parent class Employee
    override func printSummary() {
        print("I'm an inneficient dev that works \(hours) day but just chills")
    }
}

final class Manager:Employee { // Child class 2 //final keyword means that Manager can inherit from other classes but nothing can inherit from manager
    func work(){
        print("I'm managing all the devs that don't do any work for \(hours)")
        // can use hours property because it inherits the Employee parent
    }
}

let rob = Developer(hours: 8)
let jo = Manager(hours: 10)

rob.work()
jo.work()

let honey = Developer(hours: 12)
honey.printSummary()

/// How to add initializers for classes
/// If a child class has any custom initalizers it must always call the Parents initializers after its finished setting up its own properties

class Vehicle {
    let isElectric: Bool
    
    init(isElectric: Bool) {
        self.isElectric = isElectric
    }
}

class Car:Vehicle { /// If a child class doesn't have any initializers it will auto inherit the initializers from its parent
    let isConvertible: Bool
    
    init(isElectric:Bool,isConvertible: Bool) {
        self.isConvertible = isConvertible
        super.init(isElectric: isElectric) /// Must call parents initializers
    }
}

let teslaX = Car(isElectric: true, isConvertible: true)

