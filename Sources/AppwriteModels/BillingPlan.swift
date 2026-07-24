import Foundation
import JSONCodable
import AppwriteEnums

/// billingPlan
open class BillingPlan: Codable {

    enum CodingKeys: String, CodingKey {
        case id = "$id"
        case name = "name"
        case desc = "desc"
        case order = "order"
        case price = "price"
        case trial = "trial"
        case bandwidth = "bandwidth"
        case storage = "storage"
        case imageTransformations = "imageTransformations"
        case screenshotsGenerated = "screenshotsGenerated"
        case members = "members"
        case webhooks = "webhooks"
        case wafRules = "wafRules"
        case projects = "projects"
        case platforms = "platforms"
        case users = "users"
        case teams = "teams"
        case databases = "databases"
        case databasesReads = "databasesReads"
        case databasesWrites = "databasesWrites"
        case databasesBatchSize = "databasesBatchSize"
        case buckets = "buckets"
        case fileSize = "fileSize"
        case functions = "functions"
        case sites = "sites"
        case executions = "executions"
        case executionsRetentionCount = "executionsRetentionCount"
        case GBHours = "GBHours"
        case realtime = "realtime"
        case realtimeMessages = "realtimeMessages"
        case messages = "messages"
        case topics = "topics"
        case authPhone = "authPhone"
        case domains = "domains"
        case activityLogs = "activityLogs"
        case usageLogs = "usageLogs"
        case usageLogsIntervals = "usageLogsIntervals"
        case projectInactivityDays = "projectInactivityDays"
        case alertLimit = "alertLimit"
        case usage = "usage"
        case addons = "addons"
        case budgetCapEnabled = "budgetCapEnabled"
        case customSmtp = "customSmtp"
        case emailBranding = "emailBranding"
        case requiresPaymentMethod = "requiresPaymentMethod"
        case requiresBillingAddress = "requiresBillingAddress"
        case isAvailable = "isAvailable"
        case selfService = "selfService"
        case premiumSupport = "premiumSupport"
        case budgeting = "budgeting"
        case supportsMockNumbers = "supportsMockNumbers"
        case supportsOrganizationRoles = "supportsOrganizationRoles"
        case supportsCredits = "supportsCredits"
        case supportsDisposableEmailValidation = "supportsDisposableEmailValidation"
        case supportsCanonicalEmailValidation = "supportsCanonicalEmailValidation"
        case supportsFreeEmailValidation = "supportsFreeEmailValidation"
        case supportsCorporateEmailValidation = "supportsCorporateEmailValidation"
        case supportsProjectSpecificRoles = "supportsProjectSpecificRoles"
        case backupsEnabled = "backupsEnabled"
        case usagePerProject = "usagePerProject"
        case supportedAddons = "supportedAddons"
        case backupPolicies = "backupPolicies"
        case deploymentSize = "deploymentSize"
        case buildSize = "buildSize"
        case databasesAllowEncrypt = "databasesAllowEncrypt"
        case limits = "limits"
        case group = "group"
        case program = "program"
        case dedicatedDatabases = "dedicatedDatabases"
    }

    /// Plan ID.
    public let id: String
    /// Plan name
    public let name: String
    /// Plan description
    public let desc: String
    /// Plan order
    public let order: Int
    /// Price
    public let price: Double
    /// Trial days
    public let trial: Int
    /// Bandwidth
    public let bandwidth: Int
    /// Storage
    public let storage: Int
    /// Image Transformations
    public let imageTransformations: Int
    /// Screenshots generated
    public let screenshotsGenerated: Int
    /// Members
    public let members: Int
    /// Webhooks
    public let webhooks: Int
    /// Maximum WAF rules per project
    public let wafRules: Int
    /// Projects
    public let projects: Int
    /// Platforms
    public let platforms: Int
    /// Users
    public let users: Int
    /// Teams
    public let teams: Int
    /// Databases
    public let databases: Int
    /// Database reads per month
    public let databasesReads: Int
    /// Database writes per month
    public let databasesWrites: Int
    /// Database batch size limit
    public let databasesBatchSize: Int
    /// Buckets
    public let buckets: Int
    /// File size
    public let fileSize: Int
    /// Functions
    public let functions: Int
    /// Sites
    public let sites: Int
    /// Function executions
    public let executions: Int
    /// Rolling max executions retained per function/site
    public let executionsRetentionCount: Int
    /// GB hours for functions
    public let GBHours: Int
    /// Realtime connections
    public let realtime: Int
    /// Realtime messages
    public let realtimeMessages: Int
    /// Messages per month
    public let messages: Int
    /// Topics for messaging
    public let topics: Int
    /// SMS authentications per month
    public let authPhone: Int
    /// Custom domains
    public let domains: Int
    /// Activity log days
    public let activityLogs: Int
    /// Usage history days
    public let usageLogs: Int
    /// Usage log time intervals allowed for this plan (e.g. 15m, 1h, 1d).
    public let usageLogsIntervals: [String]?
    /// Number of days of console inactivity before a project is paused. 0 means pausing is disabled.
    public let projectInactivityDays: Int
    /// Alert threshold percentage
    public let alertLimit: Int
    /// Additional resources
    public let usage: UsageBillingPlan
    /// Addons
    public let addons: BillingPlanAddon
    /// Budget cap enabled or disabled.
    public let budgetCapEnabled: Bool
    /// Custom SMTP
    public let customSmtp: Bool
    /// Appwrite branding in email
    public let emailBranding: Bool
    /// Does plan require payment method
    public let requiresPaymentMethod: Bool
    /// Does plan require billing address
    public let requiresBillingAddress: Bool
    /// Is the billing plan available
    public let isAvailable: Bool
    /// Can user change the plan themselves
    public let selfService: Bool
    /// Does plan enable premium support
    public let premiumSupport: Bool
    /// Does plan support budget cap
    public let budgeting: Bool
    /// Does plan support mock numbers
    public let supportsMockNumbers: Bool
    /// Does plan support organization roles
    public let supportsOrganizationRoles: Bool
    /// Does plan support credit
    public let supportsCredits: Bool
    /// Does plan support blocking disposable email addresses.
    public let supportsDisposableEmailValidation: Bool
    /// Does plan support requiring canonical email addresses.
    public let supportsCanonicalEmailValidation: Bool
    /// Does plan support blocking free email addresses.
    public let supportsFreeEmailValidation: Bool
    /// Does plan support restricting sign-ups to corporate email addresses only.
    public let supportsCorporateEmailValidation: Bool
    /// Does plan support project-specific member roles.
    public let supportsProjectSpecificRoles: Bool
    /// Does plan support backup policies.
    public let backupsEnabled: Bool
    /// Whether usage addons are calculated per project.
    public let usagePerProject: Bool
    /// Supported addons for this plan
    public let supportedAddons: BillingPlanSupportedAddons
    /// How many policies does plan support
    public let backupPolicies: Int
    /// Maximum function and site deployment size in MB
    public let deploymentSize: Int
    /// Maximum function and site deployment size in MB
    public let buildSize: Int
    /// Does the plan support encrypted string attributes or not.
    public let databasesAllowEncrypt: Bool
    /// Plan specific limits
    public let limits: BillingPlanLimits?
    /// Group of this billing plan for variants
    public let group: AppwriteEnums.BillingPlanGroup
    /// Details of the program this plan is a part of.
    public let program: Program?
    /// Dedicated database limits available to this plan.
    public let dedicatedDatabases: BillingPlanDedicatedDatabaseLimits?

    init(
        id: String,
        name: String,
        desc: String,
        order: Int,
        price: Double,
        trial: Int,
        bandwidth: Int,
        storage: Int,
        imageTransformations: Int,
        screenshotsGenerated: Int,
        members: Int,
        webhooks: Int,
        wafRules: Int,
        projects: Int,
        platforms: Int,
        users: Int,
        teams: Int,
        databases: Int,
        databasesReads: Int,
        databasesWrites: Int,
        databasesBatchSize: Int,
        buckets: Int,
        fileSize: Int,
        functions: Int,
        sites: Int,
        executions: Int,
        executionsRetentionCount: Int,
        GBHours: Int,
        realtime: Int,
        realtimeMessages: Int,
        messages: Int,
        topics: Int,
        authPhone: Int,
        domains: Int,
        activityLogs: Int,
        usageLogs: Int,
        usageLogsIntervals: [String]?,
        projectInactivityDays: Int,
        alertLimit: Int,
        usage: UsageBillingPlan,
        addons: BillingPlanAddon,
        budgetCapEnabled: Bool,
        customSmtp: Bool,
        emailBranding: Bool,
        requiresPaymentMethod: Bool,
        requiresBillingAddress: Bool,
        isAvailable: Bool,
        selfService: Bool,
        premiumSupport: Bool,
        budgeting: Bool,
        supportsMockNumbers: Bool,
        supportsOrganizationRoles: Bool,
        supportsCredits: Bool,
        supportsDisposableEmailValidation: Bool,
        supportsCanonicalEmailValidation: Bool,
        supportsFreeEmailValidation: Bool,
        supportsCorporateEmailValidation: Bool,
        supportsProjectSpecificRoles: Bool,
        backupsEnabled: Bool,
        usagePerProject: Bool,
        supportedAddons: BillingPlanSupportedAddons,
        backupPolicies: Int,
        deploymentSize: Int,
        buildSize: Int,
        databasesAllowEncrypt: Bool,
        limits: BillingPlanLimits?,
        group: AppwriteEnums.BillingPlanGroup,
        program: Program?,
        dedicatedDatabases: BillingPlanDedicatedDatabaseLimits?
    ) {
        self.id = id
        self.name = name
        self.desc = desc
        self.order = order
        self.price = price
        self.trial = trial
        self.bandwidth = bandwidth
        self.storage = storage
        self.imageTransformations = imageTransformations
        self.screenshotsGenerated = screenshotsGenerated
        self.members = members
        self.webhooks = webhooks
        self.wafRules = wafRules
        self.projects = projects
        self.platforms = platforms
        self.users = users
        self.teams = teams
        self.databases = databases
        self.databasesReads = databasesReads
        self.databasesWrites = databasesWrites
        self.databasesBatchSize = databasesBatchSize
        self.buckets = buckets
        self.fileSize = fileSize
        self.functions = functions
        self.sites = sites
        self.executions = executions
        self.executionsRetentionCount = executionsRetentionCount
        self.GBHours = GBHours
        self.realtime = realtime
        self.realtimeMessages = realtimeMessages
        self.messages = messages
        self.topics = topics
        self.authPhone = authPhone
        self.domains = domains
        self.activityLogs = activityLogs
        self.usageLogs = usageLogs
        self.usageLogsIntervals = usageLogsIntervals
        self.projectInactivityDays = projectInactivityDays
        self.alertLimit = alertLimit
        self.usage = usage
        self.addons = addons
        self.budgetCapEnabled = budgetCapEnabled
        self.customSmtp = customSmtp
        self.emailBranding = emailBranding
        self.requiresPaymentMethod = requiresPaymentMethod
        self.requiresBillingAddress = requiresBillingAddress
        self.isAvailable = isAvailable
        self.selfService = selfService
        self.premiumSupport = premiumSupport
        self.budgeting = budgeting
        self.supportsMockNumbers = supportsMockNumbers
        self.supportsOrganizationRoles = supportsOrganizationRoles
        self.supportsCredits = supportsCredits
        self.supportsDisposableEmailValidation = supportsDisposableEmailValidation
        self.supportsCanonicalEmailValidation = supportsCanonicalEmailValidation
        self.supportsFreeEmailValidation = supportsFreeEmailValidation
        self.supportsCorporateEmailValidation = supportsCorporateEmailValidation
        self.supportsProjectSpecificRoles = supportsProjectSpecificRoles
        self.backupsEnabled = backupsEnabled
        self.usagePerProject = usagePerProject
        self.supportedAddons = supportedAddons
        self.backupPolicies = backupPolicies
        self.deploymentSize = deploymentSize
        self.buildSize = buildSize
        self.databasesAllowEncrypt = databasesAllowEncrypt
        self.limits = limits
        self.group = group
        self.program = program
        self.dedicatedDatabases = dedicatedDatabases
    }

    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        self.id = try container.decode(String.self, forKey: .id)
        self.name = try container.decode(String.self, forKey: .name)
        self.desc = try container.decode(String.self, forKey: .desc)
        self.order = try container.decode(Int.self, forKey: .order)
        self.price = try container.decode(Double.self, forKey: .price)
        self.trial = try container.decode(Int.self, forKey: .trial)
        self.bandwidth = try container.decode(Int.self, forKey: .bandwidth)
        self.storage = try container.decode(Int.self, forKey: .storage)
        self.imageTransformations = try container.decode(Int.self, forKey: .imageTransformations)
        self.screenshotsGenerated = try container.decode(Int.self, forKey: .screenshotsGenerated)
        self.members = try container.decode(Int.self, forKey: .members)
        self.webhooks = try container.decode(Int.self, forKey: .webhooks)
        self.wafRules = try container.decode(Int.self, forKey: .wafRules)
        self.projects = try container.decode(Int.self, forKey: .projects)
        self.platforms = try container.decode(Int.self, forKey: .platforms)
        self.users = try container.decode(Int.self, forKey: .users)
        self.teams = try container.decode(Int.self, forKey: .teams)
        self.databases = try container.decode(Int.self, forKey: .databases)
        self.databasesReads = try container.decode(Int.self, forKey: .databasesReads)
        self.databasesWrites = try container.decode(Int.self, forKey: .databasesWrites)
        self.databasesBatchSize = try container.decode(Int.self, forKey: .databasesBatchSize)
        self.buckets = try container.decode(Int.self, forKey: .buckets)
        self.fileSize = try container.decode(Int.self, forKey: .fileSize)
        self.functions = try container.decode(Int.self, forKey: .functions)
        self.sites = try container.decode(Int.self, forKey: .sites)
        self.executions = try container.decode(Int.self, forKey: .executions)
        self.executionsRetentionCount = try container.decode(Int.self, forKey: .executionsRetentionCount)
        self.GBHours = try container.decode(Int.self, forKey: .GBHours)
        self.realtime = try container.decode(Int.self, forKey: .realtime)
        self.realtimeMessages = try container.decode(Int.self, forKey: .realtimeMessages)
        self.messages = try container.decode(Int.self, forKey: .messages)
        self.topics = try container.decode(Int.self, forKey: .topics)
        self.authPhone = try container.decode(Int.self, forKey: .authPhone)
        self.domains = try container.decode(Int.self, forKey: .domains)
        self.activityLogs = try container.decode(Int.self, forKey: .activityLogs)
        self.usageLogs = try container.decode(Int.self, forKey: .usageLogs)
        self.usageLogsIntervals = try container.decodeIfPresent([String].self, forKey: .usageLogsIntervals)
        self.projectInactivityDays = try container.decode(Int.self, forKey: .projectInactivityDays)
        self.alertLimit = try container.decode(Int.self, forKey: .alertLimit)
        self.usage = try container.decode(UsageBillingPlan.self, forKey: .usage)
        self.addons = try container.decode(BillingPlanAddon.self, forKey: .addons)
        self.budgetCapEnabled = try container.decode(Bool.self, forKey: .budgetCapEnabled)
        self.customSmtp = try container.decode(Bool.self, forKey: .customSmtp)
        self.emailBranding = try container.decode(Bool.self, forKey: .emailBranding)
        self.requiresPaymentMethod = try container.decode(Bool.self, forKey: .requiresPaymentMethod)
        self.requiresBillingAddress = try container.decode(Bool.self, forKey: .requiresBillingAddress)
        self.isAvailable = try container.decode(Bool.self, forKey: .isAvailable)
        self.selfService = try container.decode(Bool.self, forKey: .selfService)
        self.premiumSupport = try container.decode(Bool.self, forKey: .premiumSupport)
        self.budgeting = try container.decode(Bool.self, forKey: .budgeting)
        self.supportsMockNumbers = try container.decode(Bool.self, forKey: .supportsMockNumbers)
        self.supportsOrganizationRoles = try container.decode(Bool.self, forKey: .supportsOrganizationRoles)
        self.supportsCredits = try container.decode(Bool.self, forKey: .supportsCredits)
        self.supportsDisposableEmailValidation = try container.decode(Bool.self, forKey: .supportsDisposableEmailValidation)
        self.supportsCanonicalEmailValidation = try container.decode(Bool.self, forKey: .supportsCanonicalEmailValidation)
        self.supportsFreeEmailValidation = try container.decode(Bool.self, forKey: .supportsFreeEmailValidation)
        self.supportsCorporateEmailValidation = try container.decode(Bool.self, forKey: .supportsCorporateEmailValidation)
        self.supportsProjectSpecificRoles = try container.decode(Bool.self, forKey: .supportsProjectSpecificRoles)
        self.backupsEnabled = try container.decode(Bool.self, forKey: .backupsEnabled)
        self.usagePerProject = try container.decode(Bool.self, forKey: .usagePerProject)
        self.supportedAddons = try container.decode(BillingPlanSupportedAddons.self, forKey: .supportedAddons)
        self.backupPolicies = try container.decode(Int.self, forKey: .backupPolicies)
        self.deploymentSize = try container.decode(Int.self, forKey: .deploymentSize)
        self.buildSize = try container.decode(Int.self, forKey: .buildSize)
        self.databasesAllowEncrypt = try container.decode(Bool.self, forKey: .databasesAllowEncrypt)
        self.limits = try container.decodeIfPresent(BillingPlanLimits.self, forKey: .limits)
        self.group = AppwriteEnums.BillingPlanGroup(rawValue: try container.decode(String.self, forKey: .group))!
        self.program = try container.decodeIfPresent(Program.self, forKey: .program)
        self.dedicatedDatabases = try container.decodeIfPresent(BillingPlanDedicatedDatabaseLimits.self, forKey: .dedicatedDatabases)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encode(id, forKey: .id)
        try container.encode(name, forKey: .name)
        try container.encode(desc, forKey: .desc)
        try container.encode(order, forKey: .order)
        try container.encode(price, forKey: .price)
        try container.encode(trial, forKey: .trial)
        try container.encode(bandwidth, forKey: .bandwidth)
        try container.encode(storage, forKey: .storage)
        try container.encode(imageTransformations, forKey: .imageTransformations)
        try container.encode(screenshotsGenerated, forKey: .screenshotsGenerated)
        try container.encode(members, forKey: .members)
        try container.encode(webhooks, forKey: .webhooks)
        try container.encode(wafRules, forKey: .wafRules)
        try container.encode(projects, forKey: .projects)
        try container.encode(platforms, forKey: .platforms)
        try container.encode(users, forKey: .users)
        try container.encode(teams, forKey: .teams)
        try container.encode(databases, forKey: .databases)
        try container.encode(databasesReads, forKey: .databasesReads)
        try container.encode(databasesWrites, forKey: .databasesWrites)
        try container.encode(databasesBatchSize, forKey: .databasesBatchSize)
        try container.encode(buckets, forKey: .buckets)
        try container.encode(fileSize, forKey: .fileSize)
        try container.encode(functions, forKey: .functions)
        try container.encode(sites, forKey: .sites)
        try container.encode(executions, forKey: .executions)
        try container.encode(executionsRetentionCount, forKey: .executionsRetentionCount)
        try container.encode(GBHours, forKey: .GBHours)
        try container.encode(realtime, forKey: .realtime)
        try container.encode(realtimeMessages, forKey: .realtimeMessages)
        try container.encode(messages, forKey: .messages)
        try container.encode(topics, forKey: .topics)
        try container.encode(authPhone, forKey: .authPhone)
        try container.encode(domains, forKey: .domains)
        try container.encode(activityLogs, forKey: .activityLogs)
        try container.encode(usageLogs, forKey: .usageLogs)
        try container.encodeIfPresent(usageLogsIntervals, forKey: .usageLogsIntervals)
        try container.encode(projectInactivityDays, forKey: .projectInactivityDays)
        try container.encode(alertLimit, forKey: .alertLimit)
        try container.encode(usage, forKey: .usage)
        try container.encode(addons, forKey: .addons)
        try container.encode(budgetCapEnabled, forKey: .budgetCapEnabled)
        try container.encode(customSmtp, forKey: .customSmtp)
        try container.encode(emailBranding, forKey: .emailBranding)
        try container.encode(requiresPaymentMethod, forKey: .requiresPaymentMethod)
        try container.encode(requiresBillingAddress, forKey: .requiresBillingAddress)
        try container.encode(isAvailable, forKey: .isAvailable)
        try container.encode(selfService, forKey: .selfService)
        try container.encode(premiumSupport, forKey: .premiumSupport)
        try container.encode(budgeting, forKey: .budgeting)
        try container.encode(supportsMockNumbers, forKey: .supportsMockNumbers)
        try container.encode(supportsOrganizationRoles, forKey: .supportsOrganizationRoles)
        try container.encode(supportsCredits, forKey: .supportsCredits)
        try container.encode(supportsDisposableEmailValidation, forKey: .supportsDisposableEmailValidation)
        try container.encode(supportsCanonicalEmailValidation, forKey: .supportsCanonicalEmailValidation)
        try container.encode(supportsFreeEmailValidation, forKey: .supportsFreeEmailValidation)
        try container.encode(supportsCorporateEmailValidation, forKey: .supportsCorporateEmailValidation)
        try container.encode(supportsProjectSpecificRoles, forKey: .supportsProjectSpecificRoles)
        try container.encode(backupsEnabled, forKey: .backupsEnabled)
        try container.encode(usagePerProject, forKey: .usagePerProject)
        try container.encode(supportedAddons, forKey: .supportedAddons)
        try container.encode(backupPolicies, forKey: .backupPolicies)
        try container.encode(deploymentSize, forKey: .deploymentSize)
        try container.encode(buildSize, forKey: .buildSize)
        try container.encode(databasesAllowEncrypt, forKey: .databasesAllowEncrypt)
        try container.encodeIfPresent(limits, forKey: .limits)
        try container.encode(group.rawValue, forKey: .group)
        try container.encodeIfPresent(program, forKey: .program)
        try container.encodeIfPresent(dedicatedDatabases, forKey: .dedicatedDatabases)
    }

    public func toMap() -> [String: Any] {
        return [
            "$id": id as Any,
            "name": name as Any,
            "desc": desc as Any,
            "order": order as Any,
            "price": price as Any,
            "trial": trial as Any,
            "bandwidth": bandwidth as Any,
            "storage": storage as Any,
            "imageTransformations": imageTransformations as Any,
            "screenshotsGenerated": screenshotsGenerated as Any,
            "members": members as Any,
            "webhooks": webhooks as Any,
            "wafRules": wafRules as Any,
            "projects": projects as Any,
            "platforms": platforms as Any,
            "users": users as Any,
            "teams": teams as Any,
            "databases": databases as Any,
            "databasesReads": databasesReads as Any,
            "databasesWrites": databasesWrites as Any,
            "databasesBatchSize": databasesBatchSize as Any,
            "buckets": buckets as Any,
            "fileSize": fileSize as Any,
            "functions": functions as Any,
            "sites": sites as Any,
            "executions": executions as Any,
            "executionsRetentionCount": executionsRetentionCount as Any,
            "GBHours": GBHours as Any,
            "realtime": realtime as Any,
            "realtimeMessages": realtimeMessages as Any,
            "messages": messages as Any,
            "topics": topics as Any,
            "authPhone": authPhone as Any,
            "domains": domains as Any,
            "activityLogs": activityLogs as Any,
            "usageLogs": usageLogs as Any,
            "usageLogsIntervals": usageLogsIntervals as Any,
            "projectInactivityDays": projectInactivityDays as Any,
            "alertLimit": alertLimit as Any,
            "usage": usage.toMap() as Any,
            "addons": addons.toMap() as Any,
            "budgetCapEnabled": budgetCapEnabled as Any,
            "customSmtp": customSmtp as Any,
            "emailBranding": emailBranding as Any,
            "requiresPaymentMethod": requiresPaymentMethod as Any,
            "requiresBillingAddress": requiresBillingAddress as Any,
            "isAvailable": isAvailable as Any,
            "selfService": selfService as Any,
            "premiumSupport": premiumSupport as Any,
            "budgeting": budgeting as Any,
            "supportsMockNumbers": supportsMockNumbers as Any,
            "supportsOrganizationRoles": supportsOrganizationRoles as Any,
            "supportsCredits": supportsCredits as Any,
            "supportsDisposableEmailValidation": supportsDisposableEmailValidation as Any,
            "supportsCanonicalEmailValidation": supportsCanonicalEmailValidation as Any,
            "supportsFreeEmailValidation": supportsFreeEmailValidation as Any,
            "supportsCorporateEmailValidation": supportsCorporateEmailValidation as Any,
            "supportsProjectSpecificRoles": supportsProjectSpecificRoles as Any,
            "backupsEnabled": backupsEnabled as Any,
            "usagePerProject": usagePerProject as Any,
            "supportedAddons": supportedAddons.toMap() as Any,
            "backupPolicies": backupPolicies as Any,
            "deploymentSize": deploymentSize as Any,
            "buildSize": buildSize as Any,
            "databasesAllowEncrypt": databasesAllowEncrypt as Any,
            "limits": limits?.toMap() as Any,
            "group": group.rawValue as Any,
            "program": program?.toMap() as Any,
            "dedicatedDatabases": dedicatedDatabases?.toMap() as Any
        ]
    }

    public static func from(map: [String: Any] ) -> BillingPlan {
        return BillingPlan(
            id: map["$id"] as! String,
            name: map["name"] as! String,
            desc: map["desc"] as! String,
            order: map["order"] as! Int,
            price: map["price"] as! Double,
            trial: map["trial"] as! Int,
            bandwidth: map["bandwidth"] as! Int,
            storage: map["storage"] as! Int,
            imageTransformations: map["imageTransformations"] as! Int,
            screenshotsGenerated: map["screenshotsGenerated"] as! Int,
            members: map["members"] as! Int,
            webhooks: map["webhooks"] as! Int,
            wafRules: map["wafRules"] as! Int,
            projects: map["projects"] as! Int,
            platforms: map["platforms"] as! Int,
            users: map["users"] as! Int,
            teams: map["teams"] as! Int,
            databases: map["databases"] as! Int,
            databasesReads: map["databasesReads"] as! Int,
            databasesWrites: map["databasesWrites"] as! Int,
            databasesBatchSize: map["databasesBatchSize"] as! Int,
            buckets: map["buckets"] as! Int,
            fileSize: map["fileSize"] as! Int,
            functions: map["functions"] as! Int,
            sites: map["sites"] as! Int,
            executions: map["executions"] as! Int,
            executionsRetentionCount: map["executionsRetentionCount"] as! Int,
            GBHours: map["GBHours"] as! Int,
            realtime: map["realtime"] as! Int,
            realtimeMessages: map["realtimeMessages"] as! Int,
            messages: map["messages"] as! Int,
            topics: map["topics"] as! Int,
            authPhone: map["authPhone"] as! Int,
            domains: map["domains"] as! Int,
            activityLogs: map["activityLogs"] as! Int,
            usageLogs: map["usageLogs"] as! Int,
            usageLogsIntervals: map["usageLogsIntervals"] as? [String],
            projectInactivityDays: map["projectInactivityDays"] as! Int,
            alertLimit: map["alertLimit"] as! Int,
            usage: UsageBillingPlan.from(map: map["usage"] as! [String: Any]),
            addons: BillingPlanAddon.from(map: map["addons"] as! [String: Any]),
            budgetCapEnabled: map["budgetCapEnabled"] as! Bool,
            customSmtp: map["customSmtp"] as! Bool,
            emailBranding: map["emailBranding"] as! Bool,
            requiresPaymentMethod: map["requiresPaymentMethod"] as! Bool,
            requiresBillingAddress: map["requiresBillingAddress"] as! Bool,
            isAvailable: map["isAvailable"] as! Bool,
            selfService: map["selfService"] as! Bool,
            premiumSupport: map["premiumSupport"] as! Bool,
            budgeting: map["budgeting"] as! Bool,
            supportsMockNumbers: map["supportsMockNumbers"] as! Bool,
            supportsOrganizationRoles: map["supportsOrganizationRoles"] as! Bool,
            supportsCredits: map["supportsCredits"] as! Bool,
            supportsDisposableEmailValidation: map["supportsDisposableEmailValidation"] as! Bool,
            supportsCanonicalEmailValidation: map["supportsCanonicalEmailValidation"] as! Bool,
            supportsFreeEmailValidation: map["supportsFreeEmailValidation"] as! Bool,
            supportsCorporateEmailValidation: map["supportsCorporateEmailValidation"] as! Bool,
            supportsProjectSpecificRoles: map["supportsProjectSpecificRoles"] as! Bool,
            backupsEnabled: map["backupsEnabled"] as! Bool,
            usagePerProject: map["usagePerProject"] as! Bool,
            supportedAddons: BillingPlanSupportedAddons.from(map: map["supportedAddons"] as! [String: Any]),
            backupPolicies: map["backupPolicies"] as! Int,
            deploymentSize: map["deploymentSize"] as! Int,
            buildSize: map["buildSize"] as! Int,
            databasesAllowEncrypt: map["databasesAllowEncrypt"] as! Bool,
            limits: map["limits"] as? [String: Any] != nil ? BillingPlanLimits.from(map: map["limits"] as! [String: Any]) : nil,
            group: AppwriteEnums.BillingPlanGroup(rawValue: map["group"] as! String)!,
            program: map["program"] as? [String: Any] != nil ? Program.from(map: map["program"] as! [String: Any]) : nil,
            dedicatedDatabases: map["dedicatedDatabases"] as? [String: Any] != nil ? BillingPlanDedicatedDatabaseLimits.from(map: map["dedicatedDatabases"] as! [String: Any]) : nil
        )
    }
}
