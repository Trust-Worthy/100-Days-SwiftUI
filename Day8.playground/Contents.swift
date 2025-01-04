import Cocoa

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

let passy: String = "12345"

do {
    // try must be written before all throwing functions.
    let result: String = try checkPassword(password: passy)
    print("Password rating: \(result)")
} catch PasswordError.short{ // This is what I'm used to seeing when I look at C error lol
    print("Please use a longer password")
} catch {
    print("There was an error")
}

