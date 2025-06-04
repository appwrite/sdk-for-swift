import Foundation
import JSONCodable

/// Target list
open class TargetList: Codable {

    enum CodingKeys: String, CodingKey {
        case total = "total"
        case targets = "targets"
    }

    /// Total number of targets documents that matched your query.
    public let total: Int

    /// List of targets.
    public let targets: [Target]


    init(
        total: Int,
        targets: [Target]
    ) {
        self.total = total
        self.targets = targets
    }

    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        self.total = try container.decode(Int.self, forKey: .total)
        self.targets = try container.decode([Target].self, forKey: .targets)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encode(total, forKey: .total)
        try container.encode(targets, forKey: .targets)
    }

    public func toMap() -> [String: Any] {
        return [
            "total": total as Any,
            "targets": targets.map { $0.toMap() } as Any
        ]
    }

    public static func from(map: [String: Any] ) -> TargetList {
        return TargetList(
            total: map["total"] as? Int ?? 0,
            targets: (map["targets"] as? [[String: Any]] ?? []).map { Target.from(map: $0) }
        )
    }
}
