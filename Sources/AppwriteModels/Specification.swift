import Foundation
import JSONCodable

/// Specification
public class Specification {

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
