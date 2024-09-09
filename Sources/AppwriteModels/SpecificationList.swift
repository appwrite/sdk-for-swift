import Foundation
import JSONCodable

/// Specifications List
public class SpecificationList {

    /// Total number of specifications documents that matched your query.
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
