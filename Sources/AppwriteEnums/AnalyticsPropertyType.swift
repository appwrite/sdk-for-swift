import Foundation

public enum AnalyticsPropertyType: String, Codable, CustomStringConvertible {
    case web = "web"
    case mobile = "mobile"
    case agent = "agent"

    public var description: String {
        return rawValue
    }
}
