import Foundation
import JSONCodable

/// Policy Session Duration
open class PolicySessionDuration: Codable {

    enum CodingKeys: String, CodingKey {
        case id = "$id"
        case duration = "duration"
    }

    /// Policy ID.
    public let id: String
    /// Session duration in seconds.
    public let duration: Int

    init(
        id: String,
        duration: Int
    ) {
        self.id = id
        self.duration = duration
    }

    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        self.id = try container.contains(.id) ? container.decode(String.self, forKey: .id) : ""
        self.duration = try container.contains(.duration) ? container.decode(Int.self, forKey: .duration) : 31536000
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encode(id, forKey: .id)
        try container.encode(duration, forKey: .duration)
    }

    public func toMap() -> [String: Any] {
        return [
            "$id": id as Any,
            "duration": duration as Any,
        ]
    }

    public static func from(map: [String: Any]) -> PolicySessionDuration {
        let defaults: [String: Any] = [
            "$id": "",
            "duration": 31536000,
        ]
        let map = defaults.merging(map) { _, new in new }

        return PolicySessionDuration(
            id: map["$id"] as! String,
            duration: map["duration"] as! Int
        )
    }
}
