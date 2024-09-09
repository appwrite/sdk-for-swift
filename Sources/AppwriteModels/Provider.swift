import Foundation
import JSONCodable

/// Provider
public class Provider {

    /// Provider ID.
    public let id: String

    /// Provider creation time in ISO 8601 format.
    public let createdAt: String

    /// Provider update date in ISO 8601 format.
    public let updatedAt: String

    /// The name for the provider instance.
    public let name: String

    /// The name of the provider service.
    public let provider: String

    /// Is provider enabled?
    public let enabled: Bool

    /// Type of provider.
    public let type: String

    /// Provider credentials.
    public let credentials: Any

    /// Provider options.
    public let options: Any?


    init(
        id: String,
        createdAt: String,
        updatedAt: String,
        name: String,
        provider: String,
        enabled: Bool,
        type: String,
        credentials: Any,
        options: Any?
    ) {
        self.id = id
        self.createdAt = createdAt
        self.updatedAt = updatedAt
        self.name = name
        self.provider = provider
        self.enabled = enabled
        self.type = type
        self.credentials = credentials
        self.options = options
    }

    public func toMap() -> [String: Any] {
        return [
            "$id": id as Any,
            "$createdAt": createdAt as Any,
            "$updatedAt": updatedAt as Any,
            "name": name as Any,
            "provider": provider as Any,
            "enabled": enabled as Any,
            "type": type as Any,
            "credentials": credentials as Any,
            "options": options as Any
        ]
    }

    public static func from(map: [String: Any] ) -> Provider {
        return Provider(
            id: map["$id"] as! String,
            createdAt: map["$createdAt"] as! String,
            updatedAt: map["$updatedAt"] as! String,
            name: map["name"] as! String,
            provider: map["provider"] as! String,
            enabled: map["enabled"] as! Bool,
            type: map["type"] as! String,
            credentials: map["credentials"] as! Any,
            options: map["options"] as? Any
        )
    }
}
