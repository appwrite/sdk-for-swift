
/// Bucket
public class Bucket {

    /// Bucket ID.
    public let id: String

    /// File read permissions.
    public let read: [Any]

    /// File write permissions.
    public let write: [Any]

    /// Bucket permission model. Possible values: `bucket` or `file`
    public let permission: String

    /// Bucket creation date in Unix timestamp.
    public let dateCreated: Int

    /// Bucket update date in Unix timestamp.
    public let dateUpdated: Int

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
        read: [Any],
        write: [Any],
        permission: String,
        dateCreated: Int,
        dateUpdated: Int,
        name: String,
        enabled: Bool,
        maximumFileSize: Int,
        allowedFileExtensions: [Any],
        encryption: Bool,
        antivirus: Bool
    ) {
        self.id = id
        self.read = read
        self.write = write
        self.permission = permission
        self.dateCreated = dateCreated
        self.dateUpdated = dateUpdated
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
            read: map["$read"] as! [Any],
            write: map["$write"] as! [Any],
            permission: map["permission"] as! String,
            dateCreated: map["dateCreated"] as! Int,
            dateUpdated: map["dateUpdated"] as! Int,
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
            "$read": read as Any,
            "$write": write as Any,
            "permission": permission as Any,
            "dateCreated": dateCreated as Any,
            "dateUpdated": dateUpdated as Any,
            "name": name as Any,
            "enabled": enabled as Any,
            "maximumFileSize": maximumFileSize as Any,
            "allowedFileExtensions": allowedFileExtensions as Any,
            "encryption": encryption as Any,
            "antivirus": antivirus as Any
        ]
    }
                                                    
}