import Foundation

public enum ProjectOAuth2GitHubPrompt: String, Codable, CustomStringConvertible {
    case selectAccount = "select_account"

    public var description: String {
        return rawValue
    }
}
