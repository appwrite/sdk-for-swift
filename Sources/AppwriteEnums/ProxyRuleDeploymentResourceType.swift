import Foundation

public enum ProxyRuleDeploymentResourceType: String, Codable, CustomStringConvertible {
    case function = "function"
    case site = "site"

    public var description: String {
        return rawValue
    }
}
