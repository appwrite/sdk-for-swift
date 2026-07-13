import Foundation

public enum ProjectPolicyId: String, Codable, CustomStringConvertible {
    case passwordDictionary = "password-dictionary"
    case passwordHistory = "password-history"
    case passwordStrength = "password-strength"
    case passwordPersonalData = "password-personal-data"
    case sessionAlert = "session-alert"
    case sessionDuration = "session-duration"
    case sessionInvalidation = "session-invalidation"
    case sessionLimit = "session-limit"
    case userLimit = "user-limit"
    case membershipPrivacy = "membership-privacy"
    case denyAliasedEmail = "deny-aliased-email"
    case denyDisposableEmail = "deny-disposable-email"
    case denyFreeEmail = "deny-free-email"
    case denyCorporateEmail = "deny-corporate-email"

    public var description: String {
        return rawValue
    }
}
