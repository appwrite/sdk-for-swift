import AppwriteEnums
import Foundation
import JSONCodable

/// Alert
open class Alert: Codable {

    enum CodingKeys: String, CodingKey {
        case id = "$id"
        case createdAt = "$createdAt"
        case updatedAt = "$updatedAt"
        case monitorId = "monitorId"
        case projectId = "projectId"
        case name = "name"
        case status = "status"
        case resolvedAt = "resolvedAt"
        case acknowledgedAt = "acknowledgedAt"
        case acknowledgedBy = "acknowledgedBy"
        case acknowledgedByName = "acknowledgedByName"
        case escalationId = "escalationId"
        case escalationStep = "escalationStep"
        case escalationRound = "escalationRound"
        case escalatesAt = "escalatesAt"
        case rules = "rules"
        case severity = "severity"
        case metric = "metric"
        case comparator = "comparator"
        case threshold = "threshold"
        case value = "value"
        case peak = "peak"
        case type = "type"
        case resourceType = "resourceType"
        case resourceId = "resourceId"
        case notifications = "notifications"
        case latency = "latency"
        case result = "result"
    }

    /// Alert ID.
    public let id: String
    /// Date the alert started firing, in ISO 8601 format.
    public let createdAt: String
    /// Alert update date in ISO 8601 format.
    public let updatedAt: String
    /// ID of the monitor that raised the alert.
    public let monitorId: String
    /// ID of the project the alert is about. Empty for an alert of the whole organization.
    public let projectId: String
    /// Name of the monitor when the alert fired.
    public let name: String
    /// Whether the alert is still firing or has resolved.
    public let status: AppwriteEnums.AlertStatus
    /// Date the alert resolved, in ISO 8601 format. Empty while it fires.
    public let resolvedAt: String?
    /// Date a member acknowledged the alert, in ISO 8601 format. Empty while nobody has.
    public let acknowledgedAt: String?
    /// ID of the user who acknowledged the alert. Empty while nobody has, or when it was acknowledged with an API key.
    public let acknowledgedBy: String
    /// Name of the user who acknowledged the alert, when they did.
    public let acknowledgedByName: String
    /// ID of the escalation notifying the team of this alert. Empty when the monitor notified its `notify` roles instead.
    public let escalationId: String
    /// Index of the escalation&#039;s next step to notify, counting from 0. Equal to the number of steps once the last round has gone out.
    public let escalationStep: Int
    /// How many times the escalation&#039;s steps have been repeated for this alert.
    public let escalationRound: Int
    /// When the next step is notified, in ISO 8601 format. Null when nothing is due: the alert was acknowledged or resolved, or every step has gone out.
    public let escalatesAt: String?
    /// The monitor&#039;s rules when the alert fired, as query strings.
    public let rules: [String]
    /// The monitor&#039;s severity when the alert fired: `info`, `warning`, `error` or `critical`.
    public let severity: AppwriteEnums.MonitorSeverity
    /// Metric the alert fired on. Null for a probe monitor&#039;s alert.
    public let metric: AppwriteEnums.AlertMetric?
    /// How the metric was compared with the threshold. Null for a probe monitor&#039;s alert.
    public let comparator: AppwriteEnums.AlertComparator?
    /// Threshold the metric crossed, in the metric&#039;s unit.
    public let threshold: Double
    /// Latest reading while the alert fired: the metric&#039;s value for a usage monitor, and for a probe monitor its `latency`.
    public let value: Double
    /// Reading furthest past the threshold while the alert fired.
    public let peak: Double
    /// Type of the monitor that raised the alert.
    public let type: AppwriteEnums.MonitorType
    /// Type of the resource the alert fired on: the project, or one database, bucket, function or site.
    public let resourceType: AppwriteEnums.MonitorResourceType
    /// ID of the resource the alert fired on. The project ID for a project-wide monitor.
    public let resourceId: String
    /// How many times the alert was announced as firing: once when it fired, and again after each cooldown while it kept firing.
    public let notifications: Int
    /// Probe monitors: response time in milliseconds of the latest check recorded on the alert.
    public let latency: Int?
    /// What the failing check of a probe monitor found when the alert opened, such as `connect_refused`. Null for a usage monitor&#039;s alert.
    public let result: AppwriteEnums.MonitorResult?

    init(
        id: String,
        createdAt: String,
        updatedAt: String,
        monitorId: String,
        projectId: String,
        name: String,
        status: AppwriteEnums.AlertStatus,
        resolvedAt: String?,
        acknowledgedAt: String?,
        acknowledgedBy: String,
        acknowledgedByName: String,
        escalationId: String,
        escalationStep: Int,
        escalationRound: Int,
        escalatesAt: String?,
        rules: [String],
        severity: AppwriteEnums.MonitorSeverity,
        metric: AppwriteEnums.AlertMetric?,
        comparator: AppwriteEnums.AlertComparator?,
        threshold: Double,
        value: Double,
        peak: Double,
        type: AppwriteEnums.MonitorType,
        resourceType: AppwriteEnums.MonitorResourceType,
        resourceId: String,
        notifications: Int,
        latency: Int?,
        result: AppwriteEnums.MonitorResult?
    ) {
        self.id = id
        self.createdAt = createdAt
        self.updatedAt = updatedAt
        self.monitorId = monitorId
        self.projectId = projectId
        self.name = name
        self.status = status
        self.resolvedAt = resolvedAt
        self.acknowledgedAt = acknowledgedAt
        self.acknowledgedBy = acknowledgedBy
        self.acknowledgedByName = acknowledgedByName
        self.escalationId = escalationId
        self.escalationStep = escalationStep
        self.escalationRound = escalationRound
        self.escalatesAt = escalatesAt
        self.rules = rules
        self.severity = severity
        self.metric = metric
        self.comparator = comparator
        self.threshold = threshold
        self.value = value
        self.peak = peak
        self.type = type
        self.resourceType = resourceType
        self.resourceId = resourceId
        self.notifications = notifications
        self.latency = latency
        self.result = result
    }

    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        self.id = try container.contains(.id) ? container.decode(String.self, forKey: .id) : ""
        self.createdAt = try container.contains(.createdAt) ? container.decode(String.self, forKey: .createdAt) : ""
        self.updatedAt = try container.contains(.updatedAt) ? container.decode(String.self, forKey: .updatedAt) : ""
        self.monitorId = try container.contains(.monitorId) ? container.decode(String.self, forKey: .monitorId) : ""
        self.projectId = try container.contains(.projectId) ? container.decode(String.self, forKey: .projectId) : ""
        self.name = try container.contains(.name) ? container.decode(String.self, forKey: .name) : ""
        self.status = AppwriteEnums.AlertStatus(rawValue: try container.contains(.status) ? container.decode(String.self, forKey: .status) : "firing")!
        self.resolvedAt = try container.decodeIfPresent(String.self, forKey: .resolvedAt)
        self.acknowledgedAt = try container.decodeIfPresent(String.self, forKey: .acknowledgedAt)
        self.acknowledgedBy = try container.contains(.acknowledgedBy) ? container.decode(String.self, forKey: .acknowledgedBy) : ""
        self.acknowledgedByName = try container.contains(.acknowledgedByName) ? container.decode(String.self, forKey: .acknowledgedByName) : ""
        self.escalationId = try container.contains(.escalationId) ? container.decode(String.self, forKey: .escalationId) : ""
        self.escalationStep = try container.contains(.escalationStep) ? container.decode(Int.self, forKey: .escalationStep) : 0
        self.escalationRound = try container.contains(.escalationRound) ? container.decode(Int.self, forKey: .escalationRound) : 0
        self.escalatesAt = try container.decodeIfPresent(String.self, forKey: .escalatesAt)
        self.rules = try container.contains(.rules) ? container.decode([String].self, forKey: .rules) : []
        self.severity = AppwriteEnums.MonitorSeverity(rawValue: try container.contains(.severity) ? container.decode(String.self, forKey: .severity) : "warning")!
        if let metricString = try container.decodeIfPresent(String.self, forKey: .metric) {
            self.metric = AppwriteEnums.AlertMetric(rawValue: metricString)
        } else {
            self.metric = nil
        }
        if let comparatorString = try container.decodeIfPresent(String.self, forKey: .comparator) {
            self.comparator = AppwriteEnums.AlertComparator(rawValue: comparatorString)
        } else {
            self.comparator = nil
        }
        self.threshold = try container.contains(.threshold) ? container.decode(Double.self, forKey: .threshold) : 0
        self.value = try container.contains(.value) ? container.decode(Double.self, forKey: .value) : 0
        self.peak = try container.contains(.peak) ? container.decode(Double.self, forKey: .peak) : 0
        self.type = AppwriteEnums.MonitorType(rawValue: try container.contains(.type) ? container.decode(String.self, forKey: .type) : "usage")!
        self.resourceType = AppwriteEnums.MonitorResourceType(rawValue: try container.contains(.resourceType) ? container.decode(String.self, forKey: .resourceType) : "project")!
        self.resourceId = try container.contains(.resourceId) ? container.decode(String.self, forKey: .resourceId) : ""
        self.notifications = try container.contains(.notifications) ? container.decode(Int.self, forKey: .notifications) : 0
        self.latency = try container.decodeIfPresent(Int.self, forKey: .latency)
        if let resultString = try container.decodeIfPresent(String.self, forKey: .result) {
            self.result = AppwriteEnums.MonitorResult(rawValue: resultString)
        } else {
            self.result = nil
        }
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encode(id, forKey: .id)
        try container.encode(createdAt, forKey: .createdAt)
        try container.encode(updatedAt, forKey: .updatedAt)
        try container.encode(monitorId, forKey: .monitorId)
        try container.encode(projectId, forKey: .projectId)
        try container.encode(name, forKey: .name)
        try container.encode(status.rawValue, forKey: .status)
        try container.encodeIfPresent(resolvedAt, forKey: .resolvedAt)
        try container.encodeIfPresent(acknowledgedAt, forKey: .acknowledgedAt)
        try container.encode(acknowledgedBy, forKey: .acknowledgedBy)
        try container.encode(acknowledgedByName, forKey: .acknowledgedByName)
        try container.encode(escalationId, forKey: .escalationId)
        try container.encode(escalationStep, forKey: .escalationStep)
        try container.encode(escalationRound, forKey: .escalationRound)
        try container.encodeIfPresent(escalatesAt, forKey: .escalatesAt)
        try container.encode(rules, forKey: .rules)
        try container.encode(severity.rawValue, forKey: .severity)
        try container.encodeIfPresent(metric?.rawValue, forKey: .metric)
        try container.encodeIfPresent(comparator?.rawValue, forKey: .comparator)
        try container.encode(threshold, forKey: .threshold)
        try container.encode(value, forKey: .value)
        try container.encode(peak, forKey: .peak)
        try container.encode(type.rawValue, forKey: .type)
        try container.encode(resourceType.rawValue, forKey: .resourceType)
        try container.encode(resourceId, forKey: .resourceId)
        try container.encode(notifications, forKey: .notifications)
        try container.encodeIfPresent(latency, forKey: .latency)
        try container.encodeIfPresent(result?.rawValue, forKey: .result)
    }

    public func toMap() -> [String: Any] {
        return [
            "$id": id as Any,
            "$createdAt": createdAt as Any,
            "$updatedAt": updatedAt as Any,
            "monitorId": monitorId as Any,
            "projectId": projectId as Any,
            "name": name as Any,
            "status": status.rawValue as Any,
            "resolvedAt": resolvedAt as Any,
            "acknowledgedAt": acknowledgedAt as Any,
            "acknowledgedBy": acknowledgedBy as Any,
            "acknowledgedByName": acknowledgedByName as Any,
            "escalationId": escalationId as Any,
            "escalationStep": escalationStep as Any,
            "escalationRound": escalationRound as Any,
            "escalatesAt": escalatesAt as Any,
            "rules": rules as Any,
            "severity": severity.rawValue as Any,
            "metric": metric?.rawValue as Any,
            "comparator": comparator?.rawValue as Any,
            "threshold": threshold as Any,
            "value": value as Any,
            "peak": peak as Any,
            "type": type.rawValue as Any,
            "resourceType": resourceType.rawValue as Any,
            "resourceId": resourceId as Any,
            "notifications": notifications as Any,
            "latency": latency as Any,
            "result": result?.rawValue as Any,
        ]
    }

    public static func from(map: [String: Any]) -> Alert {
        let defaults: [String: Any] = [
            "$id": "",
            "$createdAt": "",
            "$updatedAt": "",
            "monitorId": "",
            "projectId": "",
            "name": "",
            "status": "firing",
            "acknowledgedBy": "",
            "acknowledgedByName": "",
            "escalationId": "",
            "escalationStep": 0,
            "escalationRound": 0,
            "rules": [Any](),
            "severity": "warning",
            "threshold": 0.0,
            "value": 0.0,
            "peak": 0.0,
            "type": "usage",
            "resourceType": "project",
            "resourceId": "",
            "notifications": 0,
        ]
        let map = defaults.merging(map) { _, new in new }

        return Alert(
            id: map["$id"] as! String,
            createdAt: map["$createdAt"] as! String,
            updatedAt: map["$updatedAt"] as! String,
            monitorId: map["monitorId"] as! String,
            projectId: map["projectId"] as! String,
            name: map["name"] as! String,
            status: AppwriteEnums.AlertStatus(rawValue: map["status"] as! String)!,
            resolvedAt: map["resolvedAt"] as? String,
            acknowledgedAt: map["acknowledgedAt"] as? String,
            acknowledgedBy: map["acknowledgedBy"] as! String,
            acknowledgedByName: map["acknowledgedByName"] as! String,
            escalationId: map["escalationId"] as! String,
            escalationStep: map["escalationStep"] as! Int,
            escalationRound: map["escalationRound"] as! Int,
            escalatesAt: map["escalatesAt"] as? String,
            rules: map["rules"] as! [String],
            severity: AppwriteEnums.MonitorSeverity(rawValue: map["severity"] as! String)!,
            metric: map["metric"] as? String != nil ? AppwriteEnums.AlertMetric(rawValue: map["metric"] as! String) : nil,
            comparator: map["comparator"] as? String != nil ? AppwriteEnums.AlertComparator(rawValue: map["comparator"] as! String) : nil,
            threshold: map["threshold"] as! Double,
            value: map["value"] as! Double,
            peak: map["peak"] as! Double,
            type: AppwriteEnums.MonitorType(rawValue: map["type"] as! String)!,
            resourceType: AppwriteEnums.MonitorResourceType(rawValue: map["resourceType"] as! String)!,
            resourceId: map["resourceId"] as! String,
            notifications: map["notifications"] as! Int,
            latency: map["latency"] as? Int,
            result: map["result"] as? String != nil ? AppwriteEnums.MonitorResult(rawValue: map["result"] as! String) : nil
        )
    }
}
