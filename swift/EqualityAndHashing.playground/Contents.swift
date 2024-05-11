import Foundation

struct Person: Equatable {
    let id: String
    let name: String
}

let foo1 = Person(id: "1", name: "Foo")
let foo2 = Person(id: "1", name: "Bar")

// custom equality
extension Person {
    static func == (
        lhs: Self,
        rhs: Self
    ) -> Bool {
        lhs.id == rhs.id
    }
}

if foo1 == foo2 {
    "they are equal"
} else {
    "They aren't"
}


enum AnimalType {
    case dog(breed: String)
    case cat(breed: String)
}

let dog1 = AnimalType.dog(breed: "Labra")
let dog2 = AnimalType.dog(breed: "Labra")

if dog1 == dog2 {
    "they are equal"
} else {
    "They are not equal"
}


extension AnimalType: Equatable {
    static func == (
        lhs: Self,
        rhs: Self
    ) -> Bool {
        switch (lhs, rhs) {
        case let (.dog(lhsBreed), .dog(rhsBreed)),
            let (.cat(lhsBreed), .cat(rhsBreed)):
            return lhsBreed == rhsBreed
        default:
            return false
        }
    }
}

struct Animal: Equatable {
    let name: String
    let type: AnimalType
    
    static func == (
        lhs: Self,
        rhs: Self
    ) -> Bool {
        lhs.type == rhs.type
    }
}

let cat1 = Animal(name: "Whiskers", type: .cat(breed: "Street cat"))

let cat2 = Animal(name: "Whoosh", type: .cat(breed: "Street cat"))

if cat1 == cat2 {
 "they are equal because of their type"
} else {
    "not equal"
}


struct House: Hashable {
    let number: Int
    let numberOfBedrooms: Int
}

let house1 = House(number: 123, numberOfBedrooms: 2)
house1.hashValue
let house2 = House(number: 123, numberOfBedrooms: 3)
house2.hashValue

let houses = Set([house1, house2])
houses.count // 2

struct NumberedHouse: Hashable {
    let number: Int
    let numberOfBedrooms: Int
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(number)
    }
    
    static func == (
        lhs: Self,
        rhs: Self
    ) -> Bool {
        rhs.number == rhs.number
    }
}


let house3 = NumberedHouse(number: 123, numberOfBedrooms: 2)
let house4 = NumberedHouse(number: 123, numberOfBedrooms: 2)

let houses3And4 = Set([house3, house4])
houses3And4.count
houses3And4.first!.numberOfBedrooms

// Enums by default hashable and equatable
enum CarPart {
    case roof
    case tire
    case trunk
}

let uniqueParts: Set<CarPart> = [
    .roof,
    .tire,
    .roof,
    .trunk
]
