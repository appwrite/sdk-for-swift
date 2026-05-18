import Foundation
import JSONCodable

/// Project
open class Project: Codable {

    enum CodingKeys: String, CodingKey {
        case id = "$id"
        case createdAt = "$createdAt"
        case updatedAt = "$updatedAt"
        case name = "name"
        case teamId = "teamId"
        case devKeys = "devKeys"
        case smtpEnabled = "smtpEnabled"
        case smtpSenderName = "smtpSenderName"
        case smtpSenderEmail = "smtpSenderEmail"
        case smtpReplyToName = "smtpReplyToName"
        case smtpReplyToEmail = "smtpReplyToEmail"
        case smtpHost = "smtpHost"
        case smtpPort = "smtpPort"
        case smtpUsername = "smtpUsername"
        case smtpPassword = "smtpPassword"
        case smtpSecure = "smtpSecure"
        case pingCount = "pingCount"
        case pingedAt = "pingedAt"
        case labels = "labels"
        case status = "status"
        case authMethods = "authMethods"
        case services = "services"
        case protocols = "protocols"
        case region = "region"
        case billingLimits = "billingLimits"
        case blocks = "blocks"
        case consoleAccessedAt = "consoleAccessedAt"
    }

    /// Project ID.
    public let id: String
    /// Project creation date in ISO 8601 format.
    public let createdAt: String
    /// Project update date in ISO 8601 format.
    public let updatedAt: String
    /// Project name.
    public let name: String
    /// Project team ID.
    public let teamId: String
    /// Deprecated since 1.9.5: List of dev keys.
    public let devKeys: [DevKey]
    /// Status for custom SMTP
    public let smtpEnabled: Bool
    /// SMTP sender name
    public let smtpSenderName: String
    /// SMTP sender email
    public let smtpSenderEmail: String
    /// SMTP reply to name
    public let smtpReplyToName: String
    /// SMTP reply to email
    public let smtpReplyToEmail: String
    /// SMTP server host name
    public let smtpHost: String
    /// SMTP server port
    public let smtpPort: Int
    /// SMTP server username
    public let smtpUsername: String
    /// SMTP server password. This property is write-only and always returned empty.
    public let smtpPassword: String
    /// SMTP server secure protocol
    public let smtpSecure: String
    /// Number of times the ping was received for this project.
    public let pingCount: Int
    /// Last ping datetime in ISO 8601 format.
    public let pingedAt: String
    /// Labels for the project.
    public let labels: [String]
    /// Project status
    public let status: String
    /// List of auth methods.
    public let authMethods: [ProjectAuthMethod]
    /// List of services.
    public let services: [ProjectService]
    /// List of protocols.
    public let protocols: [ProjectProtocol]
    /// Project region
    public let region: String
    /// Billing limits reached
    public let billingLimits: BillingLimits
    /// Project blocks information
    public let blocks: [Block]
    /// Last time the project was accessed via console. Used with plan&#039;s projectInactivityDays to determine if project is paused.
    public let consoleAccessedAt: String

    init(
        id: String,
        createdAt: String,
        updatedAt: String,
        name: String,
        teamId: String,
        devKeys: [DevKey],
        smtpEnabled: Bool,
        smtpSenderName: String,
        smtpSenderEmail: String,
        smtpReplyToName: String,
        smtpReplyToEmail: String,
        smtpHost: String,
        smtpPort: Int,
        smtpUsername: String,
        smtpPassword: String,
        smtpSecure: String,
        pingCount: Int,
        pingedAt: String,
        labels: [String],
        status: String,
        authMethods: [ProjectAuthMethod],
        services: [ProjectService],
        protocols: [ProjectProtocol],
        region: String,
        billingLimits: BillingLimits,
        blocks: [Block],
        consoleAccessedAt: String
    ) {
        self.id = id
        self.createdAt = createdAt
        self.updatedAt = updatedAt
        self.name = name
        self.teamId = teamId
        self.devKeys = devKeys
        self.smtpEnabled = smtpEnabled
        self.smtpSenderName = smtpSenderName
        self.smtpSenderEmail = smtpSenderEmail
        self.smtpReplyToName = smtpReplyToName
        self.smtpReplyToEmail = smtpReplyToEmail
        self.smtpHost = smtpHost
        self.smtpPort = smtpPort
        self.smtpUsername = smtpUsername
        self.smtpPassword = smtpPassword
        self.smtpSecure = smtpSecure
        self.pingCount = pingCount
        self.pingedAt = pingedAt
        self.labels = labels
        self.status = status
        self.authMethods = authMethods
        self.services = services
        self.protocols = protocols
        self.region = region
        self.billingLimits = billingLimits
        self.blocks = blocks
        self.consoleAccessedAt = consoleAccessedAt
    }

    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        self.id = try container.decode(String.self, forKey: .id)
        self.createdAt = try container.decode(String.self, forKey: .createdAt)
        self.updatedAt = try container.decode(String.self, forKey: .updatedAt)
        self.name = try container.decode(String.self, forKey: .name)
        self.teamId = try container.decode(String.self, forKey: .teamId)
        self.devKeys = try container.decode([DevKey].self, forKey: .devKeys)
        self.smtpEnabled = try container.decode(Bool.self, forKey: .smtpEnabled)
        self.smtpSenderName = try container.decode(String.self, forKey: .smtpSenderName)
        self.smtpSenderEmail = try container.decode(String.self, forKey: .smtpSenderEmail)
        self.smtpReplyToName = try container.decode(String.self, forKey: .smtpReplyToName)
        self.smtpReplyToEmail = try container.decode(String.self, forKey: .smtpReplyToEmail)
        self.smtpHost = try container.decode(String.self, forKey: .smtpHost)
        self.smtpPort = try container.decode(Int.self, forKey: .smtpPort)
        self.smtpUsername = try container.decode(String.self, forKey: .smtpUsername)
        self.smtpPassword = try container.decode(String.self, forKey: .smtpPassword)
        self.smtpSecure = try container.decode(String.self, forKey: .smtpSecure)
        self.pingCount = try container.decode(Int.self, forKey: .pingCount)
        self.pingedAt = try container.decode(String.self, forKey: .pingedAt)
        self.labels = try container.decode([String].self, forKey: .labels)
        self.status = try container.decode(String.self, forKey: .status)
        self.authMethods = try container.decode([ProjectAuthMethod].self, forKey: .authMethods)
        self.services = try container.decode([ProjectService].self, forKey: .services)
        self.protocols = try container.decode([ProjectProtocol].self, forKey: .protocols)
        self.region = try container.decode(String.self, forKey: .region)
        self.billingLimits = try container.decode(BillingLimits.self, forKey: .billingLimits)
        self.blocks = try container.decode([Block].self, forKey: .blocks)
        self.consoleAccessedAt = try container.decode(String.self, forKey: .consoleAccessedAt)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encode(id, forKey: .id)
        try container.encode(createdAt, forKey: .createdAt)
        try container.encode(updatedAt, forKey: .updatedAt)
        try container.encode(name, forKey: .name)
        try container.encode(teamId, forKey: .teamId)
        try container.encode(devKeys, forKey: .devKeys)
        try container.encode(smtpEnabled, forKey: .smtpEnabled)
        try container.encode(smtpSenderName, forKey: .smtpSenderName)
        try container.encode(smtpSenderEmail, forKey: .smtpSenderEmail)
        try container.encode(smtpReplyToName, forKey: .smtpReplyToName)
        try container.encode(smtpReplyToEmail, forKey: .smtpReplyToEmail)
        try container.encode(smtpHost, forKey: .smtpHost)
        try container.encode(smtpPort, forKey: .smtpPort)
        try container.encode(smtpUsername, forKey: .smtpUsername)
        try container.encode(smtpPassword, forKey: .smtpPassword)
        try container.encode(smtpSecure, forKey: .smtpSecure)
        try container.encode(pingCount, forKey: .pingCount)
        try container.encode(pingedAt, forKey: .pingedAt)
        try container.encode(labels, forKey: .labels)
        try container.encode(status, forKey: .status)
        try container.encode(authMethods, forKey: .authMethods)
        try container.encode(services, forKey: .services)
        try container.encode(protocols, forKey: .protocols)
        try container.encode(region, forKey: .region)
        try container.encode(billingLimits, forKey: .billingLimits)
        try container.encode(blocks, forKey: .blocks)
        try container.encode(consoleAccessedAt, forKey: .consoleAccessedAt)
    }

    public func toMap() -> [String: Any] {
        return [
            "$id": id as Any,
            "$createdAt": createdAt as Any,
            "$updatedAt": updatedAt as Any,
            "name": name as Any,
            "teamId": teamId as Any,
            "devKeys": devKeys.map { $0.toMap() } as Any,
            "smtpEnabled": smtpEnabled as Any,
            "smtpSenderName": smtpSenderName as Any,
            "smtpSenderEmail": smtpSenderEmail as Any,
            "smtpReplyToName": smtpReplyToName as Any,
            "smtpReplyToEmail": smtpReplyToEmail as Any,
            "smtpHost": smtpHost as Any,
            "smtpPort": smtpPort as Any,
            "smtpUsername": smtpUsername as Any,
            "smtpPassword": smtpPassword as Any,
            "smtpSecure": smtpSecure as Any,
            "pingCount": pingCount as Any,
            "pingedAt": pingedAt as Any,
            "labels": labels as Any,
            "status": status as Any,
            "authMethods": authMethods.map { $0.toMap() } as Any,
            "services": services.map { $0.toMap() } as Any,
            "protocols": protocols.map { $0.toMap() } as Any,
            "region": region as Any,
            "billingLimits": billingLimits.toMap() as Any,
            "blocks": blocks.map { $0.toMap() } as Any,
            "consoleAccessedAt": consoleAccessedAt as Any
        ]
    }

    public static func from(map: [String: Any] ) -> Project {
        return Project(
            id: map["$id"] as! String,
            createdAt: map["$createdAt"] as! String,
            updatedAt: map["$updatedAt"] as! String,
            name: map["name"] as! String,
            teamId: map["teamId"] as! String,
            devKeys: (map["devKeys"] as! [[String: Any]]).map { DevKey.from(map: $0) },
            smtpEnabled: map["smtpEnabled"] as! Bool,
            smtpSenderName: map["smtpSenderName"] as! String,
            smtpSenderEmail: map["smtpSenderEmail"] as! String,
            smtpReplyToName: map["smtpReplyToName"] as! String,
            smtpReplyToEmail: map["smtpReplyToEmail"] as! String,
            smtpHost: map["smtpHost"] as! String,
            smtpPort: map["smtpPort"] as! Int,
            smtpUsername: map["smtpUsername"] as! String,
            smtpPassword: map["smtpPassword"] as! String,
            smtpSecure: map["smtpSecure"] as! String,
            pingCount: map["pingCount"] as! Int,
            pingedAt: map["pingedAt"] as! String,
            labels: map["labels"] as! [String],
            status: map["status"] as! String,
            authMethods: (map["authMethods"] as! [[String: Any]]).map { ProjectAuthMethod.from(map: $0) },
            services: (map["services"] as! [[String: Any]]).map { ProjectService.from(map: $0) },
            protocols: (map["protocols"] as! [[String: Any]]).map { ProjectProtocol.from(map: $0) },
            region: map["region"] as! String,
            billingLimits: BillingLimits.from(map: map["billingLimits"] as! [String: Any]),
            blocks: (map["blocks"] as! [[String: Any]]).map { Block.from(map: $0) },
            consoleAccessedAt: map["consoleAccessedAt"] as! String
        )
    }
}
