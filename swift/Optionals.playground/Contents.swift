import Foundation

func multiplyByTwo(_ value: Int? = nil) -> Int {
    if let value {
        return value * 2
    } else {
        return 0
    }
}

func multiplyByTwoDefault(_ value: Int = 0) -> Int {
    value * 2
}


multiplyByTwo() // 0
multiplyByTwoDefault() // 0
multiplyByTwoDefault(4)


let age: Int? = nil
if age != nil {
    "Age is there! How odd!"
} else {
    "Age is nil. Correct."
}

if let age {
    "Age is there. How odd! Its value is \(age)"
} else {
    "No age is present. As expected"
}

// Guard
func checkAge() {
    guard age != nil else {
        "Age is nil as expected"
        return
    }
    "Age is not nil here. Strange!"
}

checkAge()

// Unwrapping the optional

let age2: Int? = 0

func checkAge2() {
    guard let age2 else {
        "Age is nil. How strange"
        return
    }
    let xxx = age2 // Age is not optional anymore with guard let
    "Age2 is not nil as expected. value = \(age2)"
}


switch age {
case .none:
    "Age has no value"
    break
case let .some(value):
    "Age has the value of = \(value)"
    break
}

if age2 == 0 {
    "Age2 is 0 as expected, and is not null"
} else {
    "Age2 is not 0"
}

if age2 == .some(0) {
    "Age2 is 0 as expected, and is not null"
} else {
    "Age2 is not 0"
}


struct Person {
    let name: String
    let address: Address?
    struct Address {
        let firstLine: String?
    }
}

let foo: Person = Person(name: "Foo", address: nil)

if let fooFirstAddressLine = foo.address?.firstLine {
    fooFirstAddressLine
} else {
    "Foo doesn't have an address with first line, as expected"
}

if let fooAddress = foo.address,
   let firstLine = fooAddress.firstLine {
    fooAddress
    firstLine
}

let bar: Person? = Person(name: "Bar", address: Person.Address(firstLine: nil))

if bar?.name == "Bar",
   bar?.address?.firstLine == nil {
    "bars name is bar and has no first line of address"
} else {
    "Seems like something isn't working right!"
}


switch bar?.address?.firstLine {
case let .some(firstLine) where
    firstLine.starts(with: "Bar"):
    "bar first address line = \(firstLine)"
case let .some(firstLine):
    "Bar first address line that didn't match the prev case"
case .none:
    "Bar nil"
}

func getFullName(
    firstname: String,
    lastname: String?
) -> String? {
    if let lastname {
        return "\(firstname) \(lastname)"
    } else {
        return nil
    }
}

getFullName(firstname: "foo", lastname: nil)

func getFullName2(
    firstname: String,
    lastname: String?
) -> String? {
    guard let lastname else {
        return nil
    }
    return "\(firstname) \(lastname)"
}

getFullName2(firstname: "foo", lastname: "dd")
