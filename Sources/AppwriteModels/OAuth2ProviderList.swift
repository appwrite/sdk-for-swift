import Foundation
import JSONCodable

/// OAuth2 Providers List
open class OAuth2ProviderList: Codable {

    enum CodingKeys: String, CodingKey {
        case total = "total"
        case providers = "providers"
    }

    /// Total number of OAuth2 providers in the given project.
    public let total: Int
    /// List of OAuth2 providers.
    public let providers: [AnyCodable]

    init(
        total: Int,
        providers: [AnyCodable]
    ) {
        self.total = total
        self.providers = providers
    }

    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        self.total = try container.contains(.total) ? container.decode(Int.self, forKey: .total) : 0
        self.providers = try container.decode([AnyCodable].self, forKey: .providers)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encode(total, forKey: .total)
        try container.encode(providers, forKey: .providers)
    }

    public func toMap() -> [String: Any] {
        return [
            "total": total as Any,
            "providers": providers as Any,
        ]
    }

    public static func from(map: [String: Any]) -> OAuth2ProviderList {
        let defaults: [String: Any] = [
            "total": 0,
        ]
        let map = defaults.merging(map) { _, new in new }

        return OAuth2ProviderList(
            total: map["total"] as! Int,
            providers: (map["providers"] as! [Any]).map { AnyCodable($0) }
        )
    }
}
