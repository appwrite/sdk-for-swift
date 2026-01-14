import Foundation
import JSONCodable

/// Provider list
open class ProviderList: Codable {

    enum CodingKeys: String, CodingKey {
        case total = "total"
        case providers = "providers"
    }

    /// Total number of providers that matched your query.
    public let total: Int
    /// List of providers.
    public let providers: [Provider]

    init(
        total: Int,
        providers: [Provider]
    ) {
        self.total = total
        self.providers = providers
    }

    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        self.total = try container.decode(Int.self, forKey: .total)
        self.providers = try container.decode([Provider].self, forKey: .providers)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encode(total, forKey: .total)
        try container.encode(providers, forKey: .providers)
    }

    public func toMap() -> [String: Any] {
        return [
            "total": total as Any,
            "providers": providers.map { $0.toMap() } as Any
        ]
    }

    public static func from(map: [String: Any] ) -> ProviderList {
        return ProviderList(
            total: map["total"] as! Int,
            providers: (map["providers"] as! [[String: Any]]).map { Provider.from(map: $0) }
        )
    }
}
