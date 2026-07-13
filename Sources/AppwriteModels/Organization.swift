import Foundation
import JSONCodable

/// Organization
open class Organization<T : Codable>: Codable {

    enum CodingKeys: String, CodingKey {
        case id = "$id"
        case createdAt = "$createdAt"
        case updatedAt = "$updatedAt"
        case name = "name"
        case total = "total"
        case prefs = "prefs"
        case billingBudget = "billingBudget"
        case budgetAlerts = "budgetAlerts"
        case billingPlan = "billingPlan"
        case billingPlanId = "billingPlanId"
        case billingPlanDetails = "billingPlanDetails"
        case billingEmail = "billingEmail"
        case billingStartDate = "billingStartDate"
        case billingCurrentInvoiceDate = "billingCurrentInvoiceDate"
        case billingNextInvoiceDate = "billingNextInvoiceDate"
        case billingTrialStartDate = "billingTrialStartDate"
        case billingTrialDays = "billingTrialDays"
        case billingAggregationId = "billingAggregationId"
        case billingInvoiceId = "billingInvoiceId"
        case paymentMethodId = "paymentMethodId"
        case billingAddressId = "billingAddressId"
        case backupPaymentMethodId = "backupPaymentMethodId"
        case status = "status"
        case remarks = "remarks"
        case agreementBAA = "agreementBAA"
        case programManagerName = "programManagerName"
        case programManagerCalendar = "programManagerCalendar"
        case programDiscordChannelName = "programDiscordChannelName"
        case programDiscordChannelUrl = "programDiscordChannelUrl"
        case billingLimits = "billingLimits"
        case billingPlanDowngrade = "billingPlanDowngrade"
        case billingTaxId = "billingTaxId"
        case markedForDeletion = "markedForDeletion"
        case platform = "platform"
        case projects = "projects"
    }

    /// Team ID.
    public let id: String
    /// Team creation date in ISO 8601 format.
    public let createdAt: String
    /// Team update date in ISO 8601 format.
    public let updatedAt: String
    /// Team name.
    public let name: String
    /// Total number of team members.
    public let total: Int
    /// Team preferences as a key-value object
    public let prefs: Preferences<T>
    /// Project budget limit
    public let billingBudget: Int
    /// Project budget limit
    public let budgetAlerts: [Int]
    /// Organization&#039;s billing plan ID.
    public let billingPlan: String
    /// Organization&#039;s billing plan ID.
    public let billingPlanId: String
    /// Organization&#039;s billing plan.
    public let billingPlanDetails: BillingPlan
    /// Billing email set for the organization.
    public let billingEmail: String
    /// Billing cycle start date.
    public let billingStartDate: String
    /// Current invoice cycle start date.
    public let billingCurrentInvoiceDate: String
    /// Next invoice cycle start date.
    public let billingNextInvoiceDate: String
    /// Start date of trial.
    public let billingTrialStartDate: String
    /// Number of trial days.
    public let billingTrialDays: Int
    /// Current active aggregation id.
    public let billingAggregationId: String
    /// Current active aggregation id.
    public let billingInvoiceId: String
    /// Default payment method.
    public let paymentMethodId: String
    /// Default payment method.
    public let billingAddressId: String
    /// Backup payment method.
    public let backupPaymentMethodId: String
    /// Team status.
    public let status: String
    /// Remarks on team status.
    public let remarks: String
    /// Organization agreements
    public let agreementBAA: String
    /// Program manager&#039;s name.
    public let programManagerName: String
    /// Program manager&#039;s calendar link.
    public let programManagerCalendar: String
    /// Program&#039;s discord channel name.
    public let programDiscordChannelName: String
    /// Program&#039;s discord channel URL.
    public let programDiscordChannelUrl: String
    /// Billing limits reached
    public let billingLimits: BillingLimits?
    /// Billing plan selected for downgrade.
    public let billingPlanDowngrade: String
    /// Tax Id
    public let billingTaxId: String
    /// Marked for deletion
    public let markedForDeletion: Bool
    /// Product with which the organization is associated (appwrite or imagine)
    public let platform: String
    /// Selected projects
    public let projects: [String]

    init(
        id: String,
        createdAt: String,
        updatedAt: String,
        name: String,
        total: Int,
        prefs: Preferences<T>,
        billingBudget: Int,
        budgetAlerts: [Int],
        billingPlan: String,
        billingPlanId: String,
        billingPlanDetails: BillingPlan,
        billingEmail: String,
        billingStartDate: String,
        billingCurrentInvoiceDate: String,
        billingNextInvoiceDate: String,
        billingTrialStartDate: String,
        billingTrialDays: Int,
        billingAggregationId: String,
        billingInvoiceId: String,
        paymentMethodId: String,
        billingAddressId: String,
        backupPaymentMethodId: String,
        status: String,
        remarks: String,
        agreementBAA: String,
        programManagerName: String,
        programManagerCalendar: String,
        programDiscordChannelName: String,
        programDiscordChannelUrl: String,
        billingLimits: BillingLimits?,
        billingPlanDowngrade: String,
        billingTaxId: String,
        markedForDeletion: Bool,
        platform: String,
        projects: [String]
    ) {
        self.id = id
        self.createdAt = createdAt
        self.updatedAt = updatedAt
        self.name = name
        self.total = total
        self.prefs = prefs
        self.billingBudget = billingBudget
        self.budgetAlerts = budgetAlerts
        self.billingPlan = billingPlan
        self.billingPlanId = billingPlanId
        self.billingPlanDetails = billingPlanDetails
        self.billingEmail = billingEmail
        self.billingStartDate = billingStartDate
        self.billingCurrentInvoiceDate = billingCurrentInvoiceDate
        self.billingNextInvoiceDate = billingNextInvoiceDate
        self.billingTrialStartDate = billingTrialStartDate
        self.billingTrialDays = billingTrialDays
        self.billingAggregationId = billingAggregationId
        self.billingInvoiceId = billingInvoiceId
        self.paymentMethodId = paymentMethodId
        self.billingAddressId = billingAddressId
        self.backupPaymentMethodId = backupPaymentMethodId
        self.status = status
        self.remarks = remarks
        self.agreementBAA = agreementBAA
        self.programManagerName = programManagerName
        self.programManagerCalendar = programManagerCalendar
        self.programDiscordChannelName = programDiscordChannelName
        self.programDiscordChannelUrl = programDiscordChannelUrl
        self.billingLimits = billingLimits
        self.billingPlanDowngrade = billingPlanDowngrade
        self.billingTaxId = billingTaxId
        self.markedForDeletion = markedForDeletion
        self.platform = platform
        self.projects = projects
    }

    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        self.id = try container.decode(String.self, forKey: .id)
        self.createdAt = try container.decode(String.self, forKey: .createdAt)
        self.updatedAt = try container.decode(String.self, forKey: .updatedAt)
        self.name = try container.decode(String.self, forKey: .name)
        self.total = try container.decode(Int.self, forKey: .total)
        self.prefs = try container.decode(Preferences<T>.self, forKey: .prefs)
        self.billingBudget = try container.decode(Int.self, forKey: .billingBudget)
        self.budgetAlerts = try container.decode([Int].self, forKey: .budgetAlerts)
        self.billingPlan = try container.decode(String.self, forKey: .billingPlan)
        self.billingPlanId = try container.decode(String.self, forKey: .billingPlanId)
        self.billingPlanDetails = try container.decode(BillingPlan.self, forKey: .billingPlanDetails)
        self.billingEmail = try container.decode(String.self, forKey: .billingEmail)
        self.billingStartDate = try container.decode(String.self, forKey: .billingStartDate)
        self.billingCurrentInvoiceDate = try container.decode(String.self, forKey: .billingCurrentInvoiceDate)
        self.billingNextInvoiceDate = try container.decode(String.self, forKey: .billingNextInvoiceDate)
        self.billingTrialStartDate = try container.decode(String.self, forKey: .billingTrialStartDate)
        self.billingTrialDays = try container.decode(Int.self, forKey: .billingTrialDays)
        self.billingAggregationId = try container.decode(String.self, forKey: .billingAggregationId)
        self.billingInvoiceId = try container.decode(String.self, forKey: .billingInvoiceId)
        self.paymentMethodId = try container.decode(String.self, forKey: .paymentMethodId)
        self.billingAddressId = try container.decode(String.self, forKey: .billingAddressId)
        self.backupPaymentMethodId = try container.decode(String.self, forKey: .backupPaymentMethodId)
        self.status = try container.decode(String.self, forKey: .status)
        self.remarks = try container.decode(String.self, forKey: .remarks)
        self.agreementBAA = try container.decode(String.self, forKey: .agreementBAA)
        self.programManagerName = try container.decode(String.self, forKey: .programManagerName)
        self.programManagerCalendar = try container.decode(String.self, forKey: .programManagerCalendar)
        self.programDiscordChannelName = try container.decode(String.self, forKey: .programDiscordChannelName)
        self.programDiscordChannelUrl = try container.decode(String.self, forKey: .programDiscordChannelUrl)
        self.billingLimits = try container.decodeIfPresent(BillingLimits.self, forKey: .billingLimits)
        self.billingPlanDowngrade = try container.decode(String.self, forKey: .billingPlanDowngrade)
        self.billingTaxId = try container.decode(String.self, forKey: .billingTaxId)
        self.markedForDeletion = try container.decode(Bool.self, forKey: .markedForDeletion)
        self.platform = try container.decode(String.self, forKey: .platform)
        self.projects = try container.decode([String].self, forKey: .projects)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encode(id, forKey: .id)
        try container.encode(createdAt, forKey: .createdAt)
        try container.encode(updatedAt, forKey: .updatedAt)
        try container.encode(name, forKey: .name)
        try container.encode(total, forKey: .total)
        try container.encode(prefs, forKey: .prefs)
        try container.encode(billingBudget, forKey: .billingBudget)
        try container.encode(budgetAlerts, forKey: .budgetAlerts)
        try container.encode(billingPlan, forKey: .billingPlan)
        try container.encode(billingPlanId, forKey: .billingPlanId)
        try container.encode(billingPlanDetails, forKey: .billingPlanDetails)
        try container.encode(billingEmail, forKey: .billingEmail)
        try container.encode(billingStartDate, forKey: .billingStartDate)
        try container.encode(billingCurrentInvoiceDate, forKey: .billingCurrentInvoiceDate)
        try container.encode(billingNextInvoiceDate, forKey: .billingNextInvoiceDate)
        try container.encode(billingTrialStartDate, forKey: .billingTrialStartDate)
        try container.encode(billingTrialDays, forKey: .billingTrialDays)
        try container.encode(billingAggregationId, forKey: .billingAggregationId)
        try container.encode(billingInvoiceId, forKey: .billingInvoiceId)
        try container.encode(paymentMethodId, forKey: .paymentMethodId)
        try container.encode(billingAddressId, forKey: .billingAddressId)
        try container.encode(backupPaymentMethodId, forKey: .backupPaymentMethodId)
        try container.encode(status, forKey: .status)
        try container.encode(remarks, forKey: .remarks)
        try container.encode(agreementBAA, forKey: .agreementBAA)
        try container.encode(programManagerName, forKey: .programManagerName)
        try container.encode(programManagerCalendar, forKey: .programManagerCalendar)
        try container.encode(programDiscordChannelName, forKey: .programDiscordChannelName)
        try container.encode(programDiscordChannelUrl, forKey: .programDiscordChannelUrl)
        try container.encodeIfPresent(billingLimits, forKey: .billingLimits)
        try container.encode(billingPlanDowngrade, forKey: .billingPlanDowngrade)
        try container.encode(billingTaxId, forKey: .billingTaxId)
        try container.encode(markedForDeletion, forKey: .markedForDeletion)
        try container.encode(platform, forKey: .platform)
        try container.encode(projects, forKey: .projects)
    }

    public func toMap() -> [String: Any] {
        return [
            "$id": id as Any,
            "$createdAt": createdAt as Any,
            "$updatedAt": updatedAt as Any,
            "name": name as Any,
            "total": total as Any,
            "prefs": prefs.toMap() as Any,
            "billingBudget": billingBudget as Any,
            "budgetAlerts": budgetAlerts as Any,
            "billingPlan": billingPlan as Any,
            "billingPlanId": billingPlanId as Any,
            "billingPlanDetails": billingPlanDetails.toMap() as Any,
            "billingEmail": billingEmail as Any,
            "billingStartDate": billingStartDate as Any,
            "billingCurrentInvoiceDate": billingCurrentInvoiceDate as Any,
            "billingNextInvoiceDate": billingNextInvoiceDate as Any,
            "billingTrialStartDate": billingTrialStartDate as Any,
            "billingTrialDays": billingTrialDays as Any,
            "billingAggregationId": billingAggregationId as Any,
            "billingInvoiceId": billingInvoiceId as Any,
            "paymentMethodId": paymentMethodId as Any,
            "billingAddressId": billingAddressId as Any,
            "backupPaymentMethodId": backupPaymentMethodId as Any,
            "status": status as Any,
            "remarks": remarks as Any,
            "agreementBAA": agreementBAA as Any,
            "programManagerName": programManagerName as Any,
            "programManagerCalendar": programManagerCalendar as Any,
            "programDiscordChannelName": programDiscordChannelName as Any,
            "programDiscordChannelUrl": programDiscordChannelUrl as Any,
            "billingLimits": billingLimits?.toMap() as Any,
            "billingPlanDowngrade": billingPlanDowngrade as Any,
            "billingTaxId": billingTaxId as Any,
            "markedForDeletion": markedForDeletion as Any,
            "platform": platform as Any,
            "projects": projects as Any
        ]
    }

    public static func from(map: [String: Any] ) -> Organization {
        return Organization(
            id: map["$id"] as! String,
            createdAt: map["$createdAt"] as! String,
            updatedAt: map["$updatedAt"] as! String,
            name: map["name"] as! String,
            total: map["total"] as! Int,
            prefs: Preferences.from(map: map["prefs"] as! [String: Any]),
            billingBudget: map["billingBudget"] as! Int,
            budgetAlerts: map["budgetAlerts"] as! [Int],
            billingPlan: map["billingPlan"] as! String,
            billingPlanId: map["billingPlanId"] as! String,
            billingPlanDetails: BillingPlan.from(map: map["billingPlanDetails"] as! [String: Any]),
            billingEmail: map["billingEmail"] as! String,
            billingStartDate: map["billingStartDate"] as! String,
            billingCurrentInvoiceDate: map["billingCurrentInvoiceDate"] as! String,
            billingNextInvoiceDate: map["billingNextInvoiceDate"] as! String,
            billingTrialStartDate: map["billingTrialStartDate"] as! String,
            billingTrialDays: map["billingTrialDays"] as! Int,
            billingAggregationId: map["billingAggregationId"] as! String,
            billingInvoiceId: map["billingInvoiceId"] as! String,
            paymentMethodId: map["paymentMethodId"] as! String,
            billingAddressId: map["billingAddressId"] as! String,
            backupPaymentMethodId: map["backupPaymentMethodId"] as! String,
            status: map["status"] as! String,
            remarks: map["remarks"] as! String,
            agreementBAA: map["agreementBAA"] as! String,
            programManagerName: map["programManagerName"] as! String,
            programManagerCalendar: map["programManagerCalendar"] as! String,
            programDiscordChannelName: map["programDiscordChannelName"] as! String,
            programDiscordChannelUrl: map["programDiscordChannelUrl"] as! String,
            billingLimits: BillingLimits.from(map: map["billingLimits"] as! [String: Any]),
            billingPlanDowngrade: map["billingPlanDowngrade"] as! String,
            billingTaxId: map["billingTaxId"] as! String,
            markedForDeletion: map["markedForDeletion"] as! Bool,
            platform: map["platform"] as! String,
            projects: map["projects"] as! [String]
        )
    }
}
