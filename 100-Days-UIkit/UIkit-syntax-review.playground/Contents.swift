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


