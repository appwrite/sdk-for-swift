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
        case region = "region"
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
        case onboarding = "onboarding"
        case authMethods = "authMethods"
        case services = "services"
        case protocols = "protocols"
        case blocks = "blocks"
        case consoleAccessedAt = "consoleAccessedAt"
        case wafEnabled = "wafEnabled"
        case billingLimits = "billingLimits"
        case oAuth2ServerEnabled = "oAuth2ServerEnabled"
        case oAuth2ServerAuthorizationUrl = "oAuth2ServerAuthorizationUrl"
        case oAuth2ServerScopes = "oAuth2ServerScopes"
        case oAuth2ServerDefaultScopes = "oAuth2ServerDefaultScopes"
        case oAuth2ServerAuthorizationDetailsTypes = "oAuth2ServerAuthorizationDetailsTypes"
        case oAuth2ServerAccessTokenDuration = "oAuth2ServerAccessTokenDuration"
        case oAuth2ServerRefreshTokenDuration = "oAuth2ServerRefreshTokenDuration"
        case oAuth2ServerPublicAccessTokenDuration = "oAuth2ServerPublicAccessTokenDuration"
        case oAuth2ServerPublicRefreshTokenDuration = "oAuth2ServerPublicRefreshTokenDuration"
        case oAuth2ServerInstallationAccessTokenDuration = "oAuth2ServerInstallationAccessTokenDuration"
        case oAuth2ServerConfidentialPkce = "oAuth2ServerConfidentialPkce"
        case oAuth2ServerVerificationUrl = "oAuth2ServerVerificationUrl"
        case oAuth2ServerUserCodeLength = "oAuth2ServerUserCodeLength"
        case oAuth2ServerUserCodeFormat = "oAuth2ServerUserCodeFormat"
        case oAuth2ServerDeviceCodeDuration = "oAuth2ServerDeviceCodeDuration"
        case oAuth2ServerDiscoveryUrl = "oAuth2ServerDiscoveryUrl"
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
    /// Project region
    public let region: String
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
    /// Stage progress (completed or skipped) with timestamps and actor types, keyed by stage id.
    public let onboarding: [String: AnyCodable]
    /// List of auth methods.
    public let authMethods: [ProjectAuthMethod]
    /// List of services.
    public let services: [ProjectService]
    /// List of protocols.
    public let protocols: [ProjectProtocol]
    /// Project blocks information
    public let blocks: [Block]
    /// Last time the project was accessed via console. Used with plan&#039;s projectInactivityDays to determine if project is paused.
    public let consoleAccessedAt: String
    /// Whether WAF enforcement is enabled for the project.
    public let wafEnabled: Bool
    /// Billing limits reached
    public let billingLimits: BillingLimits?
    /// OAuth2 server status
    public let oAuth2ServerEnabled: Bool?
    /// OAuth2 server authorization URL
    public let oAuth2ServerAuthorizationUrl: String?
    /// OAuth2 server allowed scopes
    public let oAuth2ServerScopes: [String]?
    /// OAuth2 server scopes used when an authorization request omits the scope parameter
    public let oAuth2ServerDefaultScopes: [String]?
    /// OAuth2 server accepted RFC 9396 authorization_details types
    public let oAuth2ServerAuthorizationDetailsTypes: [String]?
    /// OAuth2 server access token duration in seconds for confidential clients
    public let oAuth2ServerAccessTokenDuration: Int?
    /// OAuth2 server refresh token duration in seconds for confidential clients
    public let oAuth2ServerRefreshTokenDuration: Int?
    /// OAuth2 server access token duration in seconds for public clients (SPAs, mobile, native)
    public let oAuth2ServerPublicAccessTokenDuration: Int?
    /// OAuth2 server refresh token duration in seconds for public clients (SPAs, mobile, native)
    public let oAuth2ServerPublicRefreshTokenDuration: Int?
    /// OAuth2 server access token duration in seconds for app installation access tokens
    public let oAuth2ServerInstallationAccessTokenDuration: Int?
    /// When enabled, PKCE is required for confidential clients (server-side flows using client_secret). PKCE is always required for public clients regardless of this setting.
    public let oAuth2ServerConfidentialPkce: Bool?
    /// URL to your application page where users enter the device flow user code. Empty when the Device Authorization Grant is not configured.
    public let oAuth2ServerVerificationUrl: String?
    /// Number of characters in the device flow user code, excluding the formatting separator.
    public let oAuth2ServerUserCodeLength: Int?
    /// Character set for device flow user codes: `numeric`, `alphabetic`, or `alphanumeric`.
    public let oAuth2ServerUserCodeFormat: String?
    /// Lifetime in seconds of device flow device codes and user codes.
    public let oAuth2ServerDeviceCodeDuration: Int?
    /// OAuth2 server discovery URL
    public let oAuth2ServerDiscoveryUrl: String?

    init(
        id: String,
        createdAt: String,
        updatedAt: String,
        name: String,
        teamId: String,
        region: String,
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
        onboarding: [String: AnyCodable],
        authMethods: [ProjectAuthMethod],
        services: [ProjectService],
        protocols: [ProjectProtocol],
        blocks: [Block],
        consoleAccessedAt: String,
        wafEnabled: Bool,
        billingLimits: BillingLimits?,
        oAuth2ServerEnabled: Bool?,
        oAuth2ServerAuthorizationUrl: String?,
        oAuth2ServerScopes: [String]?,
        oAuth2ServerDefaultScopes: [String]?,
        oAuth2ServerAuthorizationDetailsTypes: [String]?,
        oAuth2ServerAccessTokenDuration: Int?,
        oAuth2ServerRefreshTokenDuration: Int?,
        oAuth2ServerPublicAccessTokenDuration: Int?,
        oAuth2ServerPublicRefreshTokenDuration: Int?,
        oAuth2ServerInstallationAccessTokenDuration: Int?,
        oAuth2ServerConfidentialPkce: Bool?,
        oAuth2ServerVerificationUrl: String?,
        oAuth2ServerUserCodeLength: Int?,
        oAuth2ServerUserCodeFormat: String?,
        oAuth2ServerDeviceCodeDuration: Int?,
        oAuth2ServerDiscoveryUrl: String?
    ) {
        self.id = id
        self.createdAt = createdAt
        self.updatedAt = updatedAt
        self.name = name
        self.teamId = teamId
        self.region = region
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
        self.onboarding = onboarding
        self.authMethods = authMethods
        self.services = services
        self.protocols = protocols
        self.blocks = blocks
        self.consoleAccessedAt = consoleAccessedAt
        self.wafEnabled = wafEnabled
        self.billingLimits = billingLimits
        self.oAuth2ServerEnabled = oAuth2ServerEnabled
        self.oAuth2ServerAuthorizationUrl = oAuth2ServerAuthorizationUrl
        self.oAuth2ServerScopes = oAuth2ServerScopes
        self.oAuth2ServerDefaultScopes = oAuth2ServerDefaultScopes
        self.oAuth2ServerAuthorizationDetailsTypes = oAuth2ServerAuthorizationDetailsTypes
        self.oAuth2ServerAccessTokenDuration = oAuth2ServerAccessTokenDuration
        self.oAuth2ServerRefreshTokenDuration = oAuth2ServerRefreshTokenDuration
        self.oAuth2ServerPublicAccessTokenDuration = oAuth2ServerPublicAccessTokenDuration
        self.oAuth2ServerPublicRefreshTokenDuration = oAuth2ServerPublicRefreshTokenDuration
        self.oAuth2ServerInstallationAccessTokenDuration = oAuth2ServerInstallationAccessTokenDuration
        self.oAuth2ServerConfidentialPkce = oAuth2ServerConfidentialPkce
        self.oAuth2ServerVerificationUrl = oAuth2ServerVerificationUrl
        self.oAuth2ServerUserCodeLength = oAuth2ServerUserCodeLength
        self.oAuth2ServerUserCodeFormat = oAuth2ServerUserCodeFormat
        self.oAuth2ServerDeviceCodeDuration = oAuth2ServerDeviceCodeDuration
        self.oAuth2ServerDiscoveryUrl = oAuth2ServerDiscoveryUrl
    }

    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        self.id = try container.decode(String.self, forKey: .id)
        self.createdAt = try container.decode(String.self, forKey: .createdAt)
        self.updatedAt = try container.decode(String.self, forKey: .updatedAt)
        self.name = try container.decode(String.self, forKey: .name)
        self.teamId = try container.decode(String.self, forKey: .teamId)
        self.region = try container.decode(String.self, forKey: .region)
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
        self.onboarding = try container.decode([String: AnyCodable].self, forKey: .onboarding)
        self.authMethods = try container.decode([ProjectAuthMethod].self, forKey: .authMethods)
        self.services = try container.decode([ProjectService].self, forKey: .services)
        self.protocols = try container.decode([ProjectProtocol].self, forKey: .protocols)
        self.blocks = try container.decode([Block].self, forKey: .blocks)
        self.consoleAccessedAt = try container.decode(String.self, forKey: .consoleAccessedAt)
        self.wafEnabled = try container.decode(Bool.self, forKey: .wafEnabled)
        self.billingLimits = try container.decodeIfPresent(BillingLimits.self, forKey: .billingLimits)
        self.oAuth2ServerEnabled = try container.decodeIfPresent(Bool.self, forKey: .oAuth2ServerEnabled)
        self.oAuth2ServerAuthorizationUrl = try container.decodeIfPresent(String.self, forKey: .oAuth2ServerAuthorizationUrl)
        self.oAuth2ServerScopes = try container.decodeIfPresent([String].self, forKey: .oAuth2ServerScopes)
        self.oAuth2ServerDefaultScopes = try container.decodeIfPresent([String].self, forKey: .oAuth2ServerDefaultScopes)
        self.oAuth2ServerAuthorizationDetailsTypes = try container.decodeIfPresent([String].self, forKey: .oAuth2ServerAuthorizationDetailsTypes)
        self.oAuth2ServerAccessTokenDuration = try container.decodeIfPresent(Int.self, forKey: .oAuth2ServerAccessTokenDuration)
        self.oAuth2ServerRefreshTokenDuration = try container.decodeIfPresent(Int.self, forKey: .oAuth2ServerRefreshTokenDuration)
        self.oAuth2ServerPublicAccessTokenDuration = try container.decodeIfPresent(Int.self, forKey: .oAuth2ServerPublicAccessTokenDuration)
        self.oAuth2ServerPublicRefreshTokenDuration = try container.decodeIfPresent(Int.self, forKey: .oAuth2ServerPublicRefreshTokenDuration)
        self.oAuth2ServerInstallationAccessTokenDuration = try container.decodeIfPresent(Int.self, forKey: .oAuth2ServerInstallationAccessTokenDuration)
        self.oAuth2ServerConfidentialPkce = try container.decodeIfPresent(Bool.self, forKey: .oAuth2ServerConfidentialPkce)
        self.oAuth2ServerVerificationUrl = try container.decodeIfPresent(String.self, forKey: .oAuth2ServerVerificationUrl)
        self.oAuth2ServerUserCodeLength = try container.decodeIfPresent(Int.self, forKey: .oAuth2ServerUserCodeLength)
        self.oAuth2ServerUserCodeFormat = try container.decodeIfPresent(String.self, forKey: .oAuth2ServerUserCodeFormat)
        self.oAuth2ServerDeviceCodeDuration = try container.decodeIfPresent(Int.self, forKey: .oAuth2ServerDeviceCodeDuration)
        self.oAuth2ServerDiscoveryUrl = try container.decodeIfPresent(String.self, forKey: .oAuth2ServerDiscoveryUrl)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encode(id, forKey: .id)
        try container.encode(createdAt, forKey: .createdAt)
        try container.encode(updatedAt, forKey: .updatedAt)
        try container.encode(name, forKey: .name)
        try container.encode(teamId, forKey: .teamId)
        try container.encode(region, forKey: .region)
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
        try container.encode(onboarding, forKey: .onboarding)
        try container.encode(authMethods, forKey: .authMethods)
        try container.encode(services, forKey: .services)
        try container.encode(protocols, forKey: .protocols)
        try container.encode(blocks, forKey: .blocks)
        try container.encode(consoleAccessedAt, forKey: .consoleAccessedAt)
        try container.encode(wafEnabled, forKey: .wafEnabled)
        try container.encodeIfPresent(billingLimits, forKey: .billingLimits)
        try container.encodeIfPresent(oAuth2ServerEnabled, forKey: .oAuth2ServerEnabled)
        try container.encodeIfPresent(oAuth2ServerAuthorizationUrl, forKey: .oAuth2ServerAuthorizationUrl)
        try container.encodeIfPresent(oAuth2ServerScopes, forKey: .oAuth2ServerScopes)
        try container.encodeIfPresent(oAuth2ServerDefaultScopes, forKey: .oAuth2ServerDefaultScopes)
        try container.encodeIfPresent(oAuth2ServerAuthorizationDetailsTypes, forKey: .oAuth2ServerAuthorizationDetailsTypes)
        try container.encodeIfPresent(oAuth2ServerAccessTokenDuration, forKey: .oAuth2ServerAccessTokenDuration)
        try container.encodeIfPresent(oAuth2ServerRefreshTokenDuration, forKey: .oAuth2ServerRefreshTokenDuration)
        try container.encodeIfPresent(oAuth2ServerPublicAccessTokenDuration, forKey: .oAuth2ServerPublicAccessTokenDuration)
        try container.encodeIfPresent(oAuth2ServerPublicRefreshTokenDuration, forKey: .oAuth2ServerPublicRefreshTokenDuration)
        try container.encodeIfPresent(oAuth2ServerInstallationAccessTokenDuration, forKey: .oAuth2ServerInstallationAccessTokenDuration)
        try container.encodeIfPresent(oAuth2ServerConfidentialPkce, forKey: .oAuth2ServerConfidentialPkce)
        try container.encodeIfPresent(oAuth2ServerVerificationUrl, forKey: .oAuth2ServerVerificationUrl)
        try container.encodeIfPresent(oAuth2ServerUserCodeLength, forKey: .oAuth2ServerUserCodeLength)
        try container.encodeIfPresent(oAuth2ServerUserCodeFormat, forKey: .oAuth2ServerUserCodeFormat)
        try container.encodeIfPresent(oAuth2ServerDeviceCodeDuration, forKey: .oAuth2ServerDeviceCodeDuration)
        try container.encodeIfPresent(oAuth2ServerDiscoveryUrl, forKey: .oAuth2ServerDiscoveryUrl)
    }

    public func toMap() -> [String: Any] {
        return [
            "$id": id as Any,
            "$createdAt": createdAt as Any,
            "$updatedAt": updatedAt as Any,
            "name": name as Any,
            "teamId": teamId as Any,
            "region": region as Any,
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
            "onboarding": onboarding as Any,
            "authMethods": authMethods.map { $0.toMap() } as Any,
            "services": services.map { $0.toMap() } as Any,
            "protocols": protocols.map { $0.toMap() } as Any,
            "blocks": blocks.map { $0.toMap() } as Any,
            "consoleAccessedAt": consoleAccessedAt as Any,
            "wafEnabled": wafEnabled as Any,
            "billingLimits": billingLimits?.toMap() as Any,
            "oAuth2ServerEnabled": oAuth2ServerEnabled as Any,
            "oAuth2ServerAuthorizationUrl": oAuth2ServerAuthorizationUrl as Any,
            "oAuth2ServerScopes": oAuth2ServerScopes as Any,
            "oAuth2ServerDefaultScopes": oAuth2ServerDefaultScopes as Any,
            "oAuth2ServerAuthorizationDetailsTypes": oAuth2ServerAuthorizationDetailsTypes as Any,
            "oAuth2ServerAccessTokenDuration": oAuth2ServerAccessTokenDuration as Any,
            "oAuth2ServerRefreshTokenDuration": oAuth2ServerRefreshTokenDuration as Any,
            "oAuth2ServerPublicAccessTokenDuration": oAuth2ServerPublicAccessTokenDuration as Any,
            "oAuth2ServerPublicRefreshTokenDuration": oAuth2ServerPublicRefreshTokenDuration as Any,
            "oAuth2ServerInstallationAccessTokenDuration": oAuth2ServerInstallationAccessTokenDuration as Any,
            "oAuth2ServerConfidentialPkce": oAuth2ServerConfidentialPkce as Any,
            "oAuth2ServerVerificationUrl": oAuth2ServerVerificationUrl as Any,
            "oAuth2ServerUserCodeLength": oAuth2ServerUserCodeLength as Any,
            "oAuth2ServerUserCodeFormat": oAuth2ServerUserCodeFormat as Any,
            "oAuth2ServerDeviceCodeDuration": oAuth2ServerDeviceCodeDuration as Any,
            "oAuth2ServerDiscoveryUrl": oAuth2ServerDiscoveryUrl as Any
        ]
    }

    public static func from(map: [String: Any] ) -> Project {
        return Project(
            id: map["$id"] as! String,
            createdAt: map["$createdAt"] as! String,
            updatedAt: map["$updatedAt"] as! String,
            name: map["name"] as! String,
            teamId: map["teamId"] as! String,
            region: map["region"] as! String,
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
            onboarding: (map["onboarding"] as! [String: Any]).mapValues { AnyCodable($0) },
            authMethods: (map["authMethods"] as! [[String: Any]]).map { ProjectAuthMethod.from(map: $0) },
            services: (map["services"] as! [[String: Any]]).map { ProjectService.from(map: $0) },
            protocols: (map["protocols"] as! [[String: Any]]).map { ProjectProtocol.from(map: $0) },
            blocks: (map["blocks"] as! [[String: Any]]).map { Block.from(map: $0) },
            consoleAccessedAt: map["consoleAccessedAt"] as! String,
            wafEnabled: map["wafEnabled"] as! Bool,
            billingLimits: map["billingLimits"] as? [String: Any] != nil ? BillingLimits.from(map: map["billingLimits"] as! [String: Any]) : nil,
            oAuth2ServerEnabled: map["oAuth2ServerEnabled"] as? Bool,
            oAuth2ServerAuthorizationUrl: map["oAuth2ServerAuthorizationUrl"] as? String,
            oAuth2ServerScopes: map["oAuth2ServerScopes"] as? [String],
            oAuth2ServerDefaultScopes: map["oAuth2ServerDefaultScopes"] as? [String],
            oAuth2ServerAuthorizationDetailsTypes: map["oAuth2ServerAuthorizationDetailsTypes"] as? [String],
            oAuth2ServerAccessTokenDuration: map["oAuth2ServerAccessTokenDuration"] as? Int,
            oAuth2ServerRefreshTokenDuration: map["oAuth2ServerRefreshTokenDuration"] as? Int,
            oAuth2ServerPublicAccessTokenDuration: map["oAuth2ServerPublicAccessTokenDuration"] as? Int,
            oAuth2ServerPublicRefreshTokenDuration: map["oAuth2ServerPublicRefreshTokenDuration"] as? Int,
            oAuth2ServerInstallationAccessTokenDuration: map["oAuth2ServerInstallationAccessTokenDuration"] as? Int,
            oAuth2ServerConfidentialPkce: map["oAuth2ServerConfidentialPkce"] as? Bool,
            oAuth2ServerVerificationUrl: map["oAuth2ServerVerificationUrl"] as? String,
            oAuth2ServerUserCodeLength: map["oAuth2ServerUserCodeLength"] as? Int,
            oAuth2ServerUserCodeFormat: map["oAuth2ServerUserCodeFormat"] as? String,
            oAuth2ServerDeviceCodeDuration: map["oAuth2ServerDeviceCodeDuration"] as? Int,
            oAuth2ServerDiscoveryUrl: map["oAuth2ServerDiscoveryUrl"] as? String
        )
    }
}
