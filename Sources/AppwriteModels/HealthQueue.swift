import Foundation
import JSONCodable

/// Health Queue
open class HealthQueue: Codable {

    enum CodingKeys: String, CodingKey {
        case size = "size"
    }

    /// Amount of actions in the queue.
    public let size: Int

    init(
        size: Int
    ) {
        self.size = size
    }

    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        self.size = try container.decode(Int.self, forKey: .size)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encode(size, forKey: .size)
    }

    public func toMap() -> [String: Any] {
        return [
            "size": size as Any
        ]
    }

    public static func from(map: [String: Any] ) -> HealthQueue {
        return HealthQueue(
            size: map["size"] as! Int
        )
    }
}
