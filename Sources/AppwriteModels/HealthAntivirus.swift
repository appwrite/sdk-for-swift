import Foundation
import JSONCodable

/// Health Antivirus
open class HealthAntivirus: Codable {

    enum CodingKeys: String, CodingKey {
        case version = "version"
        case status = "status"
    }

    /// Antivirus version.
    public let version: String

    /// Antivirus status. Possible values can are: `disabled`, `offline`, `online`
    public let status: String


    init(
        version: String,
        status: String
    ) {
        self.version = version
        self.status = status
    }

    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        self.version = try container.decode(String.self, forKey: .version)
        self.status = try container.decode(String.self, forKey: .status)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encode(version, forKey: .version)
        try container.encode(status, forKey: .status)
    }

    public func toMap() -> [String: Any] {
        return [
            "version": version as Any,
            "status": status as Any
        ]
    }

    public static func from(map: [String: Any] ) -> HealthAntivirus {
        return HealthAntivirus(
            version: map["version"] as! String,
            status: map["status"] as! String
        )
    }
}
