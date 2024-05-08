import Foundation

extension Int {
    func plusTwo() -> Int {
        self + 2
    }
}


let two = 2
two.plusTwo()

struct Person {
    let firstName: String
    let lastName: String
}

extension Person {
    init(fullName: String) {
        let components = fullName.components(separatedBy: " ")
        self.init(
            firstName: components.first ?? fullName,
            lastName: components.last ?? fullName
        )
    }
}

let person1 = Person(fullName: "Shubham Dhage")
person1.firstName
person1.lastName

let person2 = Person(firstName: "Shubham", lastName: "Dhage")
person2.firstName
person2.lastName






protocol GoesVroom {
    var vroomValue: String { get }
    func goVroom() -> String
}

extension GoesVroom {
    func goVroom() -> String {
        "\(self.vroomValue) goes vroom!"
    }
}

struct Car {
    let manufacturer: String
    let model: String
}

let modelX = Car(manufacturer: "Tesla", model: "X")

extension Car: GoesVroom {
    var vroomValue: String {
        "\(self.manufacturer) model \(self.model)"
    }
}

modelX.goVroom() // Tesla model X goes vroom!


// Classes

class MyDouble {
    let value: Double
    init(value: Double) {
        self.value = value
    }
}

extension MyDouble {
    convenience init() {
        self.init(value: 0)
    }
}

let foo = MyDouble() // Now no need to pass value, extension will do it
MyDouble().value


// Extend protocol

extension GoesVroom {
    func goVroomVroomEvenMore() -> String {
        "\(self.vroomValue) is vrooming even more!!"
    }
}


modelX.goVroomVroomEvenMore() // Tesla model X is vrooming even more!
