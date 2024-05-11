import Foundation


let numbers = [1,2,3,4]
numbers.first
numbers.last
numbers.count
numbers.map(-)

var mutatingNumbers = [0,1,12]
mutatingNumbers.append(3)
mutatingNumbers.insert(3, at: 0)
mutatingNumbers.insert(
    contentsOf: [1, 2],
    at: 0
)


for value in numbers {
    value
}

// 2 , 4
for value in numbers where value % 2 == 0 {
    value
}

// 2, 4, 6, 8
numbers.map { (value: Int) -> String in
    String(value * 2)
}

numbers.map {
    $0 * 2
}

numbers.map { value in
    value * 2
}

numbers.filter { (value: Int) -> Bool in
    value >= 3
}

numbers.compactMap { (value: Int) -> String? in
    value % 2 == 0
        ? String(value)
        :  nil
}

let numbers2: [Int?] = [1,2,nil,4,5]
numbers2.count

let notNils = numbers2.compactMap { (value: Int?) -> Bool in
    value != nil
}

// Homgeneus array
let numbers3 = [1,2,3,2]
numbers2.count //  4

// Hetrogeneous array
let stuff1: [Any] = [
    1,
    "hello",
    2,
    "worrld"
]

let uniqueNumbers = Set([1,2,1,2,3])
uniqueNumbers.count
uniqueNumbers.map(-) //  -1 -3 -2

let myNumbers = Set([1,2,3,nil,5])
let notNilNumbers = Set(
    myNumbers.compactMap {
        $0
    }
)
notNilNumbers

let stuff3: Set<AnyHashable> = [
    1, 2, 3, "Shubham"
]
stuff3.count

// Extract integers from array
let intsInStuf1 = stuff1.compactMap { (value: Any) -> Int? in
    value as? Int
}

struct Person: Hashable {
    let id: UUID
    let name: String
    let age: Int
}

let fooId = UUID()
let foo = Person(id: fooId, name: "Foo", age: 20)
let bar = Person(id: fooId, name: "Bar", age: 21)

let people: Set<Person> = [foo, bar]
people.count

struct Person2: Hashable {
    let id: UUID
    let name: String
    let age: Int
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    
    static func == (
        lhs: Self,
        rhs: Self
    ) -> Bool {
        lhs.id == rhs.id
    }
}

let bazId = UUID()
let baz = Person2(id: bazId, name: "Baz", age: 20)
let qux = Person2(id: bazId, name: "Qux", age: 30)

if baz == qux {
    "They are equal"
}

let people2 = Set([baz, qux])
people2.count // 1

// Dictionary (JSON)

let userInfo = [
    "name": "Foo",
    "age": 20,
    "address": [
        "line1": "Address line 1",
        "postCode": "12345"
    ]
] as [String: Any]

userInfo["name"]
userInfo["age"]
(userInfo["address"] as! [String: String])["postCode"]

userInfo.keys
userInfo.values


for (key, value) in userInfo {
    key
    value
}

for (key, value) in userInfo where value is Int {
    key
    value
}

for (key, value) in userInfo where value is Int && key.count > 2 {
    key
    value
}
