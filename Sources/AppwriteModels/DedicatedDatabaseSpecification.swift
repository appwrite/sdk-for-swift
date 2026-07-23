import Foundation
import JSONCodable

/// Specification
open class DedicatedDatabaseSpecification: Codable {

    enum CodingKeys: String, CodingKey {
        case slug = "slug"
        case name = "name"
        case price = "price"
        case cpu = "cpu"
        case memory = "memory"
        case maxConnections = "maxConnections"
        case includedStorage = "includedStorage"
        case includedBandwidth = "includedBandwidth"
        case enabled = "enabled"
    }

    /// Specification slug. Use this value when creating a dedicated database.
    public let slug: String
    /// Human readable specification name.
    public let name: String
    /// Monthly price of the specification in USD.
    public let price: Double
    /// Allocated CPU in millicores.
    public let cpu: Int
    /// Allocated memory in MB.
    public let memory: Int
    /// Maximum number of concurrent connections.
    public let maxConnections: Int
    /// Included storage in GB before overage charges apply.
    public let includedStorage: Int
    /// Included bandwidth in GB before overage charges apply.
    public let includedBandwidth: Int
    /// Whether the specification is available on the current plan.
    public let enabled: Bool

    init(
        slug: String,
        name: String,
        price: Double,
        cpu: Int,
        memory: Int,
        maxConnections: Int,
        includedStorage: Int,
        includedBandwidth: Int,
        enabled: Bool
    ) {
        self.slug = slug
        self.name = name
        self.price = price
        self.cpu = cpu
        self.memory = memory
        self.maxConnections = maxConnections
        self.includedStorage = includedStorage
        self.includedBandwidth = includedBandwidth
        self.enabled = enabled
    }

    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        self.slug = try container.decode(String.self, forKey: .slug)
        self.name = try container.decode(String.self, forKey: .name)
        self.price = try container.decode(Double.self, forKey: .price)
        self.cpu = try container.decode(Int.self, forKey: .cpu)
        self.memory = try container.decode(Int.self, forKey: .memory)
        self.maxConnections = try container.decode(Int.self, forKey: .maxConnections)
        self.includedStorage = try container.decode(Int.self, forKey: .includedStorage)
        self.includedBandwidth = try container.decode(Int.self, forKey: .includedBandwidth)
        self.enabled = try container.decode(Bool.self, forKey: .enabled)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encode(slug, forKey: .slug)
        try container.encode(name, forKey: .name)
        try container.encode(price, forKey: .price)
        try container.encode(cpu, forKey: .cpu)
        try container.encode(memory, forKey: .memory)
        try container.encode(maxConnections, forKey: .maxConnections)
        try container.encode(includedStorage, forKey: .includedStorage)
        try container.encode(includedBandwidth, forKey: .includedBandwidth)
        try container.encode(enabled, forKey: .enabled)
    }

    public func toMap() -> [String: Any] {
        return [
            "slug": slug as Any,
            "name": name as Any,
            "price": price as Any,
            "cpu": cpu as Any,
            "memory": memory as Any,
            "maxConnections": maxConnections as Any,
            "includedStorage": includedStorage as Any,
            "includedBandwidth": includedBandwidth as Any,
            "enabled": enabled as Any
        ]
    }

    public static func from(map: [String: Any] ) -> DedicatedDatabaseSpecification {
        return DedicatedDatabaseSpecification(
            slug: map["slug"] as! String,
            name: map["name"] as! String,
            price: map["price"] as! Double,
            cpu: map["cpu"] as! Int,
            memory: map["memory"] as! Int,
            maxConnections: map["maxConnections"] as! Int,
            includedStorage: map["includedStorage"] as! Int,
            includedBandwidth: map["includedBandwidth"] as! Int,
            enabled: map["enabled"] as! Bool
        )
    }
}
