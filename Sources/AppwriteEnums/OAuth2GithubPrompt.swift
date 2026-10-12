import Foundation

public enum OAuth2GithubPrompt: String, Codable, CustomStringConvertible {
    case selectAccount = "select_account"

    public var description: String {
        return rawValue
    }
}
