import Foundation

public enum WafRuleAction: String, Codable, CustomStringConvertible {
    case bypass = "bypass"
    case deny = "deny"
    case challenge = "challenge"
    case rateLimit = "rateLimit"
    case redirect = "redirect"

    public var description: String {
        return rawValue
    }
}
