import Foundation

public enum NHostMigrationResource: String, Codable, CustomStringConvertible {
    case user = "user"
    case database = "database"
    case table = "table"
    case column = "column"
    case index = "index"
    case row = "row"
    case document = "document"
    case attribute = "attribute"
    case collection = "collection"
    case bucket = "bucket"
    case file = "file"

    public var description: String {
        return rawValue
    }
}
