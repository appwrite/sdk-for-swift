import Foundation
import JSONCodable

/// Migration Report
open class MigrationReport: Codable {

    enum CodingKeys: String, CodingKey {
        case user = "user"
        case team = "team"
        case database = "database"
        case row = "row"
        case file = "file"
        case bucket = "bucket"
        case function = "function"
        case platform = "platform"
        case apiKey = "api-key"
        case projectVariable = "project-variable"
        case webhook = "webhook"
        case authMethods = "auth-methods"
        case projectProtocols = "project-protocols"
        case projectLabels = "project-labels"
        case projectServices = "project-services"
        case policies = "policies"
        case smtp = "smtp"
        case rule = "rule"
        case projectEmailTemplate = "project-email-template"
        case projectEnvironment = "project-environment"
        case site = "site"
        case provider = "provider"
        case topic = "topic"
        case subscriber = "subscriber"
        case message = "message"
        case size = "size"
        case version = "version"
        case oauth2Provider = "oauth2-provider"
        case backupPolicy = "backup-policy"
    }

    /// Number of users to be migrated.
    public let user: Int
    /// Number of teams to be migrated.
    public let team: Int
    /// Number of databases to be migrated.
    public let database: Int
    /// Number of rows to be migrated.
    public let row: Int
    /// Number of files to be migrated.
    public let file: Int
    /// Number of buckets to be migrated.
    public let bucket: Int
    /// Number of functions to be migrated.
    public let function: Int
    /// Number of platforms to be migrated.
    public let platform: Int
    /// Number of API keys to be migrated.
    public let apiKey: Int
    /// Number of project variables to be migrated.
    public let projectVariable: Int
    /// Number of webhooks to be migrated.
    public let webhook: Int
    /// Number of auth-method configs to be migrated (always 0 or 1 — the project-level flag bundle).
    public let authMethods: Int
    /// Number of protocol configs to be migrated (always 0 or 1 — the project-level REST/GraphQL/WebSocket flags).
    public let projectProtocols: Int
    /// Number of label sets to be migrated (always 0 or 1 — the project-level RBAC label array).
    public let projectLabels: Int
    /// Number of service configs to be migrated (always 0 or 1 — the project-level enable/disable flags for all 17 services).
    public let projectServices: Int
    /// Number of policy bundles to be migrated (always 0 or 1 — the project-level security policies covering password rules, session behavior, user limits, and membership privacy).
    public let policies: Int
    /// Number of SMTP configurations to be migrated (always 0 or 1 — the project-level custom SMTP settings; password is not exposed by the source API).
    public let smtp: Int
    /// Number of custom-domain proxy rules to be migrated. Auto-generated `.appwrite.network` rules are skipped — they are recreated by parent Function/Site migration.
    public let rule: Int
    /// Number of custom email templates to be migrated (one per templateId × locale pair).
    public let projectEmailTemplate: Int
    /// Number of project environments to be migrated. Each is recreated under a new ID, empty: its own resources belong to a separate project.
    public let projectEnvironment: Int
    /// Number of sites to be migrated.
    public let site: Int
    /// Number of providers to be migrated.
    public let provider: Int
    /// Number of topics to be migrated.
    public let topic: Int
    /// Number of subscribers to be migrated.
    public let subscriber: Int
    /// Number of messages to be migrated.
    public let message: Int
    /// Size of files to be migrated in mb.
    public let size: Int
    /// Version of the Appwrite instance to be migrated.
    public let version: String
    /// Number of OAuth2 provider configurations to be migrated. Secrets (clientSecret, p8File) are never migrated — destination admin must re-enter them per provider.
    public let oauth2Provider: Int
    /// Number of backup policies to be migrated.
    public let backupPolicy: Int

    init(
        user: Int,
        team: Int,
        database: Int,
        row: Int,
        file: Int,
        bucket: Int,
        function: Int,
        platform: Int,
        apiKey: Int,
        projectVariable: Int,
        webhook: Int,
        authMethods: Int,
        projectProtocols: Int,
        projectLabels: Int,
        projectServices: Int,
        policies: Int,
        smtp: Int,
        rule: Int,
        projectEmailTemplate: Int,
        projectEnvironment: Int,
        site: Int,
        provider: Int,
        topic: Int,
        subscriber: Int,
        message: Int,
        size: Int,
        version: String,
        oauth2Provider: Int,
        backupPolicy: Int
    ) {
        self.user = user
        self.team = team
        self.database = database
        self.row = row
        self.file = file
        self.bucket = bucket
        self.function = function
        self.platform = platform
        self.apiKey = apiKey
        self.projectVariable = projectVariable
        self.webhook = webhook
        self.authMethods = authMethods
        self.projectProtocols = projectProtocols
        self.projectLabels = projectLabels
        self.projectServices = projectServices
        self.policies = policies
        self.smtp = smtp
        self.rule = rule
        self.projectEmailTemplate = projectEmailTemplate
        self.projectEnvironment = projectEnvironment
        self.site = site
        self.provider = provider
        self.topic = topic
        self.subscriber = subscriber
        self.message = message
        self.size = size
        self.version = version
        self.oauth2Provider = oauth2Provider
        self.backupPolicy = backupPolicy
    }

    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        self.user = try container.contains(.user) ? container.decode(Int.self, forKey: .user) : 0
        self.team = try container.contains(.team) ? container.decode(Int.self, forKey: .team) : 0
        self.database = try container.contains(.database) ? container.decode(Int.self, forKey: .database) : 0
        self.row = try container.contains(.row) ? container.decode(Int.self, forKey: .row) : 0
        self.file = try container.contains(.file) ? container.decode(Int.self, forKey: .file) : 0
        self.bucket = try container.contains(.bucket) ? container.decode(Int.self, forKey: .bucket) : 0
        self.function = try container.contains(.function) ? container.decode(Int.self, forKey: .function) : 0
        self.platform = try container.contains(.platform) ? container.decode(Int.self, forKey: .platform) : 0
        self.apiKey = try container.contains(.apiKey) ? container.decode(Int.self, forKey: .apiKey) : 0
        self.projectVariable = try container.contains(.projectVariable) ? container.decode(Int.self, forKey: .projectVariable) : 0
        self.webhook = try container.contains(.webhook) ? container.decode(Int.self, forKey: .webhook) : 0
        self.authMethods = try container.contains(.authMethods) ? container.decode(Int.self, forKey: .authMethods) : 0
        self.projectProtocols = try container.contains(.projectProtocols) ? container.decode(Int.self, forKey: .projectProtocols) : 0
        self.projectLabels = try container.contains(.projectLabels) ? container.decode(Int.self, forKey: .projectLabels) : 0
        self.projectServices = try container.contains(.projectServices) ? container.decode(Int.self, forKey: .projectServices) : 0
        self.policies = try container.contains(.policies) ? container.decode(Int.self, forKey: .policies) : 0
        self.smtp = try container.contains(.smtp) ? container.decode(Int.self, forKey: .smtp) : 0
        self.rule = try container.contains(.rule) ? container.decode(Int.self, forKey: .rule) : 0
        self.projectEmailTemplate = try container.contains(.projectEmailTemplate) ? container.decode(Int.self, forKey: .projectEmailTemplate) : 0
        self.projectEnvironment = try container.contains(.projectEnvironment) ? container.decode(Int.self, forKey: .projectEnvironment) : 0
        self.site = try container.contains(.site) ? container.decode(Int.self, forKey: .site) : 0
        self.provider = try container.contains(.provider) ? container.decode(Int.self, forKey: .provider) : 0
        self.topic = try container.contains(.topic) ? container.decode(Int.self, forKey: .topic) : 0
        self.subscriber = try container.contains(.subscriber) ? container.decode(Int.self, forKey: .subscriber) : 0
        self.message = try container.contains(.message) ? container.decode(Int.self, forKey: .message) : 0
        self.size = try container.contains(.size) ? container.decode(Int.self, forKey: .size) : 0
        self.version = try container.contains(.version) ? container.decode(String.self, forKey: .version) : ""
        self.oauth2Provider = try container.contains(.oauth2Provider) ? container.decode(Int.self, forKey: .oauth2Provider) : 0
        self.backupPolicy = try container.contains(.backupPolicy) ? container.decode(Int.self, forKey: .backupPolicy) : 0
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encode(user, forKey: .user)
        try container.encode(team, forKey: .team)
        try container.encode(database, forKey: .database)
        try container.encode(row, forKey: .row)
        try container.encode(file, forKey: .file)
        try container.encode(bucket, forKey: .bucket)
        try container.encode(function, forKey: .function)
        try container.encode(platform, forKey: .platform)
        try container.encode(apiKey, forKey: .apiKey)
        try container.encode(projectVariable, forKey: .projectVariable)
        try container.encode(webhook, forKey: .webhook)
        try container.encode(authMethods, forKey: .authMethods)
        try container.encode(projectProtocols, forKey: .projectProtocols)
        try container.encode(projectLabels, forKey: .projectLabels)
        try container.encode(projectServices, forKey: .projectServices)
        try container.encode(policies, forKey: .policies)
        try container.encode(smtp, forKey: .smtp)
        try container.encode(rule, forKey: .rule)
        try container.encode(projectEmailTemplate, forKey: .projectEmailTemplate)
        try container.encode(projectEnvironment, forKey: .projectEnvironment)
        try container.encode(site, forKey: .site)
        try container.encode(provider, forKey: .provider)
        try container.encode(topic, forKey: .topic)
        try container.encode(subscriber, forKey: .subscriber)
        try container.encode(message, forKey: .message)
        try container.encode(size, forKey: .size)
        try container.encode(version, forKey: .version)
        try container.encode(oauth2Provider, forKey: .oauth2Provider)
        try container.encode(backupPolicy, forKey: .backupPolicy)
    }

    public func toMap() -> [String: Any] {
        return [
            "user": user as Any,
            "team": team as Any,
            "database": database as Any,
            "row": row as Any,
            "file": file as Any,
            "bucket": bucket as Any,
            "function": function as Any,
            "platform": platform as Any,
            "api-key": apiKey as Any,
            "project-variable": projectVariable as Any,
            "webhook": webhook as Any,
            "auth-methods": authMethods as Any,
            "project-protocols": projectProtocols as Any,
            "project-labels": projectLabels as Any,
            "project-services": projectServices as Any,
            "policies": policies as Any,
            "smtp": smtp as Any,
            "rule": rule as Any,
            "project-email-template": projectEmailTemplate as Any,
            "project-environment": projectEnvironment as Any,
            "site": site as Any,
            "provider": provider as Any,
            "topic": topic as Any,
            "subscriber": subscriber as Any,
            "message": message as Any,
            "size": size as Any,
            "version": version as Any,
            "oauth2-provider": oauth2Provider as Any,
            "backup-policy": backupPolicy as Any,
        ]
    }

    public static func from(map: [String: Any]) -> MigrationReport {
        let defaults: [String: Any] = [
            "user": 0,
            "team": 0,
            "database": 0,
            "row": 0,
            "file": 0,
            "bucket": 0,
            "function": 0,
            "platform": 0,
            "api-key": 0,
            "project-variable": 0,
            "webhook": 0,
            "auth-methods": 0,
            "project-protocols": 0,
            "project-labels": 0,
            "project-services": 0,
            "policies": 0,
            "smtp": 0,
            "rule": 0,
            "project-email-template": 0,
            "project-environment": 0,
            "site": 0,
            "provider": 0,
            "topic": 0,
            "subscriber": 0,
            "message": 0,
            "size": 0,
            "version": "",
            "oauth2-provider": 0,
            "backup-policy": 0,
        ]
        let map = defaults.merging(map) { _, new in new }

        return MigrationReport(
            user: map["user"] as! Int,
            team: map["team"] as! Int,
            database: map["database"] as! Int,
            row: map["row"] as! Int,
            file: map["file"] as! Int,
            bucket: map["bucket"] as! Int,
            function: map["function"] as! Int,
            platform: map["platform"] as! Int,
            apiKey: map["api-key"] as! Int,
            projectVariable: map["project-variable"] as! Int,
            webhook: map["webhook"] as! Int,
            authMethods: map["auth-methods"] as! Int,
            projectProtocols: map["project-protocols"] as! Int,
            projectLabels: map["project-labels"] as! Int,
            projectServices: map["project-services"] as! Int,
            policies: map["policies"] as! Int,
            smtp: map["smtp"] as! Int,
            rule: map["rule"] as! Int,
            projectEmailTemplate: map["project-email-template"] as! Int,
            projectEnvironment: map["project-environment"] as! Int,
            site: map["site"] as! Int,
            provider: map["provider"] as! Int,
            topic: map["topic"] as! Int,
            subscriber: map["subscriber"] as! Int,
            message: map["message"] as! Int,
            size: map["size"] as! Int,
            version: map["version"] as! String,
            oauth2Provider: map["oauth2-provider"] as! Int,
            backupPolicy: map["backup-policy"] as! Int
        )
    }
}
