import Foundation

public enum OrganizationKeyScopes: String, Codable, CustomStringConvertible {
    case projectsRead = "projects.read"
    case projectsWrite = "projects.write"
    case devKeysRead = "devKeys.read"
    case devKeysWrite = "devKeys.write"
    case organizationKeysRead = "organization.keys.read"
    case organizationKeysWrite = "organization.keys.write"
    case domainsRead = "domains.read"
    case domainsWrite = "domains.write"
    case keysRead = "keys.read"
    case keysWrite = "keys.write"

    public var description: String {
        return rawValue
    }
}
