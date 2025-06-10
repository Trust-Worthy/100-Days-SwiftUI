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

//
