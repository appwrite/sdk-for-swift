
/// Bucket
public class Bucket {

    /// Bucket ID.
    public let id: String

    /// Bucket creation date in Unix timestamp.
    public let createdAt: Int

    /// Bucket update date in Unix timestamp.
    public let updatedAt: Int

    /// File read permissions.
    public let read: [Any]

    /// File write permissions.
    public let write: [Any]

    /// Bucket permission model. Possible values: `bucket` or `file`
    public let permission: String

    /// Bucket name.
    public let name: String

    /// Bucket enabled.
    public let enabled: Bool

    /// Maximum file size supported.
    public let maximumFileSize: Int

    /// Allowed file extensions.
    public let allowedFileExtensions: [Any]

    /// Bucket is encrypted.
    public let encryption: Bool

    /// Virus scanning is enabled.
    public let antivirus: Bool

    init(
        id: String,
        createdAt: Int,
        updatedAt: Int,
        read: [Any],
        write: [Any],
        permission: String,
        name: String,
        enabled: Bool,
        maximumFileSize: Int,
        allowedFileExtensions: [Any],
        encryption: Bool,
        antivirus: Bool
    ) {
        self.id = id
        self.createdAt = createdAt
        self.updatedAt = updatedAt
        self.read = read
        self.write = write
        self.permission = permission
        self.name = name
        self.enabled = enabled
        self.maximumFileSize = maximumFileSize
        self.allowedFileExtensions = allowedFileExtensions
        self.encryption = encryption
        self.antivirus = antivirus
    }

    public static func from(map: [String: Any]) -> Bucket {
        return Bucket(
            id: map["$id"] as! String,
            createdAt: map["$createdAt"] as! Int,
            updatedAt: map["$updatedAt"] as! Int,
            read: map["$read"] as! [Any],
            write: map["$write"] as! [Any],
            permission: map["permission"] as! String,
            name: map["name"] as! String,
            enabled: map["enabled"] as! Bool,
            maximumFileSize: map["maximumFileSize"] as! Int,
            allowedFileExtensions: map["allowedFileExtensions"] as! [Any],
            encryption: map["encryption"] as! Bool,
            antivirus: map["antivirus"] as! Bool
        )
    }

    public func toMap() -> [String: Any] {
        return [
            "$id": id as Any,
            "$createdAt": createdAt as Any,
            "$updatedAt": updatedAt as Any,
            "$read": read as Any,
            "$write": write as Any,
            "permission": permission as Any,
            "name": name as Any,
            "enabled": enabled as Any,
            "maximumFileSize": maximumFileSize as Any,
            "allowedFileExtensions": allowedFileExtensions as Any,
            "encryption": encryption as Any,
            "antivirus": antivirus as Any
        ]
    }
                                                    
}