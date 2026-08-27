import Foundation
import JSONCodable

/// Extensions
open class DedicatedDatabaseExtensions: Codable {

    enum CodingKeys: String, CodingKey {
        case installed = "installed"
        case available = "available"
        case metadata = "metadata"
    }

    /// List of installed extensions.
    public let installed: [String]
    /// List of available extensions that can be installed.
    public let available: [String]
    /// Curated metadata (display name, description, category) for each available extension.
    public let metadata: [PostgresExtension]

    init(
        installed: [String],
        available: [String],
        metadata: [PostgresExtension]
    ) {
        self.installed = installed
        self.available = available
        self.metadata = metadata
    }

    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        self.installed = try container.decode([String].self, forKey: .installed)
        self.available = try container.decode([String].self, forKey: .available)
        self.metadata = try container.decode([PostgresExtension].self, forKey: .metadata)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encode(installed, forKey: .installed)
        try container.encode(available, forKey: .available)
        try container.encode(metadata, forKey: .metadata)
    }

    public func toMap() -> [String: Any] {
        return [
            "installed": installed as Any,
            "available": available as Any,
            "metadata": metadata.map { $0.toMap() } as Any,
        ]
    }

    public static func from(map: [String: Any]) -> DedicatedDatabaseExtensions {
        return DedicatedDatabaseExtensions(
            installed: map["installed"] as! [String],
            available: map["available"] as! [String],
            metadata: (map["metadata"] as! [[String: Any]]).map { PostgresExtension.from(map: $0) }
        )
    }
}
