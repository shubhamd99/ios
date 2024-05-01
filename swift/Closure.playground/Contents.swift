import Foundation

// Define data type of closure

let add: (_ lhs: Int, _ rhs: Int) -> Int = {
    (lhs: Int, rhs: Int) -> Int in
    lhs + rhs
}

add(20, 30)


func customAdd(
    _ lhs: Int,
    _ rhs: Int,
    using callback: (Int, Int) -> Int
) -> Int {
    callback(lhs, rhs)
}

// Trailing closure syntax, when theres param in the end

customAdd(
    33,
    44
) { (lhs, rhs) in
    lhs + rhs
}


let ages = [30, 20, 18, 40]
//ages.sorted(by: {(lhs: Int, rhs: Int) -> Bool in
//    lhs > rhs
//})
ages.sorted(by: <) // Do Same as above
ages.sorted(by: >)

func customAdd2(
    using callback: (Int, Int) -> Int,
    _ lhs: Int,
    _ rhs: Int
) -> Int {
    callback(lhs, rhs)
}

customAdd2(
    using: { $0 + $1 }, // 50
    20,
    30
)


// pass by functions

func add10To(_ value: Int) -> Int {
    value + 10
}

func add20To(value: Int) -> Int {
    value + 20
}


func doAddition(
    on value: Int,
    using function: (Int) -> Int
) -> Int {
    function(value)
}

doAddition(on: 200, using: add10To(_:))

doAddition(on: 200, using: add20To(value:))
