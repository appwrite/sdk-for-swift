import Foundation
import JSONCodable

/// Analytics annotations list
open class AnalyticsAnnotationList: Codable {

    enum CodingKeys: String, CodingKey {
        case total = "total"
        case annotations = "annotations"
    }

    /// Total number of annotations that matched your query.
    public let total: Int
    /// List of annotations.
    public let annotations: [AnalyticsAnnotation]

    init(
        total: Int,
        annotations: [AnalyticsAnnotation]
    ) {
        self.total = total
        self.annotations = annotations
    }

    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        self.total = try container.contains(.total) ? container.decode(Int.self, forKey: .total) : 0
        self.annotations = try container.contains(.annotations) ? container.decode([AnalyticsAnnotation].self, forKey: .annotations) : []
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encode(total, forKey: .total)
        try container.encode(annotations, forKey: .annotations)
    }

    public func toMap() -> [String: Any] {
        return [
            "total": total as Any,
            "annotations": annotations.map { $0.toMap() } as Any,
        ]
    }

    public static func from(map: [String: Any]) -> AnalyticsAnnotationList {
        let defaults: [String: Any] = [
            "total": 0,
            "annotations": [Any](),
        ]
        let map = defaults.merging(map) { _, new in new }

        return AnalyticsAnnotationList(
            total: map["total"] as! Int,
            annotations: (map["annotations"] as! [[String: Any]]).map { AnalyticsAnnotation.from(map: $0) }
        )
    }
}
