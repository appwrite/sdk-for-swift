import Foundation
import JSONCodable

/// Provider list
public class ProviderList {

    /// Total number of providers documents that matched your query.
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
