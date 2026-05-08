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

        self.id = try container.decode(String.self, forKey: .id)
        self.duration = try container.decode(Int.self, forKey: .duration)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encode(id, forKey: .id)
        try container.encode(duration, forKey: .duration)
    }

    public func toMap() -> [String: Any] {
        return [
            "$id": id as Any,
            "duration": duration as Any
        ]
    }

    public static func from(map: [String: Any] ) -> PolicySessionDuration {
        return PolicySessionDuration(
            id: map["$id"] as! String,
            duration: map["duration"] as! Int
        )
    }
}
