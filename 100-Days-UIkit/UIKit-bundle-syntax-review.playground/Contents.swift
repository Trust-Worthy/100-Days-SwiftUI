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

// properties and methods of strings
let string = "Do or do not there is no try"
print(string.count)
print(string.hasPrefix("Do"))
print(string.uppercased())
print(string.sorted())

// properties of arrays
var toys: [String] = ["Woody"]

print(toys.count)
toys.append("Buzz")
print(toys.count)
toys.firstIndex(of: "Buzz")

// initializers -> help initialize the struct

struct User {
    var username: String
    
    init() { // initializer
        // make sure all properties have a value before the initializer ends!
        username = "Anonymous"
        print("Creating a new user!")
    }
    
}

var user = User()
user.username = "bobbi"

// referring to the current instance
// self.name refers to the property
// name refers to the parameter
struct Person2 {
    var name: String
    
    init(name: String) {
        print("\(name) was born!")
        self.name = name
    }
}

// Lazy properties --> create properties only when they'r needed

struct FamilyTree {
    
    init() {
        print("Creating family tree!")
    }
}

struct Person3 {
    var name: String
    lazy var familyTree = FamilyTree() // swift will only create this when it's first accessed!!
    
    init(name: String) {
        self.name = name
    }
}

var ed = Person3(name: "ed")
ed.familyTree

// static properties
struct Student {
    
    nonisolated(unsafe) static var classSize = 0
    var name: String
    
    init(name: String) {
        self.name = name
        Student.classSize += 1
    }
}

let eddy = Student(name: "edddy")
let taytay = Student(name: "Taylor")
print(Student.classSize)

// access controls --> let's u restrict which code can use properties and methods

struct Person4 {
    private var id: String // only methods inside person can read id property
    
    init(id: String) {
        self.id = id
    }
    
    func identify() -> String {
        return "My social security number is \(id)"
    }
}

let jimmm = Person4(id: "12345")
print(jimmm.identify())

// Classes! Finally
// 1. Classes never come with their own member-wise initializer
class Dog {
    var name: String
    var breed: String
    
    init(name: String, breed: String) {
        self.name = name
        self.breed = breed
    }
    
}

let poppy = Dog(name: "poppy", breed: "poodle")

// class inheritance
// child class
class Poodle: Dog { // Poodle is inheriting from Dog
    
    init(name: String) {
        super.init(name: name, breed: "poodle")
    }
    
}

// overriding methods
class Dog2 {
    func makeNoise () {
        print("wolf")
    }
}

class Poodle2: Dog2 {
    override func makeNoise() {
        print("YIP YIP BARK BARK")
    }
}

let poodle2 = Poodle2()
poodle2.makeNoise()

// final classes
final class DogFinal {
}

// copying objects

class Singer { // if singer were a struct i would get Taylor swift a second time
    var name = "Taylor Swift"
}

var singer = Singer()
print(singer.name)

var singerCopy = singer
singerCopy.name = "Justin"

print(singer.name) // creating the copy of the class is just a reference to the old class. Meaning the copy changes the original

// deinitializers
class PersonDein {
    var name = "John Doe"
    
    init() {
        print("\(name) is alive! Praise Jesus")
    }
    
    func printGreeting() {
        print("Hello, I'm \(name)")
    }
    
    deinit {
        print("\(name) is no more!")
    }
}


for _ in 1...3 {
    let person = PersonDein()
    person.printGreeting()
}

// mutability
// constant struct + variable property means the property can't be changed
// constant class + variable property means the property can change

class SingerChange {
    var name = "Donald Glover" // make it constant if I don't want it to change
}

let donald = SingerChange()
donald.name = "bruh"

// swift protocols

protocol Identifiable { // a protocol is a description not a type
    var id: String { get set}
}

// I can create a struct that conforms to that protocol
struct UserProto: Identifiable {
    var id: String
}

func displayID(thing: Identifiable) {
    print("My ID is \(thing.id)")
}

var protoUser = UserProto(id: "213423")
displayID(thing: protoUser)

// protocol inheritance

protocol Payable {
    func calculateWager() -> Int
}

protocol NeedsTrainig {
    func study()
}

protocol HasVaction {
    func takeVactation(days: Int)
}

protocol Employee: Payable, NeedsTrainig, HasVaction { }

// extensions in swift
// allows you to add methods to existing types
// now they can do things they were never intended to do
extension Int {
    func squared() -> Int {
        return self * self
    }
    
    
}

let num = 8
num.squared()

// is this what functional programming is like
// I can add a computed proterty! Can't add my own properties tho

extension Int {
    var isEven: Bool {
        return self % 2 == 0
    }
}

let nummy = 10
nummy.isEven

// protocol extensions

let pythons = ["Eric", "Graham", "John", "Michael", "Terry", "Terry"]
let beatles = Set(["John", "Paul", "George", "Ringo"])

// swift arrays and sets conform to a protocol called Collection

// extending the Collection protocol
extension Collection {
    func summarize() {
        print("There are \(count) of us:")
        
        for name in self {
            print(name)
        }
    }
}

pythons.summarize()
beatles.summarize()

// protocol oriented programming

