
/// API Keys List
public class KeyList {

    /// Total sum of items in the list.
    public let sum: Int

    /// List of keys.
    public let keys: [Key]

    init(
        sum: Int,
        keys: [Key]
    ) {
        self.sum = sum
        self.keys = keys
    }

    public static func from(map: [String: Any]) -> KeyList {
        return KeyList(
            sum: map["sum"] as! Int,
            keys: (map["keys"] as! [[String: Any]]).map { Key.from(map: $0) } as! [Key]
        )
    }

    public func toMap() -> [String: Any] {
        return [
            "sum": sum as Any,
            "keys": keys.map { $0.toMap() } as Any
        ]
    }
                                                                                                                                                                                                                            
}