import Vapor

/// Register your application's routes here.
public func routes(_ router: Router) throws {
    // Basic "Hello, world!" example
    router.get { req in
        return "Hello there!"
    }

    router.get("jstest", "get") { req -> Future<[JSTest]> in
        let jstest1 = JSTest(id: nil, testStr: "This is a test string1", testInt: 16, testReal: 1.61803)
        let jstest2 = JSTest(id: nil, testStr: "This is a test string2", testInt: 108, testReal: 3.14)
        return Future.map(on: req) { return [jstest1, jstest2] }
    }
    router.post(JSTest.self, at: "jstest", "post") { req, jstest -> Future<JSTest> in
        return jstest.save(on: req)
    }
    
    // Example of configuring a controller
    let todoController = TodoController()
    router.get("todos", use: todoController.index)
    router.post("todos", use: todoController.create)
    router.delete("todos", Todo.parameter, use: todoController.delete)
}
