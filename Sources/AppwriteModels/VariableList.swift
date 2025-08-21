import Foundation
import JSONCodable

/// Variables List
open class VariableList: Codable {

    enum CodingKeys: String, CodingKey {
        case total = "total"
        case variables = "variables"
    }

    /// Total number of variables that matched your query.
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

    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        self.total = try container.decode(Int.self, forKey: .total)
        self.variables = try container.decode([Variable].self, forKey: .variables)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encode(total, forKey: .total)
        try container.encode(variables, forKey: .variables)
    }

    public func toMap() -> [String: Any] {
        return [
            "total": total as Any,
            "variables": variables.map { $0.toMap() } as Any
        ]
    }

    public static func from(map: [String: Any] ) -> VariableList {
        return VariableList(
            total: map["total"] as! Int,
            variables: (map["variables"] as! [[String: Any]]).map { Variable.from(map: $0) }
        )
    }
}
