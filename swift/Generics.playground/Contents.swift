import Foundation


func perform<N: Numeric>(
    _ op: (N, N) -> N,
    on lhs: N,
    and rhs: N
) -> N {
    op(lhs, rhs)
}

perform(+, on: 10.1, and: 20.3) // 30.4

perform(+, on: 10, and: 10)
perform(-, on: 10, and: 10)
perform(*, on: 10, and: 10)
perform(/, on: 10, and: 10)

// Alternate way of defining generic function

func perform2<N>(
    _ op: (N, N) -> N,
    on lhs: N,
    and rhs: N
) -> N where N: Numeric {
    op(lhs, rhs)
}

perform2(+, on: 10.1, and: 20.3) // 30.4

perform2(+, on: 10, and: 10)
perform2(-, on: 10, and: 10)
perform2(*, on: 10, and: 10)
perform2(/, on: 10, and: 10)


protocol CanJump {
    func jump() -> String
}

protocol CanRun {
    func run() -> String
}


struct Person: CanJump, CanRun {
    func jump() -> String {
        "Jumping..."
    }
    
    func run() -> String {
        "Running"
    }
}


func jumpAndRun<T: CanJump & CanRun>(value: T) {
    value.jump()
    value.run()
}

let person = Person()
jumpAndRun(value: person)


// generics in extension

extension [String] {
    func longestString() -> String? {
        self.sorted { (lhs: String, rhs: String) -> Bool in
            lhs.count > rhs.count
        }.first
    }
}


["Foo", "Bar Baz", "Qux"].longestString() // Bar Baz


// generic protocol with associatedtype

protocol View {
    func addSubView(_ view: View)
}


extension View {
    func addSubView(_ view: View) {
        // empty
    }
}

struct Button: View {
    // empty
}

protocol PresentableAsView {
    associatedtype ViewType: View
    func produceView() -> ViewType
    func configure(
        superView: View,
        thisView: ViewType
    )
    func present(
        view: ViewType,
        on superView: View
    )
}

extension PresentableAsView {
    func configure(
        superView: View,
        thisView: ViewType
    ) {
        // empty by default
    }
    func present(
        view: ViewType,
        on superView: View
    ) {
        superView.addSubView(view)
    }
}

struct MyButton: PresentableAsView {
    func produceView() -> Button {
        Button()
    }
    
    func configure(superView: View, thisView: Button) {
        
    }
}

extension PresentableAsView where ViewType == Button {
    func doSomethingWithButton() {
        "this is a button"
    }
}


let button = MyButton()
button.doSomethingWithButton()


extension [Int] {
    func average() -> Double {
        Double(self.reduce(0, +)) / Double(self.count)
    }
}


[4, 2].average() // 3
[2, 5, 8].average() // 5
