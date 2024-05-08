import Foundation

//struct Animal {
//    let type: String
//    init(type: String) {
//        if (type == "Rabbit" || type == "Dog" || type == "Cat") {
//            self.type = type
//        } else {
//            preconditionFailure()
//        }
//    }
//}

// Animal(type: "Bike")


enum Animals {
    case cat
    case dog
    case rabbit
    // OR one line: case cat, dog, rabbit
}


let cat = Animals.cat
cat


if cat == Animals.cat {
    "This is a cat"
} else if cat == Animals.dog {
    "This is a dog"
}

// Switch statements

let rabbit = Animals.rabbit

func describeAnimal(_ animal: Animals) {
    switch animal {
    case .cat:
        "This is a cat"
        break
    case .dog:
        "This is a dog"
        break
    case .rabbit:
        "This is a rabbit"
        break
    }
}

describeAnimal(Animals.cat)

switch cat {
case .cat:
    "This is a cat"
    break
case .dog:
    "This is a dog"
    break
case .rabbit:
    "This is a rabbit"
    break
//default:
//    "This is something else"
}


enum Shortcut {
    case fileOrFolder(path: URL, name: String)
    case wwwUrl(path: URL)
    case song(artist: String, songName: String)
}

let wwwApple = Shortcut.wwwUrl(path: URL(string: "https://apple.com")!)

switch wwwApple {
    case .fileOrFolder(let path, let name):
        path
        name
        break
    case .wwwUrl(let path):
        path
        break
    case .song(let artist, let songName):
        artist
        songName
        break
}

// Shorter form
switch wwwApple {
    case let .fileOrFolder(path, name):
        path
        name
        break
    case let .wwwUrl(path):
        path
        break
    case let .song(artist, songName):
        artist
        songName
        break
}

if case let .wwwUrl(path) = wwwApple {
    path
}

let withoutYou = Shortcut.song(artist: "Symphony X", songName: "Without you")


if case let .song(_, songName) = withoutYou {
    songName
}

enum Vehicle {
    case car(manufacturer: String, model: String)
    case bike(manufacturer: String, year: Int)
    
    // Computed property
    var manufacturer: String {
        switch self {
        case let .car(manufacturer, _):
            return manufacturer
        case let .bike(manufacturer, _):
            return manufacturer
        }
    }
}

func getManufacturer(from vehicle: Vehicle) -> String {
    switch vehicle {
    case let .car(manufacturer, _):
        return manufacturer
    case let .bike(manufacturer, _):
        return manufacturer
    }
}


let bike = Vehicle.bike(manufacturer: "HD", year: 1987)
bike.manufacturer
getManufacturer(from: bike)


enum FamilyMember: String {
    case father = "Dad"
    case sister = "Sis"
}

FamilyMember.father.rawValue


enum FavEmoji: String, CaseIterable {
    case blush = "blushEmoji"
    case rocket = "rocketEmoji"
    case fire = "fireEmoji"
}

FavEmoji.allCases
FavEmoji.allCases.map(\.rawValue) // Iterable


// Reverse mapping

if let blush = FavEmoji(rawValue: "blushEmoji") {
    "Found the blush emoji"
} else {
    "This emoji doesn't exist"
}


// Mutating
enum Height {
    case short, medium, long
    mutating func makeLong() {
        self = Height.long
    }
}


var myHeight = Height.medium // .medium
myHeight.makeLong()
myHeight // .long


// Recursive or Indirect enumeration
indirect enum IntOperation {
    case add(Int, Int)
    case subtract(Int, Int)
    case freehand(IntOperation)
    
    func calculateResult(
        of operation: IntOperation? = nil
    ) -> Int {
        switch operation ?? self {
        case let .add(lhs, rhs):
            return lhs + rhs
        case let .subtract(lhs, rhs):
            return lhs - rhs
        case let .freehand(operation):
            return calculateResult(of: operation)
        }
    }
}


let freehand = IntOperation.freehand(.add(2, 4))
freehand.calculateResult() // 6
