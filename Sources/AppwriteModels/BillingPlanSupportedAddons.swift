import Foundation
import JSONCodable

/// BillingPlanSupportedAddons
open class BillingPlanSupportedAddons: Codable {

    enum CodingKeys: String, CodingKey {
        case baa = "baa"
        case premiumGeoDB = "premiumGeoDB"
        case premiumGeoDBOrg = "premiumGeoDBOrg"
    }

    /// Whether the plan supports BAA (Business Associate Agreement) addon
    public let baa: Bool
    /// Whether the plan supports Premium Geo DB addon (project-level)
    public let premiumGeoDB: Bool
    /// Whether the plan supports Premium Geo DB addon (organization-level)
    public let premiumGeoDBOrg: Bool

    init(
        baa: Bool,
        premiumGeoDB: Bool,
        premiumGeoDBOrg: Bool
    ) {
        self.baa = baa
        self.premiumGeoDB = premiumGeoDB
        self.premiumGeoDBOrg = premiumGeoDBOrg
    }

    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        self.baa = try container.decode(Bool.self, forKey: .baa)
        self.premiumGeoDB = try container.decode(Bool.self, forKey: .premiumGeoDB)
        self.premiumGeoDBOrg = try container.decode(Bool.self, forKey: .premiumGeoDBOrg)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encode(baa, forKey: .baa)
        try container.encode(premiumGeoDB, forKey: .premiumGeoDB)
        try container.encode(premiumGeoDBOrg, forKey: .premiumGeoDBOrg)
    }

    public func toMap() -> [String: Any] {
        return [
            "baa": baa as Any,
            "premiumGeoDB": premiumGeoDB as Any,
            "premiumGeoDBOrg": premiumGeoDBOrg as Any
        ]
    }

    public static func from(map: [String: Any] ) -> BillingPlanSupportedAddons {
        return BillingPlanSupportedAddons(
            baa: map["baa"] as! Bool,
            premiumGeoDB: map["premiumGeoDB"] as! Bool,
            premiumGeoDBOrg: map["premiumGeoDBOrg"] as! Bool
        )
    }
}
