import Foundation

public enum BillingPlanGroup: String, Codable, CustomStringConvertible {
    case starter = "starter"
    case pro = "pro"
    case scale = "scale"

    public var description: String {
        return rawValue
    }
}
