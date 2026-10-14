import Foundation

public enum ProjectOAuth2KakaoPrompt: String, Codable, CustomStringConvertible {
    case `none` = "none"
    case login = "login"
    case create = "create"
    case selectAccount = "select_account"

    public var description: String {
        return rawValue
    }
}
