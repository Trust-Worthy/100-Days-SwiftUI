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
func travelBruh(action: (String) -> Void) {
    print("Getting ready to go")
    action("London Bruv")
    print("I arrived!!!!")
}


// This is just straight diabolical syntax dog...
travelBruh { (place: String) in
    print("I am going to \(place) in my car")
}

// using closures as params when they return values
func travelRet(action: (String) -> String) {
    print("I'm getting ready to go.")
    let description = action("London Mate")
    print(description)
    print("I arrived Gimme!")
}

// calling travel using trailing closure syntax
travelRet { (place: String) -> String in
    return "I'm going to \(place) in my carro"
    
}

// shorthand param names
func travelShorter(action: (String) -> String) {
    print("About to leave for the Maldives")
    let desctiption: (String) = action("London")
    print(desctiption)
    print("I arrived!")
    
}

travelShorter { (place: String) -> String in
    return "I'm going to \(place) in my car"
    
}

travelShorter { place in
    return "I'm going to \(place) in my car"
    
}
travelShorter { place in
    "I'm going to \(place) in my car"
    
}

travelShorter {
    "SHORTEST: I'm going to \($0) in my car"
    
}

// closures with multiple parameters

func travelMultiple(action: (String, Int) -> String) {
    print("closures are crazy")
    let desc = action("Zimbabwe", 60)
    print(desc)
}

travelMultiple {
    "This is a mad short closure: \($0) # \($1)"
}

travelMultiple { (country: String , num: Int) in
    return "This is more descriptive \(country) + \(num)"
}

// returning closures from functions

func travelRetClosure() -> (String) -> Void {
    return { // closure the function is returning
        print("I'm going to \($0)")
        // this closure returns void aka nothing in the closure
    }
}

let result = travelRetClosure()
// result is now a closure / function
result("London")

// capturing values inside closures
func travelCapture() -> (String) -> Void {
    var counter = 1
    return {
        print("\(counter). I'm going to \($0)");
        counter += 1; // each time the closure is called this will trigger
    }
}

let rez = travelCapture()
rez("Greece")
rez("France")
rez("Asia")

// Structs!!

struct Sport {
    var name: String  // struct property
}

var tennis: Sport = Sport(name: "Tennis")
print(tennis.name)

tennis.name = "Table tennis"
// computed properties
struct Sport2 {
    var name: String
    var isOlympicSport: Bool
    
    // computed property
    var olympicStatus: String {
        if isOlympicSport {
            return "\(name) is an Olympic sport"
        } else {
            return "\(name) is not an Olympic sport"
        }
    }
}

let chessBoxing = Sport2(name: "Chessboxing", isOlympicSport: false)
print(chessBoxing.olympicStatus)

// property observers

struct Progress {
    var task: String
    var amount: Int {
        didSet {
            print("\(task) is now \(amount)% complete")
        }
    }
    
}

var progress = Progress(task: "Loading data", amount: 0)
// we want swift to print an update every time amount changes
progress.amount = 30
progress.amount = 80
progress.amount = 100

// methods --> functions inside of structs are called methods

struct City {
    var population: Int
    
    func collectTaxes() -> Int {
        return population * 1000
    }
}

let london: City = City(population: 9000000)
print(london.collectTaxes())

// mutating methods
// if a struct is constant... all it's properties are constant
struct Person {
    var name: String
    
    mutating func makeAnonymous() {
        name = "Anonymous"
    }
}

var person = Person(name: "Ed")
person.makeAnonymous()
print(person.name)
