
/// Runtimes List
public class RuntimeList {

    /// Total number of runtimes documents that matched your query.
    public let total: Int

    /// List of runtimes.
    public let runtimes: [Runtime]

    init(
        total: Int,
        runtimes: [Runtime]
    ) {
        self.total = total
        self.runtimes = runtimes
    }

    public static func from(map: [String: Any]) -> RuntimeList {
        return RuntimeList(
            total: map["total"] as! Int,
            runtimes: (map["runtimes"] as! [[String: Any]]).map { Runtime.from(map: $0) }
        )
    }

    public func toMap() -> [String: Any] {
        return [
            "total": total as Any,
            "runtimes": runtimes.map { $0.toMap() } as Any
        ]
    }
                                                                                                                                                                                                                                                                                            
}