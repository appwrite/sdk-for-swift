import Foundation
import JSONCodable

/// Escalation
open class Escalation: Codable {

    enum CodingKeys: String, CodingKey {
        case id = "$id"
        case createdAt = "$createdAt"
        case updatedAt = "$updatedAt"
        case name = "name"
        case steps = "steps"
        case `repeat` = "repeat"
    }

    /// Escalation ID.
    public let id: String
    /// Escalation creation date in ISO 8601 format.
    public let createdAt: String
    /// Escalation update date in ISO 8601 format.
    public let updatedAt: String
    /// Escalation name.
    public let name: String
    /// Who is notified of a firing alert, in order, until a member acknowledges it.
    public let steps: [EscalationStep]
    /// How many more times the steps run from the first, a monitor&#039;s cooldown after the last step, while nobody has acknowledged the alert.
    public let `repeat`: Int

    init(
        id: String,
        createdAt: String,
        updatedAt: String,
        name: String,
        steps: [EscalationStep],
        `repeat`: Int
    ) {
        self.id = id
        self.createdAt = createdAt
        self.updatedAt = updatedAt
        self.name = name
        self.steps = steps
        self.`repeat` = `repeat`
    }

    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        self.id = try container.contains(.id) ? container.decode(String.self, forKey: .id) : ""
        self.createdAt = try container.contains(.createdAt) ? container.decode(String.self, forKey: .createdAt) : ""
        self.updatedAt = try container.contains(.updatedAt) ? container.decode(String.self, forKey: .updatedAt) : ""
        self.name = try container.contains(.name) ? container.decode(String.self, forKey: .name) : ""
        self.steps = try container.contains(.steps) ? container.decode([EscalationStep].self, forKey: .steps) : []
        self.`repeat` = try container.contains(.`repeat`) ? container.decode(Int.self, forKey: .`repeat`) : 0
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encode(id, forKey: .id)
        try container.encode(createdAt, forKey: .createdAt)
        try container.encode(updatedAt, forKey: .updatedAt)
        try container.encode(name, forKey: .name)
        try container.encode(steps, forKey: .steps)
        try container.encode(`repeat`, forKey: .`repeat`)
    }

    public func toMap() -> [String: Any] {
        return [
            "$id": id as Any,
            "$createdAt": createdAt as Any,
            "$updatedAt": updatedAt as Any,
            "name": name as Any,
            "steps": steps.map { $0.toMap() } as Any,
            "repeat": `repeat` as Any,
        ]
    }

    public static func from(map: [String: Any]) -> Escalation {
        let defaults: [String: Any] = [
            "$id": "",
            "$createdAt": "",
            "$updatedAt": "",
            "name": "",
            "steps": [Any](),
            "repeat": 0,
        ]
        let map = defaults.merging(map) { _, new in new }

        return Escalation(
            id: map["$id"] as! String,
            createdAt: map["$createdAt"] as! String,
            updatedAt: map["$updatedAt"] as! String,
            name: map["name"] as! String,
            steps: (map["steps"] as! [[String: Any]]).map { EscalationStep.from(map: $0) },
            `repeat`: map["repeat"] as! Int
        )
    }
}
