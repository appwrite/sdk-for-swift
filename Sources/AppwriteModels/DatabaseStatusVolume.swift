import Foundation
import JSONCodable

/// Volume
open class DatabaseStatusVolume: Codable {

    enum CodingKeys: String, CodingKey {
        case path = "path"
        case usedPercent = "usedPercent"
        case available = "available"
        case mounted = "mounted"
    }

    /// Mount path of the volume.
    public let path: String
    /// Percentage of storage used.
    public let usedPercent: String
    /// Available storage space.
    public let available: String
    /// Whether the volume is mounted.
    public let mounted: Bool

    init(
        path: String,
        usedPercent: String,
        available: String,
        mounted: Bool
    ) {
        self.path = path
        self.usedPercent = usedPercent
        self.available = available
        self.mounted = mounted
    }

    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        self.path = try container.contains(.path) ? container.decode(String.self, forKey: .path) : ""
        self.usedPercent = try container.contains(.usedPercent) ? container.decode(String.self, forKey: .usedPercent) : "0%"
        self.available = try container.contains(.available) ? container.decode(String.self, forKey: .available) : "0GB"
        self.mounted = try container.contains(.mounted) ? container.decode(Bool.self, forKey: .mounted) : false
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encode(path, forKey: .path)
        try container.encode(usedPercent, forKey: .usedPercent)
        try container.encode(available, forKey: .available)
        try container.encode(mounted, forKey: .mounted)
    }

    public func toMap() -> [String: Any] {
        return [
            "path": path as Any,
            "usedPercent": usedPercent as Any,
            "available": available as Any,
            "mounted": mounted as Any,
        ]
    }

    public static func from(map: [String: Any]) -> DatabaseStatusVolume {
        let defaults: [String: Any] = [
            "path": "",
            "usedPercent": "0%",
            "available": "0GB",
            "mounted": false,
        ]
        let map = defaults.merging(map) { _, new in new }

        return DatabaseStatusVolume(
            path: map["path"] as! String,
            usedPercent: map["usedPercent"] as! String,
            available: map["available"] as! String,
            mounted: map["mounted"] as! Bool
        )
    }
}
