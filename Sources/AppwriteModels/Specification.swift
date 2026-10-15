import Foundation
import JSONCodable

/// Specification
open class Specification: Codable {

    enum CodingKeys: String, CodingKey {
        case memory = "memory"
        case cpus = "cpus"
        case enabled = "enabled"
        case slug = "slug"
    }

    /// Memory size in MB.
    public let memory: Int
    /// Number of CPUs.
    public let cpus: Double
    /// Is size enabled.
    public let enabled: Bool
    /// Size slug.
    public let slug: String

    init(
        memory: Int,
        cpus: Double,
        enabled: Bool,
        slug: String
    ) {
        self.memory = memory
        self.cpus = cpus
        self.enabled = enabled
        self.slug = slug
    }

    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        self.memory = try container.contains(.memory) ? container.decode(Int.self, forKey: .memory) : 0
        self.cpus = try container.contains(.cpus) ? container.decode(Double.self, forKey: .cpus) : 0
        self.enabled = try container.contains(.enabled) ? container.decode(Bool.self, forKey: .enabled) : false
        self.slug = try container.contains(.slug) ? container.decode(String.self, forKey: .slug) : ""
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encode(memory, forKey: .memory)
        try container.encode(cpus, forKey: .cpus)
        try container.encode(enabled, forKey: .enabled)
        try container.encode(slug, forKey: .slug)
    }

    public func toMap() -> [String: Any] {
        return [
            "memory": memory as Any,
            "cpus": cpus as Any,
            "enabled": enabled as Any,
            "slug": slug as Any,
        ]
    }

    public static func from(map: [String: Any]) -> Specification {
        let defaults: [String: Any] = [
            "memory": 0,
            "cpus": 0.0,
            "enabled": false,
            "slug": "",
        ]
        let map = defaults.merging(map) { _, new in new }

        return Specification(
            memory: map["memory"] as! Int,
            cpus: map["cpus"] as! Double,
            enabled: map["enabled"] as! Bool,
            slug: map["slug"] as! String
        )
    }
}
