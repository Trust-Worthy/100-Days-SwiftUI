import Cocoa

func greetUser() -> Void {
    print("Hi there!")
}

greetUser()

var greetCopy: () -> Void = greetUser

greetCopy()


let sayHello = { (name: String) -> String in
    "Hi \(name)!"
}

sayHello("Naruto")

func getUserData(for id: Int) -> String {
    if id == 1989 {
        return "Taylor Swift"
    } else {
        return "Anonymous"
    }
}

let data: (Int) -> String = getUserData
let user = data(1989)
print(user)



let team = ["Gloria","Suzanne","Piper","Tiffany","Tasha"]

let sortedTeam = team.sorted()
print(sortedTeam)

// should return true if name 1 comes before name 2
func captainFirstSorted(name1: String, name2: String) -> Bool {
    if name1 == "Suzanne" {
        return true
    } else if name2 == "Suzanne" {
        return false
    }
    // otherwise do a reg sort
    return name1 < name2
}

//let captainFirstTeam = team.sorted(by: captainFirstSorted)
//print(captainFirstTeam)


let captainFirstTeam = team.sorted(by: { (name1: String, name2: String) -> Bool in
    if name1 == "Suzanne" {
        return true
    } else if name2 == "Suzanne" {
        return false
    }
    // otherwise do a reg sort
    return name1 < name2
})

print(captainFirstTeam)
