import Foundation
import JSONCodable

/// Collections List
public class CollectionList {

    /// Total number of collections documents that matched your query.
    public let total: Int


    /// List of collections.
    public let collections: [Collection]



    init(
        total: Int,
        collections: [Collection]
    ) {
        self.total = total
        self.collections = collections
    }

    public func toMap() -> [String: Any] {
        return [
            "total": total as Any,
            "collections": collections.map { $0.toMap() } as Any
        ]
    }

    public static func from(map: [String: Any] ) -> CollectionList {
        return CollectionList(
            total: map["total"] as! Int,
            collections: (map["collections"] as! [[String: Any]]).map { Collection.from(map: $0) }
        )
    }
}
