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