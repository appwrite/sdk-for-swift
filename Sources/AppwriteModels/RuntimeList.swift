
/// Runtimes List
public class RuntimeList {

    /// Total number of items available on the server.
    public let sum: Int

    /// List of runtimes.
    public let runtimes: [Runtime]

    init(
        sum: Int,
        runtimes: [Runtime]
    ) {
        self.sum = sum
        self.runtimes = runtimes
    }

    public static func from(map: [String: Any]) -> RuntimeList {
        return RuntimeList(
            sum: map["sum"] as! Int,
            runtimes: (map["runtimes"] as! [[String: Any]]).map { Runtime.from(map: $0) }
        )
    }

    public func toMap() -> [String: Any] {
        return [
            "sum": sum as Any,
            "runtimes": runtimes.map { $0.toMap() } as Any
        ]
    }
                                                                                                                                                                                                                                
}