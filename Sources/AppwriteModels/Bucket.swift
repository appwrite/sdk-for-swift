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
        case description = "description"
        case enabled = "enabled"
        case maximumFileSize = "maximumFileSize"
        case allowedFileExtensions = "allowedFileExtensions"
        case compression = "compression"
        case encryption = "encryption"
        case antivirus = "antivirus"
        case transformations = "transformations"
        case stripMetadata = "stripMetadata"
        case totalSize = "totalSize"
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
    /// Optional description for the bucket.
    public let description: String
    /// Bucket enabled.
    public let enabled: Bool
    /// Maximum file size supported.
    public let maximumFileSize: Int
    /// Allowed file extensions.
    public let allowedFileExtensions: [String]
    /// Compression algorithm chosen for compression. Will be one of none, [gzip](https://en.wikipedia.org/wiki/Gzip), or [zstd](https://en.wikipedia.org/wiki/Zstd).
    public let compression: String
    /// Bucket is encrypted.
    public let encryption: Bool
    /// Virus scanning is enabled.
    public let antivirus: Bool
    /// Image transformations are enabled.
    public let transformations: Bool
    /// Metadata such as location, device and capture time is removed from uploaded images.
    public let stripMetadata: Bool
    /// Total size of this bucket in bytes.
    public let totalSize: Int

    init(
        id: String,
        createdAt: String,
        updatedAt: String,
        permissions: [String],
        fileSecurity: Bool,
        name: String,
        description: String,
        enabled: Bool,
        maximumFileSize: Int,
        allowedFileExtensions: [String],
        compression: String,
        encryption: Bool,
        antivirus: Bool,
        transformations: Bool,
        stripMetadata: Bool,
        totalSize: Int
    ) {
        self.id = id
        self.createdAt = createdAt
        self.updatedAt = updatedAt
        self.permissions = permissions
        self.fileSecurity = fileSecurity
        self.name = name
        self.description = description
        self.enabled = enabled
        self.maximumFileSize = maximumFileSize
        self.allowedFileExtensions = allowedFileExtensions
        self.compression = compression
        self.encryption = encryption
        self.antivirus = antivirus
        self.transformations = transformations
        self.stripMetadata = stripMetadata
        self.totalSize = totalSize
    }

    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        self.id = try container.contains(.id) ? container.decode(String.self, forKey: .id) : ""
        self.createdAt = try container.contains(.createdAt) ? container.decode(String.self, forKey: .createdAt) : ""
        self.updatedAt = try container.contains(.updatedAt) ? container.decode(String.self, forKey: .updatedAt) : ""
        self.permissions = try container.contains(.permissions) ? container.decode([String].self, forKey: .permissions) : []
        self.fileSecurity = try container.contains(.fileSecurity) ? container.decode(Bool.self, forKey: .fileSecurity) : false
        self.name = try container.contains(.name) ? container.decode(String.self, forKey: .name) : ""
        self.description = try container.contains(.description) ? container.decode(String.self, forKey: .description) : ""
        self.enabled = try container.contains(.enabled) ? container.decode(Bool.self, forKey: .enabled) : true
        self.maximumFileSize = try container.contains(.maximumFileSize) ? container.decode(Int.self, forKey: .maximumFileSize) : 0
        self.allowedFileExtensions = try container.contains(.allowedFileExtensions) ? container.decode([String].self, forKey: .allowedFileExtensions) : []
        self.compression = try container.contains(.compression) ? container.decode(String.self, forKey: .compression) : ""
        self.encryption = try container.contains(.encryption) ? container.decode(Bool.self, forKey: .encryption) : true
        self.antivirus = try container.contains(.antivirus) ? container.decode(Bool.self, forKey: .antivirus) : true
        self.transformations = try container.contains(.transformations) ? container.decode(Bool.self, forKey: .transformations) : true
        self.stripMetadata = try container.contains(.stripMetadata) ? container.decode(Bool.self, forKey: .stripMetadata) : false
        self.totalSize = try container.contains(.totalSize) ? container.decode(Int.self, forKey: .totalSize) : 0
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encode(id, forKey: .id)
        try container.encode(createdAt, forKey: .createdAt)
        try container.encode(updatedAt, forKey: .updatedAt)
        try container.encode(permissions, forKey: .permissions)
        try container.encode(fileSecurity, forKey: .fileSecurity)
        try container.encode(name, forKey: .name)
        try container.encode(description, forKey: .description)
        try container.encode(enabled, forKey: .enabled)
        try container.encode(maximumFileSize, forKey: .maximumFileSize)
        try container.encode(allowedFileExtensions, forKey: .allowedFileExtensions)
        try container.encode(compression, forKey: .compression)
        try container.encode(encryption, forKey: .encryption)
        try container.encode(antivirus, forKey: .antivirus)
        try container.encode(transformations, forKey: .transformations)
        try container.encode(stripMetadata, forKey: .stripMetadata)
        try container.encode(totalSize, forKey: .totalSize)
    }

    public func toMap() -> [String: Any] {
        return [
            "$id": id as Any,
            "$createdAt": createdAt as Any,
            "$updatedAt": updatedAt as Any,
            "$permissions": permissions as Any,
            "fileSecurity": fileSecurity as Any,
            "name": name as Any,
            "description": description as Any,
            "enabled": enabled as Any,
            "maximumFileSize": maximumFileSize as Any,
            "allowedFileExtensions": allowedFileExtensions as Any,
            "compression": compression as Any,
            "encryption": encryption as Any,
            "antivirus": antivirus as Any,
            "transformations": transformations as Any,
            "stripMetadata": stripMetadata as Any,
            "totalSize": totalSize as Any,
        ]
    }

    public static func from(map: [String: Any]) -> Bucket {
        let defaults: [String: Any] = [
            "$id": "",
            "$createdAt": "",
            "$updatedAt": "",
            "$permissions": [Any](),
            "fileSecurity": false,
            "name": "",
            "description": "",
            "enabled": true,
            "maximumFileSize": 0,
            "allowedFileExtensions": [Any](),
            "compression": "",
            "encryption": true,
            "antivirus": true,
            "transformations": true,
            "stripMetadata": false,
            "totalSize": 0,
        ]
        let map = defaults.merging(map) { _, new in new }

        return Bucket(
            id: map["$id"] as! String,
            createdAt: map["$createdAt"] as! String,
            updatedAt: map["$updatedAt"] as! String,
            permissions: map["$permissions"] as! [String],
            fileSecurity: map["fileSecurity"] as! Bool,
            name: map["name"] as! String,
            description: map["description"] as! String,
            enabled: map["enabled"] as! Bool,
            maximumFileSize: map["maximumFileSize"] as! Int,
            allowedFileExtensions: map["allowedFileExtensions"] as! [String],
            compression: map["compression"] as! String,
            encryption: map["encryption"] as! Bool,
            antivirus: map["antivirus"] as! Bool,
            transformations: map["transformations"] as! Bool,
            stripMetadata: map["stripMetadata"] as! Bool,
            totalSize: map["totalSize"] as! Int
        )
    }
}
