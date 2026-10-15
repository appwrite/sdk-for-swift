import AppwriteEnums
import Foundation
import JSONCodable

/// Rule
open class ProxyRule: Codable {

    enum CodingKeys: String, CodingKey {
        case id = "$id"
        case createdAt = "$createdAt"
        case updatedAt = "$updatedAt"
        case domain = "domain"
        case type = "type"
        case trigger = "trigger"
        case redirectUrl = "redirectUrl"
        case redirectStatusCode = "redirectStatusCode"
        case deploymentId = "deploymentId"
        case deploymentResourceType = "deploymentResourceType"
        case deploymentResourceId = "deploymentResourceId"
        case deploymentVcsProviderBranch = "deploymentVcsProviderBranch"
        case status = "status"
        case logs = "logs"
        case renewAt = "renewAt"
        case `protocol` = "protocol"
    }

    /// Rule ID.
    public let id: String
    /// Rule creation date in ISO 8601 format.
    public let createdAt: String
    /// Rule update date in ISO 8601 format.
    public let updatedAt: String
    /// Domain name.
    public let domain: String
    /// Action definition for the rule. Possible values are &quot;api&quot;, &quot;deployment&quot;, or &quot;redirect&quot;
    public let type: String
    /// Defines how the rule was created. Possible values are &quot;manual&quot; or &quot;deployment&quot;
    public let trigger: String
    /// URL to redirect to. Used if type is &quot;redirect&quot;
    public let redirectUrl: String
    /// Status code to apply during redirect. Used if type is &quot;redirect&quot;
    public let redirectStatusCode: Int
    /// ID of deployment. Used if type is &quot;deployment&quot;
    public let deploymentId: String
    /// Type of deployment resource: function, site, or dedicatedDatabase.
    public let deploymentResourceType: AppwriteEnums.ProxyRuleDeploymentResourceType?
    /// ID of deployment&#039;s resource (site or function ID). Used if type is &quot;deployment&quot;
    public let deploymentResourceId: String
    /// Name of Git branch that updates rule. Used if type is &quot;deployment&quot;
    public let deploymentVcsProviderBranch: String
    /// Domain verification status. Possible values are &quot;unverified&quot;, &quot;verifying&quot;, &quot;verified&quot;
    public let status: AppwriteEnums.ProxyRuleStatus
    /// Logs from rule verification or certificate generation. Certificate generation logs are prioritized if both are available.
    public let logs: String
    /// Certificate auto-renewal date in ISO 8601 format.
    public let renewAt: String
    /// Ingress protocol for the rule.
    public let `protocol`: AppwriteEnums.ProxyRuleProtocol

    init(
        id: String,
        createdAt: String,
        updatedAt: String,
        domain: String,
        type: String,
        trigger: String,
        redirectUrl: String,
        redirectStatusCode: Int,
        deploymentId: String,
        deploymentResourceType: AppwriteEnums.ProxyRuleDeploymentResourceType?,
        deploymentResourceId: String,
        deploymentVcsProviderBranch: String,
        status: AppwriteEnums.ProxyRuleStatus,
        logs: String,
        renewAt: String,
        `protocol`: AppwriteEnums.ProxyRuleProtocol
    ) {
        self.id = id
        self.createdAt = createdAt
        self.updatedAt = updatedAt
        self.domain = domain
        self.type = type
        self.trigger = trigger
        self.redirectUrl = redirectUrl
        self.redirectStatusCode = redirectStatusCode
        self.deploymentId = deploymentId
        self.deploymentResourceType = deploymentResourceType
        self.deploymentResourceId = deploymentResourceId
        self.deploymentVcsProviderBranch = deploymentVcsProviderBranch
        self.status = status
        self.logs = logs
        self.renewAt = renewAt
        self.`protocol` = `protocol`
    }

    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        self.id = try container.contains(.id) ? container.decode(String.self, forKey: .id) : ""
        self.createdAt = try container.contains(.createdAt) ? container.decode(String.self, forKey: .createdAt) : ""
        self.updatedAt = try container.contains(.updatedAt) ? container.decode(String.self, forKey: .updatedAt) : ""
        self.domain = try container.contains(.domain) ? container.decode(String.self, forKey: .domain) : ""
        self.type = try container.contains(.type) ? container.decode(String.self, forKey: .type) : ""
        self.trigger = try container.contains(.trigger) ? container.decode(String.self, forKey: .trigger) : ""
        self.redirectUrl = try container.contains(.redirectUrl) ? container.decode(String.self, forKey: .redirectUrl) : ""
        self.redirectStatusCode = try container.contains(.redirectStatusCode) ? container.decode(Int.self, forKey: .redirectStatusCode) : 301
        self.deploymentId = try container.contains(.deploymentId) ? container.decode(String.self, forKey: .deploymentId) : ""
        if let deploymentResourceTypeString = try container.decodeIfPresent(String.self, forKey: .deploymentResourceType) {
            self.deploymentResourceType = AppwriteEnums.ProxyRuleDeploymentResourceType(rawValue: deploymentResourceTypeString)
        } else {
            self.deploymentResourceType = nil
        }
        self.deploymentResourceId = try container.contains(.deploymentResourceId) ? container.decode(String.self, forKey: .deploymentResourceId) : ""
        self.deploymentVcsProviderBranch = try container.contains(.deploymentVcsProviderBranch) ? container.decode(String.self, forKey: .deploymentVcsProviderBranch) : ""
        self.status = AppwriteEnums.ProxyRuleStatus(rawValue: try container.contains(.status) ? container.decode(String.self, forKey: .status) : "unverified")!
        self.logs = try container.contains(.logs) ? container.decode(String.self, forKey: .logs) : ""
        self.renewAt = try container.decode(String.self, forKey: .renewAt)
        self.`protocol` = AppwriteEnums.ProxyRuleProtocol(rawValue: try container.contains(.`protocol`) ? container.decode(String.self, forKey: .`protocol`) : "http")!
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encode(id, forKey: .id)
        try container.encode(createdAt, forKey: .createdAt)
        try container.encode(updatedAt, forKey: .updatedAt)
        try container.encode(domain, forKey: .domain)
        try container.encode(type, forKey: .type)
        try container.encode(trigger, forKey: .trigger)
        try container.encode(redirectUrl, forKey: .redirectUrl)
        try container.encode(redirectStatusCode, forKey: .redirectStatusCode)
        try container.encode(deploymentId, forKey: .deploymentId)
        try container.encodeIfPresent(deploymentResourceType?.rawValue, forKey: .deploymentResourceType)
        try container.encode(deploymentResourceId, forKey: .deploymentResourceId)
        try container.encode(deploymentVcsProviderBranch, forKey: .deploymentVcsProviderBranch)
        try container.encode(status.rawValue, forKey: .status)
        try container.encode(logs, forKey: .logs)
        try container.encode(renewAt, forKey: .renewAt)
        try container.encode(`protocol`.rawValue, forKey: .`protocol`)
    }

    public func toMap() -> [String: Any] {
        return [
            "$id": id as Any,
            "$createdAt": createdAt as Any,
            "$updatedAt": updatedAt as Any,
            "domain": domain as Any,
            "type": type as Any,
            "trigger": trigger as Any,
            "redirectUrl": redirectUrl as Any,
            "redirectStatusCode": redirectStatusCode as Any,
            "deploymentId": deploymentId as Any,
            "deploymentResourceType": deploymentResourceType?.rawValue as Any,
            "deploymentResourceId": deploymentResourceId as Any,
            "deploymentVcsProviderBranch": deploymentVcsProviderBranch as Any,
            "status": status.rawValue as Any,
            "logs": logs as Any,
            "renewAt": renewAt as Any,
            "protocol": `protocol`.rawValue as Any,
        ]
    }

    public static func from(map: [String: Any]) -> ProxyRule {
        let defaults: [String: Any] = [
            "$id": "",
            "$createdAt": "",
            "$updatedAt": "",
            "domain": "",
            "type": "",
            "trigger": "",
            "redirectUrl": "",
            "redirectStatusCode": 301,
            "deploymentId": "",
            "deploymentResourceId": "",
            "deploymentVcsProviderBranch": "",
            "status": "unverified",
            "logs": "",
            "protocol": "http",
        ]
        let map = defaults.merging(map) { _, new in new }

        return ProxyRule(
            id: map["$id"] as! String,
            createdAt: map["$createdAt"] as! String,
            updatedAt: map["$updatedAt"] as! String,
            domain: map["domain"] as! String,
            type: map["type"] as! String,
            trigger: map["trigger"] as! String,
            redirectUrl: map["redirectUrl"] as! String,
            redirectStatusCode: map["redirectStatusCode"] as! Int,
            deploymentId: map["deploymentId"] as! String,
            deploymentResourceType: map["deploymentResourceType"] as? String != nil ? AppwriteEnums.ProxyRuleDeploymentResourceType(rawValue: map["deploymentResourceType"] as! String) : nil,
            deploymentResourceId: map["deploymentResourceId"] as! String,
            deploymentVcsProviderBranch: map["deploymentVcsProviderBranch"] as! String,
            status: AppwriteEnums.ProxyRuleStatus(rawValue: map["status"] as! String)!,
            logs: map["logs"] as! String,
            renewAt: map["renewAt"] as! String,
            protocol: AppwriteEnums.ProxyRuleProtocol(rawValue: map["protocol"] as! String)!
        )
    }
}
