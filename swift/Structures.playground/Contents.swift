import Foundation

// Structures are value type and cannot be passed as reference type

struct Person {
    let name: String
    let age: Int
}

// Instance of Person
let foo = Person(
    name: "Foo",
    age: 20
)


foo.name
foo.age


struct CommodoreComputer {
    let name: String
    let manufacturer: String
    
    init(name: String) {
        self.name = name
        self.manufacturer = "Commodore"
    }
}


let c64 = CommodoreComputer(
    name: "My commodore"
)
c64.name
c64.manufacturer

// Computed property in struct
struct Person2 {
    let firstName: String
    let lastName: String
    // Computed property
    var fullName: String { // Function
        "\(firstName) \(lastName)"
    }
}


let fooBar = Person2(
    firstName: "Shubham",
    lastName: "Dhage"
)

fooBar.firstName
fooBar.lastName
fooBar.fullName

// Mutation in struct - Change values
struct Car {
    var currentSpeed: Int
    mutating func drive(speed: Int) {
        "Driving..."
        currentSpeed = speed
    }
}

let immutableCar = Car(currentSpeed: 20)
// immutableCar.drive(speed: 10) // Won't mutate and throw error

var mutableCar = Car(currentSpeed: 10)
mutableCar.drive(speed: 30)
mutableCar.currentSpeed

var copy = mutableCar // Copy of structure
mutableCar.currentSpeed // 30
mutableCar.drive(speed: 55)
mutableCar.currentSpeed // 55
copy.currentSpeed // 30


// Sub-classing

struct LivingThing {
    init() {
        "I'm a living thing"
    }
}

// Struct cannot inherit
//struct Animal: LivingThing {
//    
//}

// Copy of Struct with different values

struct Bike {
    let manufacturer: String
    let currentSpeed: Int
    func copy(currentSpeed: Int) -> Bike {
        Bike(manufacturer: self.manufacturer, currentSpeed: currentSpeed)
    }
}

let bike1 = Bike(manufacturer: "HD", currentSpeed: 20)

let bike2 = bike1.copy(currentSpeed: 33)

bike1.currentSpeed
bike2.currentSpeed
