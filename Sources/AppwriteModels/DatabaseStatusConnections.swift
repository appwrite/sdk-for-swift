import Foundation
import JSONCodable

/// Connections
open class DatabaseStatusConnections: Codable {

    enum CodingKeys: String, CodingKey {
        case current = "current"
        case max = "max"
    }

    /// Current number of active connections.
    public let current: Int
    /// Maximum allowed connections.
    public let max: Int

    init(
        current: Int,
        max: Int
    ) {
        self.current = current
        self.max = max
    }

    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        self.current = try container.decode(Int.self, forKey: .current)
        self.max = try container.decode(Int.self, forKey: .max)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encode(current, forKey: .current)
        try container.encode(max, forKey: .max)
    }

    public func toMap() -> [String: Any] {
        return [
            "current": current as Any,
            "max": max as Any
        ]
    }

    public static func from(map: [String: Any] ) -> DatabaseStatusConnections {
        return DatabaseStatusConnections(
            current: map["current"] as! Int,
            max: map["max"] as! Int
        )
    }
}
