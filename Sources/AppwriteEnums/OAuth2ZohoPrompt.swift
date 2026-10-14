import Foundation

public enum OAuth2ZohoPrompt: String, Codable, CustomStringConvertible {
    case consent = "consent"

    public var description: String {
        return rawValue
    }
}
