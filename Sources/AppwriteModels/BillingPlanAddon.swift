import Foundation
import JSONCodable

/// Addon
open class BillingPlanAddon: Codable {

    enum CodingKeys: String, CodingKey {
        case seats = "seats"
        case projects = "projects"
    }

    /// Addon seats
    public let seats: BillingPlanAddonDetails
    /// Addon projects
    public let projects: BillingPlanAddonDetails

    init(
        seats: BillingPlanAddonDetails,
        projects: BillingPlanAddonDetails
    ) {
        self.seats = seats
        self.projects = projects
    }

    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        self.seats = try container.decode(BillingPlanAddonDetails.self, forKey: .seats)
        self.projects = try container.decode(BillingPlanAddonDetails.self, forKey: .projects)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encode(seats, forKey: .seats)
        try container.encode(projects, forKey: .projects)
    }

    public func toMap() -> [String: Any] {
        return [
            "seats": seats.toMap() as Any,
            "projects": projects.toMap() as Any
        ]
    }

    public static func from(map: [String: Any] ) -> BillingPlanAddon {
        return BillingPlanAddon(
            seats: BillingPlanAddonDetails.from(map: map["seats"] as! [String: Any]),
            projects: BillingPlanAddonDetails.from(map: map["projects"] as! [String: Any])
        )
    }
}
