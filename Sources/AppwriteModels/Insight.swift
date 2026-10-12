import Foundation
import JSONCodable

/// Insight
open class Insight: Codable {

    enum CodingKeys: String, CodingKey {
        case id = "$id"
        case createdAt = "$createdAt"
        case updatedAt = "$updatedAt"
        case reportId = "reportId"
        case type = "type"
        case severity = "severity"
        case status = "status"
        case resourceType = "resourceType"
        case resourceId = "resourceId"
        case parentResourceType = "parentResourceType"
        case parentResourceId = "parentResourceId"
        case title = "title"
        case summary = "summary"
        case ctas = "ctas"
        case analyzedAt = "analyzedAt"
        case dismissedAt = "dismissedAt"
        case dismissedBy = "dismissedBy"
    }

    /// Insight ID.
    public let id: String
    /// Insight creation date in ISO 8601 format.
    public let createdAt: String
    /// Insight update date in ISO 8601 format.
    public let updatedAt: String
    /// Parent report ID. Insights always belong to a report.
    public let reportId: String
    /// Insight type. One of databaseIndex (legacy), tablesDBIndex, documentsDBIndex, vectorsDBIndex, databasePerformance, sitePerformance, siteAccessibility, siteSeo, functionPerformance. The index types are engine-specific so each CTA can pair the right service+method (databases.createIndex, tablesDB.createIndex, documentsDB.createIndex, or vectorsDB.createIndex).
    public let type: String
    /// Insight severity. One of info, warning, critical.
    public let severity: String
    /// Insight status. One of active, dismissed.
    public let status: String
    /// Type of the resource the insight is about. Plural noun, e.g. databases, sites, functions.
    public let resourceType: String
    /// ID of the resource the insight is about.
    public let resourceId: String
    /// Plural noun for the parent resource that contains the insight&#039;s resource, e.g. an insight about a column index on a table → resourceType=indexes, parentResourceType=tables. Empty when the resource has no parent.
    public let parentResourceType: String
    /// ID of the parent resource. Empty when the resource has no parent.
    public let parentResourceId: String
    /// Insight title.
    public let title: String
    /// Short markdown summary describing the insight.
    public let summary: String
    /// List of call-to-action buttons attached to this insight.
    public let ctas: [InsightCTA]
    /// Time the insight was analyzed in ISO 8601 format.
    public let analyzedAt: String?
    /// Time the insight was dismissed in ISO 8601 format. Empty when not dismissed.
    public let dismissedAt: String?
    /// User ID that dismissed the insight. Empty when not dismissed.
    public let dismissedBy: String?

    init(
        id: String,
        createdAt: String,
        updatedAt: String,
        reportId: String,
        type: String,
        severity: String,
        status: String,
        resourceType: String,
        resourceId: String,
        parentResourceType: String,
        parentResourceId: String,
        title: String,
        summary: String,
        ctas: [InsightCTA],
        analyzedAt: String?,
        dismissedAt: String?,
        dismissedBy: String?
    ) {
        self.id = id
        self.createdAt = createdAt
        self.updatedAt = updatedAt
        self.reportId = reportId
        self.type = type
        self.severity = severity
        self.status = status
        self.resourceType = resourceType
        self.resourceId = resourceId
        self.parentResourceType = parentResourceType
        self.parentResourceId = parentResourceId
        self.title = title
        self.summary = summary
        self.ctas = ctas
        self.analyzedAt = analyzedAt
        self.dismissedAt = dismissedAt
        self.dismissedBy = dismissedBy
    }

    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        self.id = try container.contains(.id) ? container.decode(String.self, forKey: .id) : ""
        self.createdAt = try container.contains(.createdAt) ? container.decode(String.self, forKey: .createdAt) : ""
        self.updatedAt = try container.contains(.updatedAt) ? container.decode(String.self, forKey: .updatedAt) : ""
        self.reportId = try container.contains(.reportId) ? container.decode(String.self, forKey: .reportId) : ""
        self.type = try container.contains(.type) ? container.decode(String.self, forKey: .type) : ""
        self.severity = try container.contains(.severity) ? container.decode(String.self, forKey: .severity) : "info"
        self.status = try container.contains(.status) ? container.decode(String.self, forKey: .status) : "active"
        self.resourceType = try container.contains(.resourceType) ? container.decode(String.self, forKey: .resourceType) : ""
        self.resourceId = try container.contains(.resourceId) ? container.decode(String.self, forKey: .resourceId) : ""
        self.parentResourceType = try container.contains(.parentResourceType) ? container.decode(String.self, forKey: .parentResourceType) : ""
        self.parentResourceId = try container.contains(.parentResourceId) ? container.decode(String.self, forKey: .parentResourceId) : ""
        self.title = try container.contains(.title) ? container.decode(String.self, forKey: .title) : ""
        self.summary = try container.contains(.summary) ? container.decode(String.self, forKey: .summary) : ""
        self.ctas = try container.decode([InsightCTA].self, forKey: .ctas)
        self.analyzedAt = try container.decodeIfPresent(String.self, forKey: .analyzedAt)
        self.dismissedAt = try container.decodeIfPresent(String.self, forKey: .dismissedAt)
        self.dismissedBy = try container.decodeIfPresent(String.self, forKey: .dismissedBy)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encode(id, forKey: .id)
        try container.encode(createdAt, forKey: .createdAt)
        try container.encode(updatedAt, forKey: .updatedAt)
        try container.encode(reportId, forKey: .reportId)
        try container.encode(type, forKey: .type)
        try container.encode(severity, forKey: .severity)
        try container.encode(status, forKey: .status)
        try container.encode(resourceType, forKey: .resourceType)
        try container.encode(resourceId, forKey: .resourceId)
        try container.encode(parentResourceType, forKey: .parentResourceType)
        try container.encode(parentResourceId, forKey: .parentResourceId)
        try container.encode(title, forKey: .title)
        try container.encode(summary, forKey: .summary)
        try container.encode(ctas, forKey: .ctas)
        try container.encodeIfPresent(analyzedAt, forKey: .analyzedAt)
        try container.encodeIfPresent(dismissedAt, forKey: .dismissedAt)
        try container.encodeIfPresent(dismissedBy, forKey: .dismissedBy)
    }

    public func toMap() -> [String: Any] {
        return [
            "$id": id as Any,
            "$createdAt": createdAt as Any,
            "$updatedAt": updatedAt as Any,
            "reportId": reportId as Any,
            "type": type as Any,
            "severity": severity as Any,
            "status": status as Any,
            "resourceType": resourceType as Any,
            "resourceId": resourceId as Any,
            "parentResourceType": parentResourceType as Any,
            "parentResourceId": parentResourceId as Any,
            "title": title as Any,
            "summary": summary as Any,
            "ctas": ctas.map { $0.toMap() } as Any,
            "analyzedAt": analyzedAt as Any,
            "dismissedAt": dismissedAt as Any,
            "dismissedBy": dismissedBy as Any,
        ]
    }

    public static func from(map: [String: Any]) -> Insight {
        let defaults: [String: Any] = [
            "$id": "",
            "$createdAt": "",
            "$updatedAt": "",
            "reportId": "",
            "type": "",
            "severity": "info",
            "status": "active",
            "resourceType": "",
            "resourceId": "",
            "parentResourceType": "",
            "parentResourceId": "",
            "title": "",
            "summary": "",
        ]
        let map = defaults.merging(map) { _, new in new }

        return Insight(
            id: map["$id"] as! String,
            createdAt: map["$createdAt"] as! String,
            updatedAt: map["$updatedAt"] as! String,
            reportId: map["reportId"] as! String,
            type: map["type"] as! String,
            severity: map["severity"] as! String,
            status: map["status"] as! String,
            resourceType: map["resourceType"] as! String,
            resourceId: map["resourceId"] as! String,
            parentResourceType: map["parentResourceType"] as! String,
            parentResourceId: map["parentResourceId"] as! String,
            title: map["title"] as! String,
            summary: map["summary"] as! String,
            ctas: (map["ctas"] as! [[String: Any]]).map { InsightCTA.from(map: $0) },
            analyzedAt: map["analyzedAt"] as? String,
            dismissedAt: map["dismissedAt"] as? String,
            dismissedBy: map["dismissedBy"] as? String
        )
    }
}
