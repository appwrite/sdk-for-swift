import Foundation
import JSONCodable

/// Rule
public class ProxyRule {

    /// Rule ID.
    public let id: String

    /// Rule creation date in ISO 8601 format.
    public let createdAt: String

    /// Rule update date in ISO 8601 format.
    public let updatedAt: String

    /// Domain name.
    public let domain: String

    /// Action definition for the rule. Possible values are &quot;api&quot;, &quot;function&quot;, or &quot;redirect&quot;
    public let resourceType: String

    /// ID of resource for the action type. If resourceType is &quot;api&quot; or &quot;url&quot;, it is empty. If resourceType is &quot;function&quot;, it is ID of the function.
    public let resourceId: String

    /// Domain verification status. Possible values are &quot;created&quot;, &quot;verifying&quot;, &quot;verified&quot; and &quot;unverified&quot;
    public let status: String

    /// Certificate generation logs. This will return an empty string if generation did not run, or succeeded.
    public let logs: String

    /// Certificate auto-renewal date in ISO 8601 format.
    public let renewAt: String


    init(
        id: String,
        createdAt: String,
        updatedAt: String,
        domain: String,
        resourceType: String,
        resourceId: String,
        status: String,
        logs: String,
        renewAt: String
    ) {
        self.id = id
        self.createdAt = createdAt
        self.updatedAt = updatedAt
        self.domain = domain
        self.resourceType = resourceType
        self.resourceId = resourceId
        self.status = status
        self.logs = logs
        self.renewAt = renewAt
    }

    public func toMap() -> [String: Any] {
        return [
            "$id": id as Any,
            "$createdAt": createdAt as Any,
            "$updatedAt": updatedAt as Any,
            "domain": domain as Any,
            "resourceType": resourceType as Any,
            "resourceId": resourceId as Any,
            "status": status as Any,
            "logs": logs as Any,
            "renewAt": renewAt as Any
        ]
    }

    public static func from(map: [String: Any] ) -> ProxyRule {
        return ProxyRule(
            id: map["$id"] as! String,
            createdAt: map["$createdAt"] as! String,
            updatedAt: map["$updatedAt"] as! String,
            domain: map["domain"] as! String,
            resourceType: map["resourceType"] as! String,
            resourceId: map["resourceId"] as! String,
            status: map["status"] as! String,
            logs: map["logs"] as! String,
            renewAt: map["renewAt"] as! String
        )
    }
}
