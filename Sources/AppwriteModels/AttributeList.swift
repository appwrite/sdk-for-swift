import Foundation
import JSONCodable

/// Attributes List
open class AttributeList: Codable {

    enum CodingKeys: String, CodingKey {
        case total = "total"
        case attributes = "attributes"
    }

    /// Total number of attributes in the given collection.
    public let total: Int
    /// List of attributes.
    public let attributes: [AnyCodable]

    init(
        total: Int,
        attributes: [AnyCodable]
    ) {
        self.total = total
        self.attributes = attributes
    }

    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        self.total = try container.contains(.total) ? container.decode(Int.self, forKey: .total) : 0
        self.attributes = try container.decode([AnyCodable].self, forKey: .attributes)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encode(total, forKey: .total)
        try container.encode(attributes, forKey: .attributes)
    }

    public func toMap() -> [String: Any] {
        return [
            "total": total as Any,
            "attributes": attributes as Any,
        ]
    }

    public static func from(map: [String: Any]) -> AttributeList {
        let defaults: [String: Any] = [
            "total": 0,
        ]
        let map = defaults.merging(map) { _, new in new }

        return AttributeList(
            total: map["total"] as! Int,
            attributes: (map["attributes"] as! [Any]).map { AnyCodable($0) }
        )
    }
}
