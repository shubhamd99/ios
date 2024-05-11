import Foundation


struct Person {
    let firstName: String?
    let lastName: String?
    
    enum Errors: Error {
        case firstNameIsNil
        case lastNameIsNil
        case bothNamesAreNil
    }
    
    func getFullName() throws -> String {
        switch (firstName, lastName) {
        case (.none, .none):
            throw Errors.bothNamesAreNil
        case (.none, .some):
            throw Errors.firstNameIsNil
        case (.some, .none):
            throw Errors.lastNameIsNil
        case let (.some(firstName), .some(lastName)):
            return "\(firstName) \(lastName)"
        }
    }
}


let foo = Person(firstName: "Foo", lastName: nil)

do {
    let fullName = try foo.getFullName()
} catch {
    "Got an error = \(error)"
}


do {
    let fullName = try foo.getFullName()
} catch let e {
    "Got an error = \(e)"
}

do {
    let fullName = try foo.getFullName()
    fullName
} catch is Person.Errors {
    "Got an error"
}

let bar = Person(firstName: nil, lastName: nil)

do {
    let fullName = try bar.getFullName()
    fullName
} catch Person.Errors.firstNameIsNil {
    "first name is nil"
} catch Person.Errors.lastNameIsNil {
    "last name is nil"
} catch Person.Errors.bothNamesAreNil {
    "both names are nil"
} catch {
    "Error final"
}


struct Car {
    let manufacturer: String
    
    enum Errors: Error {
        case invalidManufacturer
    }
    
    init(
        manufacturer: String
    ) throws {
        if manufacturer.isEmpty {
            throw Errors.invalidManufacturer
        }
        self.manufacturer = manufacturer
    }
}

do {
    let myCar = try Car(manufacturer: "")
    myCar.manufacturer
} catch Car.Errors.invalidManufacturer {
    "Invalid MFD" // here came
} catch {
    "Some other error"
}


if let yourCar = try? Car(manufacturer: "Tesla") {
    "Success, your car = \(yourCar)"
} else {
    "Failed to construct and error in not accessible now"
}


let theirCar = try! Car(manufacturer: "Ford")
theirCar.manufacturer


struct Dog {
    let isInjured: Bool
    let isSleeping: Bool
    
    enum BarkingErrors: Error {
        case cannotBarkIsSleeping
    }
    
    enum RunningErrors: Error {
        case cannotRunIsInjured
    }
    
    func bark() throws {
        if isSleeping {
            throw BarkingErrors.cannotBarkIsSleeping
        }
        "Bark..."
    }
    
    func run() throws {
        if isInjured {
            throw RunningErrors.cannotRunIsInjured
        }
        "Run..."
    }
    
    func barkAndRun() throws {
        try bark()
        try run()
    }
}


let dog = Dog(isInjured: true, isSleeping: true)


do {
    try dog.barkAndRun()
} catch Dog.BarkingErrors.cannotBarkIsSleeping,
        Dog.RunningErrors.cannotRunIsInjured {
    "Cannot-bark-is-sleeping OR cannot-run-is-injured"
} catch {
    "Somet other error"
}

// rethrows keyword is used to indicate that a function can throw errors if one of its function parameters throws an error
func fullName(
    firstName: String?,
    lastName: String?,
    calculator: (String?, String?) throws -> String?
) rethrows -> String? {
    try calculator(firstName, lastName)
}

enum NameErrors: Error {
    case firstNameIsInvalid
    case lastNameIsInvalid
}


func + (
    firstName: String?,
    lastName: String?
) throws -> String? {
    guard let firstName, !firstName.isEmpty else {
        throw NameErrors.firstNameIsInvalid
    }
    guard let lastName, !lastName.isEmpty else {
        throw NameErrors.lastNameIsInvalid
    }
    return "\(firstName) \(lastName)"
}

do {
    let fobar = try fullName(firstName: "Foo", lastName: nil, calculator: +)
} catch NameErrors.firstNameIsInvalid {
    "Error 1"
} catch NameErrors.lastNameIsInvalid {
    "Error 2"
} catch let err {
    "\(err)"
}


// Result

enum IntegerErrors: Error {
    case noPositiveIntegerBefore(thisValue: Int)
}


func getPrevPositiveInteger(
    from int: Int
) -> Result<Int, IntegerErrors> {
    guard int > 0 else {
        return Result.failure(
            IntegerErrors.noPositiveIntegerBefore(
                thisValue: int
            )
        )
    }
    
    return Result.success(int - 1)
}


func performGet(
    forvalue value: Int
) {
    switch getPrevPositiveInteger(from: value) {
    case let.success(previousValue):
        "Prev valueis \(previousValue)" // Prev value is 9
    case let .failure(error):
        switch error {
        case let .noPositiveIntegerBefore(thisValue: thisValue):
            "No positive intbefore \(thisValue)"
        }
    }
}

performGet(forvalue: 10)
