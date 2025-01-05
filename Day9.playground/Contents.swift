import Cocoa

func greeUser(){
    print("Greet User")
}

greeUser()

/// This reminds me a lot of function pointers in C
/// This function returns no value. So Void is the type annotation.
var greetBro: () -> Void = greeUser

/**
 This is a closure expression below
 */
let sayHello = {
    print("Say Hello!")
}
sayHello()

/*
 * This is an example of a closure taking in a parameter and returning a string
Thank you Jesus that I get to learn how to code
 */
let sayGoodbye = { (name:String ) -> String in
    "Goodbye \(name)!"
    
}

let byeBoo: String = sayGoodbye("Taylor Swift")
print(byeBoo)


func getUserData(for id:Int) -> String {
    if id == 1989 {
        return "Tay Tay born in 1989"
    }else {
        return "none"
    }
}
// This is a closure below
let data: (Int) -> String = getUserData
let user = data(1989)
print(user)


let team = ["jon","conner","jim","beth","zack","able","heather"]
let sortedTeam = team.sorted()  // Allows us to pass in a custom sorted function. This is like java with anonymous functions I believe they're called?
print(sortedTeam)

func captainFirstSorted(name1: String,name2: String) -> Bool {
    // should return true if name1 comes before name2
    if name1 == "conner" {
        return true // conner comes before everyone else
    } else if name2 == "conner" {
        /// ex: name1 = ben name2 = "conner"
        /// No! name1 does not come before name2 because conner goes before everyone else
        return false
    }
    
    return name1 < name2 /// regular alphabetical sort
}

let captainFirstTeam = team.sorted(by: captainFirstSorted)

print(captainFirstTeam)



