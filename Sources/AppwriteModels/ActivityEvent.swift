import Foundation
import JSONCodable

/// ActivityEvent
open class ActivityEvent: Codable {

    enum CodingKeys: String, CodingKey {
        case id = "$id"
        case actorType = "actorType"
        case actorId = "actorId"
        case actorEmail = "actorEmail"
        case actorName = "actorName"
        case resourceParent = "resourceParent"
        case resourceType = "resourceType"
        case resourceId = "resourceId"
        case resource = "resource"
        case event = "event"
        case userAgent = "userAgent"
        case ip = "ip"
        case mode = "mode"
        case country = "country"
        case time = "time"
        case projectId = "projectId"
        case teamId = "teamId"
        case hostname = "hostname"
    }

    /// Event ID.
    public let id: String
    /// Actor type.
    public let actorType: String
    /// Actor ID.
    public let actorId: String
    /// Actor Email.
    public let actorEmail: String
    /// Actor Name.
    public let actorName: String
    /// Resource parent.
    public let resourceParent: String
    /// Resource type.
    public let resourceType: String
    /// Resource ID.
    public let resourceId: String
    /// Resource.
    public let resource: String
    /// Event name.
    public let event: String
    /// User agent.
    public let userAgent: String
    /// IP address.
    public let ip: String
    /// API mode when event triggered.
    public let mode: String
    /// Location.
    public let country: String
    /// Log creation date in ISO 8601 format.
    public let time: String
    /// Project ID.
    public let projectId: String
    /// Team ID.
    public let teamId: String
    /// Hostname.
    public let hostname: String

    init(
        id: String,
        actorType: String,
        actorId: String,
        actorEmail: String,
        actorName: String,
        resourceParent: String,
        resourceType: String,
        resourceId: String,
        resource: String,
        event: String,
        userAgent: String,
        ip: String,
        mode: String,
        country: String,
        time: String,
        projectId: String,
        teamId: String,
        hostname: String
    ) {
        self.id = id
        self.actorType = actorType
        self.actorId = actorId
        self.actorEmail = actorEmail
        self.actorName = actorName
        self.resourceParent = resourceParent
        self.resourceType = resourceType
        self.resourceId = resourceId
        self.resource = resource
        self.event = event
        self.userAgent = userAgent
        self.ip = ip
        self.mode = mode
        self.country = country
        self.time = time
        self.projectId = projectId
        self.teamId = teamId
        self.hostname = hostname
    }

    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        self.id = try container.decode(String.self, forKey: .id)
        self.actorType = try container.decode(String.self, forKey: .actorType)
        self.actorId = try container.decode(String.self, forKey: .actorId)
        self.actorEmail = try container.decode(String.self, forKey: .actorEmail)
        self.actorName = try container.decode(String.self, forKey: .actorName)
        self.resourceParent = try container.decode(String.self, forKey: .resourceParent)
        self.resourceType = try container.decode(String.self, forKey: .resourceType)
        self.resourceId = try container.decode(String.self, forKey: .resourceId)
        self.resource = try container.decode(String.self, forKey: .resource)
        self.event = try container.decode(String.self, forKey: .event)
        self.userAgent = try container.decode(String.self, forKey: .userAgent)
        self.ip = try container.decode(String.self, forKey: .ip)
        self.mode = try container.decode(String.self, forKey: .mode)
        self.country = try container.decode(String.self, forKey: .country)
        self.time = try container.decode(String.self, forKey: .time)
        self.projectId = try container.decode(String.self, forKey: .projectId)
        self.teamId = try container.decode(String.self, forKey: .teamId)
        self.hostname = try container.decode(String.self, forKey: .hostname)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encode(id, forKey: .id)
        try container.encode(actorType, forKey: .actorType)
        try container.encode(actorId, forKey: .actorId)
        try container.encode(actorEmail, forKey: .actorEmail)
        try container.encode(actorName, forKey: .actorName)
        try container.encode(resourceParent, forKey: .resourceParent)
        try container.encode(resourceType, forKey: .resourceType)
        try container.encode(resourceId, forKey: .resourceId)
        try container.encode(resource, forKey: .resource)
        try container.encode(event, forKey: .event)
        try container.encode(userAgent, forKey: .userAgent)
        try container.encode(ip, forKey: .ip)
        try container.encode(mode, forKey: .mode)
        try container.encode(country, forKey: .country)
        try container.encode(time, forKey: .time)
        try container.encode(projectId, forKey: .projectId)
        try container.encode(teamId, forKey: .teamId)
        try container.encode(hostname, forKey: .hostname)
    }

    public func toMap() -> [String: Any] {
        return [
            "$id": id as Any,
            "actorType": actorType as Any,
            "actorId": actorId as Any,
            "actorEmail": actorEmail as Any,
            "actorName": actorName as Any,
            "resourceParent": resourceParent as Any,
            "resourceType": resourceType as Any,
            "resourceId": resourceId as Any,
            "resource": resource as Any,
            "event": event as Any,
            "userAgent": userAgent as Any,
            "ip": ip as Any,
            "mode": mode as Any,
            "country": country as Any,
            "time": time as Any,
            "projectId": projectId as Any,
            "teamId": teamId as Any,
            "hostname": hostname as Any
        ]
    }

    public static func from(map: [String: Any] ) -> ActivityEvent {
        return ActivityEvent(
            id: map["$id"] as! String,
            actorType: map["actorType"] as! String,
            actorId: map["actorId"] as! String,
            actorEmail: map["actorEmail"] as! String,
            actorName: map["actorName"] as! String,
            resourceParent: map["resourceParent"] as! String,
            resourceType: map["resourceType"] as! String,
            resourceId: map["resourceId"] as! String,
            resource: map["resource"] as! String,
            event: map["event"] as! String,
            userAgent: map["userAgent"] as! String,
            ip: map["ip"] as! String,
            mode: map["mode"] as! String,
            country: map["country"] as! String,
            time: map["time"] as! String,
            projectId: map["projectId"] as! String,
            teamId: map["teamId"] as! String,
            hostname: map["hostname"] as! String
        )
    }
}
