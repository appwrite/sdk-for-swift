
/// Buckets List
public class BucketList {

    /// Total number of buckets documents that matched your query.
    public let total: Int

    /// List of buckets.
    public let buckets: [Bucket]

    init(
        total: Int,
        buckets: [Bucket]
    ) {
        self.total = total
        self.buckets = buckets
    }

    public static func from(map: [String: Any]) -> BucketList {
        return BucketList(
            total: map["total"] as! Int,
            buckets: (map["buckets"] as! [[String: Any]]).map { Bucket.from(map: $0) }
        )
    }

    public func toMap() -> [String: Any] {
        return [
            "total": total as Any,
            "buckets": buckets.map { $0.toMap() } as Any
        ]
    }
                                                                                                                                                                                                                                                                                            
}
