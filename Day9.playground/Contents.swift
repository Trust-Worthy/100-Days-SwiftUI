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

//let captainFirstTeam = team.sorted(by: captainFirstSorted)
//
//print(captainFirstTeam)

/**
 * Do the same thing as above but with a closure.
 * This can be tough, but I can work through it by the power of the Holy Spirit
 */

/// Passing in a closure to the sorted function!
let captainFirstTeam = team.sorted(by: { (name1: String, name2:String) -> Bool in
    /**
     * copied same code as above and put it in the closure
     */
    if name1 == "conner" {
        return true // conner comes before everyone else
    } else if name2 == "conner" {
        /// ex: name1 = ben name2 = "conner"
        /// No! name1 does not come before name2 because conner goes before everyone else
        return false
    }
    
    return name1 < name2 /// regular alphabetical sort
})

print(captainFirstTeam)

/************************************************************/
/// Learning about trailing closures now

///Ahhh I get it closures are kinda like lambdas in python

// Trailing closure syntax

let sortedTrailing = team.sorted { a,b in
    if a == "conner" {return true}
    else if b == "conner" {return false}
    
    return a < b
    
    
}

// This is the completed trailing closure
print(sortedTrailing)

let reverseTeam = team.sorted {
    return $0 > $1
    /**
     * team.sorted { $0,$1 in
     * return $0 > $1
     * This is a little more elaborate explanation of what's going on in this closure
     */
    /// everything after the 'in' keyword is apart of the closure. This helps with reading the code
  /**
   * Because retunr $0 > $1 is only 1 line ...
   * Code can be reduced to
   *
   * let reverseTeam = team.sorted { $0 > $1 }
   *
   * That is hyper efficient
   */
    
}
print(reverseTeam)


/// Find all the team players who's name begins with a lowercase j

let jOnly:[String] = team.filter { $0.hasPrefix("j")} /// This is trailing closure. The hasPrefix will eval on every item of array
print(jOnly)

let upppercaseTeam: [String] = team.map {$0.uppercased()} /// map() can be converted. Doesn't have to return type of array you passed in
print(upppercaseTeam)

/********************************************/
// Learning how to take in a function as a parameter in Swift


func makeArray(size:Int, using generator:() -> Int ) -> [Int] {
    var numbers = [Int]()
    
    for _ in 0..<size {
        let newNumber = generator()
        numbers.append(newNumber)
    }
    
    return numbers
}

let rolls: [Int] = makeArray(size: 50) {
    // Because the generator function doesn't take in any parameters in the func def of makeArray,
    // I don't have to write anything else after the size parameter
    // the code below use has to return a single integer
    
    Int.random(in:1...20)
    
    /**
     * This trailing closure above is the same as...
     *
     *  func generateNumber() -> Int {
     *      Int.random(in:1...20)
     * }
     * let newRolls = makeArray(size:50,using:generateNumber)
     */
}

print(rolls)

/// Make function take in multiple functions as parameters
/// Write function that accepts 3 function parameters

func doImportantWork(first: () -> Void,second: () -> Void, third: () -> Void) -> Void {
    print("About to start first work")
    first()
    print("About to start second work")
    second()
    print("About to start third work")
    third()
    print("doneee!!")
}

/// I didn't need any parentheses because all the parameters are functions...
/// I can just use closure syntax for everything in this case
/// pay attention to the 2nd function argument. It uses the colon ':'.
doImportantWork {
    print("This is the first work")
} second: {
    print("This is the second work")
} third: {
    print("This is the third work")
}

/*************************************************************/
// Checkpoint 5!! Let's do it
/**
 * Requirements:
 *
 * take given array...
 * - filter out any numbers that are even
 * - sort the array in ascending order
 * - map the remaining integers to strings in the format "x is a lucky number"
 * - print the resulting array, one item per line
 *
 * all while using closures to chain them together!
 */
let luckyNumbers: [Int] = [7,4,38,21,16,15,12,33,31,49]

var luckyArray = luckyNumbers.filter { $0.isMultiple(of: 2) == false }.sorted {$0 < $1}.map {"\($0) is lucky number"}
print(luckyArray)

/// Finally finished the checkpoint... That was not easy
