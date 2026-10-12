import Foundation
import JSONCodable

/// Platforms List
open class PlatformList: Codable {

    enum CodingKeys: String, CodingKey {
        case total = "total"
        case platforms = "platforms"
    }

    /// Total number of platforms in the given project.
    public let total: Int
    /// List of platforms.
    public let platforms: [AnyCodable]

    init(
        total: Int,
        platforms: [AnyCodable]
    ) {
        self.total = total
        self.platforms = platforms
    }

    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        self.total = try container.contains(.total) ? container.decode(Int.self, forKey: .total) : 0
        self.platforms = try container.decode([AnyCodable].self, forKey: .platforms)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encode(total, forKey: .total)
        try container.encode(platforms, forKey: .platforms)
    }

    public func toMap() -> [String: Any] {
        return [
            "total": total as Any,
            "platforms": platforms as Any,
        ]
    }

    public static func from(map: [String: Any]) -> PlatformList {
        let defaults: [String: Any] = [
            "total": 0,
        ]
        let map = defaults.merging(map) { _, new in new }

        return PlatformList(
            total: map["total"] as! Int,
            platforms: (map["platforms"] as! [Any]).map { AnyCodable($0) }
        )
    }
}
