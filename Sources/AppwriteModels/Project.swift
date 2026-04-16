import Foundation
import JSONCodable

/// Project
open class Project: Codable {

    enum CodingKeys: String, CodingKey {
        case id = "$id"
        case createdAt = "$createdAt"
        case updatedAt = "$updatedAt"
        case name = "name"
        case description = "description"
        case teamId = "teamId"
        case logo = "logo"
        case url = "url"
        case legalName = "legalName"
        case legalCountry = "legalCountry"
        case legalState = "legalState"
        case legalCity = "legalCity"
        case legalAddress = "legalAddress"
        case legalTaxId = "legalTaxId"
        case authDuration = "authDuration"
        case authLimit = "authLimit"
        case authSessionsLimit = "authSessionsLimit"
        case authPasswordHistory = "authPasswordHistory"
        case authPasswordDictionary = "authPasswordDictionary"
        case authPersonalDataCheck = "authPersonalDataCheck"
        case authDisposableEmails = "authDisposableEmails"
        case authCanonicalEmails = "authCanonicalEmails"
        case authFreeEmails = "authFreeEmails"
        case authMockNumbers = "authMockNumbers"
        case authSessionAlerts = "authSessionAlerts"
        case authMembershipsUserName = "authMembershipsUserName"
        case authMembershipsUserEmail = "authMembershipsUserEmail"
        case authMembershipsMfa = "authMembershipsMfa"
        case authInvalidateSessions = "authInvalidateSessions"
        case oAuthProviders = "oAuthProviders"
        case platforms = "platforms"
        case webhooks = "webhooks"
        case keys = "keys"
        case devKeys = "devKeys"
        case smtpEnabled = "smtpEnabled"
        case smtpSenderName = "smtpSenderName"
        case smtpSenderEmail = "smtpSenderEmail"
        case smtpReplyTo = "smtpReplyTo"
        case smtpHost = "smtpHost"
        case smtpPort = "smtpPort"
        case smtpUsername = "smtpUsername"
        case smtpPassword = "smtpPassword"
        case smtpSecure = "smtpSecure"
        case pingCount = "pingCount"
        case pingedAt = "pingedAt"
        case labels = "labels"
        case status = "status"
        case authEmailPassword = "authEmailPassword"
        case authUsersAuthMagicURL = "authUsersAuthMagicURL"
        case authEmailOtp = "authEmailOtp"
        case authAnonymous = "authAnonymous"
        case authInvites = "authInvites"
        case authJWT = "authJWT"
        case authPhone = "authPhone"
        case serviceStatusForAccount = "serviceStatusForAccount"
        case serviceStatusForAvatars = "serviceStatusForAvatars"
        case serviceStatusForDatabases = "serviceStatusForDatabases"
        case serviceStatusForTablesdb = "serviceStatusForTablesdb"
        case serviceStatusForLocale = "serviceStatusForLocale"
        case serviceStatusForHealth = "serviceStatusForHealth"
        case serviceStatusForProject = "serviceStatusForProject"
        case serviceStatusForStorage = "serviceStatusForStorage"
        case serviceStatusForTeams = "serviceStatusForTeams"
        case serviceStatusForUsers = "serviceStatusForUsers"
        case serviceStatusForVcs = "serviceStatusForVcs"
        case serviceStatusForSites = "serviceStatusForSites"
        case serviceStatusForFunctions = "serviceStatusForFunctions"
        case serviceStatusForProxy = "serviceStatusForProxy"
        case serviceStatusForGraphql = "serviceStatusForGraphql"
        case serviceStatusForMigrations = "serviceStatusForMigrations"
        case serviceStatusForMessaging = "serviceStatusForMessaging"
        case protocolStatusForRest = "protocolStatusForRest"
        case protocolStatusForGraphql = "protocolStatusForGraphql"
        case protocolStatusForWebsocket = "protocolStatusForWebsocket"
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
    /// Project description.
    public let description: String
    /// Project team ID.
    public let teamId: String
    /// Project logo file ID.
    public let logo: String
    /// Project website URL.
    public let url: String
    /// Company legal name.
    public let legalName: String
    /// Country code in [ISO 3166-1](http://en.wikipedia.org/wiki/ISO_3166-1) two-character format.
    public let legalCountry: String
    /// State name.
    public let legalState: String
    /// City name.
    public let legalCity: String
    /// Company Address.
    public let legalAddress: String
    /// Company Tax ID.
    public let legalTaxId: String
    /// Session duration in seconds.
    public let authDuration: Int
    /// Max users allowed. 0 is unlimited.
    public let authLimit: Int
    /// Max sessions allowed per user. 100 maximum.
    public let authSessionsLimit: Int
    /// Max allowed passwords in the history list per user. Max passwords limit allowed in history is 20. Use 0 for disabling password history.
    public let authPasswordHistory: Int
    /// Whether or not to check user&#039;s password against most commonly used passwords.
    public let authPasswordDictionary: Bool
    /// Whether or not to check the user password for similarity with their personal data.
    public let authPersonalDataCheck: Bool
    /// Whether or not to disallow disposable email addresses during signup and email updates.
    public let authDisposableEmails: Bool
    /// Whether or not to require canonical email addresses during signup and email updates.
    public let authCanonicalEmails: Bool
    /// Whether or not to disallow free email addresses during signup and email updates.
    public let authFreeEmails: Bool
    /// An array of mock numbers and their corresponding verification codes (OTPs).
    public let authMockNumbers: [MockNumber]
    /// Whether or not to send session alert emails to users.
    public let authSessionAlerts: Bool
    /// Whether or not to show user names in the teams membership response.
    public let authMembershipsUserName: Bool
    /// Whether or not to show user emails in the teams membership response.
    public let authMembershipsUserEmail: Bool
    /// Whether or not to show user MFA status in the teams membership response.
    public let authMembershipsMfa: Bool
    /// Whether or not all existing sessions should be invalidated on password change
    public let authInvalidateSessions: Bool
    /// List of Auth Providers.
    public let oAuthProviders: [AuthProvider]
    /// List of Platforms.
    public let platforms: [AnyCodable]
    /// List of Webhooks.
    public let webhooks: [Webhook]
    /// List of API Keys.
    public let keys: [Key]
    /// List of dev keys.
    public let devKeys: [DevKey]
    /// Status for custom SMTP
    public let smtpEnabled: Bool
    /// SMTP sender name
    public let smtpSenderName: String
    /// SMTP sender email
    public let smtpSenderEmail: String
    /// SMTP reply to email
    public let smtpReplyTo: String
    /// SMTP server host name
    public let smtpHost: String
    /// SMTP server port
    public let smtpPort: Int
    /// SMTP server username
    public let smtpUsername: String
    /// SMTP server password
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
    /// Email/Password auth method status
    public let authEmailPassword: Bool
    /// Magic URL auth method status
    public let authUsersAuthMagicURL: Bool
    /// Email (OTP) auth method status
    public let authEmailOtp: Bool
    /// Anonymous auth method status
    public let authAnonymous: Bool
    /// Invites auth method status
    public let authInvites: Bool
    /// JWT auth method status
    public let authJWT: Bool
    /// Phone auth method status
    public let authPhone: Bool
    /// Account service status
    public let serviceStatusForAccount: Bool
    /// Avatars service status
    public let serviceStatusForAvatars: Bool
    /// Databases (legacy) service status
    public let serviceStatusForDatabases: Bool
    /// TablesDB service status
    public let serviceStatusForTablesdb: Bool
    /// Locale service status
    public let serviceStatusForLocale: Bool
    /// Health service status
    public let serviceStatusForHealth: Bool
    /// Project service status
    public let serviceStatusForProject: Bool
    /// Storage service status
    public let serviceStatusForStorage: Bool
    /// Teams service status
    public let serviceStatusForTeams: Bool
    /// Users service status
    public let serviceStatusForUsers: Bool
    /// VCS service status
    public let serviceStatusForVcs: Bool
    /// Sites service status
    public let serviceStatusForSites: Bool
    /// Functions service status
    public let serviceStatusForFunctions: Bool
    /// Proxy service status
    public let serviceStatusForProxy: Bool
    /// GraphQL service status
    public let serviceStatusForGraphql: Bool
    /// Migrations service status
    public let serviceStatusForMigrations: Bool
    /// Messaging service status
    public let serviceStatusForMessaging: Bool
    /// REST protocol status
    public let protocolStatusForRest: Bool
    /// GraphQL protocol status
    public let protocolStatusForGraphql: Bool
    /// Websocket protocol status
    public let protocolStatusForWebsocket: Bool
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
        description: String,
        teamId: String,
        logo: String,
        url: String,
        legalName: String,
        legalCountry: String,
        legalState: String,
        legalCity: String,
        legalAddress: String,
        legalTaxId: String,
        authDuration: Int,
        authLimit: Int,
        authSessionsLimit: Int,
        authPasswordHistory: Int,
        authPasswordDictionary: Bool,
        authPersonalDataCheck: Bool,
        authDisposableEmails: Bool,
        authCanonicalEmails: Bool,
        authFreeEmails: Bool,
        authMockNumbers: [MockNumber],
        authSessionAlerts: Bool,
        authMembershipsUserName: Bool,
        authMembershipsUserEmail: Bool,
        authMembershipsMfa: Bool,
        authInvalidateSessions: Bool,
        oAuthProviders: [AuthProvider],
        platforms: [AnyCodable],
        webhooks: [Webhook],
        keys: [Key],
        devKeys: [DevKey],
        smtpEnabled: Bool,
        smtpSenderName: String,
        smtpSenderEmail: String,
        smtpReplyTo: String,
        smtpHost: String,
        smtpPort: Int,
        smtpUsername: String,
        smtpPassword: String,
        smtpSecure: String,
        pingCount: Int,
        pingedAt: String,
        labels: [String],
        status: String,
        authEmailPassword: Bool,
        authUsersAuthMagicURL: Bool,
        authEmailOtp: Bool,
        authAnonymous: Bool,
        authInvites: Bool,
        authJWT: Bool,
        authPhone: Bool,
        serviceStatusForAccount: Bool,
        serviceStatusForAvatars: Bool,
        serviceStatusForDatabases: Bool,
        serviceStatusForTablesdb: Bool,
        serviceStatusForLocale: Bool,
        serviceStatusForHealth: Bool,
        serviceStatusForProject: Bool,
        serviceStatusForStorage: Bool,
        serviceStatusForTeams: Bool,
        serviceStatusForUsers: Bool,
        serviceStatusForVcs: Bool,
        serviceStatusForSites: Bool,
        serviceStatusForFunctions: Bool,
        serviceStatusForProxy: Bool,
        serviceStatusForGraphql: Bool,
        serviceStatusForMigrations: Bool,
        serviceStatusForMessaging: Bool,
        protocolStatusForRest: Bool,
        protocolStatusForGraphql: Bool,
        protocolStatusForWebsocket: Bool,
        region: String,
        billingLimits: BillingLimits,
        blocks: [Block],
        consoleAccessedAt: String
    ) {
        self.id = id
        self.createdAt = createdAt
        self.updatedAt = updatedAt
        self.name = name
        self.description = description
        self.teamId = teamId
        self.logo = logo
        self.url = url
        self.legalName = legalName
        self.legalCountry = legalCountry
        self.legalState = legalState
        self.legalCity = legalCity
        self.legalAddress = legalAddress
        self.legalTaxId = legalTaxId
        self.authDuration = authDuration
        self.authLimit = authLimit
        self.authSessionsLimit = authSessionsLimit
        self.authPasswordHistory = authPasswordHistory
        self.authPasswordDictionary = authPasswordDictionary
        self.authPersonalDataCheck = authPersonalDataCheck
        self.authDisposableEmails = authDisposableEmails
        self.authCanonicalEmails = authCanonicalEmails
        self.authFreeEmails = authFreeEmails
        self.authMockNumbers = authMockNumbers
        self.authSessionAlerts = authSessionAlerts
        self.authMembershipsUserName = authMembershipsUserName
        self.authMembershipsUserEmail = authMembershipsUserEmail
        self.authMembershipsMfa = authMembershipsMfa
        self.authInvalidateSessions = authInvalidateSessions
        self.oAuthProviders = oAuthProviders
        self.platforms = platforms
        self.webhooks = webhooks
        self.keys = keys
        self.devKeys = devKeys
        self.smtpEnabled = smtpEnabled
        self.smtpSenderName = smtpSenderName
        self.smtpSenderEmail = smtpSenderEmail
        self.smtpReplyTo = smtpReplyTo
        self.smtpHost = smtpHost
        self.smtpPort = smtpPort
        self.smtpUsername = smtpUsername
        self.smtpPassword = smtpPassword
        self.smtpSecure = smtpSecure
        self.pingCount = pingCount
        self.pingedAt = pingedAt
        self.labels = labels
        self.status = status
        self.authEmailPassword = authEmailPassword
        self.authUsersAuthMagicURL = authUsersAuthMagicURL
        self.authEmailOtp = authEmailOtp
        self.authAnonymous = authAnonymous
        self.authInvites = authInvites
        self.authJWT = authJWT
        self.authPhone = authPhone
        self.serviceStatusForAccount = serviceStatusForAccount
        self.serviceStatusForAvatars = serviceStatusForAvatars
        self.serviceStatusForDatabases = serviceStatusForDatabases
        self.serviceStatusForTablesdb = serviceStatusForTablesdb
        self.serviceStatusForLocale = serviceStatusForLocale
        self.serviceStatusForHealth = serviceStatusForHealth
        self.serviceStatusForProject = serviceStatusForProject
        self.serviceStatusForStorage = serviceStatusForStorage
        self.serviceStatusForTeams = serviceStatusForTeams
        self.serviceStatusForUsers = serviceStatusForUsers
        self.serviceStatusForVcs = serviceStatusForVcs
        self.serviceStatusForSites = serviceStatusForSites
        self.serviceStatusForFunctions = serviceStatusForFunctions
        self.serviceStatusForProxy = serviceStatusForProxy
        self.serviceStatusForGraphql = serviceStatusForGraphql
        self.serviceStatusForMigrations = serviceStatusForMigrations
        self.serviceStatusForMessaging = serviceStatusForMessaging
        self.protocolStatusForRest = protocolStatusForRest
        self.protocolStatusForGraphql = protocolStatusForGraphql
        self.protocolStatusForWebsocket = protocolStatusForWebsocket
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
        self.description = try container.decode(String.self, forKey: .description)
        self.teamId = try container.decode(String.self, forKey: .teamId)
        self.logo = try container.decode(String.self, forKey: .logo)
        self.url = try container.decode(String.self, forKey: .url)
        self.legalName = try container.decode(String.self, forKey: .legalName)
        self.legalCountry = try container.decode(String.self, forKey: .legalCountry)
        self.legalState = try container.decode(String.self, forKey: .legalState)
        self.legalCity = try container.decode(String.self, forKey: .legalCity)
        self.legalAddress = try container.decode(String.self, forKey: .legalAddress)
        self.legalTaxId = try container.decode(String.self, forKey: .legalTaxId)
        self.authDuration = try container.decode(Int.self, forKey: .authDuration)
        self.authLimit = try container.decode(Int.self, forKey: .authLimit)
        self.authSessionsLimit = try container.decode(Int.self, forKey: .authSessionsLimit)
        self.authPasswordHistory = try container.decode(Int.self, forKey: .authPasswordHistory)
        self.authPasswordDictionary = try container.decode(Bool.self, forKey: .authPasswordDictionary)
        self.authPersonalDataCheck = try container.decode(Bool.self, forKey: .authPersonalDataCheck)
        self.authDisposableEmails = try container.decode(Bool.self, forKey: .authDisposableEmails)
        self.authCanonicalEmails = try container.decode(Bool.self, forKey: .authCanonicalEmails)
        self.authFreeEmails = try container.decode(Bool.self, forKey: .authFreeEmails)
        self.authMockNumbers = try container.decode([MockNumber].self, forKey: .authMockNumbers)
        self.authSessionAlerts = try container.decode(Bool.self, forKey: .authSessionAlerts)
        self.authMembershipsUserName = try container.decode(Bool.self, forKey: .authMembershipsUserName)
        self.authMembershipsUserEmail = try container.decode(Bool.self, forKey: .authMembershipsUserEmail)
        self.authMembershipsMfa = try container.decode(Bool.self, forKey: .authMembershipsMfa)
        self.authInvalidateSessions = try container.decode(Bool.self, forKey: .authInvalidateSessions)
        self.oAuthProviders = try container.decode([AuthProvider].self, forKey: .oAuthProviders)
        self.platforms = try container.decode([AnyCodable].self, forKey: .platforms)
        self.webhooks = try container.decode([Webhook].self, forKey: .webhooks)
        self.keys = try container.decode([Key].self, forKey: .keys)
        self.devKeys = try container.decode([DevKey].self, forKey: .devKeys)
        self.smtpEnabled = try container.decode(Bool.self, forKey: .smtpEnabled)
        self.smtpSenderName = try container.decode(String.self, forKey: .smtpSenderName)
        self.smtpSenderEmail = try container.decode(String.self, forKey: .smtpSenderEmail)
        self.smtpReplyTo = try container.decode(String.self, forKey: .smtpReplyTo)
        self.smtpHost = try container.decode(String.self, forKey: .smtpHost)
        self.smtpPort = try container.decode(Int.self, forKey: .smtpPort)
        self.smtpUsername = try container.decode(String.self, forKey: .smtpUsername)
        self.smtpPassword = try container.decode(String.self, forKey: .smtpPassword)
        self.smtpSecure = try container.decode(String.self, forKey: .smtpSecure)
        self.pingCount = try container.decode(Int.self, forKey: .pingCount)
        self.pingedAt = try container.decode(String.self, forKey: .pingedAt)
        self.labels = try container.decode([String].self, forKey: .labels)
        self.status = try container.decode(String.self, forKey: .status)
        self.authEmailPassword = try container.decode(Bool.self, forKey: .authEmailPassword)
        self.authUsersAuthMagicURL = try container.decode(Bool.self, forKey: .authUsersAuthMagicURL)
        self.authEmailOtp = try container.decode(Bool.self, forKey: .authEmailOtp)
        self.authAnonymous = try container.decode(Bool.self, forKey: .authAnonymous)
        self.authInvites = try container.decode(Bool.self, forKey: .authInvites)
        self.authJWT = try container.decode(Bool.self, forKey: .authJWT)
        self.authPhone = try container.decode(Bool.self, forKey: .authPhone)
        self.serviceStatusForAccount = try container.decode(Bool.self, forKey: .serviceStatusForAccount)
        self.serviceStatusForAvatars = try container.decode(Bool.self, forKey: .serviceStatusForAvatars)
        self.serviceStatusForDatabases = try container.decode(Bool.self, forKey: .serviceStatusForDatabases)
        self.serviceStatusForTablesdb = try container.decode(Bool.self, forKey: .serviceStatusForTablesdb)
        self.serviceStatusForLocale = try container.decode(Bool.self, forKey: .serviceStatusForLocale)
        self.serviceStatusForHealth = try container.decode(Bool.self, forKey: .serviceStatusForHealth)
        self.serviceStatusForProject = try container.decode(Bool.self, forKey: .serviceStatusForProject)
        self.serviceStatusForStorage = try container.decode(Bool.self, forKey: .serviceStatusForStorage)
        self.serviceStatusForTeams = try container.decode(Bool.self, forKey: .serviceStatusForTeams)
        self.serviceStatusForUsers = try container.decode(Bool.self, forKey: .serviceStatusForUsers)
        self.serviceStatusForVcs = try container.decode(Bool.self, forKey: .serviceStatusForVcs)
        self.serviceStatusForSites = try container.decode(Bool.self, forKey: .serviceStatusForSites)
        self.serviceStatusForFunctions = try container.decode(Bool.self, forKey: .serviceStatusForFunctions)
        self.serviceStatusForProxy = try container.decode(Bool.self, forKey: .serviceStatusForProxy)
        self.serviceStatusForGraphql = try container.decode(Bool.self, forKey: .serviceStatusForGraphql)
        self.serviceStatusForMigrations = try container.decode(Bool.self, forKey: .serviceStatusForMigrations)
        self.serviceStatusForMessaging = try container.decode(Bool.self, forKey: .serviceStatusForMessaging)
        self.protocolStatusForRest = try container.decode(Bool.self, forKey: .protocolStatusForRest)
        self.protocolStatusForGraphql = try container.decode(Bool.self, forKey: .protocolStatusForGraphql)
        self.protocolStatusForWebsocket = try container.decode(Bool.self, forKey: .protocolStatusForWebsocket)
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
        try container.encode(description, forKey: .description)
        try container.encode(teamId, forKey: .teamId)
        try container.encode(logo, forKey: .logo)
        try container.encode(url, forKey: .url)
        try container.encode(legalName, forKey: .legalName)
        try container.encode(legalCountry, forKey: .legalCountry)
        try container.encode(legalState, forKey: .legalState)
        try container.encode(legalCity, forKey: .legalCity)
        try container.encode(legalAddress, forKey: .legalAddress)
        try container.encode(legalTaxId, forKey: .legalTaxId)
        try container.encode(authDuration, forKey: .authDuration)
        try container.encode(authLimit, forKey: .authLimit)
        try container.encode(authSessionsLimit, forKey: .authSessionsLimit)
        try container.encode(authPasswordHistory, forKey: .authPasswordHistory)
        try container.encode(authPasswordDictionary, forKey: .authPasswordDictionary)
        try container.encode(authPersonalDataCheck, forKey: .authPersonalDataCheck)
        try container.encode(authDisposableEmails, forKey: .authDisposableEmails)
        try container.encode(authCanonicalEmails, forKey: .authCanonicalEmails)
        try container.encode(authFreeEmails, forKey: .authFreeEmails)
        try container.encode(authMockNumbers, forKey: .authMockNumbers)
        try container.encode(authSessionAlerts, forKey: .authSessionAlerts)
        try container.encode(authMembershipsUserName, forKey: .authMembershipsUserName)
        try container.encode(authMembershipsUserEmail, forKey: .authMembershipsUserEmail)
        try container.encode(authMembershipsMfa, forKey: .authMembershipsMfa)
        try container.encode(authInvalidateSessions, forKey: .authInvalidateSessions)
        try container.encode(oAuthProviders, forKey: .oAuthProviders)
        try container.encode(platforms, forKey: .platforms)
        try container.encode(webhooks, forKey: .webhooks)
        try container.encode(keys, forKey: .keys)
        try container.encode(devKeys, forKey: .devKeys)
        try container.encode(smtpEnabled, forKey: .smtpEnabled)
        try container.encode(smtpSenderName, forKey: .smtpSenderName)
        try container.encode(smtpSenderEmail, forKey: .smtpSenderEmail)
        try container.encode(smtpReplyTo, forKey: .smtpReplyTo)
        try container.encode(smtpHost, forKey: .smtpHost)
        try container.encode(smtpPort, forKey: .smtpPort)
        try container.encode(smtpUsername, forKey: .smtpUsername)
        try container.encode(smtpPassword, forKey: .smtpPassword)
        try container.encode(smtpSecure, forKey: .smtpSecure)
        try container.encode(pingCount, forKey: .pingCount)
        try container.encode(pingedAt, forKey: .pingedAt)
        try container.encode(labels, forKey: .labels)
        try container.encode(status, forKey: .status)
        try container.encode(authEmailPassword, forKey: .authEmailPassword)
        try container.encode(authUsersAuthMagicURL, forKey: .authUsersAuthMagicURL)
        try container.encode(authEmailOtp, forKey: .authEmailOtp)
        try container.encode(authAnonymous, forKey: .authAnonymous)
        try container.encode(authInvites, forKey: .authInvites)
        try container.encode(authJWT, forKey: .authJWT)
        try container.encode(authPhone, forKey: .authPhone)
        try container.encode(serviceStatusForAccount, forKey: .serviceStatusForAccount)
        try container.encode(serviceStatusForAvatars, forKey: .serviceStatusForAvatars)
        try container.encode(serviceStatusForDatabases, forKey: .serviceStatusForDatabases)
        try container.encode(serviceStatusForTablesdb, forKey: .serviceStatusForTablesdb)
        try container.encode(serviceStatusForLocale, forKey: .serviceStatusForLocale)
        try container.encode(serviceStatusForHealth, forKey: .serviceStatusForHealth)
        try container.encode(serviceStatusForProject, forKey: .serviceStatusForProject)
        try container.encode(serviceStatusForStorage, forKey: .serviceStatusForStorage)
        try container.encode(serviceStatusForTeams, forKey: .serviceStatusForTeams)
        try container.encode(serviceStatusForUsers, forKey: .serviceStatusForUsers)
        try container.encode(serviceStatusForVcs, forKey: .serviceStatusForVcs)
        try container.encode(serviceStatusForSites, forKey: .serviceStatusForSites)
        try container.encode(serviceStatusForFunctions, forKey: .serviceStatusForFunctions)
        try container.encode(serviceStatusForProxy, forKey: .serviceStatusForProxy)
        try container.encode(serviceStatusForGraphql, forKey: .serviceStatusForGraphql)
        try container.encode(serviceStatusForMigrations, forKey: .serviceStatusForMigrations)
        try container.encode(serviceStatusForMessaging, forKey: .serviceStatusForMessaging)
        try container.encode(protocolStatusForRest, forKey: .protocolStatusForRest)
        try container.encode(protocolStatusForGraphql, forKey: .protocolStatusForGraphql)
        try container.encode(protocolStatusForWebsocket, forKey: .protocolStatusForWebsocket)
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
            "description": description as Any,
            "teamId": teamId as Any,
            "logo": logo as Any,
            "url": url as Any,
            "legalName": legalName as Any,
            "legalCountry": legalCountry as Any,
            "legalState": legalState as Any,
            "legalCity": legalCity as Any,
            "legalAddress": legalAddress as Any,
            "legalTaxId": legalTaxId as Any,
            "authDuration": authDuration as Any,
            "authLimit": authLimit as Any,
            "authSessionsLimit": authSessionsLimit as Any,
            "authPasswordHistory": authPasswordHistory as Any,
            "authPasswordDictionary": authPasswordDictionary as Any,
            "authPersonalDataCheck": authPersonalDataCheck as Any,
            "authDisposableEmails": authDisposableEmails as Any,
            "authCanonicalEmails": authCanonicalEmails as Any,
            "authFreeEmails": authFreeEmails as Any,
            "authMockNumbers": authMockNumbers.map { $0.toMap() } as Any,
            "authSessionAlerts": authSessionAlerts as Any,
            "authMembershipsUserName": authMembershipsUserName as Any,
            "authMembershipsUserEmail": authMembershipsUserEmail as Any,
            "authMembershipsMfa": authMembershipsMfa as Any,
            "authInvalidateSessions": authInvalidateSessions as Any,
            "oAuthProviders": oAuthProviders.map { $0.toMap() } as Any,
            "platforms": platforms as Any,
            "webhooks": webhooks.map { $0.toMap() } as Any,
            "keys": keys.map { $0.toMap() } as Any,
            "devKeys": devKeys.map { $0.toMap() } as Any,
            "smtpEnabled": smtpEnabled as Any,
            "smtpSenderName": smtpSenderName as Any,
            "smtpSenderEmail": smtpSenderEmail as Any,
            "smtpReplyTo": smtpReplyTo as Any,
            "smtpHost": smtpHost as Any,
            "smtpPort": smtpPort as Any,
            "smtpUsername": smtpUsername as Any,
            "smtpPassword": smtpPassword as Any,
            "smtpSecure": smtpSecure as Any,
            "pingCount": pingCount as Any,
            "pingedAt": pingedAt as Any,
            "labels": labels as Any,
            "status": status as Any,
            "authEmailPassword": authEmailPassword as Any,
            "authUsersAuthMagicURL": authUsersAuthMagicURL as Any,
            "authEmailOtp": authEmailOtp as Any,
            "authAnonymous": authAnonymous as Any,
            "authInvites": authInvites as Any,
            "authJWT": authJWT as Any,
            "authPhone": authPhone as Any,
            "serviceStatusForAccount": serviceStatusForAccount as Any,
            "serviceStatusForAvatars": serviceStatusForAvatars as Any,
            "serviceStatusForDatabases": serviceStatusForDatabases as Any,
            "serviceStatusForTablesdb": serviceStatusForTablesdb as Any,
            "serviceStatusForLocale": serviceStatusForLocale as Any,
            "serviceStatusForHealth": serviceStatusForHealth as Any,
            "serviceStatusForProject": serviceStatusForProject as Any,
            "serviceStatusForStorage": serviceStatusForStorage as Any,
            "serviceStatusForTeams": serviceStatusForTeams as Any,
            "serviceStatusForUsers": serviceStatusForUsers as Any,
            "serviceStatusForVcs": serviceStatusForVcs as Any,
            "serviceStatusForSites": serviceStatusForSites as Any,
            "serviceStatusForFunctions": serviceStatusForFunctions as Any,
            "serviceStatusForProxy": serviceStatusForProxy as Any,
            "serviceStatusForGraphql": serviceStatusForGraphql as Any,
            "serviceStatusForMigrations": serviceStatusForMigrations as Any,
            "serviceStatusForMessaging": serviceStatusForMessaging as Any,
            "protocolStatusForRest": protocolStatusForRest as Any,
            "protocolStatusForGraphql": protocolStatusForGraphql as Any,
            "protocolStatusForWebsocket": protocolStatusForWebsocket as Any,
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
            description: map["description"] as! String,
            teamId: map["teamId"] as! String,
            logo: map["logo"] as! String,
            url: map["url"] as! String,
            legalName: map["legalName"] as! String,
            legalCountry: map["legalCountry"] as! String,
            legalState: map["legalState"] as! String,
            legalCity: map["legalCity"] as! String,
            legalAddress: map["legalAddress"] as! String,
            legalTaxId: map["legalTaxId"] as! String,
            authDuration: map["authDuration"] as! Int,
            authLimit: map["authLimit"] as! Int,
            authSessionsLimit: map["authSessionsLimit"] as! Int,
            authPasswordHistory: map["authPasswordHistory"] as! Int,
            authPasswordDictionary: map["authPasswordDictionary"] as! Bool,
            authPersonalDataCheck: map["authPersonalDataCheck"] as! Bool,
            authDisposableEmails: map["authDisposableEmails"] as! Bool,
            authCanonicalEmails: map["authCanonicalEmails"] as! Bool,
            authFreeEmails: map["authFreeEmails"] as! Bool,
            authMockNumbers: (map["authMockNumbers"] as! [[String: Any]]).map { MockNumber.from(map: $0) },
            authSessionAlerts: map["authSessionAlerts"] as! Bool,
            authMembershipsUserName: map["authMembershipsUserName"] as! Bool,
            authMembershipsUserEmail: map["authMembershipsUserEmail"] as! Bool,
            authMembershipsMfa: map["authMembershipsMfa"] as! Bool,
            authInvalidateSessions: map["authInvalidateSessions"] as! Bool,
            oAuthProviders: (map["oAuthProviders"] as! [[String: Any]]).map { AuthProvider.from(map: $0) },
            platforms: (map["platforms"] as! [Any]).map { AnyCodable($0) },
            webhooks: (map["webhooks"] as! [[String: Any]]).map { Webhook.from(map: $0) },
            keys: (map["keys"] as! [[String: Any]]).map { Key.from(map: $0) },
            devKeys: (map["devKeys"] as! [[String: Any]]).map { DevKey.from(map: $0) },
            smtpEnabled: map["smtpEnabled"] as! Bool,
            smtpSenderName: map["smtpSenderName"] as! String,
            smtpSenderEmail: map["smtpSenderEmail"] as! String,
            smtpReplyTo: map["smtpReplyTo"] as! String,
            smtpHost: map["smtpHost"] as! String,
            smtpPort: map["smtpPort"] as! Int,
            smtpUsername: map["smtpUsername"] as! String,
            smtpPassword: map["smtpPassword"] as! String,
            smtpSecure: map["smtpSecure"] as! String,
            pingCount: map["pingCount"] as! Int,
            pingedAt: map["pingedAt"] as! String,
            labels: map["labels"] as! [String],
            status: map["status"] as! String,
            authEmailPassword: map["authEmailPassword"] as! Bool,
            authUsersAuthMagicURL: map["authUsersAuthMagicURL"] as! Bool,
            authEmailOtp: map["authEmailOtp"] as! Bool,
            authAnonymous: map["authAnonymous"] as! Bool,
            authInvites: map["authInvites"] as! Bool,
            authJWT: map["authJWT"] as! Bool,
            authPhone: map["authPhone"] as! Bool,
            serviceStatusForAccount: map["serviceStatusForAccount"] as! Bool,
            serviceStatusForAvatars: map["serviceStatusForAvatars"] as! Bool,
            serviceStatusForDatabases: map["serviceStatusForDatabases"] as! Bool,
            serviceStatusForTablesdb: map["serviceStatusForTablesdb"] as! Bool,
            serviceStatusForLocale: map["serviceStatusForLocale"] as! Bool,
            serviceStatusForHealth: map["serviceStatusForHealth"] as! Bool,
            serviceStatusForProject: map["serviceStatusForProject"] as! Bool,
            serviceStatusForStorage: map["serviceStatusForStorage"] as! Bool,
            serviceStatusForTeams: map["serviceStatusForTeams"] as! Bool,
            serviceStatusForUsers: map["serviceStatusForUsers"] as! Bool,
            serviceStatusForVcs: map["serviceStatusForVcs"] as! Bool,
            serviceStatusForSites: map["serviceStatusForSites"] as! Bool,
            serviceStatusForFunctions: map["serviceStatusForFunctions"] as! Bool,
            serviceStatusForProxy: map["serviceStatusForProxy"] as! Bool,
            serviceStatusForGraphql: map["serviceStatusForGraphql"] as! Bool,
            serviceStatusForMigrations: map["serviceStatusForMigrations"] as! Bool,
            serviceStatusForMessaging: map["serviceStatusForMessaging"] as! Bool,
            protocolStatusForRest: map["protocolStatusForRest"] as! Bool,
            protocolStatusForGraphql: map["protocolStatusForGraphql"] as! Bool,
            protocolStatusForWebsocket: map["protocolStatusForWebsocket"] as! Bool,
            region: map["region"] as! String,
            billingLimits: BillingLimits.from(map: map["billingLimits"] as! [String: Any]),
            blocks: (map["blocks"] as! [[String: Any]]).map { Block.from(map: $0) },
            consoleAccessedAt: map["consoleAccessedAt"] as! String
        )
    }
}
