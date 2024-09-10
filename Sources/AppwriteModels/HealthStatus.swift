import Foundation
import JSONCodable

/// Health Status
public class HealthStatus {

    /// Name of the service.
    public let name: String

    /// Duration in milliseconds how long the health check took.
    public let ping: Int

    /// Service status. Possible values can are: `pass`, `fail`
    public let status: String


    init(
        name: String,
        ping: Int,
        status: String
    ) {
        self.name = name
        self.ping = ping
        self.status = status
    }

    public func toMap() -> [String: Any] {
        return [
            "name": name as Any,
            "ping": ping as Any,
            "status": status as Any
        ]
    }

    public static func from(map: [String: Any] ) -> HealthStatus {
        return HealthStatus(
            name: map["name"] as! String,
            ping: map["ping"] as! Int,
            status: map["status"] as! String
        )
    }
}
