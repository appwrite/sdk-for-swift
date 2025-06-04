import Foundation
import JSONCodable

/// Frameworks List
open class FrameworkList: Codable {

    enum CodingKeys: String, CodingKey {
        case total = "total"
        case frameworks = "frameworks"
    }

    /// Total number of frameworks documents that matched your query.
    public let total: Int

    /// List of frameworks.
    public let frameworks: [Framework]


    init(
        total: Int,
        frameworks: [Framework]
    ) {
        self.total = total
        self.frameworks = frameworks
    }

    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        self.total = try container.decode(Int.self, forKey: .total)
        self.frameworks = try container.decode([Framework].self, forKey: .frameworks)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encode(total, forKey: .total)
        try container.encode(frameworks, forKey: .frameworks)
    }

    public func toMap() -> [String: Any] {
        return [
            "total": total as Any,
            "frameworks": frameworks.map { $0.toMap() } as Any
        ]
    }

    public static func from(map: [String: Any] ) -> FrameworkList {
        return FrameworkList(
            total: map["total"] as? Int ?? 0,
            frameworks: (map["frameworks"] as? [[String: Any]] ?? []).map { Framework.from(map: $0) }
        )
    }
}
