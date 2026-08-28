import Foundation
import JSONCodable

/// BranchList
open class DedicatedDatabaseBranchList: Codable {

    enum CodingKeys: String, CodingKey {
        case total = "total"
        case branches = "branches"
    }

    /// Total number of branches.
    public let total: Int
    /// List of branches.
    public let branches: [DedicatedDatabaseBranch]

    init(
        total: Int,
        branches: [DedicatedDatabaseBranch]
    ) {
        self.total = total
        self.branches = branches
    }

    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        self.total = try container.decode(Int.self, forKey: .total)
        self.branches = try container.decode([DedicatedDatabaseBranch].self, forKey: .branches)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encode(total, forKey: .total)
        try container.encode(branches, forKey: .branches)
    }

    public func toMap() -> [String: Any] {
        return [
            "total": total as Any,
            "branches": branches.map { $0.toMap() } as Any,
        ]
    }

    public static func from(map: [String: Any]) -> DedicatedDatabaseBranchList {
        return DedicatedDatabaseBranchList(
            total: map["total"] as! Int,
            branches: (map["branches"] as! [[String: Any]]).map { DedicatedDatabaseBranch.from(map: $0) }
        )
    }
}
