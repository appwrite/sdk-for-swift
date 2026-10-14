import Foundation

public enum ProjectOAuth2MicrosoftPrompt: String, Codable, CustomStringConvertible {
    case `none` = "none"
    case login = "login"
    case consent = "consent"
    case selectAccount = "select_account"

    public var description: String {
        return rawValue
    }
}
