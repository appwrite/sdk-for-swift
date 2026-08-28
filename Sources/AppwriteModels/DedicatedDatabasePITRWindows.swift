import Foundation
import JSONCodable

/// PITRWindows
open class DedicatedDatabasePITRWindows: Codable {

    enum CodingKeys: String, CodingKey {
        case earliest = "earliest"
        case latest = "latest"
    }

    /// Earliest available recovery point.
    public let earliest: String
    /// Latest available recovery point.
    public let latest: String

    init(
        earliest: String,
        latest: String
    ) {
        self.earliest = earliest
        self.latest = latest
    }

    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        self.earliest = try container.decode(String.self, forKey: .earliest)
        self.latest = try container.decode(String.self, forKey: .latest)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encode(earliest, forKey: .earliest)
        try container.encode(latest, forKey: .latest)
    }

    public func toMap() -> [String: Any] {
        return [
            "earliest": earliest as Any,
            "latest": latest as Any,
        ]
    }

    public static func from(map: [String: Any]) -> DedicatedDatabasePITRWindows {
        return DedicatedDatabasePITRWindows(
            earliest: map["earliest"] as! String,
            latest: map["latest"] as! String
        )
    }
}
