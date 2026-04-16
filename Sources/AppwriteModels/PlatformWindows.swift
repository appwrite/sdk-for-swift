import Foundation
import JSONCodable
import AppwriteEnums

/// Platform Windows
open class PlatformWindows: Codable {

    enum CodingKeys: String, CodingKey {
        case id = "$id"
        case createdAt = "$createdAt"
        case updatedAt = "$updatedAt"
        case name = "name"
        case type = "type"
        case packageIdentifierName = "packageIdentifierName"
    }

    /// Platform ID.
    public let id: String
    /// Platform creation date in ISO 8601 format.
    public let createdAt: String
    /// Platform update date in ISO 8601 format.
    public let updatedAt: String
    /// Platform name.
    public let name: String
    /// Platform type. Possible values are: windows, apple, android, linux, web.
    public let type: AppwriteEnums.PlatformType
    /// Windows package identifier name.
    public let packageIdentifierName: String

    init(
        id: String,
        createdAt: String,
        updatedAt: String,
        name: String,
        type: AppwriteEnums.PlatformType,
        packageIdentifierName: String
    ) {
        self.id = id
        self.createdAt = createdAt
        self.updatedAt = updatedAt
        self.name = name
        self.type = type
        self.packageIdentifierName = packageIdentifierName
    }

    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        self.id = try container.decode(String.self, forKey: .id)
        self.createdAt = try container.decode(String.self, forKey: .createdAt)
        self.updatedAt = try container.decode(String.self, forKey: .updatedAt)
        self.name = try container.decode(String.self, forKey: .name)
        self.type = AppwriteEnums.PlatformType(rawValue: try container.decode(String.self, forKey: .type))!
        self.packageIdentifierName = try container.decode(String.self, forKey: .packageIdentifierName)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encode(id, forKey: .id)
        try container.encode(createdAt, forKey: .createdAt)
        try container.encode(updatedAt, forKey: .updatedAt)
        try container.encode(name, forKey: .name)
        try container.encode(type.rawValue, forKey: .type)
        try container.encode(packageIdentifierName, forKey: .packageIdentifierName)
    }

    public func toMap() -> [String: Any] {
        return [
            "$id": id as Any,
            "$createdAt": createdAt as Any,
            "$updatedAt": updatedAt as Any,
            "name": name as Any,
            "type": type.rawValue as Any,
            "packageIdentifierName": packageIdentifierName as Any
        ]
    }

    public static func from(map: [String: Any] ) -> PlatformWindows {
        return PlatformWindows(
            id: map["$id"] as! String,
            createdAt: map["$createdAt"] as! String,
            updatedAt: map["$updatedAt"] as! String,
            name: map["name"] as! String,
            type: PlatformType(rawValue: map["type"] as! String)!,
            packageIdentifierName: map["packageIdentifierName"] as! String
        )
    }
}
