import Foundation

public enum ProjectOAuth2ZohoPrompt: String, Codable, CustomStringConvertible {
    case consent = "consent"

    public var description: String {
        return rawValue
    }
}
