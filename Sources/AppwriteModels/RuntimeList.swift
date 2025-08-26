import Foundation
import JSONCodable

/// Runtimes List
open class RuntimeList: Codable {

    enum CodingKeys: String, CodingKey {
        case total = "total"
        case runtimes = "runtimes"
    }

    /// Total number of runtimes that matched your query.
    public let total: Int

    /// List of runtimes.
    public let runtimes: [Runtime]


    init(
        total: Int,
        runtimes: [Runtime]
    ) {
        self.total = total
        self.runtimes = runtimes
    }

    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        self.total = try container.decode(Int.self, forKey: .total)
        self.runtimes = try container.decode([Runtime].self, forKey: .runtimes)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encode(total, forKey: .total)
        try container.encode(runtimes, forKey: .runtimes)
    }

    public func toMap() -> [String: Any] {
        return [
            "total": total as Any,
            "runtimes": runtimes.map { $0.toMap() } as Any
        ]
    }

    public static func from(map: [String: Any] ) -> RuntimeList {
        return RuntimeList(
            total: map["total"] as! Int,
            runtimes: (map["runtimes"] as! [[String: Any]]).map { Runtime.from(map: $0) }
        )
    }
}
