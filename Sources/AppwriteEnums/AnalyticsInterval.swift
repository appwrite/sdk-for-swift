import Foundation

public enum AnalyticsInterval: String, Codable, CustomStringConvertible {
    case oneHour = "1h"
    case oneDay = "1d"
    case oneWeek = "1w"
    case oneMonth = "1m"

    public var description: String {
        return rawValue
    }
}
