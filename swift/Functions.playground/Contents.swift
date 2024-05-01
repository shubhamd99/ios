import Foundation

func noArgumentsAndNoReturnValue() {
    "I don't know what I'm doing"
}

noArgumentsAndNoReturnValue()

func plusTwo(value: Int) {
    let newValue = value + 2
}

plusTwo(value: 30)


func newPlusTwo(value: Int) -> Int {
    value + 2 // OR return value + 2
}

newPlusTwo(value: 30)

func customAdd(
    value1: Int,
    value2: Int
) -> Int {
    value1 + value2
}


let customAdded = customAdd(value1: 10, value2: 20)


// External and internal labels

func customMulti(
    value1 lhs: Int,
    value2 rhs: Int
) -> Int {
    lhs + rhs
}


let customMultiplied = customMulti(value1: 20, value2: 20)

// Without label

func customMinus(
    _ lhs: Int,
    _ rhs: Int
) -> Int {
    lhs + rhs
}


let customSubtracted = customMinus(10, 20)

// The @discardableResult attribute in Swift is used to indicate to the compiler that the return value of a function can be safely ignored

@discardableResult
func myCustomAdd(
    _ lhs: Int,
    _ rhs: Int
) -> Int {
    lhs + rhs
}

// With Struct
struct Person {
    func getAge() -> Int {
        10
    }
    func doSomething() -> Int {
        let age = getAge()
        return age
    }
}

// Nested Function

func doSomethingCompilcated(
    with value: Int
) -> Int {
    func mainLogic(value: Int) -> Int {
        value + 2
    }
    
    return mainLogic(value: value + 2)
}

doSomethingCompilcated(with: 33)


// Default values

func getFullName(
    firstName: String = "Foo",
    lastName: String = "Bar"
) -> String {
    "\(firstName) \(lastName)"
}


getFullName()
getFullName(firstName: "SHubham")
getFullName(lastName: "SHubham")
