import Foundation
import JSONCodable

/// DNS records list
open class DnsRecordsList: Codable {

    enum CodingKeys: String, CodingKey {
        case total = "total"
        case dnsRecords = "dnsRecords"
    }

    /// Total number of dnsRecords that matched your query.
    public let total: Int
    /// List of dnsRecords.
    public let dnsRecords: [DnsRecord]

    init(
        total: Int,
        dnsRecords: [DnsRecord]
    ) {
        self.total = total
        self.dnsRecords = dnsRecords
    }

    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        self.total = try container.contains(.total) ? container.decode(Int.self, forKey: .total) : 0
        self.dnsRecords = try container.decode([DnsRecord].self, forKey: .dnsRecords)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encode(total, forKey: .total)
        try container.encode(dnsRecords, forKey: .dnsRecords)
    }

    public func toMap() -> [String: Any] {
        return [
            "total": total as Any,
            "dnsRecords": dnsRecords.map { $0.toMap() } as Any,
        ]
    }

    public static func from(map: [String: Any]) -> DnsRecordsList {
        let defaults: [String: Any] = [
            "total": 0,
        ]
        let map = defaults.merging(map) { _, new in new }

        return DnsRecordsList(
            total: map["total"] as! Int,
            dnsRecords: (map["dnsRecords"] as! [[String: Any]]).map { DnsRecord.from(map: $0) }
        )
    }
}
