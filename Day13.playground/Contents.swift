import Cocoa

/**
 * @Author: Trust-Worthy
 * 100 Days of SwiftUI: Day 13
 * Topic: Protocols in Swift
 */

/// Protocols are like outlies. Kinda like header files in C?
/// Protocols allow us to specify functionality instead of exact types
protocol Vehicle { /// Protocol is a unique type
    /// List all the methods and properties
    var name: String { get }  // read only
    var currentPassengers: Int {get set } // read and write
    func estimateTime (for distance: Int) -> Int
    func travel(distance: Int)
}
/// You can adopt multiple protocols just by listing them
protocol CanBeElectric {
    
}

/// Adopting or conforming to the protocol...
/// If you want to inherit from a parent, put parent first then protocols to conform to
struct Car:Vehicle,CanBeElectric { /// :Vehicle -> "struct Car conforms to vehicle protocol"
    let name:String = "Whoopty"
    var currentPassengers:Int = 1
    
    func estimateTime(for distance: Int) -> Int {
        distance / 50
    }
    func travel(distance: Int) {
        print("I'm driving \(distance)km")
    }
    // New method not included in the protocol
    func openSunroof() {
        print("It's a nice day!")
    }
}

struct Bicycle: Vehicle {
    let name: String = "Bicycle"
    var currentPassengers: Int = 1
    
    func estimateTime(for distance: Int) -> Int {
        distance / 10
    }
    func travel(distance: Int) {
        print("I'm cycling \(distance)km")
    }
}

func commute(distance: Int, using vehicle:Vehicle) { // We can use a generic vehicle for the param
    
    /// This function can use any type of data as long as it conforms to Vehicle protocol
    /// Both bicycle and car can be used here
    /// As long as vehicle can estimate time and travel
    if vehicle.estimateTime(for: distance) > 100 {
        print("That's too slow... I'll try a diff vehicle")
    } else {
        vehicle.travel(distance: distance)
    }
}
func getTravelEstimates(using vehicles: [Vehicle],distance:Int) {
    for vehicle in vehicles {
        let estimate = vehicle.estimateTime(for: distance)
        print("\(vehicle.name): \(estimate) hours to travel \(distance)km")
    }
}

let car = Car()
commute(distance: 100, using: car)

let bike = Bicycle()
commute(distance: 50, using: bike)

getTravelEstimates(using: [car,bike], distance: 200)

/// How to use opaque return types --> Help to reduce complexity
/// Every SwiftUI uses opaque return types that's why we're learning it


func getRandomNumber() -> some Equatable { /// Can't return equatable. key to understanding opaque return types
    Int.random(in: 1...6) /// Swift knows an integer will be returned from this function
    /// There is flexibility to change this to Double etc etc
}
/// You can return protocols from functions. It's a helpful thing to do
func getRandomBool() -> some Equatable { /// must use some keyword
    Bool.random()
}
/// I can also return for example ... some Vehicle. A spcific type of some Vehicle. That makes sense to me
/// Equatable protocol allows us to use == to compare two instances of the same type

print(getRandomNumber() == getRandomNumber())

/// Returning protocols allow us to hide information kinda like ADT in C. You don't touch the actual struct in C when you just return a pointer to it
/// Opaque return types allow us to hide information in our code, but not from the Swift Compiler

/// The "return type" for our layout is a bunch of different tyings: colors, boxes, etc. Instead, we can use an Equatable so we don't have to write
/// return #431234 , box etc etc or else you would have to change it every time you want to see something different on the screen


protocol View { } /// Used for some kind of thing we want to appear on the screen
/// "Return some kind of View" an equatable. The compiler knows exactly what we're returning.

