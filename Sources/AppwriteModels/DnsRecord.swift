import Foundation
import JSONCodable

/// DNSRecord
open class DnsRecord: Codable {

    enum CodingKeys: String, CodingKey {
        case id = "$id"
        case createdAt = "$createdAt"
        case updatedAt = "$updatedAt"
        case type = "type"
        case name = "name"
        case value = "value"
        case ttl = "ttl"
        case priority = "priority"
        case lock = "lock"
        case weight = "weight"
        case port = "port"
        case comment = "comment"
    }

    /// DNS Record ID.
    public let id: String
    /// DNS Record creation time in ISO 8601 format.
    public let createdAt: String
    /// DNS Record update date in ISO 8601 format.
    public let updatedAt: String
    /// DNS record type (e.g. A, CNAME, MX).
    public let type: String
    /// Record name or subdomain.
    public let name: String
    /// Value of the record (IP address, domain, etc.).
    public let value: String
    /// Time to live (in seconds).
    public let ttl: Int
    /// Record priority (commonly used for MX).
    public let priority: Int
    /// Whether this record is locked (read-only).
    public let lock: Bool
    /// Record weight (used for SRV records).
    public let weight: Int
    /// Target port (used for SRV records).
    public let port: Int
    /// Comment for the DNS record.
    public let comment: String

    init(
        id: String,
        createdAt: String,
        updatedAt: String,
        type: String,
        name: String,
        value: String,
        ttl: Int,
        priority: Int,
        lock: Bool,
        weight: Int,
        port: Int,
        comment: String
    ) {
        self.id = id
        self.createdAt = createdAt
        self.updatedAt = updatedAt
        self.type = type
        self.name = name
        self.value = value
        self.ttl = ttl
        self.priority = priority
        self.lock = lock
        self.weight = weight
        self.port = port
        self.comment = comment
    }

    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        self.id = try container.contains(.id) ? container.decode(String.self, forKey: .id) : ""
        self.createdAt = try container.contains(.createdAt) ? container.decode(String.self, forKey: .createdAt) : ""
        self.updatedAt = try container.contains(.updatedAt) ? container.decode(String.self, forKey: .updatedAt) : ""
        self.type = try container.contains(.type) ? container.decode(String.self, forKey: .type) : ""
        self.name = try container.contains(.name) ? container.decode(String.self, forKey: .name) : ""
        self.value = try container.contains(.value) ? container.decode(String.self, forKey: .value) : ""
        self.ttl = try container.contains(.ttl) ? container.decode(Int.self, forKey: .ttl) : 3600
        self.priority = try container.contains(.priority) ? container.decode(Int.self, forKey: .priority) : 0
        self.lock = try container.contains(.lock) ? container.decode(Bool.self, forKey: .lock) : false
        self.weight = try container.contains(.weight) ? container.decode(Int.self, forKey: .weight) : 0
        self.port = try container.contains(.port) ? container.decode(Int.self, forKey: .port) : 0
        self.comment = try container.contains(.comment) ? container.decode(String.self, forKey: .comment) : ""
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encode(id, forKey: .id)
        try container.encode(createdAt, forKey: .createdAt)
        try container.encode(updatedAt, forKey: .updatedAt)
        try container.encode(type, forKey: .type)
        try container.encode(name, forKey: .name)
        try container.encode(value, forKey: .value)
        try container.encode(ttl, forKey: .ttl)
        try container.encode(priority, forKey: .priority)
        try container.encode(lock, forKey: .lock)
        try container.encode(weight, forKey: .weight)
        try container.encode(port, forKey: .port)
        try container.encode(comment, forKey: .comment)
    }

    public func toMap() -> [String: Any] {
        return [
            "$id": id as Any,
            "$createdAt": createdAt as Any,
            "$updatedAt": updatedAt as Any,
            "type": type as Any,
            "name": name as Any,
            "value": value as Any,
            "ttl": ttl as Any,
            "priority": priority as Any,
            "lock": lock as Any,
            "weight": weight as Any,
            "port": port as Any,
            "comment": comment as Any,
        ]
    }

    public static func from(map: [String: Any]) -> DnsRecord {
        let defaults: [String: Any] = [
            "$id": "",
            "$createdAt": "",
            "$updatedAt": "",
            "type": "",
            "name": "",
            "value": "",
            "ttl": 3600,
            "priority": 0,
            "lock": false,
            "weight": 0,
            "port": 0,
            "comment": "",
        ]
        let map = defaults.merging(map) { _, new in new }

        return DnsRecord(
            id: map["$id"] as! String,
            createdAt: map["$createdAt"] as! String,
            updatedAt: map["$updatedAt"] as! String,
            type: map["type"] as! String,
            name: map["name"] as! String,
            value: map["value"] as! String,
            ttl: map["ttl"] as! Int,
            priority: map["priority"] as! Int,
            lock: map["lock"] as! Bool,
            weight: map["weight"] as! Int,
            port: map["port"] as! Int,
            comment: map["comment"] as! String
        )
    }
}
