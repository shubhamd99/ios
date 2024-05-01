import Foundation

// Declaring variable

var myName = "Woo" // Cannot be re-assigned
let yourName = "Foo" // Can not be re-assigned


myName = "Shubham"

print("Variable:", yourName)
print("Variable:", myName)


// Arrays

var names = [
    myName,
    yourName
]


names.append("Bar")
names.append("Bar2")

print(names)

names = []

print(names)


let oldArray = NSMutableArray(
    array: ["Foo", "Bar"]
)


// NSMutableArray is a variant of NSArray
func changeTheArray(_ array: NSArray) {
    let arrCopy = array as! NSMutableArray // Avoid using this code
    arrCopy.add("Baz")
}

changeTheArray(oldArray)

print(oldArray)
