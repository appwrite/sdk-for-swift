
/// Variables List
public class VariableList {

    /// Total number of variables documents that matched your query.
    public let total: Int

    /// List of variables.
    public let variables: [Variable]

    init(
        total: Int,
        variables: [Variable]
    ) {
        self.total = total
        self.variables = variables
    }

    public static func from(map: [String: Any]) -> VariableList {
        return VariableList(
            total: map["total"] as! Int,
            variables: (map["variables"] as! [[String: Any]]).map { Variable.from(map: $0) }
        )
    }

    public func toMap() -> [String: Any] {
        return [
            "total": total as Any,
            "variables": variables.map { $0.toMap() } as Any
        ]
    }
                                                                                                                                                                                                                                                                                            
}
