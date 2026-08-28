import Foundation
import JSONCodable

/// Dedicated database restorations list
open class DedicatedDatabaseRestorationList: Codable {

    enum CodingKeys: String, CodingKey {
        case total = "total"
        case restorations = "restorations"
    }

    /// Total number of restorations that matched your query.
    public let total: Int
    /// List of restorations.
    public let restorations: [DedicatedDatabaseRestoration]

    init(
        total: Int,
        restorations: [DedicatedDatabaseRestoration]
    ) {
        self.total = total
        self.restorations = restorations
    }

    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        self.total = try container.decode(Int.self, forKey: .total)
        self.restorations = try container.decode([DedicatedDatabaseRestoration].self, forKey: .restorations)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encode(total, forKey: .total)
        try container.encode(restorations, forKey: .restorations)
    }

    public func toMap() -> [String: Any] {
        return [
            "total": total as Any,
            "restorations": restorations.map { $0.toMap() } as Any,
        ]
    }

    public static func from(map: [String: Any]) -> DedicatedDatabaseRestorationList {
        return DedicatedDatabaseRestorationList(
            total: map["total"] as! Int,
            restorations: (map["restorations"] as! [[String: Any]]).map { DedicatedDatabaseRestoration.from(map: $0) }
        )
    }
}
