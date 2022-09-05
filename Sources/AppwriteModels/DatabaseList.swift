
/// Databases List
public class DatabaseList {

    /// Total number of databases documents that matched your query.
    public let total: Int

    /// List of databases.
    public let databases: [Database]

    init(
        total: Int,
        databases: [Database]
    ) {
        self.total = total
        self.databases = databases
    }

    public static func from(map: [String: Any]) -> DatabaseList {
        return DatabaseList(
            total: map["total"] as! Int,
            databases: (map["databases"] as! [[String: Any]]).map { Database.from(map: $0) }
        )
    }

    public func toMap() -> [String: Any] {
        return [
            "total": total as Any,
            "databases": databases.map { $0.toMap() } as Any
        ]
    }
                                                                                                                                                                                                                                                                                            
}