import Foundation
import JSONCodable

/// Buckets List
open class BucketList: Codable {

    enum CodingKeys: String, CodingKey {
        case total = "total"
        case buckets = "buckets"
    }

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

    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        self.total = try container.decode(Int.self, forKey: .total)
        self.buckets = try container.decode([Bucket].self, forKey: .buckets)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encode(total, forKey: .total)
        try container.encode(buckets, forKey: .buckets)
    }

    public func toMap() -> [String: Any] {
        return [
            "total": total as Any,
            "buckets": buckets.map { $0.toMap() } as Any
        ]
    }

    public static func from(map: [String: Any] ) -> BucketList {
        return BucketList(
            total: map["total"] as? Int ?? 0,
            buckets: (map["buckets"] as? [[String: Any]] ?? []).map { Bucket.from(map: $0) }
        )
    }
}
