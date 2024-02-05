import Foundation

public enum MessagingProviderType: String, Codable {
    case email = "email"
    case sms = "sms"
    case push = "push"

    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encode(rawValue)
    }
}
