import Foundation

public enum MessagingProviderType: String, Codable, CustomStringConvertible {
    case email = "email"
    case sms = "sms"
    case push = "push"

    public var description: String {
        return rawValue
    }
}
