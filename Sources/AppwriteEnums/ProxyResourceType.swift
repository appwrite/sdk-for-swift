import Foundation

public enum ProxyResourceType: String, CustomStringConvertible {
    case site = "site"
    case function = "function"

    public var description: String {
        return rawValue
    }
}
