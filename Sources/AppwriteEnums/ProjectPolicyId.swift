import Foundation

public enum ProjectPolicyId: String, CustomStringConvertible {
    case passwordDictionary = "password-dictionary"
    case passwordHistory = "password-history"
    case passwordPersonalData = "password-personal-data"
    case sessionAlert = "session-alert"
    case sessionDuration = "session-duration"
    case sessionInvalidation = "session-invalidation"
    case sessionLimit = "session-limit"
    case userLimit = "user-limit"
    case membershipPrivacy = "membership-privacy"

    public var description: String {
        return rawValue
    }
}
