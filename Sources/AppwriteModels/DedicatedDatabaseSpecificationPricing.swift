import Foundation
import JSONCodable

/// SpecificationPricing
open class DedicatedDatabaseSpecificationPricing: Codable {

    enum CodingKeys: String, CodingKey {
        case storageOverageRate = "storageOverageRate"
        case bandwidthOverageRate = "bandwidthOverageRate"
        case replicaRate = "replicaRate"
        case pitrRate = "pitrRate"
    }

    /// Price per GB of storage above the included amount, per month, in USD.
    public let storageOverageRate: Double
    /// Price per GB of bandwidth above the included amount, per month, in USD.
    public let bandwidthOverageRate: Double
    /// High availability replica price as a fraction of the specification cost.
    public let replicaRate: Double
    /// Point-in-time recovery price as a fraction of the specification cost.
    public let pitrRate: Double

    init(
        storageOverageRate: Double,
        bandwidthOverageRate: Double,
        replicaRate: Double,
        pitrRate: Double
    ) {
        self.storageOverageRate = storageOverageRate
        self.bandwidthOverageRate = bandwidthOverageRate
        self.replicaRate = replicaRate
        self.pitrRate = pitrRate
    }

    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        self.storageOverageRate = try container.decode(Double.self, forKey: .storageOverageRate)
        self.bandwidthOverageRate = try container.decode(Double.self, forKey: .bandwidthOverageRate)
        self.replicaRate = try container.decode(Double.self, forKey: .replicaRate)
        self.pitrRate = try container.decode(Double.self, forKey: .pitrRate)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encode(storageOverageRate, forKey: .storageOverageRate)
        try container.encode(bandwidthOverageRate, forKey: .bandwidthOverageRate)
        try container.encode(replicaRate, forKey: .replicaRate)
        try container.encode(pitrRate, forKey: .pitrRate)
    }

    public func toMap() -> [String: Any] {
        return [
            "storageOverageRate": storageOverageRate as Any,
            "bandwidthOverageRate": bandwidthOverageRate as Any,
            "replicaRate": replicaRate as Any,
            "pitrRate": pitrRate as Any,
        ]
    }

    public static func from(map: [String: Any]) -> DedicatedDatabaseSpecificationPricing {
        return DedicatedDatabaseSpecificationPricing(
            storageOverageRate: map["storageOverageRate"] as! Double,
            bandwidthOverageRate: map["bandwidthOverageRate"] as! Double,
            replicaRate: map["replicaRate"] as! Double,
            pitrRate: map["pitrRate"] as! Double
        )
    }
}
