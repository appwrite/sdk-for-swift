import Foundation

/// Health Status
public class HealthStatus {

    /// Duration in milliseconds how long the health check took.
    public let ping: Int

    /// Service status. Possible values can are: `pass`, `fail`
    public let status: String


    init(
        ping: Int,
        status: String
    ) {
        self.ping = ping
        self.status = status
    }

    public func toMap() -> [String: Any] {
        return [
            "ping": ping as Any,
            "status": status as Any
        ]
    }

    public static func from(map: [String: Any] ) -> HealthStatus {
        return HealthStatus(
            ping: map["ping"] as! Int,
            status: map["status"] as! String
        )
    }
}
