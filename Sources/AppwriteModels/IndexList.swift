import Foundation
import JSONCodable

/// Indexes List
public class IndexList {

    /// Total number of indexes documents that matched your query.
    public let total: Int


    /// List of indexes.
    public let indexes: [Index]



    init(
        total: Int,
        indexes: [Index]
    ) {
        self.total = total
        self.indexes = indexes
    }

    public func toMap() -> [String: Any] {
        return [
            "total": total as Any,
            "indexes": indexes.map { $0.toMap() } as Any
        ]
    }

    public static func from(map: [String: Any] ) -> IndexList {
        return IndexList(
            total: map["total"] as! Int,
            indexes: (map["indexes"] as! [[String: Any]]).map { Index.from(map: $0) }
        )
    }
}
