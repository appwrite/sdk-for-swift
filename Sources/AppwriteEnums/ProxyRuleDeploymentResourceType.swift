import Foundation

public enum ProxyRuleDeploymentResourceType: String, CustomStringConvertible {
    case function = "function"
    case site = "site"

    public var description: String {
        return rawValue
    }
}
