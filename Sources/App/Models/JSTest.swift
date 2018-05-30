import FluentSQLite
import Vapor

struct JSTest: SQLiteModel {
    var id: Int?
    var testStr: String
    var testInt: Int
    var testReal: Double
    
    init(id: Int? = nil, testStr: String, testInt: Int, testReal: Double) {
        self.id = id
        self.testStr = testStr
        self.testInt = testInt
        self.testReal = testReal
    }
}

/// Allows `Todo` to be used as a dynamic migration.
extension JSTest: Migration { }

/// Allows `Todo` to be encoded to and decoded from HTTP messages.
extension JSTest: Content { }

/// Allows `Todo` to be used as a dynamic parameter in route definitions.
extension JSTest: Parameter { }
