import Foundation

public enum AuthMethod: String, CustomStringConvertible {
    case emailPassword = "email-password"
    case magicUrl = "magic-url"
    case emailOtp = "email-otp"
    case anonymous = "anonymous"
    case invites = "invites"
    case jwt = "jwt"
    case phone = "phone"

    public var description: String {
        return rawValue
    }
}
