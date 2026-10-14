import Foundation

public enum BillingPlanGroup: String, Codable, CustomStringConvertible {
    case starter = "starter"
    case free = "free"
    case start = "start"
    case pro = "pro"
    case scale = "scale"

    public var description: String {
        return rawValue
    }
}
