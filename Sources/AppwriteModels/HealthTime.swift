import Foundation
import JSONCodable

/// Health Time
public class HealthTime {

    /// Current unix timestamp on trustful remote server.
    public let remoteTime: Int


    /// Current unix timestamp of local server where Appwrite runs.
    public let localTime: Int


    /// Difference of unix remote and local timestamps in milliseconds.
    public let diff: Int



    init(
        remoteTime: Int,
        localTime: Int,
        diff: Int
    ) {
        self.remoteTime = remoteTime
        self.localTime = localTime
        self.diff = diff
    }

    public func toMap() -> [String: Any] {
        return [
            "remoteTime": remoteTime as Any,
            "localTime": localTime as Any,
            "diff": diff as Any
        ]
    }

    public static func from(map: [String: Any] ) -> HealthTime {
        return HealthTime(
            remoteTime: map["remoteTime"] as! Int,
            localTime: map["localTime"] as! Int,
            diff: map["diff"] as! Int
        )
    }
}
