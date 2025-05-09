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
    
    init(isConvertible: Bool) {
        self.isConvertible = isConvertible
        super.init(isElectric: true) /// Must call parents initializers
    }
}

let teslaX = Car(isConvertible: true)

/// How to copy classes
/// All copies of a class instance all point to the same piece of data
/// Changes to one copy change all of them
/// Classes are reference types --> refer to other shared pot of data

class User {
    var username = "Anonymous"
    
    /// To create a "deep copy"
    func copy() -> User {
        let user = User()
        user.username = username
        return user
    }
}

var user1 = User()
var user2 = user1
var user3 = user1.copy()
user2.username = "Taylor" /// Data changes for both of them --> allows us to share common data
/// structs do not share data across copies! This is very crucial
user3.username = "50 Cent"
print(user1.username)
print(user1.username)
print(user3.username)

/// Deinitializers and working with variables inside of classes

class UserEx2 {
    var name = "Paul"
}

var user = UserEx2() /// although the let keyword is being used here, the user itself isn't changing. just the data inside it
user.name = "Taylor"
print(user.name)

/// Change actual instance of user --> "moved the signpost" but if it was let user on line 135 we wouldn't be able to do this
user = UserEx2()
print(user.name)

/// Classes don't need mutating keyword to change properties

/// Deinitializers for classes
/// Deinitailizers never have params or return data
/// We never call deinitializers directly, the system does as needed
/// Struct don't have deinitializers

/// Example of a deinitializer being used when the last instance of class is destroyed
class UserEx3 {
    let id: Int
    
    init(id: Int) {
        self.id = id
        print("User \(id): I'm alive! ")
    }
    deinit { /// No parents
        print("User \(id): I'm destroyed :(")
    }
}
/// The classes will be initialized and deinitialized within the scope of this for loop
/// deinitializer will be activated when the last class inistance is destroyed
var users = [UserEx3]()

for i in 1...3 {
    let dude = UserEx3(id: i)
   
    print("User \(dude.id) is in control")
    users.append(dude)
    
}

print("Loop is done")
users.removeAll()
print("Array is clear")

/// Checkpoint 7
/// Requirements:
/// Make a class hierarchy for animals
/// Start with Animal. Add a legs property
/// Create a dog child with a speak method
/// Make a corgi , poodle , and subclss Dog.
/// Make Cat an Animals subclass. add a speak method and a isTame boolean set with an initializer
/// Make persion and lion subclasses of Cat

class Animals {
    var legs: Int
    
    init(legs: Int) {
        self.legs = legs
    }
}

class Dog:Animals {
    
    func speak(){
        print("I'm a dog and I bark... woof woof")
    }
}

class Corgi:Dog {
}
class Poodle:Dog {
}

class Cat:Animals {
    var isTame: Bool
    
    init(isTame: Bool,legs:Int) {
        self.isTame = isTame
        super.init(legs: legs)
    }
    
    func speak(){
        print("I'm a cat and I meow... MEOW MEOW MEOW")
    }
    
}

class Persian:Animals {}
class Lion:Animals {}
