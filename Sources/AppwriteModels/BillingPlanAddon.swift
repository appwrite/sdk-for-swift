import Foundation
import JSONCodable

/// Addon
open class BillingPlanAddon: Codable {

    enum CodingKeys: String, CodingKey {
        case seats = "seats"
        case projects = "projects"
    }

    /// Addon seats
    public let seats: BillingPlanAddonDetails?
    /// Addon projects
    public let projects: BillingPlanAddonDetails?

    init(
        seats: BillingPlanAddonDetails?,
        projects: BillingPlanAddonDetails?
    ) {
        self.seats = seats
        self.projects = projects
    }

    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        self.seats = try container.decodeIfPresent(BillingPlanAddonDetails.self, forKey: .seats)
        self.projects = try container.decodeIfPresent(BillingPlanAddonDetails.self, forKey: .projects)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encodeIfPresent(seats, forKey: .seats)
        try container.encodeIfPresent(projects, forKey: .projects)
    }

    public func toMap() -> [String: Any] {
        return [
            "seats": seats?.toMap() as Any,
            "projects": projects?.toMap() as Any
        ]
    }

    public static func from(map: [String: Any] ) -> BillingPlanAddon {
        return BillingPlanAddon(
            seats: map["seats"] as? [String: Any] != nil ? BillingPlanAddonDetails.from(map: map["seats"] as! [String: Any]) : nil,
            projects: map["projects"] as? [String: Any] != nil ? BillingPlanAddonDetails.from(map: map["projects"] as! [String: Any]) : nil
        )
    }
}
