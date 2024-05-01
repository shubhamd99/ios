import Foundation

let myName = "Shubham"
let myAge = 20
let yourName = "Dhage"
let yourAge = 19

if myName == "Shubham" {
    "your name is \(myName)"
} else {
    "Oops, I guessed it wrong"
}

if "Shubham" == myName {
    "An uncommon way of doing this"
}

if myName == "Shubham" && myAge == 30 {
    "Name is SHubham and age is 30"
} else if myAge == 20 {
    "I only guessed the age right"
} else {
    "I don't know what I'm doing"
}


if myAge == 20 || myName == "Foo" {
    "Either age is 20 name is Foo or both"
} else if myName == "Shubham" || myAge == 20 {
    "It's too late to get in this clause"
}


if (myName == "Shubham" && myAge == 20) && (yourName == "Dhage" || yourAge == 19) {
    "My name is Shubham and I'm 20.."
} else {
    "Hmm, that didn't work so well"
}
