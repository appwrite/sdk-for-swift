import Foundation
import JSONCodable
import AppwriteEnums

/// Platform Android
open class PlatformAndroid: Codable {

    enum CodingKeys: String, CodingKey {
        case id = "$id"
        case createdAt = "$createdAt"
        case updatedAt = "$updatedAt"
        case name = "name"
        case type = "type"
        case applicationId = "applicationId"
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
    /// Android application ID.
    public let applicationId: String

    init(
        id: String,
        createdAt: String,
        updatedAt: String,
        name: String,
        type: AppwriteEnums.PlatformType,
        applicationId: String
    ) {
        self.id = id
        self.createdAt = createdAt
        self.updatedAt = updatedAt
        self.name = name
        self.type = type
        self.applicationId = applicationId
    }

    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        self.id = try container.decode(String.self, forKey: .id)
        self.createdAt = try container.decode(String.self, forKey: .createdAt)
        self.updatedAt = try container.decode(String.self, forKey: .updatedAt)
        self.name = try container.decode(String.self, forKey: .name)
        self.type = AppwriteEnums.PlatformType(rawValue: try container.decode(String.self, forKey: .type))!
        self.applicationId = try container.decode(String.self, forKey: .applicationId)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encode(id, forKey: .id)
        try container.encode(createdAt, forKey: .createdAt)
        try container.encode(updatedAt, forKey: .updatedAt)
        try container.encode(name, forKey: .name)
        try container.encode(type.rawValue, forKey: .type)
        try container.encode(applicationId, forKey: .applicationId)
    }

    public func toMap() -> [String: Any] {
        return [
            "$id": id as Any,
            "$createdAt": createdAt as Any,
            "$updatedAt": updatedAt as Any,
            "name": name as Any,
            "type": type.rawValue as Any,
            "applicationId": applicationId as Any
        ]
    }

    public static func from(map: [String: Any] ) -> PlatformAndroid {
        return PlatformAndroid(
            id: map["$id"] as! String,
            createdAt: map["$createdAt"] as! String,
            updatedAt: map["$updatedAt"] as! String,
            name: map["name"] as! String,
            type: PlatformType(rawValue: map["type"] as! String)!,
            applicationId: map["applicationId"] as! String
        )
    }
}
