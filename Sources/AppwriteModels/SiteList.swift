import Foundation
import JSONCodable

/// Sites List
open class SiteList: Codable {

    enum CodingKeys: String, CodingKey {
        case total = "total"
        case sites = "sites"
    }

    /// Total number of sites that matched your query.
    public let total: Int
    /// List of sites.
    public let sites: [Site]

    init(
        total: Int,
        sites: [Site]
    ) {
        self.total = total
        self.sites = sites
    }

    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        self.total = try container.contains(.total) ? container.decode(Int.self, forKey: .total) : 0
        self.sites = try container.contains(.sites) ? container.decode([Site].self, forKey: .sites) : []
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encode(total, forKey: .total)
        try container.encode(sites, forKey: .sites)
    }

    public func toMap() -> [String: Any] {
        return [
            "total": total as Any,
            "sites": sites.map { $0.toMap() } as Any,
        ]
    }

    public static func from(map: [String: Any]) -> SiteList {
        let defaults: [String: Any] = [
            "total": 0,
            "sites": [Any](),
        ]
        let map = defaults.merging(map) { _, new in new }

        return SiteList(
            total: map["total"] as! Int,
            sites: (map["sites"] as! [[String: Any]]).map { Site.from(map: $0) }
        )
    }
}
