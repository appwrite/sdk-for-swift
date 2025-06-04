import Foundation
import JSONCodable

/// Functions List
open class FunctionList: Codable {

    enum CodingKeys: String, CodingKey {
        case total = "total"
        case functions = "functions"
    }

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

    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        self.total = try container.decode(Int.self, forKey: .total)
        self.functions = try container.decode([Function].self, forKey: .functions)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encode(total, forKey: .total)
        try container.encode(functions, forKey: .functions)
    }

    public func toMap() -> [String: Any] {
        return [
            "total": total as Any,
            "functions": functions.map { $0.toMap() } as Any
        ]
    }

    public static func from(map: [String: Any] ) -> FunctionList {
        return FunctionList(
            total: map["total"] as? Int ?? 0,
            functions: (map["functions"] as? [[String: Any]] ?? []).map { Function.from(map: $0) }
        )
    }
}
