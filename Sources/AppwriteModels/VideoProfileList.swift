import Foundation
import JSONCodable

/// Video Profiles List
open class VideoProfileList: Codable {

    enum CodingKeys: String, CodingKey {
        case total = "total"
        case profiles = "profiles"
    }

    /// Total number of profiles that matched your query.
    public let total: Int
    /// List of profiles.
    public let profiles: [VideoProfile]

    init(
        total: Int,
        profiles: [VideoProfile]
    ) {
        self.total = total
        self.profiles = profiles
    }

    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        self.total = try container.contains(.total) ? container.decode(Int.self, forKey: .total) : 0
        self.profiles = try container.contains(.profiles) ? container.decode([VideoProfile].self, forKey: .profiles) : []
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encode(total, forKey: .total)
        try container.encode(profiles, forKey: .profiles)
    }

    public func toMap() -> [String: Any] {
        return [
            "total": total as Any,
            "profiles": profiles.map { $0.toMap() } as Any,
        ]
    }

    public static func from(map: [String: Any]) -> VideoProfileList {
        let defaults: [String: Any] = [
            "total": 0,
            "profiles": [Any](),
        ]
        let map = defaults.merging(map) { _, new in new }

        return VideoProfileList(
            total: map["total"] as! Int,
            profiles: (map["profiles"] as! [[String: Any]]).map { VideoProfile.from(map: $0) }
        )
    }
}
