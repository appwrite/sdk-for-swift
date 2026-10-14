import Foundation

public enum OAuth2SalesforcePrompt: String, Codable, CustomStringConvertible {
    case login = "login"
    case consent = "consent"

    public var description: String {
        return rawValue
    }
}
