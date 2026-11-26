import AppwriteEnums
import Foundation
import JSONCodable

/// Monitor
open class Monitor: Codable {

    enum CodingKeys: String, CodingKey {
        case id = "$id"
        case createdAt = "$createdAt"
        case updatedAt = "$updatedAt"
        case name = "name"
        case projectId = "projectId"
        case rules = "rules"
        case type = "type"
        case resourceType = "resourceType"
        case resourceId = "resourceId"
        case window = "window"
        case cooldown = "cooldown"
        case enabled = "enabled"
        case notify = "notify"
        case escalationId = "escalationId"
        case severity = "severity"
        case status = "status"
        case value = "value"
        case evaluatedAt = "evaluatedAt"
        case alertId = "alertId"
        case triggeredAt = "triggeredAt"
        case interval = "interval"
        case timeout = "timeout"
        case url = "url"
        case method = "method"
        case headers = "headers"
        case body = "body"
        case domain = "domain"
        case record = "record"
        case resolver = "resolver"
        case host = "host"
        case port = "port"
        case tlsMode = "tlsMode"
        case result = "result"
        case latency = "latency"
        case code = "code"
        case certificateExpiresAt = "certificateExpiresAt"
    }

    /// Monitor ID.
    public let id: String
    /// Monitor creation date in ISO 8601 format.
    public let createdAt: String
    /// Monitor update date in ISO 8601 format.
    public let updatedAt: String
    /// Monitor name.
    public let name: String
    /// Project ID.
    public let projectId: String
    /// Rules that must all hold for the monitor to fire, as query strings. A usage monitor has one comparing a metric with a threshold, optionally scoped with `equal(&#039;resourceType&#039;)` and `equal(&#039;resourceId&#039;)`. A probe monitor fires when its rules match the check, over these variables: `http` `statusCode`, `latency`, `certificateDays` and `certificateLifetime`; `dns` `answer`, `answers` and `latency`; `tcp` `latency`; `smtp` `code`, `latency`, `certificateDays` and `certificateLifetime`. A failed connection fires whatever the rules.
    public let rules: [String]
    /// What the monitor checks: `usage` compares a usage metric with a threshold; `http`, `dns`, `tcp` and `smtp` probe a target on their own interval.
    public let type: AppwriteEnums.MonitorType
    /// Type of the resource the monitor watches, from its rules: the project, or one database, bucket, function or site.
    public let resourceType: AppwriteEnums.MonitorResourceType
    /// ID of the resource the monitor watches, from its rules. The project ID for a project-wide monitor.
    public let resourceId: String
    /// Seconds a counter metric is summed over, and a growth metric is measured across. Gauges compare their latest value. Usage is read a short lag behind the evaluation (`_APP_ALERTS_USAGE_LAG`, 120 seconds by default) so events still being written are counted by the next evaluation.
    public let window: Int
    /// Minimum seconds between two team notifications of this monitor firing. Events fire on every change regardless.
    public let cooldown: Int
    /// Whether the monitor is evaluated.
    public let enabled: Bool
    /// Organization roles whose confirmed members get an email and a console notification when the monitor fires and resolves. Empty when the alert events are the only delivery. Not used while `escalationId` is set.
    public let notify: [String]
    /// ID of the organization&#039;s escalation that notifies the team of this monitor&#039;s alerts, step by step until one is acknowledged. When set, `notify` is not used. Empty to notify the `notify` roles once.
    public let escalationId: String
    /// How urgent the monitor&#039;s alerts are: `info`, `warning`, `error` or `critical`. Critical alerts may be delivered with higher urgency by the notification channels that support it.
    public let severity: AppwriteEnums.MonitorSeverity
    /// Whether the monitor is firing, as of its last evaluation.
    public let status: AppwriteEnums.MonitorStatus
    /// Metric value at the last evaluation. Null before the first evaluation, and when the last evaluation (`evaluatedAt`) found no usage recorded to read: without data a monitor is not compared, so it keeps its status and open alert.
    public let value: Double?
    /// Last evaluation date in ISO 8601 format.
    public let evaluatedAt: String?
    /// ID of the alert the monitor is firing for. Empty while it is not firing.
    public let alertId: String
    /// Date the monitor last announced an alert, in ISO 8601 format.
    public let triggeredAt: String?
    /// Probe monitors: seconds between two checks, read back raised to the plan&#039;s minimum. 0 for usage monitors, which are evaluated on the server&#039;s interval.
    public let interval: Int
    /// Probe monitors: seconds a check may take before it fails.
    public let timeout: Int
    /// HTTP monitors: URL requested.
    public let url: String
    /// HTTP monitors: method the URL is requested with. Null for other types.
    public let method: AppwriteEnums.MonitorMethod?
    /// HTTP monitors: headers sent, as an object of header names and values.
    public let headers: [String: AnyCodable]?
    /// HTTP monitors: request body sent.
    public let body: String
    /// DNS monitors: domain queried.
    public let domain: String
    /// DNS monitors: record type queried. Null for other types.
    public let record: AppwriteEnums.MonitorRecord?
    /// DNS monitors: resolver queried. Empty for the server&#039;s DNS resolver.
    public let resolver: String
    /// TCP and SMTP monitors: hostname or IP address connected to.
    public let host: String
    /// TCP and SMTP monitors: port connected to.
    public let port: Int
    /// SMTP monitors: how the connection is secured. `auto` picks implicit TLS on port 465, STARTTLS on 587 and none otherwise. Null for other types.
    public let tlsMode: AppwriteEnums.MonitorTlsMode?
    /// Probe monitors: what the last check found. `ok` passes; anything else opened the monitor&#039;s alert. Null before the first check.
    public let result: AppwriteEnums.MonitorResult?
    /// Probe monitors: milliseconds the last check took.
    public let latency: Int?
    /// Probe monitors: last status code an HTTP target answered with, reply code an SMTP server sent, or response code a DNS resolver returned.
    public let code: Int?
    /// Probe monitors: expiry date of the TLS certificate the last check saw, in ISO 8601 format. Null without TLS.
    public let certificateExpiresAt: String?

    init(
        id: String,
        createdAt: String,
        updatedAt: String,
        name: String,
        projectId: String,
        rules: [String],
        type: AppwriteEnums.MonitorType,
        resourceType: AppwriteEnums.MonitorResourceType,
        resourceId: String,
        window: Int,
        cooldown: Int,
        enabled: Bool,
        notify: [String],
        escalationId: String,
        severity: AppwriteEnums.MonitorSeverity,
        status: AppwriteEnums.MonitorStatus,
        value: Double?,
        evaluatedAt: String?,
        alertId: String,
        triggeredAt: String?,
        interval: Int,
        timeout: Int,
        url: String,
        method: AppwriteEnums.MonitorMethod?,
        headers: [String: AnyCodable]?,
        body: String,
        domain: String,
        record: AppwriteEnums.MonitorRecord?,
        resolver: String,
        host: String,
        port: Int,
        tlsMode: AppwriteEnums.MonitorTlsMode?,
        result: AppwriteEnums.MonitorResult?,
        latency: Int?,
        code: Int?,
        certificateExpiresAt: String?
    ) {
        self.id = id
        self.createdAt = createdAt
        self.updatedAt = updatedAt
        self.name = name
        self.projectId = projectId
        self.rules = rules
        self.type = type
        self.resourceType = resourceType
        self.resourceId = resourceId
        self.window = window
        self.cooldown = cooldown
        self.enabled = enabled
        self.notify = notify
        self.escalationId = escalationId
        self.severity = severity
        self.status = status
        self.value = value
        self.evaluatedAt = evaluatedAt
        self.alertId = alertId
        self.triggeredAt = triggeredAt
        self.interval = interval
        self.timeout = timeout
        self.url = url
        self.method = method
        self.headers = headers
        self.body = body
        self.domain = domain
        self.record = record
        self.resolver = resolver
        self.host = host
        self.port = port
        self.tlsMode = tlsMode
        self.result = result
        self.latency = latency
        self.code = code
        self.certificateExpiresAt = certificateExpiresAt
    }

    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        self.id = try container.contains(.id) ? container.decode(String.self, forKey: .id) : ""
        self.createdAt = try container.contains(.createdAt) ? container.decode(String.self, forKey: .createdAt) : ""
        self.updatedAt = try container.contains(.updatedAt) ? container.decode(String.self, forKey: .updatedAt) : ""
        self.name = try container.contains(.name) ? container.decode(String.self, forKey: .name) : ""
        self.projectId = try container.contains(.projectId) ? container.decode(String.self, forKey: .projectId) : ""
        self.rules = try container.contains(.rules) ? container.decode([String].self, forKey: .rules) : []
        self.type = AppwriteEnums.MonitorType(rawValue: try container.contains(.type) ? container.decode(String.self, forKey: .type) : "usage")!
        self.resourceType = AppwriteEnums.MonitorResourceType(rawValue: try container.contains(.resourceType) ? container.decode(String.self, forKey: .resourceType) : "project")!
        self.resourceId = try container.contains(.resourceId) ? container.decode(String.self, forKey: .resourceId) : ""
        self.window = try container.contains(.window) ? container.decode(Int.self, forKey: .window) : 3600
        self.cooldown = try container.contains(.cooldown) ? container.decode(Int.self, forKey: .cooldown) : 3600
        self.enabled = try container.contains(.enabled) ? container.decode(Bool.self, forKey: .enabled) : true
        self.notify = try container.contains(.notify) ? container.decode([String].self, forKey: .notify) : [
        "owner"
    ]
        self.escalationId = try container.contains(.escalationId) ? container.decode(String.self, forKey: .escalationId) : ""
        self.severity = AppwriteEnums.MonitorSeverity(rawValue: try container.contains(.severity) ? container.decode(String.self, forKey: .severity) : "warning")!
        self.status = AppwriteEnums.MonitorStatus(rawValue: try container.contains(.status) ? container.decode(String.self, forKey: .status) : "ok")!
        self.value = try container.decodeIfPresent(Double.self, forKey: .value)
        self.evaluatedAt = try container.decodeIfPresent(String.self, forKey: .evaluatedAt)
        self.alertId = try container.contains(.alertId) ? container.decode(String.self, forKey: .alertId) : ""
        self.triggeredAt = try container.decodeIfPresent(String.self, forKey: .triggeredAt)
        self.interval = try container.contains(.interval) ? container.decode(Int.self, forKey: .interval) : 0
        self.timeout = try container.contains(.timeout) ? container.decode(Int.self, forKey: .timeout) : 0
        self.url = try container.contains(.url) ? container.decode(String.self, forKey: .url) : ""
        if let methodString = try container.decodeIfPresent(String.self, forKey: .method) {
            self.method = AppwriteEnums.MonitorMethod(rawValue: methodString)
        } else {
            self.method = nil
        }
        self.headers = try container.decodeIfPresent([String: AnyCodable].self, forKey: .headers)
        self.body = try container.contains(.body) ? container.decode(String.self, forKey: .body) : ""
        self.domain = try container.contains(.domain) ? container.decode(String.self, forKey: .domain) : ""
        if let recordString = try container.decodeIfPresent(String.self, forKey: .record) {
            self.record = AppwriteEnums.MonitorRecord(rawValue: recordString)
        } else {
            self.record = nil
        }
        self.resolver = try container.contains(.resolver) ? container.decode(String.self, forKey: .resolver) : ""
        self.host = try container.contains(.host) ? container.decode(String.self, forKey: .host) : ""
        self.port = try container.contains(.port) ? container.decode(Int.self, forKey: .port) : 0
        if let tlsModeString = try container.decodeIfPresent(String.self, forKey: .tlsMode) {
            self.tlsMode = AppwriteEnums.MonitorTlsMode(rawValue: tlsModeString)
        } else {
            self.tlsMode = nil
        }
        if let resultString = try container.decodeIfPresent(String.self, forKey: .result) {
            self.result = AppwriteEnums.MonitorResult(rawValue: resultString)
        } else {
            self.result = nil
        }
        self.latency = try container.decodeIfPresent(Int.self, forKey: .latency)
        self.code = try container.decodeIfPresent(Int.self, forKey: .code)
        self.certificateExpiresAt = try container.decodeIfPresent(String.self, forKey: .certificateExpiresAt)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encode(id, forKey: .id)
        try container.encode(createdAt, forKey: .createdAt)
        try container.encode(updatedAt, forKey: .updatedAt)
        try container.encode(name, forKey: .name)
        try container.encode(projectId, forKey: .projectId)
        try container.encode(rules, forKey: .rules)
        try container.encode(type.rawValue, forKey: .type)
        try container.encode(resourceType.rawValue, forKey: .resourceType)
        try container.encode(resourceId, forKey: .resourceId)
        try container.encode(window, forKey: .window)
        try container.encode(cooldown, forKey: .cooldown)
        try container.encode(enabled, forKey: .enabled)
        try container.encode(notify, forKey: .notify)
        try container.encode(escalationId, forKey: .escalationId)
        try container.encode(severity.rawValue, forKey: .severity)
        try container.encode(status.rawValue, forKey: .status)
        try container.encodeIfPresent(value, forKey: .value)
        try container.encodeIfPresent(evaluatedAt, forKey: .evaluatedAt)
        try container.encode(alertId, forKey: .alertId)
        try container.encodeIfPresent(triggeredAt, forKey: .triggeredAt)
        try container.encode(interval, forKey: .interval)
        try container.encode(timeout, forKey: .timeout)
        try container.encode(url, forKey: .url)
        try container.encodeIfPresent(method?.rawValue, forKey: .method)
        try container.encodeIfPresent(headers, forKey: .headers)
        try container.encode(body, forKey: .body)
        try container.encode(domain, forKey: .domain)
        try container.encodeIfPresent(record?.rawValue, forKey: .record)
        try container.encode(resolver, forKey: .resolver)
        try container.encode(host, forKey: .host)
        try container.encode(port, forKey: .port)
        try container.encodeIfPresent(tlsMode?.rawValue, forKey: .tlsMode)
        try container.encodeIfPresent(result?.rawValue, forKey: .result)
        try container.encodeIfPresent(latency, forKey: .latency)
        try container.encodeIfPresent(code, forKey: .code)
        try container.encodeIfPresent(certificateExpiresAt, forKey: .certificateExpiresAt)
    }

    public func toMap() -> [String: Any] {
        return [
            "$id": id as Any,
            "$createdAt": createdAt as Any,
            "$updatedAt": updatedAt as Any,
            "name": name as Any,
            "projectId": projectId as Any,
            "rules": rules as Any,
            "type": type.rawValue as Any,
            "resourceType": resourceType.rawValue as Any,
            "resourceId": resourceId as Any,
            "window": window as Any,
            "cooldown": cooldown as Any,
            "enabled": enabled as Any,
            "notify": notify as Any,
            "escalationId": escalationId as Any,
            "severity": severity.rawValue as Any,
            "status": status.rawValue as Any,
            "value": value as Any,
            "evaluatedAt": evaluatedAt as Any,
            "alertId": alertId as Any,
            "triggeredAt": triggeredAt as Any,
            "interval": interval as Any,
            "timeout": timeout as Any,
            "url": url as Any,
            "method": method?.rawValue as Any,
            "headers": headers as Any,
            "body": body as Any,
            "domain": domain as Any,
            "record": record?.rawValue as Any,
            "resolver": resolver as Any,
            "host": host as Any,
            "port": port as Any,
            "tlsMode": tlsMode?.rawValue as Any,
            "result": result?.rawValue as Any,
            "latency": latency as Any,
            "code": code as Any,
            "certificateExpiresAt": certificateExpiresAt as Any,
        ]
    }

    public static func from(map: [String: Any]) -> Monitor {
        let defaults: [String: Any] = [
            "$id": "",
            "$createdAt": "",
            "$updatedAt": "",
            "name": "",
            "projectId": "",
            "rules": [Any](),
            "type": "usage",
            "resourceType": "project",
            "resourceId": "",
            "window": 3600,
            "cooldown": 3600,
            "enabled": true,
            "notify": ["owner"] as [Any],
            "escalationId": "",
            "severity": "warning",
            "status": "ok",
            "alertId": "",
            "interval": 0,
            "timeout": 0,
            "url": "",
            "body": "",
            "domain": "",
            "resolver": "",
            "host": "",
            "port": 0,
        ]
        let map = defaults.merging(map) { _, new in new }

        return Monitor(
            id: map["$id"] as! String,
            createdAt: map["$createdAt"] as! String,
            updatedAt: map["$updatedAt"] as! String,
            name: map["name"] as! String,
            projectId: map["projectId"] as! String,
            rules: map["rules"] as! [String],
            type: AppwriteEnums.MonitorType(rawValue: map["type"] as! String)!,
            resourceType: AppwriteEnums.MonitorResourceType(rawValue: map["resourceType"] as! String)!,
            resourceId: map["resourceId"] as! String,
            window: map["window"] as! Int,
            cooldown: map["cooldown"] as! Int,
            enabled: map["enabled"] as! Bool,
            notify: map["notify"] as! [String],
            escalationId: map["escalationId"] as! String,
            severity: AppwriteEnums.MonitorSeverity(rawValue: map["severity"] as! String)!,
            status: AppwriteEnums.MonitorStatus(rawValue: map["status"] as! String)!,
            value: map["value"] as? Double,
            evaluatedAt: map["evaluatedAt"] as? String,
            alertId: map["alertId"] as! String,
            triggeredAt: map["triggeredAt"] as? String,
            interval: map["interval"] as! Int,
            timeout: map["timeout"] as! Int,
            url: map["url"] as! String,
            method: map["method"] as? String != nil ? AppwriteEnums.MonitorMethod(rawValue: map["method"] as! String) : nil,
            headers: (map["headers"] as? [String: Any])?.mapValues { AnyCodable($0) },
            body: map["body"] as! String,
            domain: map["domain"] as! String,
            record: map["record"] as? String != nil ? AppwriteEnums.MonitorRecord(rawValue: map["record"] as! String) : nil,
            resolver: map["resolver"] as! String,
            host: map["host"] as! String,
            port: map["port"] as! Int,
            tlsMode: map["tlsMode"] as? String != nil ? AppwriteEnums.MonitorTlsMode(rawValue: map["tlsMode"] as! String) : nil,
            result: map["result"] as? String != nil ? AppwriteEnums.MonitorResult(rawValue: map["result"] as! String) : nil,
            latency: map["latency"] as? Int,
            code: map["code"] as? Int,
            certificateExpiresAt: map["certificateExpiresAt"] as? String
        )
    }
}
