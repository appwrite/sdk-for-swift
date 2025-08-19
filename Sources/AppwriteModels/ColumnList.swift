import Foundation
import JSONCodable

/// Columns List
open class ColumnList: Codable {

    enum CodingKeys: String, CodingKey {
        case total = "total"
        case columns = "columns"
    }

    /// Total number of columns in the given table.
    public let total: Int

    /// List of columns.
    public let columns: [AnyCodable]


    init(
        total: Int,
        columns: [AnyCodable]
    ) {
        self.total = total
        self.columns = columns
    }

    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        self.total = try container.decode(Int.self, forKey: .total)
        self.columns = try container.decode([AnyCodable].self, forKey: .columns)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encode(total, forKey: .total)
        try container.encode(columns, forKey: .columns)
    }

    public func toMap() -> [String: Any] {
        return [
            "total": total as Any,
            "columns": columns as Any
        ]
    }

    public static func from(map: [String: Any] ) -> ColumnList {
        return ColumnList(
            total: map["total"] as! Int,
            columns: (map["columns"] as! [Any]).map { AnyCodable($0) }
        )
    }
}
