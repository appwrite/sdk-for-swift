import Foundation
import JSONCodable

/// Reports List
open class ReportList: Codable {

    enum CodingKeys: String, CodingKey {
        case total = "total"
        case reports = "reports"
    }

    /// Total number of reports that matched your query.
    public let total: Int
    /// List of reports.
    public let reports: [Report]

    init(
        total: Int,
        reports: [Report]
    ) {
        self.total = total
        self.reports = reports
    }

    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        self.total = try container.contains(.total) ? container.decode(Int.self, forKey: .total) : 0
        self.reports = try container.contains(.reports) ? container.decode([Report].self, forKey: .reports) : []
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encode(total, forKey: .total)
        try container.encode(reports, forKey: .reports)
    }

    public func toMap() -> [String: Any] {
        return [
            "total": total as Any,
            "reports": reports.map { $0.toMap() } as Any,
        ]
    }

    public static func from(map: [String: Any]) -> ReportList {
        let defaults: [String: Any] = [
            "total": 0,
            "reports": [Any](),
        ]
        let map = defaults.merging(map) { _, new in new }

        return ReportList(
            total: map["total"] as! Int,
            reports: (map["reports"] as! [[String: Any]]).map { Report.from(map: $0) }
        )
    }
}
