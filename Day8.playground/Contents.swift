import Cocoa

/**
 * Learning about throwing errors and default parameters
 */
enum PasswordError: Error {
    case short,obvious
}

func checkPassword(password:String) throws -> String {
    if password.count < 5 {
        throw PasswordError.short
    }
    if password == "12345" {
        throw PasswordError.obvious
    }
    
    if password.count < 8 {
        return "OK"
    } else if password.count < 10 {
        return "Good"
    } else {
        return "Excellent"
    }
}

let passy: String = "asdjfkasdk;fa"

do {
    // try must be written before all throwing functions.
    let result: String = try checkPassword(password: passy)
    print("Password rating: \(result)")
} catch PasswordError.short{ // This is what I'm used to seeing when I look at C error lol
    print("Please use a longer password")
} catch {
    print("There was an error")
}

/**
 * Checkpoint 4 below
 */

enum numError: Error {
    case outOfBounds, noRoot
}

func calcSqrt(findRootOf value:Int) throws -> Int{
    
    switch value {
        case 1...10_000:
            for i in 1...100{ // realized that the largest i can be is 100!
                if i * i == value && type(of: i) == Int.self {
                    /// If i is the square root and is also an integer
                    return i
                }
            }
        // If the for loop never finds a solution then throw the error
        throw numError.noRoot
        default:
            throw numError.outOfBounds
    }
        
}

/**
 * Testing the solution
 */

var val:Int = 25
do {
    
    let solution: Int = try calcSqrt(findRootOf: val)
    print("The solution is \(solution)")
} catch numError.noRoot {
    print("The value \(val) doesn't have an integer square root")
} catch {
    print("There was an error bro...")
}

