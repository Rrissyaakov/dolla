import Combine

class MyObject: ObservableObject {
    @Published var name: String = "John"
    @Published var age: Int = 30
}

let myObject = MyObject()

let nameKeyPath = \MyObject.name
let ageKeyPath = \MyObject.age

let namePublisher = myObject.publisher(for: nameKeyPath)
let agePublisher = myObject.publisher(for: ageKeyPath)

let nameCancellable = namePublisher.sink { value in
    print("Name changed to: \(value)")
}

let ageCancellable = agePublisher.sink { value in
    print("Age changed to: \(value)")
}

myObject.name = "Alice" // Output: Name changed to: Alice
myObject.age = 25 // Output: Age changed to: 25
