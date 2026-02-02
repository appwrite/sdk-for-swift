import Foundation
import JSONCodable

/// Specifications List
open class SpecificationList: Codable {

    enum CodingKeys: String, CodingKey {
        case total = "total"
        case specifications = "specifications"
    }

    /// Total number of specifications that matched your query.
    public let total: Int
    /// List of specifications.
    public let specifications: [Specification]

    init(
        total: Int,
        specifications: [Specification]
    ) {
        self.total = total
        self.specifications = specifications
    }

    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        self.total = try container.decode(Int.self, forKey: .total)
        self.specifications = try container.decode([Specification].self, forKey: .specifications)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encode(total, forKey: .total)
        try container.encode(specifications, forKey: .specifications)
    }

    public func toMap() -> [String: Any] {
        return [
            "total": total as Any,
            "specifications": specifications.map { $0.toMap() } as Any
        ]
    }

    public static func from(map: [String: Any] ) -> SpecificationList {
        return SpecificationList(
            total: map["total"] as! Int,
            specifications: (map["specifications"] as! [[String: Any]]).map { Specification.from(map: $0) }
        )
    }
}
