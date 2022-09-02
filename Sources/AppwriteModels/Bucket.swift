
/// Bucket
public class Bucket {

    /// Bucket ID.
    public let id: String

    /// Bucket creation time in Datetime
    public let createdAt: String

    /// Bucket update date in Datetime
    public let updatedAt: String

    /// Bucket permissions. [Learn more about permissions](/docs/permissions).
    public let permissions: [Any]

    /// Whether file-level security is enabled. [Learn more about permissions](/docs/permissions).
    public let fileSecurity: String

    /// Bucket name.
    public let name: String

    /// Bucket enabled.
    public let enabled: Bool

    /// Maximum file size supported.
    public let maximumFileSize: Int

    /// Allowed file extensions.
    public let allowedFileExtensions: [Any]

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
        permissions: [Any],
        fileSecurity: String,
        name: String,
        enabled: Bool,
        maximumFileSize: Int,
        allowedFileExtensions: [Any],
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

    public static func from(map: [String: Any]) -> Bucket {
        return Bucket(
            id: map["$id"] as! String,
            createdAt: map["$createdAt"] as! String,
            updatedAt: map["$updatedAt"] as! String,
            permissions: map["$permissions"] as! [Any],
            fileSecurity: map["fileSecurity"] as! String,
            name: map["name"] as! String,
            enabled: map["enabled"] as! Bool,
            maximumFileSize: map["maximumFileSize"] as! Int,
            allowedFileExtensions: map["allowedFileExtensions"] as! [Any],
            compression: map["compression"] as! String,
            encryption: map["encryption"] as! Bool,
            antivirus: map["antivirus"] as! Bool
        )
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
                                                    
}