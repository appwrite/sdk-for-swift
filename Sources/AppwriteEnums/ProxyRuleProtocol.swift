import Foundation

public enum ProxyRuleProtocol: String, Codable, CustomStringConvertible {
    case http = "http"
    case smtp = "smtp"

    public var description: String {
        return rawValue
    }
}
