import Foundation
import JSONCodable

/// Email Templates List
open class EmailTemplateList: Codable {

    enum CodingKeys: String, CodingKey {
        case total = "total"
        case templates = "templates"
    }

    /// Total number of templates that matched your query.
    public let total: Int
    /// List of templates.
    public let templates: [EmailTemplate]

    init(
        total: Int,
        templates: [EmailTemplate]
    ) {
        self.total = total
        self.templates = templates
    }

    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        self.total = try container.decode(Int.self, forKey: .total)
        self.templates = try container.decode([EmailTemplate].self, forKey: .templates)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encode(total, forKey: .total)
        try container.encode(templates, forKey: .templates)
    }

    public func toMap() -> [String: Any] {
        return [
            "total": total as Any,
            "templates": templates.map { $0.toMap() } as Any
        ]
    }

    public static func from(map: [String: Any] ) -> EmailTemplateList {
        return EmailTemplateList(
            total: map["total"] as! Int,
            templates: (map["templates"] as! [[String: Any]]).map { EmailTemplate.from(map: $0) }
        )
    }
}
