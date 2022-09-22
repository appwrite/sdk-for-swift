
/// Functions List
public class FunctionList {

    /// Total number of functions documents that matched your query.
    public let total: Int

    /// List of functions.
    public let functions: [Function]

    init(
        total: Int,
        functions: [Function]
    ) {
        self.total = total
        self.functions = functions
    }

    public static func from(map: [String: Any]) -> FunctionList {
        return FunctionList(
            total: map["total"] as! Int,
            functions: (map["functions"] as! [[String: Any]]).map { Function.from(map: $0) }
        )
    }

    public func toMap() -> [String: Any] {
        return [
            "total": total as Any,
            "functions": functions.map { $0.toMap() } as Any
        ]
    }
                                                                                                                                                                                                                                                                                            
}
