import Foundation

public enum ProjectEmailTemplateId: String, Codable, CustomStringConvertible {
    case verification = "verification"
    case magicSession = "magicSession"
    case recovery = "recovery"
    case invitation = "invitation"
    case mfaChallenge = "mfaChallenge"
    case sessionAlert = "sessionAlert"
    case otpSession = "otpSession"

    public var description: String {
        return rawValue
    }
}
