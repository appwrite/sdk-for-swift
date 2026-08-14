import Foundation
import JSONCodable

/// Invalidation
open class ProxyInvalidation: Codable {

    enum CodingKeys: String, CodingKey {
        case domain = "domain"
        case type = "type"
        case reference = "reference"
        case status = "status"
    }

    /// Domain name.
    public let domain: String
    /// Invalidation type. Possible values are &quot;tag&quot;, &quot;path&quot;, or &quot;all&quot;.
    public let type: String
    /// Invalidated reference. Depending on type this is a cache tag name, a URL path, or empty when type is all.
    public let reference: String
    /// Invalidation status.
    public let status: String

    init(
        domain: String,
        type: String,
        reference: String,
        status: String
    ) {
        self.domain = domain
        self.type = type
        self.reference = reference
        self.status = status
    }

    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        self.domain = try container.decode(String.self, forKey: .domain)
        self.type = try container.decode(String.self, forKey: .type)
        self.reference = try container.decode(String.self, forKey: .reference)
        self.status = try container.decode(String.self, forKey: .status)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encode(domain, forKey: .domain)
        try container.encode(type, forKey: .type)
        try container.encode(reference, forKey: .reference)
        try container.encode(status, forKey: .status)
    }

    public func toMap() -> [String: Any] {
        return [
            "domain": domain as Any,
            "type": type as Any,
            "reference": reference as Any,
            "status": status as Any
        ]
    }

    public static func from(map: [String: Any] ) -> ProxyInvalidation {
        return ProxyInvalidation(
            domain: map["domain"] as! String,
            type: map["type"] as! String,
            reference: map["reference"] as! String,
            status: map["status"] as! String
        )
    }
}
