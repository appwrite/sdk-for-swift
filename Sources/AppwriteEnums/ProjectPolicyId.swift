import Foundation

public enum ProjectPolicyId: String, Codable, CustomStringConvertible {
    case passwordDictionary = "password-dictionary"
    case passwordHistory = "password-history"
    case passwordStrength = "password-strength"
    case passwordPersonalData = "password-personal-data"
    case passwordPwned = "password-pwned"
    case passwordRotation = "password-rotation"
    case sessionAlert = "session-alert"
    case sessionDuration = "session-duration"
    case sessionInvalidation = "session-invalidation"
    case sessionLimit = "session-limit"
    case userLimit = "user-limit"
    case membershipPrivacy = "membership-privacy"
    case mfaFactors = "mfa-factors"
    case denyAliasedEmail = "deny-aliased-email"
    case denyDisposableEmail = "deny-disposable-email"
    case denyFreeEmail = "deny-free-email"
    case denyCorporateEmail = "deny-corporate-email"
    case denyRealtimeGuests = "deny-realtime-guests"
    case passkey = "passkey"

    public var description: String {
        return rawValue
    }
}
