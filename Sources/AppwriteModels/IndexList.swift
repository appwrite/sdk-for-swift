
/// Indexes List
public class IndexList {

    /// Total number of items available on the server.
    public let sum: Int

    /// List of indexes.
    public let indexes: [Index]

    init(
        sum: Int,
        indexes: [Index]
    ) {
        self.sum = sum
        self.indexes = indexes
    }

    public static func from(map: [String: Any]) -> IndexList {
        return IndexList(
            sum: map["sum"] as! Int,
            indexes: (map["indexes"] as! [[String: Any]]).map { Index.from(map: $0) }
        )
    }

    public func toMap() -> [String: Any] {
        return [
            "sum": sum as Any,
            "indexes": indexes.map { $0.toMap() } as Any
        ]
    }
                                                                                                                                                                                                                                
}