import Foundation
import JSONCodable

/// Health Antivirus
public class HealthAntivirus {

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
