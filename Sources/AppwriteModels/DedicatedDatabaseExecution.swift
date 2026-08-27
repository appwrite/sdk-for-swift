import Foundation
import JSONCodable

/// Execution
open class DedicatedDatabaseExecution: Codable {

    enum CodingKeys: String, CodingKey {
        case rows = "rows"
        case rowCount = "rowCount"
        case columns = "columns"
        case durationMs = "durationMs"
        case truncated = "truncated"
        case bytes = "bytes"
    }

    /// Result rows as a list of column-name =&gt; value maps. Empty for non-returning statements.
    public let rows: [AnyCodable]
    /// Number of rows returned (for SELECT) or affected (for INSERT/UPDATE/DELETE).
    public let rowCount: Int
    /// Column metadata in result-set order.
    public let columns: [DedicatedDatabaseExecutionColumn]
    /// Server-side execution time in milliseconds.
    public let durationMs: Int
    /// True when the configured row or byte cap was hit and the result was truncated.
    public let truncated: Bool
    /// Serialised payload size in bytes.
    public let bytes: Int

    init(
        rows: [AnyCodable],
        rowCount: Int,
        columns: [DedicatedDatabaseExecutionColumn],
        durationMs: Int,
        truncated: Bool,
        bytes: Int
    ) {
        self.rows = rows
        self.rowCount = rowCount
        self.columns = columns
        self.durationMs = durationMs
        self.truncated = truncated
        self.bytes = bytes
    }

    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        self.rows = try container.decode([AnyCodable].self, forKey: .rows)
        self.rowCount = try container.decode(Int.self, forKey: .rowCount)
        self.columns = try container.decode([DedicatedDatabaseExecutionColumn].self, forKey: .columns)
        self.durationMs = try container.decode(Int.self, forKey: .durationMs)
        self.truncated = try container.decode(Bool.self, forKey: .truncated)
        self.bytes = try container.decode(Int.self, forKey: .bytes)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encode(rows, forKey: .rows)
        try container.encode(rowCount, forKey: .rowCount)
        try container.encode(columns, forKey: .columns)
        try container.encode(durationMs, forKey: .durationMs)
        try container.encode(truncated, forKey: .truncated)
        try container.encode(bytes, forKey: .bytes)
    }

    public func toMap() -> [String: Any] {
        return [
            "rows": rows as Any,
            "rowCount": rowCount as Any,
            "columns": columns.map { $0.toMap() } as Any,
            "durationMs": durationMs as Any,
            "truncated": truncated as Any,
            "bytes": bytes as Any,
        ]
    }

    public static func from(map: [String: Any]) -> DedicatedDatabaseExecution {
        return DedicatedDatabaseExecution(
            rows: (map["rows"] as! [Any]).map { AnyCodable($0) },
            rowCount: map["rowCount"] as! Int,
            columns: (map["columns"] as! [[String: Any]]).map { DedicatedDatabaseExecutionColumn.from(map: $0) },
            durationMs: map["durationMs"] as! Int,
            truncated: map["truncated"] as! Bool,
            bytes: map["bytes"] as! Int
        )
    }
}
