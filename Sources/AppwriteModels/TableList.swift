import Foundation
import JSONCodable

/// Tables List
open class TableList: Codable {

    enum CodingKeys: String, CodingKey {
        case total = "total"
        case tables = "tables"
    }

    /// Total number of tables that matched your query.
    public let total: Int

    /// List of tables.
    public let tables: [Table]


    init(
        total: Int,
        tables: [Table]
    ) {
        self.total = total
        self.tables = tables
    }

    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        self.total = try container.decode(Int.self, forKey: .total)
        self.tables = try container.decode([Table].self, forKey: .tables)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encode(total, forKey: .total)
        try container.encode(tables, forKey: .tables)
    }

    public func toMap() -> [String: Any] {
        return [
            "total": total as Any,
            "tables": tables.map { $0.toMap() } as Any
        ]
    }

    public static func from(map: [String: Any] ) -> TableList {
        return TableList(
            total: map["total"] as! Int,
            tables: (map["tables"] as! [[String: Any]]).map { Table.from(map: $0) }
        )
    }
}
