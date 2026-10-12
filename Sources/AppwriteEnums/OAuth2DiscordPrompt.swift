import Foundation

public enum OAuth2DiscordPrompt: String, Codable, CustomStringConvertible {
    case `none` = "none"
    case consent = "consent"

    public var description: String {
        return rawValue
    }
}
