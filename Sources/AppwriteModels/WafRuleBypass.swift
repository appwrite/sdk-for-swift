import AppwriteEnums
import Foundation
import JSONCodable

/// WafRuleBypass
open class WafRuleBypass: Codable {

    enum CodingKeys: String, CodingKey {
        case id = "$id"
        case createdAt = "$createdAt"
        case updatedAt = "$updatedAt"
        case name = "name"
        case description = "description"
        case teamId = "teamId"
        case projectId = "projectId"
        case resourceType = "resourceType"
        case resourceId = "resourceId"
        case action = "action"
        case priority = "priority"
        case enabled = "enabled"
        case conditions = "conditions"
        case config = "config"
    }

    /// Rule ID.
    public let id: String
    /// WAF rule creation time in ISO 8601 format.
    public let createdAt: String
    /// WAF rule last update time in ISO 8601 format.
    public let updatedAt: String
    /// Human friendly rule name.
    public let name: String
    /// Optional description for the rule.
    public let description: String
    /// Team ID.
    public let teamId: String
    /// Project ID.
    public let projectId: String
    /// Resource type the rule is scoped to.
    public let resourceType: String
    /// Resource identifier. Empty for API-wide rules.
    public let resourceId: String
    /// Action performed when the rule matches.
    public let action: AppwriteEnums.WafRuleAction
    /// Evaluation priority. Lower values execute earlier.
    public let priority: Int
    /// Whether the rule is active.
    public let enabled: Bool
    /// List of conditions evaluated for this rule.
    public let conditions: [AnyCodable]
    /// Action specific configuration.
    public let config: [String: AnyCodable]

    init(
        id: String,
        createdAt: String,
        updatedAt: String,
        name: String,
        description: String,
        teamId: String,
        projectId: String,
        resourceType: String,
        resourceId: String,
        action: AppwriteEnums.WafRuleAction,
        priority: Int,
        enabled: Bool,
        conditions: [AnyCodable],
        config: [String: AnyCodable]
    ) {
        self.id = id
        self.createdAt = createdAt
        self.updatedAt = updatedAt
        self.name = name
        self.description = description
        self.teamId = teamId
        self.projectId = projectId
        self.resourceType = resourceType
        self.resourceId = resourceId
        self.action = action
        self.priority = priority
        self.enabled = enabled
        self.conditions = conditions
        self.config = config
    }

    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        self.id = try container.contains(.id) ? container.decode(String.self, forKey: .id) : ""
        self.createdAt = try container.contains(.createdAt) ? container.decode(String.self, forKey: .createdAt) : ""
        self.updatedAt = try container.contains(.updatedAt) ? container.decode(String.self, forKey: .updatedAt) : ""
        self.name = try container.contains(.name) ? container.decode(String.self, forKey: .name) : ""
        self.description = try container.contains(.description) ? container.decode(String.self, forKey: .description) : ""
        self.teamId = try container.contains(.teamId) ? container.decode(String.self, forKey: .teamId) : ""
        self.projectId = try container.contains(.projectId) ? container.decode(String.self, forKey: .projectId) : ""
        self.resourceType = try container.contains(.resourceType) ? container.decode(String.self, forKey: .resourceType) : "api"
        self.resourceId = try container.contains(.resourceId) ? container.decode(String.self, forKey: .resourceId) : ""
        self.action = AppwriteEnums.WafRuleAction(rawValue: try container.decode(String.self, forKey: .action))!
        self.priority = try container.contains(.priority) ? container.decode(Int.self, forKey: .priority) : 0
        self.enabled = try container.contains(.enabled) ? container.decode(Bool.self, forKey: .enabled) : true
        self.conditions = try container.contains(.conditions) ? container.decode([AnyCodable].self, forKey: .conditions) : ([Any]()).map { AnyCodable($0) }
        self.config = try container.contains(.config) ? container.decode([String: AnyCodable].self, forKey: .config) : ([String: Any]()).mapValues { AnyCodable($0) }
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encode(id, forKey: .id)
        try container.encode(createdAt, forKey: .createdAt)
        try container.encode(updatedAt, forKey: .updatedAt)
        try container.encode(name, forKey: .name)
        try container.encode(description, forKey: .description)
        try container.encode(teamId, forKey: .teamId)
        try container.encode(projectId, forKey: .projectId)
        try container.encode(resourceType, forKey: .resourceType)
        try container.encode(resourceId, forKey: .resourceId)
        try container.encode(action.rawValue, forKey: .action)
        try container.encode(priority, forKey: .priority)
        try container.encode(enabled, forKey: .enabled)
        try container.encode(conditions, forKey: .conditions)
        try container.encode(config, forKey: .config)
    }

    public func toMap() -> [String: Any] {
        return [
            "$id": id as Any,
            "$createdAt": createdAt as Any,
            "$updatedAt": updatedAt as Any,
            "name": name as Any,
            "description": description as Any,
            "teamId": teamId as Any,
            "projectId": projectId as Any,
            "resourceType": resourceType as Any,
            "resourceId": resourceId as Any,
            "action": action.rawValue as Any,
            "priority": priority as Any,
            "enabled": enabled as Any,
            "conditions": conditions as Any,
            "config": config as Any,
        ]
    }

    public static func from(map: [String: Any]) -> WafRuleBypass {
        let defaults: [String: Any] = [
            "$id": "",
            "$createdAt": "",
            "$updatedAt": "",
            "name": "",
            "description": "",
            "teamId": "",
            "projectId": "",
            "resourceType": "api",
            "resourceId": "",
            "priority": 0,
            "enabled": true,
            "conditions": [Any](),
            "config": [String: Any](),
        ]
        let map = defaults.merging(map) { _, new in new }

        return WafRuleBypass(
            id: map["$id"] as! String,
            createdAt: map["$createdAt"] as! String,
            updatedAt: map["$updatedAt"] as! String,
            name: map["name"] as! String,
            description: map["description"] as! String,
            teamId: map["teamId"] as! String,
            projectId: map["projectId"] as! String,
            resourceType: map["resourceType"] as! String,
            resourceId: map["resourceId"] as! String,
            action: AppwriteEnums.WafRuleAction(rawValue: map["action"] as! String)!,
            priority: map["priority"] as! Int,
            enabled: map["enabled"] as! Bool,
            conditions: (map["conditions"] as! [Any]).map { AnyCodable($0) },
            config: (map["config"] as! [String: Any]).mapValues { AnyCodable($0) }
        )
    }
}
