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





