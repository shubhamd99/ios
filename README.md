# IOS Development

## Swift

Swift is a programming language created by Apple to build apps for iOS, Mac, Apple TV, and Apple Watch. It's open source and easy to use, with a concise syntax and modern features. Swift is optimized for running on iOS, macOS, and other Apple platforms, and Apple offers a variety of frameworks and APIs to make applications unique.
Swift has some common similarities to Python, including a clear syntax and a RELP environment that facilitates finding errors in code and debugging.

The latest version of Swift is Swift 5.9.2

### Start writing Swift code:

- Create a workspace

![img_url](https://i.imgur.com/HXVrRAP.png)

- Create a Playground

![img_url](https://i.imgur.com/lzv6wjQ.png)

### Data Types in Swift

* Character:  "s","a"	            - a 16-bit Unicode character
* String:	  "hello world!"	    - represents textual data
* Int:	      3, -23	            - an integer number
* Float:	  2.4, 3.14, -23.21	    - represents 32-bit floating-point number
* Double:	  2.422342412414	    - represents 64-bit floating-point number
* Bool:	      true and false	    - Any of two values: true or false


* Int8	8 bit	-128 to 127
* Int16	16 bit	-215 to 215-1
* Int32	32bit	-231 to 231-1
* Int64	64bit	-263 to 263-1
* UInt32	Depend on platform	0 to 232
* UInt64	Depend on platform	0 to 264


#### CGFloat

The basic type for floating-point scalar values in Core Graphics and related frameworks.


### Variables

- let: let is used to declare constants, which are immutable values that cannot be changed after they are assigned.

- var: The keyword var is used to declare variables, which are mutable values that can have their values changed or reassigned after initialization. The var keyword is required for lazy properties

### Structure vs Class

#### Structures (structs):

- These are value types. When you copy a struct, a new copy of the data is created. Any changes made to the copy won't affect the original struct. This makes them ideal for situations where you don't want to accidentally modify the original data.
- Since they're value types, structs are typically stored on the stack, which is faster to access but has limited memory space. They are automatically deallocated when they go out of scope (no longer needed)
- Structs: Structs cannot inherit properties and behaviors from other structs.
- Int, Double, String, and Array are all implemented as structs, making them lightweight and efficient for data storage.

#### Classes (class):

- These are reference types. When you copy a class, you're copying a reference to the same memory location where the original class resides. Changes made to the copy will also affect the original class. This is useful when you want multiple parts of your code to work with the same data.
- As reference types, classes reside on the heap, which has more memory available but is slower to access. They need to be manually deallocated using techniques like ARC (Automatic Reference Counting) to avoid memory leaks.
- Classes can inherit from other classes, allowing them to reuse existing functionality and extend it with their own specific features. This is a powerful mechanism for code organization and reusability.
- Date, FileManager, and URLSession are implemented as classes, as they represent complex objects with behaviors like date manipulation, file management, and network interactions.


### Operators

In Swift, operators are categorized based on the number of operands (values) they work with and their position relative to those operands. Here's a breakdown of unary prefix, unary postfix, and binary infix operators:

1. Unary Prefix Operators:

These operators appear immediately before their single operand.
They perform an operation on the operand and return a resulting value.
Examples:

```
- (negation): -x negates the value of x (e.g., -5 becomes -5).
! (logical NOT): !truthValue inverts the truth value (e.g., !true becomes false).
Increment (++): ++x increments the value of x by 1 before returning it (e.g., x = 3; ++x becomes x = 4).
Decrement (--): --x decrements the value of x by 1 before returning it (e.g., x = 3; --x becomes x = 2).
```

2. Unary Postfix Operators:

These operators appear immediately after their single operand.
They perform an operation on the operand but might not necessarily modify the original value.
Examples:

```
Increment (++): x++ increments the value of x by 1 after returning its current value (e.g., x = 3; x++ becomes x = 3 (original value), then x becomes 4).
Decrement (--): x-- decrements the value of x by 1 after returning its current value (e.g., x = 3; x-- becomes x = 3 (original value), then x becomes 2).
Force unwrapping (!): This is used with optional values to access the wrapped value if it's not nil. However, it can be dangerous if the optional is actually nil, so use it cautiously (e.g., let unwrappedValue = optionalValue!).
```

3. Binary Infix Operators:

These operators appear between two operands.
They perform an operation on both operands and return a resulting value.
Examples:

```
Arithmetic operators: +, -, *, /, % (e.g., 2 + 3 evaluates to 5).
Comparison operators: <, >, <=, >=, ==, != (e.g., 5 > 3 evaluates to true).
Logical operators: &&, ||, ! (e.g., x > 0 && y < 10 combines two conditions).
Assignment operators: =, +=, -=, *=, /= (e.g., x += 5 is equivalent to x = x + 5).
```

### Closures

closures are self-contained blocks of code that can capture and store references to any constants and variables from the context in which they're defined. This is known as "closing over" those values. Closures are powerful tools for writing concise, functional code. Closures don't have a formal name like a function. They're defined inline using curly braces {}. Closures can capture variables from their surrounding scope, allowing them to access and potentially modify those values even after the surrounding code has finished execution.

### Enumerations

Enumerations, or enums, are user-defined data types that group related values together. They can be used to represent different cases or states in code, and can be as simple as a list of related constants or as complex as containing associated values and methods.

## Protocols

In Swift, protocols are interfaces that define a blueprint for properties, methods, and other requirements that a class, structure, or enumeration must adhere to. Protocols can be used to specify a property's type, whether it's gettable or settable, and more. They can be declared after the names of the class, structure, or enumeration types.

## Extensions

In Swift, extensions allow developers to add new functionality to existing classes, structs, enumerations, or protocols without modifying their original implementation. This includes the ability to extend types for which the original source code is not accessible, a concept known as retroactive modeling.

## Generics

Generics in Swift are a fundamental tool that allows developers to write reusable, flexible, and clean code. They enable developers to use different data types in the same functions and classes, while still providing strong type safety.

## Swift UI vs UIKit

SwiftUI and UIKit are both popular tools for building iOS user interfaces. SwiftUI is a newer, more declarative framework that's good for new projects, while UIKit is a more traditional, imperative framework that's better for maintaining legacy apps:

### Swift UI

SwiftUI is a more recent framework built by Apple, released in 2019 with version 13 of the iOS SDK. It’s particularly attractive for developers who want to create beautiful and responsive UIs in a declarative way. It’s built on top of the Swift programming language and is intended for building UIs for applications across Apple’s ecosystem, including iOS, macOS, tvOS, and watchOS.

- Declarative syntax - With declarative syntax, you can describe the desired outcome of a UI rather than the specific steps for achieving it. The framework handles all the necessary actions and implementation details that your view requires, leaving you to only worry about its appearance.

- State and data binding - State is a property wrapper used to store values that can change over time and whose changes need to be reflected in the UI. Data binding is a method for connecting two pieces of data so that changes to one are automatically reflected in the other.

- Previews and live editing - You can see changes in your app’s UI in real-time as you write and modify code, thanks to SwiftUI’s previews and live editing features. You don’t have to run your app on an emulator or a device to see a live rendering of your UI code. This makes the development process faster and more efficient.

- Simplified code and easier maintenance. Improved design-to-code workflow. Automatic support for dark mode and accessibility.

- Limited compatibility with older iOS versions. Less mature framework with fewer UI components. 


### UIKit

UIkit was launched in 2008 to provide pre-built components for developers to handle inputs, touch events, and other user interactions on iOS apps. It was built with Objective-C, an improvement of the C programming language, that adds support for object-oriented programming.

UIkit was initially designed to build a UI for the iPhone’s small touch-based screens, but it has evolved to support various devices over the years, including tvOS apps. UIkit has added numerous features over time, like auto layout, dynamic types, collection views, and drag-and-drop functionality, to make it a more powerful and user-friendly framework.

Key components and design patterns: 

- View controllers - As the name suggests, view controllers are objects used to manage UI views by responding to user input. They handle events such as button taps, gestures, and passing data to the views. They also act as an intermediary between the app’s data model and the views, as well as coordinating with other objects in the app.

- Interface Builder and storyboards - Interface Builder is a visual editor embedded into Xcode (an IDE for Apple platforms) used to create and design user interfaces for iOS apps. Storyboards are visual representations of the app’s user interface, representing the screens, their order, and the transitions between them. 

- Delegates and data sources - Delegates and data sources is a common design pattern in UIkit for iOS app development. It entails having a data source—an object responsible for providing the data displayed in a view—and a delegate—an object responsible for handling events or actions occurring in a view

- A mature and stable framework. A wide range of UI components. Extensive documentation and community support.

- Lack of built-in support for modern design patterns. Verbose code.

![comparison](https://sendbird.sfo3.digitaloceanspaces.com/cms/Tutorial-image_Framework-comparison-for-ease-of-use.png)


## Async Swift

To declare an asynchronous function in Swift, write the async keyword after the function name and before its return type. An asynchronous function can also throw errors like a normal function. It is marked with the async throws keywords in such cases.


```swift
import Foundation

func fetchImageData() async throws -> Data {
	let data = // ... Download the image data ...
	return data
}
```

```swift
func fetchImageData() async throws -> Data {
	let url = URL(string: "https://images.dog.ceo/breeds/mountain-swiss/n02107574_1387.jpg")!
	let (data, _) = try await URLSession.shared.data(from: url)
	return data
}
```

The introduction of async await in Swift 5.5 replaced completion closures in asynchronous functions. Before Swift concurrency, callbacks were necessary to resume execution when asynchronous functions finished.

```swift
func fetchImageData(completion: @escaping (Result<Data, Error>)) {
	let url = URL(string: "https://images.dog.ceo/breeds/mountain-swiss/n02107574_1387.jpg")!
	let task = URLSession.shared.dataTask(with: url) { data, response, error in
		if let error = error {
			completion(.failure(error))
			return
		}
		completion(.success(data))
	}
	task.resume()
}
```

### Task

A task in Swift is a unit of work that can be executed concurrently or asynchronously. It is a part of the Swift concurrency model.
You can create a task by providing a closure that contains the work to perform. Tasks can start running immediately after creation.
You can access the result from a throwing task using the value property. You can access the result or error from a throwing task using the result property.
Tasks can be used to improve the performance of your app by allowing multiple tasks to run simultaneously. You can also use tasks to make your app more responsive by allowing long-running tasks to periodically pause and let other tasks proceed.

```swift
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
```

## Create a new app

### Create a new project

![img_url](https://i.imgur.com/BqV0nZI.png)

![img_url](https://i.imgur.com/nE1iPLk.png)

![img_url](https://i.imgur.com/AZyOpZy.png)


## Components

### View

A type that represents part of your app’s user interface and provides modifiers that you use to configure views. You create custom views by declaring types that conform to the View protocol. Implement the required body computed property to provide the content for your custom view.

```swift
struct MyView: View {
    var body: some View {
        Text("Hello, World!")
    }
}
```

### VStack
A view that arranges its subviews in a vertical line.
Unlike LazyVStack, which only renders the views when your app needs to display them, a VStack renders the views all at once, regardless of whether they are on- or offscreen. Use the regular VStack when you have a small number of subviews or don’t want the delayed rendering behavior of the “lazy” version.

```swift
var body: some View {
    VStack(
        alignment: .leading,
        spacing: 10
    ) {
        ForEach(
            1...10,
            id: \.self
        ) {
            Text("Item \($0)")
        }
    }
}
```

### @State

A property wrapper type that can read and write a value managed by SwiftUI. Use state as the single source of truth for a given value type that you store in a view hierarchy. Create a state value in an App, Scene, or View by applying the @State attribute to a property declaration and providing an initial value. Declare state as private to prevent setting it in a memberwise initializer, which can conflict with the storage management that SwiftUI provides:

```swift
struct PlayButton: View {
    @State private var isPlaying: Bool = false // Create the state.


    var body: some View {
        Button(isPlaying ? "Pause" : "Play") { // Read the state.
            isPlaying.toggle() // Write the state.
        }
    }
}
```

### NavigationView (Depricated) 

A view for presenting a stack of views that represents a visible path in a navigation hierarchy. Use a NavigationView to create a navigation-based app in which the user can traverse a collection of views. 
