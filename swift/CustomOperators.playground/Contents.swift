import Foundation

let firstName: String? = "Foo"
let lastName: String? = "bar"

let fullName = firstName + lastName

// Binary infix (in-between two values) operator
func + (
    lhs: String?,
    rhs: String?
) -> String? {
    switch (lhs, rhs) {
    case (.none, .none):
        return nil
    case let (.some(value), .none),
        let (.none, .some(value)):
        return value
    case let (.some(lhs), .some(rhs)):
        return lhs + rhs
    }
}

// unary prefix

prefix operator ^
prefix func ^ (
    value: String
) -> String {
    value.uppercased()
}

let lowercaseName = "Foo bar"
let uppercasename = ^lowercaseName

// Postfix operator
postfix operator *
postfix func * (
    value: String
) -> String {
    "*** \(value) ***"
}

let withStarts = lowercaseName*


struct Person {
    let name: String
}

struct Family {
    let members: [Person]
}

func + (
    lhs: Person,
    rhs: Person
) -> Family {
    Family(
        members: [
            lhs, rhs
        ]
    )
}

func + (
    lhs: Family,
    rhs: Person
) -> Family {
    var members = family.members
    members.append(rhs)
    return Family(members: members)
}

let mom = Person(name: "Mom")
let dad = Person(name: "Dad")
let son = Person(name: "Son")

let family = mom + dad
let familyWithSon = family +  son
