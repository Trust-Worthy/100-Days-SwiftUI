import UIKit



let card: Int = 9
let card2: Int = 2

if card > card2 {
    print("Card 1 is larger than card 2")
}

// functions

func printHelp() {
    let message: String = "help help help SOS"
    
    print(message)
}

printHelp()

func square(num number: Int) {
    print(number * number)
}
square(num: 33)

func squareRet(num number: Int) -> Int {
    return number * number
}

func sayHello(to name: String) {
    print("Hello, \(name)!")
}

sayHello(to: "jom")

func greet(_ person: String, nicely: Bool = true) {
    if nicely {
        print("Kind hello to you \(person)")
    }
    else {
        print("UZ a mean person \(person)")
    }
}

greet("Jimmy", nicely: false)

// Variadic function

func squareMany(numbers: Int...) {
    for num in numbers {
        print("\(num) squared is \(num * num)")
    }
}

squareMany(numbers: 1,2,3,4,5)

// throwing functions

enum PasswordError: Error {
    case obvious
}

func checkPassword(_ password: String) throws -> Bool{
    if password == "password" {
        throw PasswordError.obvious
    }
    return true
}


do {
    try checkPassword("password")
    print("taht password is great!")
    
} catch {
    print("You can't use that password.")
}

// inout params

func doubleInPlace(number: inout Int) {
    number *= 2
}

var myNUm: Int = 10

doubleInPlace(number: &myNUm)
print(myNUm)

// closures

let driving = {
    print("I'm driving in my car")
}

driving()

let drivingParam = { (place: String) in
    print("I'm going to \(place) in my car")
    
}
drivingParam("London")

let drivinReturn = { (place: String ) -> String in
    var message: String = "I'm going to \(place) in my car"
    return message
}

let ret: String = drivinReturn("Argnetina")
print(ret)


let drivingClo = {
    print("I'm driving in my car")
}

func travel(action: ()-> Void) {
    print("I'm getting ready to go.")
    action()
    print("I arrived!")
}

travel(action: driving)

// trailing closure syntax
// If the last parameter to a function is a closure, swift lets you use special syntax
// called "trailing closure syntax"
func travelDos(action: () -> Void) {
    print("I'm getting ready to go.")
    action()
    print("I arrived!")
}


travelDos {
    print("This is a trailing closure.")
}

// using closures as parameters when they accept parameters
func travelBruh
