import Foundation
import JSONCodable

/// OperationList
open class DedicatedDatabaseOperationList: Codable {

    enum CodingKeys: String, CodingKey {
        case total = "total"
        case operations = "operations"
    }

    /// Total number of operations.
    public let total: Int
    /// List of operations.
    public let operations: [DedicatedDatabaseOperation]

    init(
        total: Int,
        operations: [DedicatedDatabaseOperation]
    ) {
        self.total = total
        self.operations = operations
    }

    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        self.total = try container.contains(.total) ? container.decode(Int.self, forKey: .total) : 0
        self.operations = try container.contains(.operations) ? container.decode([DedicatedDatabaseOperation].self, forKey: .operations) : []
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encode(total, forKey: .total)
        try container.encode(operations, forKey: .operations)
    }

    public func toMap() -> [String: Any] {
        return [
            "total": total as Any,
            "operations": operations.map { $0.toMap() } as Any,
        ]
    }

    public static func from(map: [String: Any]) -> DedicatedDatabaseOperationList {
        let defaults: [String: Any] = [
            "total": 0,
            "operations": [Any](),
        ]
        let map = defaults.merging(map) { _, new in new }

        return DedicatedDatabaseOperationList(
            total: map["total"] as! Int,
            operations: (map["operations"] as! [[String: Any]]).map { DedicatedDatabaseOperation.from(map: $0) }
        )
    }
}
