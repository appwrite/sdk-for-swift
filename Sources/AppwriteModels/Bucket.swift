import Foundation
import JSONCodable

/// Bucket
open class Bucket: Codable {

    enum CodingKeys: String, CodingKey {
        case id = "$id"
        case createdAt = "$createdAt"
        case updatedAt = "$updatedAt"
        case permissions = "$permissions"
        case fileSecurity = "fileSecurity"
        case name = "name"
        case enabled = "enabled"
        case maximumFileSize = "maximumFileSize"
        case allowedFileExtensions = "allowedFileExtensions"
        case compression = "compression"
        case encryption = "encryption"
        case antivirus = "antivirus"
    }

    /// Bucket ID.
    public let id: String

    /// Bucket creation time in ISO 8601 format.
    public let createdAt: String

    /// Bucket update date in ISO 8601 format.
    public let updatedAt: String

    /// Bucket permissions. [Learn more about permissions](https://appwrite.io/docs/permissions).
    public let permissions: [String]

    /// Whether file-level security is enabled. [Learn more about permissions](https://appwrite.io/docs/permissions).
    public let fileSecurity: Bool

    /// Bucket name.
    public let name: String

    /// Bucket enabled.
    public let enabled: Bool

    /// Maximum file size supported.
    public let maximumFileSize: Int

    /// Allowed file extensions.
    public let allowedFileExtensions: [String]

    /// Compression algorithm choosen for compression. Will be one of none, [gzip](https://en.wikipedia.org/wiki/Gzip), or [zstd](https://en.wikipedia.org/wiki/Zstd).
    public let compression: String

    /// Bucket is encrypted.
    public let encryption: Bool

    /// Virus scanning is enabled.
    public let antivirus: Bool


    init(
        id: String,
        createdAt: String,
        updatedAt: String,
        permissions: [String],
        fileSecurity: Bool,
        name: String,
        enabled: Bool,
        maximumFileSize: Int,
        allowedFileExtensions: [String],
        compression: String,
        encryption: Bool,
        antivirus: Bool
    ) {
        self.id = id
        self.createdAt = createdAt
        self.updatedAt = updatedAt
        self.permissions = permissions
        self.fileSecurity = fileSecurity
        self.name = name
        self.enabled = enabled
        self.maximumFileSize = maximumFileSize
        self.allowedFileExtensions = allowedFileExtensions
        self.compression = compression
        self.encryption = encryption
        self.antivirus = antivirus
    }

    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        self.id = try container.decode(String.self, forKey: .id)
        self.createdAt = try container.decode(String.self, forKey: .createdAt)
        self.updatedAt = try container.decode(String.self, forKey: .updatedAt)
        self.permissions = try container.decode([String].self, forKey: .permissions)
        self.fileSecurity = try container.decode(Bool.self, forKey: .fileSecurity)
        self.name = try container.decode(String.self, forKey: .name)
        self.enabled = try container.decode(Bool.self, forKey: .enabled)
        self.maximumFileSize = try container.decode(Int.self, forKey: .maximumFileSize)
        self.allowedFileExtensions = try container.decode([String].self, forKey: .allowedFileExtensions)
        self.compression = try container.decode(String.self, forKey: .compression)
        self.encryption = try container.decode(Bool.self, forKey: .encryption)
        self.antivirus = try container.decode(Bool.self, forKey: .antivirus)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encode(id, forKey: .id)
        try container.encode(createdAt, forKey: .createdAt)
        try container.encode(updatedAt, forKey: .updatedAt)
        try container.encode(permissions, forKey: .permissions)
        try container.encode(fileSecurity, forKey: .fileSecurity)
        try container.encode(name, forKey: .name)
        try container.encode(enabled, forKey: .enabled)
        try container.encode(maximumFileSize, forKey: .maximumFileSize)
        try container.encode(allowedFileExtensions, forKey: .allowedFileExtensions)
        try container.encode(compression, forKey: .compression)
        try container.encode(encryption, forKey: .encryption)
        try container.encode(antivirus, forKey: .antivirus)
    }

    public func toMap() -> [String: Any] {
        return [
            "$id": id as Any,
            "$createdAt": createdAt as Any,
            "$updatedAt": updatedAt as Any,
            "$permissions": permissions as Any,
            "fileSecurity": fileSecurity as Any,
            "name": name as Any,
            "enabled": enabled as Any,
            "maximumFileSize": maximumFileSize as Any,
            "allowedFileExtensions": allowedFileExtensions as Any,
            "compression": compression as Any,
            "encryption": encryption as Any,
            "antivirus": antivirus as Any
        ]
    }

    public static func from(map: [String: Any] ) -> Bucket {
        return Bucket(
            id: map["$id"] as? String ?? "",
            createdAt: map["$createdAt"] as? String ?? "",
            updatedAt: map["$updatedAt"] as? String ?? "",
            permissions: map["$permissions"] as? [String] ?? [],
            fileSecurity: map["fileSecurity"] as? Bool ?? false,
            name: map["name"] as? String ?? "",
            enabled: map["enabled"] as? Bool ?? false,
            maximumFileSize: map["maximumFileSize"] as? Int ?? 0,
            allowedFileExtensions: map["allowedFileExtensions"] as? [String] ?? [],
            compression: map["compression"] as? String ?? "",
            encryption: map["encryption"] as? Bool ?? false,
            antivirus: map["antivirus"] as? Bool ?? false
        )
    }
}
