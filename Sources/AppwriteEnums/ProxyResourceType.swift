import Foundation

public enum ProxyResourceType: String, Codable, CustomStringConvertible {
    case site = "site"
    case function = "function"

    public var description: String {
        return rawValue
    }
}
