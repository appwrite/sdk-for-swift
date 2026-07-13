import Foundation
import JSONCodable

/// Program
open class Program: Codable {

    enum CodingKeys: String, CodingKey {
        case id = "$id"
        case title = "title"
        case description = "description"
        case tag = "tag"
        case icon = "icon"
        case url = "url"
        case active = "active"
        case external = "external"
        case billingPlanId = "billingPlanId"
    }

    /// Program ID
    public let id: String
    /// Program title
    public let title: String
    /// Program description
    public let description: String
    /// Program tag for highlighting on console
    public let tag: String
    /// Program icon for highlighting on console
    public let icon: String
    /// URL for more information on this program
    public let url: String
    /// Whether this program is active
    public let active: Bool
    /// Whether this program is external
    public let external: Bool
    /// Billing plan ID that this is program is associated with.
    public let billingPlanId: String

    init(
        id: String,
        title: String,
        description: String,
        tag: String,
        icon: String,
        url: String,
        active: Bool,
        external: Bool,
        billingPlanId: String
    ) {
        self.id = id
        self.title = title
        self.description = description
        self.tag = tag
        self.icon = icon
        self.url = url
        self.active = active
        self.external = external
        self.billingPlanId = billingPlanId
    }

    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        self.id = try container.decode(String.self, forKey: .id)
        self.title = try container.decode(String.self, forKey: .title)
        self.description = try container.decode(String.self, forKey: .description)
        self.tag = try container.decode(String.self, forKey: .tag)
        self.icon = try container.decode(String.self, forKey: .icon)
        self.url = try container.decode(String.self, forKey: .url)
        self.active = try container.decode(Bool.self, forKey: .active)
        self.external = try container.decode(Bool.self, forKey: .external)
        self.billingPlanId = try container.decode(String.self, forKey: .billingPlanId)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encode(id, forKey: .id)
        try container.encode(title, forKey: .title)
        try container.encode(description, forKey: .description)
        try container.encode(tag, forKey: .tag)
        try container.encode(icon, forKey: .icon)
        try container.encode(url, forKey: .url)
        try container.encode(active, forKey: .active)
        try container.encode(external, forKey: .external)
        try container.encode(billingPlanId, forKey: .billingPlanId)
    }

    public func toMap() -> [String: Any] {
        return [
            "$id": id as Any,
            "title": title as Any,
            "description": description as Any,
            "tag": tag as Any,
            "icon": icon as Any,
            "url": url as Any,
            "active": active as Any,
            "external": external as Any,
            "billingPlanId": billingPlanId as Any
        ]
    }

    public static func from(map: [String: Any] ) -> Program {
        return Program(
            id: map["$id"] as! String,
            title: map["title"] as! String,
            description: map["description"] as! String,
            tag: map["tag"] as! String,
            icon: map["icon"] as! String,
            url: map["url"] as! String,
            active: map["active"] as! Bool,
            external: map["external"] as! Bool,
            billingPlanId: map["billingPlanId"] as! String
        )
    }
}
