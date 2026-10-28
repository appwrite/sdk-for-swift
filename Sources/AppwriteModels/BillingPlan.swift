import AppwriteEnums
import Foundation
import JSONCodable

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
        case environments = "environments"
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
        case deploymentRetention = "deploymentRetention"
        case deploymentRetentionMax = "deploymentRetentionMax"
        case deploymentsRetentionCount = "deploymentsRetentionCount"
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
        case usageAggregateOnlyMetrics = "usageAggregateOnlyMetrics"
        case projectInactivityDays = "projectInactivityDays"
        case alertLimit = "alertLimit"
        case usage = "usage"
        case addons = "addons"
        case budgetCapEnabled = "budgetCapEnabled"
        case customSmtp = "customSmtp"
        case emailBranding = "emailBranding"
        case requiresPaymentMethod = "requiresPaymentMethod"
        case requiresBillingAddress = "requiresBillingAddress"
        case eligibleCountries = "eligibleCountries"
        case isAvailable = "isAvailable"
        case selfService = "selfService"
        case premiumSupport = "premiumSupport"
        case budgeting = "budgeting"
        case supportsMockNumbers = "supportsMockNumbers"
        case supportsOrganizationRoles = "supportsOrganizationRoles"
        case supportsCredits = "supportsCredits"
        case supportsDedicatedDatabases = "supportsDedicatedDatabases"
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
        case functionsIntervalMinimum = "functionsIntervalMinimum"
        case functionsAllowCron = "functionsAllowCron"
        case databasesAllowEncrypt = "databasesAllowEncrypt"
        case limits = "limits"
        case group = "group"
        case program = "program"
        case databaseComputeCredit = "databaseComputeCredit"
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
    public let members: Int?
    /// Webhooks
    public let webhooks: Int
    /// Maximum WAF rules per project
    public let wafRules: Int
    /// Maximum environments per project. 0 when the plan does not offer environments.
    public let environments: Int
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
    /// Days non-active deployments are kept when a function or site sets no retention.
    public let deploymentRetention: Int?
    /// Maximum deployment retention in days a function or site can set. 0 means unlimited.
    public let deploymentRetentionMax: Int?
    /// Non-active deployments kept per function or site. 0 means unlimited.
    public let deploymentsRetentionCount: Int?
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
    public let activityLogs: Int?
    /// Usage history days
    public let usageLogs: Int
    /// Usage log time intervals allowed for this plan (e.g. 15m, 1h, 1d).
    public let usageLogsIntervals: [String]?
    /// Metrics this plan only records as a total. They cannot be broken down by dimension or filtered, because the stored events cover a fraction of the real traffic.
    public let usageAggregateOnlyMetrics: [String]?
    /// Number of days of console inactivity before a project is paused. 0 means pausing is disabled.
    public let projectInactivityDays: Int
    /// Alert threshold percentage
    public let alertLimit: Int
    /// Additional resources. Null when the plan does not support usage billing.
    public let usage: UsageBillingPlan?
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
    /// ISO country codes eligible for this regional plan. Empty means no restriction.
    public let eligibleCountries: [String]?
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
    /// Does plan support dedicated databases.
    public let supportsDedicatedDatabases: Bool
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
    public let backupsEnabled: Bool?
    /// Whether usage addons are calculated per project.
    public let usagePerProject: Bool
    /// Supported addons for this plan
    public let supportedAddons: BillingPlanSupportedAddons
    /// How many policies does plan support
    public let backupPolicies: Int?
    /// Maximum function and site deployment size in MB
    public let deploymentSize: Int
    /// Maximum function and site deployment size in MB
    public let buildSize: Int
    /// Shortest function schedule interval allowed, in minutes. 0 allows every interval.
    public let functionsIntervalMinimum: Int
    /// Does the plan allow cron function schedules or only intervals.
    public let functionsAllowCron: Bool
    /// Does the plan support encrypted string attributes or not.
    public let databasesAllowEncrypt: Bool
    /// Plan specific limits
    public let limits: BillingPlanLimits?
    /// Group of this billing plan for variants
    public let group: AppwriteEnums.BillingPlanGroup
    /// Details of the program this plan is a part of.
    public let program: Program?
    /// Included monthly dedicated-database compute credit in USD. Resets each billing cycle with no roll-over.
    public let databaseComputeCredit: Double
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
        members: Int?,
        webhooks: Int,
        wafRules: Int,
        environments: Int,
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
        deploymentRetention: Int?,
        deploymentRetentionMax: Int?,
        deploymentsRetentionCount: Int?,
        GBHours: Int,
        realtime: Int,
        realtimeMessages: Int,
        messages: Int,
        topics: Int,
        authPhone: Int,
        domains: Int,
        activityLogs: Int?,
        usageLogs: Int,
        usageLogsIntervals: [String]?,
        usageAggregateOnlyMetrics: [String]?,
        projectInactivityDays: Int,
        alertLimit: Int,
        usage: UsageBillingPlan?,
        addons: BillingPlanAddon,
        budgetCapEnabled: Bool,
        customSmtp: Bool,
        emailBranding: Bool,
        requiresPaymentMethod: Bool,
        requiresBillingAddress: Bool,
        eligibleCountries: [String]?,
        isAvailable: Bool,
        selfService: Bool,
        premiumSupport: Bool,
        budgeting: Bool,
        supportsMockNumbers: Bool,
        supportsOrganizationRoles: Bool,
        supportsCredits: Bool,
        supportsDedicatedDatabases: Bool,
        supportsDisposableEmailValidation: Bool,
        supportsCanonicalEmailValidation: Bool,
        supportsFreeEmailValidation: Bool,
        supportsCorporateEmailValidation: Bool,
        supportsProjectSpecificRoles: Bool,
        backupsEnabled: Bool?,
        usagePerProject: Bool,
        supportedAddons: BillingPlanSupportedAddons,
        backupPolicies: Int?,
        deploymentSize: Int,
        buildSize: Int,
        functionsIntervalMinimum: Int,
        functionsAllowCron: Bool,
        databasesAllowEncrypt: Bool,
        limits: BillingPlanLimits?,
        group: AppwriteEnums.BillingPlanGroup,
        program: Program?,
        databaseComputeCredit: Double,
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
        self.environments = environments
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
        self.deploymentRetention = deploymentRetention
        self.deploymentRetentionMax = deploymentRetentionMax
        self.deploymentsRetentionCount = deploymentsRetentionCount
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
        self.usageAggregateOnlyMetrics = usageAggregateOnlyMetrics
        self.projectInactivityDays = projectInactivityDays
        self.alertLimit = alertLimit
        self.usage = usage
        self.addons = addons
        self.budgetCapEnabled = budgetCapEnabled
        self.customSmtp = customSmtp
        self.emailBranding = emailBranding
        self.requiresPaymentMethod = requiresPaymentMethod
        self.requiresBillingAddress = requiresBillingAddress
        self.eligibleCountries = eligibleCountries
        self.isAvailable = isAvailable
        self.selfService = selfService
        self.premiumSupport = premiumSupport
        self.budgeting = budgeting
        self.supportsMockNumbers = supportsMockNumbers
        self.supportsOrganizationRoles = supportsOrganizationRoles
        self.supportsCredits = supportsCredits
        self.supportsDedicatedDatabases = supportsDedicatedDatabases
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
        self.functionsIntervalMinimum = functionsIntervalMinimum
        self.functionsAllowCron = functionsAllowCron
        self.databasesAllowEncrypt = databasesAllowEncrypt
        self.limits = limits
        self.group = group
        self.program = program
        self.databaseComputeCredit = databaseComputeCredit
        self.dedicatedDatabases = dedicatedDatabases
    }

    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        self.id = try container.contains(.id) ? container.decode(String.self, forKey: .id) : ""
        self.name = try container.contains(.name) ? container.decode(String.self, forKey: .name) : ""
        self.desc = try container.contains(.desc) ? container.decode(String.self, forKey: .desc) : ""
        self.order = try container.contains(.order) ? container.decode(Int.self, forKey: .order) : 0
        self.price = try container.contains(.price) ? container.decode(Double.self, forKey: .price) : 0
        self.trial = try container.contains(.trial) ? container.decode(Int.self, forKey: .trial) : 0
        self.bandwidth = try container.contains(.bandwidth) ? container.decode(Int.self, forKey: .bandwidth) : 0
        self.storage = try container.contains(.storage) ? container.decode(Int.self, forKey: .storage) : 0
        self.imageTransformations = try container.contains(.imageTransformations) ? container.decode(Int.self, forKey: .imageTransformations) : 0
        self.screenshotsGenerated = try container.contains(.screenshotsGenerated) ? container.decode(Int.self, forKey: .screenshotsGenerated) : 0
        self.members = try container.decodeIfPresent(Int.self, forKey: .members)
        self.webhooks = try container.contains(.webhooks) ? container.decode(Int.self, forKey: .webhooks) : 0
        self.wafRules = try container.contains(.wafRules) ? container.decode(Int.self, forKey: .wafRules) : 0
        self.environments = try container.contains(.environments) ? container.decode(Int.self, forKey: .environments) : 0
        self.projects = try container.contains(.projects) ? container.decode(Int.self, forKey: .projects) : 0
        self.platforms = try container.contains(.platforms) ? container.decode(Int.self, forKey: .platforms) : 0
        self.users = try container.contains(.users) ? container.decode(Int.self, forKey: .users) : 0
        self.teams = try container.contains(.teams) ? container.decode(Int.self, forKey: .teams) : 0
        self.databases = try container.contains(.databases) ? container.decode(Int.self, forKey: .databases) : 0
        self.databasesReads = try container.contains(.databasesReads) ? container.decode(Int.self, forKey: .databasesReads) : 0
        self.databasesWrites = try container.contains(.databasesWrites) ? container.decode(Int.self, forKey: .databasesWrites) : 0
        self.databasesBatchSize = try container.contains(.databasesBatchSize) ? container.decode(Int.self, forKey: .databasesBatchSize) : 0
        self.buckets = try container.contains(.buckets) ? container.decode(Int.self, forKey: .buckets) : 0
        self.fileSize = try container.contains(.fileSize) ? container.decode(Int.self, forKey: .fileSize) : 0
        self.functions = try container.contains(.functions) ? container.decode(Int.self, forKey: .functions) : 0
        self.sites = try container.contains(.sites) ? container.decode(Int.self, forKey: .sites) : 0
        self.executions = try container.contains(.executions) ? container.decode(Int.self, forKey: .executions) : 0
        self.executionsRetentionCount = try container.contains(.executionsRetentionCount) ? container.decode(Int.self, forKey: .executionsRetentionCount) : 1000
        self.deploymentRetention = try container.decodeIfPresent(Int.self, forKey: .deploymentRetention)
        self.deploymentRetentionMax = try container.decodeIfPresent(Int.self, forKey: .deploymentRetentionMax)
        self.deploymentsRetentionCount = try container.decodeIfPresent(Int.self, forKey: .deploymentsRetentionCount)
        self.GBHours = try container.contains(.GBHours) ? container.decode(Int.self, forKey: .GBHours) : 0
        self.realtime = try container.contains(.realtime) ? container.decode(Int.self, forKey: .realtime) : 0
        self.realtimeMessages = try container.contains(.realtimeMessages) ? container.decode(Int.self, forKey: .realtimeMessages) : 0
        self.messages = try container.contains(.messages) ? container.decode(Int.self, forKey: .messages) : 0
        self.topics = try container.contains(.topics) ? container.decode(Int.self, forKey: .topics) : 0
        self.authPhone = try container.contains(.authPhone) ? container.decode(Int.self, forKey: .authPhone) : 0
        self.domains = try container.contains(.domains) ? container.decode(Int.self, forKey: .domains) : 0
        self.activityLogs = try container.decodeIfPresent(Int.self, forKey: .activityLogs)
        self.usageLogs = try container.contains(.usageLogs) ? container.decode(Int.self, forKey: .usageLogs) : 0
        self.usageLogsIntervals = try container.decodeIfPresent([String].self, forKey: .usageLogsIntervals)
        self.usageAggregateOnlyMetrics = try container.decodeIfPresent([String].self, forKey: .usageAggregateOnlyMetrics)
        self.projectInactivityDays = try container.contains(.projectInactivityDays) ? container.decode(Int.self, forKey: .projectInactivityDays) : 0
        self.alertLimit = try container.contains(.alertLimit) ? container.decode(Int.self, forKey: .alertLimit) : 80
        self.usage = try container.decodeIfPresent(UsageBillingPlan.self, forKey: .usage)
        self.addons = try container.decode(BillingPlanAddon.self, forKey: .addons)
        self.budgetCapEnabled = try container.contains(.budgetCapEnabled) ? container.decode(Bool.self, forKey: .budgetCapEnabled) : false
        self.customSmtp = try container.contains(.customSmtp) ? container.decode(Bool.self, forKey: .customSmtp) : false
        self.emailBranding = try container.contains(.emailBranding) ? container.decode(Bool.self, forKey: .emailBranding) : false
        self.requiresPaymentMethod = try container.contains(.requiresPaymentMethod) ? container.decode(Bool.self, forKey: .requiresPaymentMethod) : true
        self.requiresBillingAddress = try container.contains(.requiresBillingAddress) ? container.decode(Bool.self, forKey: .requiresBillingAddress) : false
        self.eligibleCountries = try container.decodeIfPresent([String].self, forKey: .eligibleCountries)
        self.isAvailable = try container.contains(.isAvailable) ? container.decode(Bool.self, forKey: .isAvailable) : true
        self.selfService = try container.contains(.selfService) ? container.decode(Bool.self, forKey: .selfService) : true
        self.premiumSupport = try container.contains(.premiumSupport) ? container.decode(Bool.self, forKey: .premiumSupport) : true
        self.budgeting = try container.contains(.budgeting) ? container.decode(Bool.self, forKey: .budgeting) : true
        self.supportsMockNumbers = try container.contains(.supportsMockNumbers) ? container.decode(Bool.self, forKey: .supportsMockNumbers) : true
        self.supportsOrganizationRoles = try container.contains(.supportsOrganizationRoles) ? container.decode(Bool.self, forKey: .supportsOrganizationRoles) : true
        self.supportsCredits = try container.contains(.supportsCredits) ? container.decode(Bool.self, forKey: .supportsCredits) : false
        self.supportsDedicatedDatabases = try container.contains(.supportsDedicatedDatabases) ? container.decode(Bool.self, forKey: .supportsDedicatedDatabases) : false
        self.supportsDisposableEmailValidation = try container.contains(.supportsDisposableEmailValidation) ? container.decode(Bool.self, forKey: .supportsDisposableEmailValidation) : false
        self.supportsCanonicalEmailValidation = try container.contains(.supportsCanonicalEmailValidation) ? container.decode(Bool.self, forKey: .supportsCanonicalEmailValidation) : false
        self.supportsFreeEmailValidation = try container.contains(.supportsFreeEmailValidation) ? container.decode(Bool.self, forKey: .supportsFreeEmailValidation) : false
        self.supportsCorporateEmailValidation = try container.contains(.supportsCorporateEmailValidation) ? container.decode(Bool.self, forKey: .supportsCorporateEmailValidation) : false
        self.supportsProjectSpecificRoles = try container.contains(.supportsProjectSpecificRoles) ? container.decode(Bool.self, forKey: .supportsProjectSpecificRoles) : false
        self.backupsEnabled = try container.decodeIfPresent(Bool.self, forKey: .backupsEnabled)
        self.usagePerProject = try container.contains(.usagePerProject) ? container.decode(Bool.self, forKey: .usagePerProject) : true
        self.supportedAddons = try container.decode(BillingPlanSupportedAddons.self, forKey: .supportedAddons)
        self.backupPolicies = try container.decodeIfPresent(Int.self, forKey: .backupPolicies)
        self.deploymentSize = try container.contains(.deploymentSize) ? container.decode(Int.self, forKey: .deploymentSize) : 0
        self.buildSize = try container.contains(.buildSize) ? container.decode(Int.self, forKey: .buildSize) : 0
        self.functionsIntervalMinimum = try container.contains(.functionsIntervalMinimum) ? container.decode(Int.self, forKey: .functionsIntervalMinimum) : 0
        self.functionsAllowCron = try container.contains(.functionsAllowCron) ? container.decode(Bool.self, forKey: .functionsAllowCron) : true
        self.databasesAllowEncrypt = try container.contains(.databasesAllowEncrypt) ? container.decode(Bool.self, forKey: .databasesAllowEncrypt) : false
        self.limits = try container.decodeIfPresent(BillingPlanLimits.self, forKey: .limits)
        self.group = AppwriteEnums.BillingPlanGroup(rawValue: try container.decode(String.self, forKey: .group))!
        self.program = try container.decodeIfPresent(Program.self, forKey: .program)
        self.databaseComputeCredit = try container.contains(.databaseComputeCredit) ? container.decode(Double.self, forKey: .databaseComputeCredit) : 0
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
        try container.encodeIfPresent(members, forKey: .members)
        try container.encode(webhooks, forKey: .webhooks)
        try container.encode(wafRules, forKey: .wafRules)
        try container.encode(environments, forKey: .environments)
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
        try container.encodeIfPresent(deploymentRetention, forKey: .deploymentRetention)
        try container.encodeIfPresent(deploymentRetentionMax, forKey: .deploymentRetentionMax)
        try container.encodeIfPresent(deploymentsRetentionCount, forKey: .deploymentsRetentionCount)
        try container.encode(GBHours, forKey: .GBHours)
        try container.encode(realtime, forKey: .realtime)
        try container.encode(realtimeMessages, forKey: .realtimeMessages)
        try container.encode(messages, forKey: .messages)
        try container.encode(topics, forKey: .topics)
        try container.encode(authPhone, forKey: .authPhone)
        try container.encode(domains, forKey: .domains)
        try container.encodeIfPresent(activityLogs, forKey: .activityLogs)
        try container.encode(usageLogs, forKey: .usageLogs)
        try container.encodeIfPresent(usageLogsIntervals, forKey: .usageLogsIntervals)
        try container.encodeIfPresent(usageAggregateOnlyMetrics, forKey: .usageAggregateOnlyMetrics)
        try container.encode(projectInactivityDays, forKey: .projectInactivityDays)
        try container.encode(alertLimit, forKey: .alertLimit)
        try container.encodeIfPresent(usage, forKey: .usage)
        try container.encode(addons, forKey: .addons)
        try container.encode(budgetCapEnabled, forKey: .budgetCapEnabled)
        try container.encode(customSmtp, forKey: .customSmtp)
        try container.encode(emailBranding, forKey: .emailBranding)
        try container.encode(requiresPaymentMethod, forKey: .requiresPaymentMethod)
        try container.encode(requiresBillingAddress, forKey: .requiresBillingAddress)
        try container.encodeIfPresent(eligibleCountries, forKey: .eligibleCountries)
        try container.encode(isAvailable, forKey: .isAvailable)
        try container.encode(selfService, forKey: .selfService)
        try container.encode(premiumSupport, forKey: .premiumSupport)
        try container.encode(budgeting, forKey: .budgeting)
        try container.encode(supportsMockNumbers, forKey: .supportsMockNumbers)
        try container.encode(supportsOrganizationRoles, forKey: .supportsOrganizationRoles)
        try container.encode(supportsCredits, forKey: .supportsCredits)
        try container.encode(supportsDedicatedDatabases, forKey: .supportsDedicatedDatabases)
        try container.encode(supportsDisposableEmailValidation, forKey: .supportsDisposableEmailValidation)
        try container.encode(supportsCanonicalEmailValidation, forKey: .supportsCanonicalEmailValidation)
        try container.encode(supportsFreeEmailValidation, forKey: .supportsFreeEmailValidation)
        try container.encode(supportsCorporateEmailValidation, forKey: .supportsCorporateEmailValidation)
        try container.encode(supportsProjectSpecificRoles, forKey: .supportsProjectSpecificRoles)
        try container.encodeIfPresent(backupsEnabled, forKey: .backupsEnabled)
        try container.encode(usagePerProject, forKey: .usagePerProject)
        try container.encode(supportedAddons, forKey: .supportedAddons)
        try container.encodeIfPresent(backupPolicies, forKey: .backupPolicies)
        try container.encode(deploymentSize, forKey: .deploymentSize)
        try container.encode(buildSize, forKey: .buildSize)
        try container.encode(functionsIntervalMinimum, forKey: .functionsIntervalMinimum)
        try container.encode(functionsAllowCron, forKey: .functionsAllowCron)
        try container.encode(databasesAllowEncrypt, forKey: .databasesAllowEncrypt)
        try container.encodeIfPresent(limits, forKey: .limits)
        try container.encode(group.rawValue, forKey: .group)
        try container.encodeIfPresent(program, forKey: .program)
        try container.encode(databaseComputeCredit, forKey: .databaseComputeCredit)
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
            "environments": environments as Any,
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
            "deploymentRetention": deploymentRetention as Any,
            "deploymentRetentionMax": deploymentRetentionMax as Any,
            "deploymentsRetentionCount": deploymentsRetentionCount as Any,
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
            "usageAggregateOnlyMetrics": usageAggregateOnlyMetrics as Any,
            "projectInactivityDays": projectInactivityDays as Any,
            "alertLimit": alertLimit as Any,
            "usage": usage?.toMap() as Any,
            "addons": addons.toMap() as Any,
            "budgetCapEnabled": budgetCapEnabled as Any,
            "customSmtp": customSmtp as Any,
            "emailBranding": emailBranding as Any,
            "requiresPaymentMethod": requiresPaymentMethod as Any,
            "requiresBillingAddress": requiresBillingAddress as Any,
            "eligibleCountries": eligibleCountries as Any,
            "isAvailable": isAvailable as Any,
            "selfService": selfService as Any,
            "premiumSupport": premiumSupport as Any,
            "budgeting": budgeting as Any,
            "supportsMockNumbers": supportsMockNumbers as Any,
            "supportsOrganizationRoles": supportsOrganizationRoles as Any,
            "supportsCredits": supportsCredits as Any,
            "supportsDedicatedDatabases": supportsDedicatedDatabases as Any,
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
            "functionsIntervalMinimum": functionsIntervalMinimum as Any,
            "functionsAllowCron": functionsAllowCron as Any,
            "databasesAllowEncrypt": databasesAllowEncrypt as Any,
            "limits": limits?.toMap() as Any,
            "group": group.rawValue as Any,
            "program": program?.toMap() as Any,
            "databaseComputeCredit": databaseComputeCredit as Any,
            "dedicatedDatabases": dedicatedDatabases?.toMap() as Any,
        ]
    }

    public static func from(map: [String: Any]) -> BillingPlan {
        let defaults: [String: Any] = [
            "$id": "",
            "name": "",
            "desc": "",
            "order": 0,
            "price": 0.0,
            "trial": 0,
            "bandwidth": 0,
            "storage": 0,
            "imageTransformations": 0,
            "screenshotsGenerated": 0,
            "webhooks": 0,
            "wafRules": 0,
            "environments": 0,
            "projects": 0,
            "platforms": 0,
            "users": 0,
            "teams": 0,
            "databases": 0,
            "databasesReads": 0,
            "databasesWrites": 0,
            "databasesBatchSize": 0,
            "buckets": 0,
            "fileSize": 0,
            "functions": 0,
            "sites": 0,
            "executions": 0,
            "executionsRetentionCount": 1000,
            "GBHours": 0,
            "realtime": 0,
            "realtimeMessages": 0,
            "messages": 0,
            "topics": 0,
            "authPhone": 0,
            "domains": 0,
            "usageLogs": 0,
            "projectInactivityDays": 0,
            "alertLimit": 80,
            "budgetCapEnabled": false,
            "customSmtp": false,
            "emailBranding": false,
            "requiresPaymentMethod": true,
            "requiresBillingAddress": false,
            "isAvailable": true,
            "selfService": true,
            "premiumSupport": true,
            "budgeting": true,
            "supportsMockNumbers": true,
            "supportsOrganizationRoles": true,
            "supportsCredits": false,
            "supportsDedicatedDatabases": false,
            "supportsDisposableEmailValidation": false,
            "supportsCanonicalEmailValidation": false,
            "supportsFreeEmailValidation": false,
            "supportsCorporateEmailValidation": false,
            "supportsProjectSpecificRoles": false,
            "usagePerProject": true,
            "deploymentSize": 0,
            "buildSize": 0,
            "functionsIntervalMinimum": 0,
            "functionsAllowCron": true,
            "databasesAllowEncrypt": false,
            "databaseComputeCredit": 0.0,
        ]
        let map = defaults.merging(map) { _, new in new }

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
            members: map["members"] as? Int,
            webhooks: map["webhooks"] as! Int,
            wafRules: map["wafRules"] as! Int,
            environments: map["environments"] as! Int,
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
            deploymentRetention: map["deploymentRetention"] as? Int,
            deploymentRetentionMax: map["deploymentRetentionMax"] as? Int,
            deploymentsRetentionCount: map["deploymentsRetentionCount"] as? Int,
            GBHours: map["GBHours"] as! Int,
            realtime: map["realtime"] as! Int,
            realtimeMessages: map["realtimeMessages"] as! Int,
            messages: map["messages"] as! Int,
            topics: map["topics"] as! Int,
            authPhone: map["authPhone"] as! Int,
            domains: map["domains"] as! Int,
            activityLogs: map["activityLogs"] as? Int,
            usageLogs: map["usageLogs"] as! Int,
            usageLogsIntervals: map["usageLogsIntervals"] as? [String],
            usageAggregateOnlyMetrics: map["usageAggregateOnlyMetrics"] as? [String],
            projectInactivityDays: map["projectInactivityDays"] as! Int,
            alertLimit: map["alertLimit"] as! Int,
            usage: map["usage"] as? [String: Any] != nil ? UsageBillingPlan.from(map: map["usage"] as! [String: Any]) : nil,
            addons: BillingPlanAddon.from(map: map["addons"] as! [String: Any]),
            budgetCapEnabled: map["budgetCapEnabled"] as! Bool,
            customSmtp: map["customSmtp"] as! Bool,
            emailBranding: map["emailBranding"] as! Bool,
            requiresPaymentMethod: map["requiresPaymentMethod"] as! Bool,
            requiresBillingAddress: map["requiresBillingAddress"] as! Bool,
            eligibleCountries: map["eligibleCountries"] as? [String],
            isAvailable: map["isAvailable"] as! Bool,
            selfService: map["selfService"] as! Bool,
            premiumSupport: map["premiumSupport"] as! Bool,
            budgeting: map["budgeting"] as! Bool,
            supportsMockNumbers: map["supportsMockNumbers"] as! Bool,
            supportsOrganizationRoles: map["supportsOrganizationRoles"] as! Bool,
            supportsCredits: map["supportsCredits"] as! Bool,
            supportsDedicatedDatabases: map["supportsDedicatedDatabases"] as! Bool,
            supportsDisposableEmailValidation: map["supportsDisposableEmailValidation"] as! Bool,
            supportsCanonicalEmailValidation: map["supportsCanonicalEmailValidation"] as! Bool,
            supportsFreeEmailValidation: map["supportsFreeEmailValidation"] as! Bool,
            supportsCorporateEmailValidation: map["supportsCorporateEmailValidation"] as! Bool,
            supportsProjectSpecificRoles: map["supportsProjectSpecificRoles"] as! Bool,
            backupsEnabled: map["backupsEnabled"] as? Bool,
            usagePerProject: map["usagePerProject"] as! Bool,
            supportedAddons: BillingPlanSupportedAddons.from(map: map["supportedAddons"] as! [String: Any]),
            backupPolicies: map["backupPolicies"] as? Int,
            deploymentSize: map["deploymentSize"] as! Int,
            buildSize: map["buildSize"] as! Int,
            functionsIntervalMinimum: map["functionsIntervalMinimum"] as! Int,
            functionsAllowCron: map["functionsAllowCron"] as! Bool,
            databasesAllowEncrypt: map["databasesAllowEncrypt"] as! Bool,
            limits: map["limits"] as? [String: Any] != nil ? BillingPlanLimits.from(map: map["limits"] as! [String: Any]) : nil,
            group: AppwriteEnums.BillingPlanGroup(rawValue: map["group"] as! String)!,
            program: map["program"] as? [String: Any] != nil ? Program.from(map: map["program"] as! [String: Any]) : nil,
            databaseComputeCredit: map["databaseComputeCredit"] as! Double,
            dedicatedDatabases: map["dedicatedDatabases"] as? [String: Any] != nil ? BillingPlanDedicatedDatabaseLimits.from(map: map["dedicatedDatabases"] as! [String: Any]) : nil
        )
    }
}
