import Foundation
import JSONCodable

/// Environment
open class Environment: Codable {

    enum CodingKeys: String, CodingKey {
        case id = "$id"
        case createdAt = "$createdAt"
        case updatedAt = "$updatedAt"
        case projectId = "projectId"
        case name = "name"
    }

    /// Environment ID, as passed in the X-Appwrite-Environment header.
    public let id: String
    /// Environment creation date in ISO 8601 format.
    public let createdAt: String
    /// Environment update date in ISO 8601 format.
    public let updatedAt: String
    /// ID of the project the environment belongs to, as passed in the X-Appwrite-Project header.
    public let projectId: String
    /// Environment name.
    public let name: String

    init(
        id: String,
        createdAt: String,
        updatedAt: String,
        projectId: String,
        name: String
    ) {
        self.id = id
        self.createdAt = createdAt
        self.updatedAt = updatedAt
        self.projectId = projectId
        self.name = name
    }

    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        self.id = try container.contains(.id) ? container.decode(String.self, forKey: .id) : ""
        self.createdAt = try container.contains(.createdAt) ? container.decode(String.self, forKey: .createdAt) : ""
        self.updatedAt = try container.contains(.updatedAt) ? container.decode(String.self, forKey: .updatedAt) : ""
        self.projectId = try container.contains(.projectId) ? container.decode(String.self, forKey: .projectId) : ""
        self.name = try container.contains(.name) ? container.decode(String.self, forKey: .name) : ""
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encode(id, forKey: .id)
        try container.encode(createdAt, forKey: .createdAt)
        try container.encode(updatedAt, forKey: .updatedAt)
        try container.encode(projectId, forKey: .projectId)
        try container.encode(name, forKey: .name)
    }

    public func toMap() -> [String: Any] {
        return [
            "$id": id as Any,
            "$createdAt": createdAt as Any,
            "$updatedAt": updatedAt as Any,
            "projectId": projectId as Any,
            "name": name as Any,
        ]
    }

    public static func from(map: [String: Any]) -> Environment {
        let defaults: [String: Any] = [
            "$id": "",
            "$createdAt": "",
            "$updatedAt": "",
            "projectId": "",
            "name": "",
        ]
        let map = defaults.merging(map) { _, new in new }

        return Environment(
            id: map["$id"] as! String,
            createdAt: map["$createdAt"] as! String,
            updatedAt: map["$updatedAt"] as! String,
            projectId: map["projectId"] as! String,
            name: map["name"] as! String
        )
    }
}
