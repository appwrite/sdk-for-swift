import Foundation
import JSONCodable
import AppwriteEnums

/// Health Antivirus
open class HealthAntivirus: Codable {

    enum CodingKeys: String, CodingKey {
        case version = "version"
        case status = "status"
    }

    /// Antivirus version.
    public let version: String

    /// Antivirus status. Possible values are: `disabled`, `offline`, `online`
    public let status: HealthAntivirusStatus


    init(
        version: String,
        status: HealthAntivirusStatus
    ) {
        self.version = version
        self.status = status
    }

    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        self.version = try container.decode(String.self, forKey: .version)
        self.status = HealthAntivirusStatus(rawValue: try container.decode(String.self, forKey: .status))!
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encode(version, forKey: .version)
        try container.encode(status.rawValue, forKey: .status)
    }

    public func toMap() -> [String: Any] {
        return [
            "version": version as Any,
            "status": status.rawValue as Any
        ]
    }

    public static func from(map: [String: Any] ) -> HealthAntivirus {
        return HealthAntivirus(
            version: map["version"] as! String,
            status: HealthAntivirusStatus(rawValue: map["status"] as! String)!
        )
    }
}
