
/// Domains List
public class DomainList {

    /// Total sum of items in the list.
    public let sum: Int

    /// List of domains.
    public let domains: [Domain]

    init(
        sum: Int,
        domains: [Domain]
    ) {
        self.sum = sum
        self.domains = domains
    }

    public static func from(map: [String: Any]) -> DomainList {
        return DomainList(
            sum: map["sum"] as! Int,
            domains: (map["domains"] as! [[String: Any]]).map { Domain.from(map: $0) }
        )
    }

    public func toMap() -> [String: Any] {
        return [
            "sum": sum as Any,
            "domains": domains.map { $0.toMap() } as Any
        ]
    }
                                                                                                                                                                                                                            
}