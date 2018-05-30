import Vapor

/// Register your application's routes here.
public func routes(_ router: Router) throws {
    // Basic "Hello, world!" example
    router.get { req in
        return "Hello there!"
    }

    router.get("jstest", "get") { req -> Future<[JSTest]> in
        let jstest = JSTest(id: nil, testStr: "This is a test string", testInt: 108, testReal: 1.61803)
        return Future.map(on: req) { return [jstest] }
    }
    
    // Example of configuring a controller
    let todoController = TodoController()
    router.get("todos", use: todoController.index)
    router.post("todos", use: todoController.create)
    router.delete("todos", Todo.parameter, use: todoController.delete)
}
