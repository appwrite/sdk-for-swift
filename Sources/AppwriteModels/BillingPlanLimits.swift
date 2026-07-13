import Foundation
import JSONCodable

/// PlanLimits
open class BillingPlanLimits: Codable {

    enum CodingKeys: String, CodingKey {
        case credits = "credits"
        case dailyCredits = "dailyCredits"
    }

    /// Credits limit per billing cycle
    public let credits: Int?
    /// Daily credits limit (if applicable)
    public let dailyCredits: Int?

    init(
        credits: Int?,
        dailyCredits: Int?
    ) {
        self.credits = credits
        self.dailyCredits = dailyCredits
    }

    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        self.credits = try container.decodeIfPresent(Int.self, forKey: .credits)
        self.dailyCredits = try container.decodeIfPresent(Int.self, forKey: .dailyCredits)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encodeIfPresent(credits, forKey: .credits)
        try container.encodeIfPresent(dailyCredits, forKey: .dailyCredits)
    }

    public func toMap() -> [String: Any] {
        return [
            "credits": credits as Any,
            "dailyCredits": dailyCredits as Any
        ]
    }

    public static func from(map: [String: Any] ) -> BillingPlanLimits {
        return BillingPlanLimits(
            credits: map["credits"] as? Int,
            dailyCredits: map["dailyCredits"] as? Int
        )
    }
}
