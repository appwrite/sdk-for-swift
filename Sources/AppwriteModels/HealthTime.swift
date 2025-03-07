import Foundation
import JSONCodable

/// Health Time
open class HealthTime: Codable {

    enum CodingKeys: String, CodingKey {
        case remoteTime = "remoteTime"
        case localTime = "localTime"
        case diff = "diff"
    }

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

    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        self.remoteTime = try container.decode(Int.self, forKey: .remoteTime)
        self.localTime = try container.decode(Int.self, forKey: .localTime)
        self.diff = try container.decode(Int.self, forKey: .diff)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encode(remoteTime, forKey: .remoteTime)
        try container.encode(localTime, forKey: .localTime)
        try container.encode(diff, forKey: .diff)
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
