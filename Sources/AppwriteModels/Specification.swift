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

        self.memory = try container.decode(Int.self, forKey: .memory)
        self.cpus = try container.decode(Double.self, forKey: .cpus)
        self.enabled = try container.decode(Bool.self, forKey: .enabled)
        self.slug = try container.decode(String.self, forKey: .slug)
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
            "slug": slug as Any
        ]
    }

    public static func from(map: [String: Any] ) -> Specification {
        return Specification(
            memory: map["memory"] as! Int,
            cpus: map["cpus"] as! Double,
            enabled: map["enabled"] as! Bool,
            slug: map["slug"] as! String
        )
    }
}
