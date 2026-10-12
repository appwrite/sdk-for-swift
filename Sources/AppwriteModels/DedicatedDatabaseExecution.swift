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

        self.rows = try container.contains(.rows) ? container.decode([AnyCodable].self, forKey: .rows) : ([Any]()).map { AnyCodable($0) }
        self.rowCount = try container.contains(.rowCount) ? container.decode(Int.self, forKey: .rowCount) : 0
        self.columns = try container.decode([DedicatedDatabaseExecutionColumn].self, forKey: .columns)
        self.durationMs = try container.contains(.durationMs) ? container.decode(Int.self, forKey: .durationMs) : 0
        self.truncated = try container.contains(.truncated) ? container.decode(Bool.self, forKey: .truncated) : false
        self.bytes = try container.contains(.bytes) ? container.decode(Int.self, forKey: .bytes) : 0
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
        let defaults: [String: Any] = [
            "rows": [Any](),
            "rowCount": 0,
            "durationMs": 0,
            "truncated": false,
            "bytes": 0,
        ]
        let map = defaults.merging(map) { _, new in new }

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
