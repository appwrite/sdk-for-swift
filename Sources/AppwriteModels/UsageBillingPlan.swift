import Foundation
import JSONCodable

/// usageBillingPlan
open class UsageBillingPlan: Codable {

    enum CodingKeys: String, CodingKey {
        case bandwidth = "bandwidth"
        case executions = "executions"
        case member = "member"
        case realtime = "realtime"
        case realtimeMessages = "realtimeMessages"
        case realtimeBandwidth = "realtimeBandwidth"
        case storage = "storage"
        case users = "users"
        case GBHours = "GBHours"
        case imageTransformations = "imageTransformations"
        case credits = "credits"
    }

    /// Bandwidth additional resources
    public let bandwidth: AdditionalResource
    /// Executions additional resources
    public let executions: AdditionalResource
    /// Member additional resources
    public let member: AdditionalResource
    /// Realtime additional resources
    public let realtime: AdditionalResource
    /// Realtime messages additional resources
    public let realtimeMessages: AdditionalResource
    /// Realtime bandwidth additional resources
    public let realtimeBandwidth: AdditionalResource
    /// Storage additional resources
    public let storage: AdditionalResource
    /// User additional resources
    public let users: AdditionalResource
    /// GBHour additional resources
    public let GBHours: AdditionalResource
    /// Image transformation additional resources
    public let imageTransformations: AdditionalResource
    /// Credits additional resources
    public let credits: AdditionalResource

    init(
        bandwidth: AdditionalResource,
        executions: AdditionalResource,
        member: AdditionalResource,
        realtime: AdditionalResource,
        realtimeMessages: AdditionalResource,
        realtimeBandwidth: AdditionalResource,
        storage: AdditionalResource,
        users: AdditionalResource,
        GBHours: AdditionalResource,
        imageTransformations: AdditionalResource,
        credits: AdditionalResource
    ) {
        self.bandwidth = bandwidth
        self.executions = executions
        self.member = member
        self.realtime = realtime
        self.realtimeMessages = realtimeMessages
        self.realtimeBandwidth = realtimeBandwidth
        self.storage = storage
        self.users = users
        self.GBHours = GBHours
        self.imageTransformations = imageTransformations
        self.credits = credits
    }

    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        self.bandwidth = try container.decode(AdditionalResource.self, forKey: .bandwidth)
        self.executions = try container.decode(AdditionalResource.self, forKey: .executions)
        self.member = try container.decode(AdditionalResource.self, forKey: .member)
        self.realtime = try container.decode(AdditionalResource.self, forKey: .realtime)
        self.realtimeMessages = try container.decode(AdditionalResource.self, forKey: .realtimeMessages)
        self.realtimeBandwidth = try container.decode(AdditionalResource.self, forKey: .realtimeBandwidth)
        self.storage = try container.decode(AdditionalResource.self, forKey: .storage)
        self.users = try container.decode(AdditionalResource.self, forKey: .users)
        self.GBHours = try container.decode(AdditionalResource.self, forKey: .GBHours)
        self.imageTransformations = try container.decode(AdditionalResource.self, forKey: .imageTransformations)
        self.credits = try container.decode(AdditionalResource.self, forKey: .credits)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encode(bandwidth, forKey: .bandwidth)
        try container.encode(executions, forKey: .executions)
        try container.encode(member, forKey: .member)
        try container.encode(realtime, forKey: .realtime)
        try container.encode(realtimeMessages, forKey: .realtimeMessages)
        try container.encode(realtimeBandwidth, forKey: .realtimeBandwidth)
        try container.encode(storage, forKey: .storage)
        try container.encode(users, forKey: .users)
        try container.encode(GBHours, forKey: .GBHours)
        try container.encode(imageTransformations, forKey: .imageTransformations)
        try container.encode(credits, forKey: .credits)
    }

    public func toMap() -> [String: Any] {
        return [
            "bandwidth": bandwidth.toMap() as Any,
            "executions": executions.toMap() as Any,
            "member": member.toMap() as Any,
            "realtime": realtime.toMap() as Any,
            "realtimeMessages": realtimeMessages.toMap() as Any,
            "realtimeBandwidth": realtimeBandwidth.toMap() as Any,
            "storage": storage.toMap() as Any,
            "users": users.toMap() as Any,
            "GBHours": GBHours.toMap() as Any,
            "imageTransformations": imageTransformations.toMap() as Any,
            "credits": credits.toMap() as Any
        ]
    }

    public static func from(map: [String: Any] ) -> UsageBillingPlan {
        return UsageBillingPlan(
            bandwidth: AdditionalResource.from(map: map["bandwidth"] as! [String: Any]),
            executions: AdditionalResource.from(map: map["executions"] as! [String: Any]),
            member: AdditionalResource.from(map: map["member"] as! [String: Any]),
            realtime: AdditionalResource.from(map: map["realtime"] as! [String: Any]),
            realtimeMessages: AdditionalResource.from(map: map["realtimeMessages"] as! [String: Any]),
            realtimeBandwidth: AdditionalResource.from(map: map["realtimeBandwidth"] as! [String: Any]),
            storage: AdditionalResource.from(map: map["storage"] as! [String: Any]),
            users: AdditionalResource.from(map: map["users"] as! [String: Any]),
            GBHours: AdditionalResource.from(map: map["GBHours"] as! [String: Any]),
            imageTransformations: AdditionalResource.from(map: map["imageTransformations"] as! [String: Any]),
            credits: AdditionalResource.from(map: map["credits"] as! [String: Any])
        )
    }
}
