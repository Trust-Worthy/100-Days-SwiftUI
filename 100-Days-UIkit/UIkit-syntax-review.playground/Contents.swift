import UIKit


// Review of Functions

func printHelp() {
    let message = """
        Welcome to my App!
        """
    
    print(message)
}

printHelp()

// taking parameters

func square(number: Int) {
    print(number * number)
}

square(number: 5)

// optionals


func getHaterStatus(weather: String) -> String? { // Question mark means options string
    
    if weather == "sunny" {
        return nil // swift wants my code to be really safe so nil is dangerous
    } else {
        return "Hate"
    }
    
}

// optionals might have a value or might not

var status: String? //
status = getHaterStatus(weather: "rainy")


func takeHaterAction(status: String) { // can's pass in an optional
    if status == "Hate" {
        print("Hating")
    }
}

// optional unwrapping


if let haterStatus = getHaterStatus(weather: "rainy") {
    // If optional isn't empty
    takeHaterAction(status: haterStatus)
}


func yearAlbumReleased(name: String) -> Int? {
    if name == "Taylor Swift" {return 2006}
    if name == "Fearless" {return 2008}
    return nil
}

// returning values

func square2(number: Int) -> Int {
    return number * number
}


let result = square2(number: 8)
print(result)

// parameter labels

func sayHello(to name: String) {
    print("Hello \(name)")
}

sayHello(to: "James")

// Omitting parameter labels

func greet(_ name: String) {
    print("I am greeting you \(name) squad gang")
}

greet("Karl")

// default parameters

func greetDefParams(name: String, nicely: Bool = true) {
    if nicely == true {
        print("I'm greeting \(name) with kindness")
    } else {
        print("What are you... \(name) looking @@@??? Huh punk?")
    }
}

greetDefParams(name: "Jimmy", nicely: false)

// Variadic functions

func squareVariadic(numbers: Int...) {
    for number in numbers {
        print("\(number) squared is \(number * number)")
    }
}
squareVariadic(numbers: 2,3,4,5)

// Writing throwing functions

enum PasswordError: Error {
    case obvious
}

func checkPassword(password: String) throws -> Bool {
    
    if password.count < 12 {
        throw PasswordError.obvious
    } else {
        return true
    }
}
// running throwing functions

do {
    try checkPassword(password: "hihihisddfdf")
    print("That password is maadd strong")
} catch {
    print("That is a bad password my friend")
}

// reviewing inout parameters

func doubleInPlace(num: inout Int) {
    num*=2
}

var myNum = 10

doubleInPlace(num: &myNum)
doubleInPlace(num: &myNum)
print("myNum is \(myNum)")

// basic closure
// a closure is just a function assigned to variable

let driving = {
    print("I am driving down the highway... Oh no the Ops is coming!!")
}

driving()
driving()

// accepting parameters in a closure


let drivingParam = { (place: String) in
    print("I am driving to \(place)")
}

drivingParam("London")

// returning values from a closure

let drivingWithReturn = { (place: String) -> String in
    return "I am driving to \(place). Around the world in 80 days."
}

let vroom = drivingWithReturn("Africa")
print(vroom)

// taking in closures as arguements to other functions / closures

let drivingClosure = { (place: String) -> String in
    return "I am driving to \(place) in my new BMW"
}

func travel(closure action: (String) -> String) {
    print("I'm preparing to travel. Putting bags in car.")
    print(action("SF"))
    print("Just made it home. I am done driving for the day!")
}

travel(closure: drivingClosure)

// Trailing closure syntax
// I think this syntax is the hardest to get used to

func travelTrailingClosure(action: () -> Void) {
    print("About to travel")
    action()
    print("Done traveling")
}

travelTrailingClosure { // Trailing closure syntax is supposedly really common
    print("I am traveling traveling traveling")
}

// Using closures as params when they accept params

func travelClosureParam(action: (String) -> Void) {
    print("About to travel")
    action("London")
    print("Done traveling for a while.")
}

travelClosureParam { (place: String) in // Trailing closure syntax
    print("I am going to travel to \(place)!!!")
}

// closure param that takes a param and returns a value

func travelReturn(action: (String) -> String) {
    print("Doing my ting")
    let going = action("London")
    print("Definitely pulling up to \(going)")
}

travelReturn { (place: String) -> String in
    return "\(place) because going to new places is madd fun"
}

// learning about closure shorthand parameter names when swift can infer the arguements

travelReturn {
    return "How are you doing \($0) my dawwwg?"
}

// closure example with more than one param
func travelMultParams(action: (String, Int) -> String)  {
    print("About to travel at a specific speed.")
    let phrase = action("Egypt", 60)
    print(phrase)
    print("That was a dope trip to AFrica!!")
}

travelMultParams {
    return "Going on a dope trip to \($0) at \($1)mph"
}

// returning closures from functions is actually atrocious

func travelRetFunc() -> (String) -> String {
    return {
        "I am going to travel to \($0)"
    }
}

let message = travelRetFunc()
print(message("India"))

let weirdCode = travelRetFunc()("Dubai")
print(weirdCode)


// capturing values in functions that return closures

func travelCapture() -> (String) -> Void {
    var counter = 1
    
    return  {
        print("\(counter). Going to school on the \($0) of the month")
        counter += 1
    }
}

let countSchool = travelCapture()
countSchool("2nd")
countSchool("3nd")
countSchool("4nd")
countSchool("5nd")


// Getting into structs review

struct Sport {
    var name: String // make sure to put the type of the struct
    
    // Computed Properties are powerful toos
    var isOlympicSport: Bool
    
    var confirmation: String {
        if isOlympicSport {
            return "\(name) is an Olympic sport. You can win medals"
        } else {
            return "\(name) is not an Olympic sport. You can't win any medals"
        }
    }
}

var tennis = Sport(name:"Tennis", isOlympicSport: false)
tennis.name = "Table Tennis"
print(tennis.name)

var running = Sport(name: "Track", isOlympicSport: true)
print(running.confirmation)

// Property observers

struct Progress {
    var task: String
    var amount: Int {
        didSet{
            print("\(task) is \(amount)% complete")
        }
    }
}

var progress = Progress(task:"Buying car", amount:10)
progress.amount = 20
progress.amount = 70
progress.amount = 100

// methods --> functions that belong to structs / classes

struct City {
    var population: Int
    
    func gimmeTaxes() -> Int {
        return population * 1000
    }
}

let SF = City(population: 9_000_000)
print(SF.gimmeTaxes())

// mutating funcs exist to tell swift when a method should be able to change a varaible

struct Person {
    var name: String {
        didSet {
            print("Name was changed to \(name)")
        }
    }
    
    mutating func makeAnon() {
        name = "Anonymous hacker..."
    }
}

var hacker = Person(name: "Bad BOI")
hacker.makeAnon()

// Creating my own inits for structs

struct User {
    var username: String
    
    init() {
        username = "NONE"
        print("Creating a new user")
    }
}

var jim = User()
jim.username = "Jim"
print(jim.username)

// using the self keyword to refer to the instance
struct FamilyTree {
    init(my name: String) {
        print("Creating \(name)'s family tree!!!")
    }
}
struct Person1 {
    
    var name: String {
        didSet {
            print("\(name) was just added to the list.")
        }
        willSet {
            print("\(name) is about to be added to the list.")
        }
    }
    
    init(name: String) {
        print("\(name) just showed up to the party!!!")
        self.name = name
    }
    lazy var familyTree = FamilyTree(my:name)
}

var jeff = Person1(name: "jeff")
jeff.name = "Jim"

var bobby = Person1(name: "bobby")
bobby.familyTree


// Static properties and methods

struct StudentSTU {
    var name: String
    
    nonisolated(unsafe) static var classSize = 0
    
    init(name: String) {
        self.name = name
        StudentSTU.classSize += 1
    }
}

var jeffBezos = StudentSTU(name: "jeff Bez")
var markZuck = StudentSTU(name: "Mark zuck")

print(StudentSTU.classSize)

// Acess controls

struct Person2 {
    private var id: Int // can only be read inside the struct
    var name: String
    
    init(name: String, id: Int) {
        self.name = name
        self.id = id
    }
    
    func identify() -> String {
        return "My name is \(name) and my social is \(id)"
    }
}

var specialAgent = Person2(name: "Tom", id: 12345)

print(specialAgent.identify())
