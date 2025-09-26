import Foundation
import JSONCodable
import AppwriteEnums

/// Health Status
open class HealthStatus: Codable {

    enum CodingKeys: String, CodingKey {
        case name = "name"
        case ping = "ping"
        case status = "status"
    }

    /// Name of the service.
    public let name: String

    /// Duration in milliseconds how long the health check took.
    public let ping: Int

    /// Service status. Possible values are: `pass`, `fail`
    public let status: HealthCheckStatus


    init(
        name: String,
        ping: Int,
        status: HealthCheckStatus
    ) {
        self.name = name
        self.ping = ping
        self.status = status
    }

    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        self.name = try container.decode(String.self, forKey: .name)
        self.ping = try container.decode(Int.self, forKey: .ping)
        self.status = HealthCheckStatus(rawValue: try container.decode(String.self, forKey: .status))!
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encode(name, forKey: .name)
        try container.encode(ping, forKey: .ping)
        try container.encode(status.rawValue, forKey: .status)
    }

    public func toMap() -> [String: Any] {
        return [
            "name": name as Any,
            "ping": ping as Any,
            "status": status.rawValue as Any
        ]
    }

    public static func from(map: [String: Any] ) -> HealthStatus {
        return HealthStatus(
            name: map["name"] as! String,
            ping: map["ping"] as! Int,
            status: HealthCheckStatus(rawValue: map["status"] as! String)!
        )
    }
}
