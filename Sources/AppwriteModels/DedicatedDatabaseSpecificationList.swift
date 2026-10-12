import Foundation
import JSONCodable

/// SpecificationList
open class DedicatedDatabaseSpecificationList: Codable {

    enum CodingKeys: String, CodingKey {
        case specifications = "specifications"
        case total = "total"
    }

    /// List of dedicated database specifications.
    public let specifications: [DedicatedDatabaseSpecification]
    /// Total number of specifications.
    public let total: Int

    init(
        specifications: [DedicatedDatabaseSpecification],
        total: Int
    ) {
        self.specifications = specifications
        self.total = total
    }

    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        self.specifications = try container.decode([DedicatedDatabaseSpecification].self, forKey: .specifications)
        self.total = try container.contains(.total) ? container.decode(Int.self, forKey: .total) : 0
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encode(specifications, forKey: .specifications)
        try container.encode(total, forKey: .total)
    }

    public func toMap() -> [String: Any] {
        return [
            "specifications": specifications.map { $0.toMap() } as Any,
            "total": total as Any,
        ]
    }

    public static func from(map: [String: Any]) -> DedicatedDatabaseSpecificationList {
        let defaults: [String: Any] = [
            "total": 0,
        ]
        let map = defaults.merging(map) { _, new in new }

        return DedicatedDatabaseSpecificationList(
            specifications: (map["specifications"] as! [[String: Any]]).map { DedicatedDatabaseSpecification.from(map: $0) },
            total: map["total"] as! Int
        )
    }
}
