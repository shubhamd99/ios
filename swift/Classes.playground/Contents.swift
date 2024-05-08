import Foundation

// Classes are reference type

class Person {
    var name: String
    var age: Int
    
    init(
        name: String,
        age: Int
    ) {
        self.name = name
        self.age = age
    }
    
    func increaseAge() {
        self.age += 1
    }
}

// unlike struct, we can mutate data witin class with let variable
let foo = Person(name: "Foo", age: 20)
foo.age
foo.increaseAge()
foo.age


foo.age // 21
let bar = foo // same reference
bar.increaseAge()
foo.age // 22
bar.age // 22
foo.age += 10 // Externally can change
foo.age // 31

// === checks if two variable pointing to same memory

if foo === bar {
    "Foo and Bar point to the same memory"
} else {
    "They don't point to the same memory"
}


// Sub class

class Vehicle {
    func goVroom() {
        "Vroom vroom"
    }
}
// Inherit from Vehicle (cannot do same in struct)
class Car: Vehicle {}

let car = Car()
car.goVroom()


class Person2 {
    private(set) var age: Int // Only can be set internally and only can be read from outside
    
    init(age: Int) {
        self.age = age
    }
    
    func increaseAge() {
        self.age += 1
    }
}


let baz = Person2(age: 23)
baz.age
baz.increaseAge()
baz.age
// baz.age += 22 // Will not work


// Designated initializer

class Tesla {
    let manufacturer = "Tesla"
    let model: String
    let year: Int
    
    init() {
        self.model = "X"
        self.year = 2023
    }
    
    init(
        model: String,
        year: Int
    ) {
        self.model = model
        self.year = year
    }
    
    convenience init(model: String) {
        self.init(
            model: model,
            year: 2023
        )
    }
}


class TeslaModelY: Tesla {
    override init() {
        super.init(
            model: "Y'",
            year: 2023
        )
    }
}



let modelY = TeslaModelY()
modelY.model
modelY.year
modelY.manufacturer


let fooBar = Person2(age: 20)
fooBar.age
func doSomething(with person: Person2) {
    person.increaseAge()
}
doSomething(with: fooBar) // passing reference
fooBar.age // 21


// De-initializer - use to remove from memory
// Swift automatically deallocates your instances when they're no longer needed, to free up resources
class MyClass {
    init() {
        "initialized"
    }
    func doSomething() {
        // empty
    }
    deinit {
        "Deinitialized"
    }
}

let myClosure = {
    let myClass = MyClass()
    myClass.doSomething()
}
myClosure()
