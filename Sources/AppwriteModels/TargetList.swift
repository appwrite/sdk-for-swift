import Foundation
import JSONCodable

/// Target list
public class TargetList {

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

    public func toMap() -> [String: Any] {
        return [
            "total": total as Any,
            "targets": targets.map { $0.toMap() } as Any
        ]
    }

    public static func from(map: [String: Any] ) -> TargetList {
        return TargetList(
            total: map["total"] as! Int,
            targets: (map["targets"] as! [[String: Any]]).map { Target.from(map: $0) }
        )
    }
}
