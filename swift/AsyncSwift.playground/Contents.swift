import Foundation
import PlaygroundSupport
import _Concurrency

// Wait for async task to finish in playground
PlaygroundPage
    .current
    .needsIndefiniteExecution = true

func calculateFullName(
    firstname: String,
    lastName: String
) async -> String {
    try? await Task.sleep(for: .seconds(1))
    return "\(firstname) \(lastName)"
}

Task {
    let result1 = await calculateFullName(
        firstname: "Foo",
        lastName: "Bar"
    )
    // Another way of writing
    async let result2 = calculateFullName(
        firstname: "Foo",
        lastName: "Bar"
    )
    await result2
}


enum Clothe {
    case socks, shirt, trousers
}

func buySocks() async throws -> Clothe {
    try await Task.sleep(for: .seconds(1))
    return Clothe.socks
}

func buyShirt() async throws -> Clothe {
    try await Task.sleep(for: .seconds(1))
    return Clothe.shirt
}

func buyTrousers() async throws -> Clothe {
    try await Task.sleep(for: .seconds(1))
    return Clothe.trousers
}

struct Ensemble: CustomDebugStringConvertible {
    let clothes: [Clothe]
    let totalPrice: Double
    
    var debugDescription: String {
        "Clothes = \(clothes), price = \(totalPrice)"
    }
    
}


func buyWholeEnsemble() async throws -> Ensemble {
    async let socks = buySocks()
    async let shirts = buyShirt()
    async let trousers = buyTrousers()
    
    let ensemble = Ensemble(
        clothes: await [
            try socks,
            try shirts,
            try trousers
        ],
        totalPrice: 230
    )
    
    return ensemble
    
}


Task {
    if let ensemble = try? await buyWholeEnsemble() {
        print(ensemble)
    } else {
        "Something went wrong"
    }
}

func getFullName(
    delay: Duration,
    calculator: () async -> String
) async -> String {
    try? await Task.sleep(for: delay)
    return await calculator()
}

func fullName() async -> String {
    "Foo bar"
}

Task {
    await getFullName(
        delay: .seconds(2)
    ) {
        async let name = fullName()
        return await name
    }
}
