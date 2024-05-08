import Foundation

// Blueprints or Interfaces


protocol CanBreathe {
    func breathe()
}


struct Animal: CanBreathe {
    func breathe() {
        "Animal breathing..."
    }
}


struct Person: CanBreathe {
    func breathe() {
        "Person breathing..."
    }
}


let dog = Animal()
dog.breathe()
let foo = Person()
foo.breathe()

protocol CanJump {
    func jump() // Protocol cannot have body
}

// With this technique we can add function body to protocol
extension CanJump {
    func jump() {
        "Jumping..."
    }
}

// No need to declare jump method now because of extension
struct Cat: CanJump {
    
}

let whiskers = Cat()
whiskers.jump()


protocol HasName {
    var name: String { get }
    var age: Int { get set }
}

extension HasName {
    // It will have access to name and age variables
    func describeMe() -> String {
        "Your name is \(name) and you are \(age) years old"
    }
    mutating func increaseAge() -> Int {
        self.age += 1
        return self.age
    }
}

struct Dog: HasName {
    let name: String
    var age: Int
}

var woof = Dog(name: "Woof", age: 10)
woof.name
woof.age
woof.age += 2
woof.age

woof.describeMe() // "Your name is Woof and ...
woof.increaseAge() // 13


protocol Vehicle {
    var speed: Int { get set }
    mutating func increaseSpeed(by value: Int)
}

extension Vehicle {
    mutating func increaseSpeed(by value: Int) {
        self.speed += value
    }
}

struct Bike: Vehicle {
    var speed: Int
    init() {
        self.speed = 0
    }
}

var bike = Bike()
bike.speed // 0
bike.increaseSpeed(by: 10)
bike.speed // 10


// Verify Protocols

struct Worm {
    
}
let worm = Worm()

func describe(obj: Any) {
    if obj is Vehicle {
        "object conforms to the Vehicle protocol"
    } else {
        "obj does NOT conform to the Vehicle protocol"
    }
}


describe(obj: bike)
describe(obj: worm)


// Promote to specific type

func increaseSpeedIfVehicle(
    obj: Any
) {
    if var vehicle = obj as? Vehicle {
        vehicle.increaseSpeed(by: 23)
    } else {
        "this was not a vehicle"
    }
}

increaseSpeedIfVehicle(obj: bike) // Bike is struct and cannot be passed as reference, it will change for class
bike.speed // 10 - no value change


