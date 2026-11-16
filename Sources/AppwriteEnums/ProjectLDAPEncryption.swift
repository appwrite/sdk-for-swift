import Foundation

public enum ProjectLDAPEncryption: String, Codable, CustomStringConvertible {
    case `none` = "none"
    case ldaps = "ldaps"
    case starttls = "starttls"

    public var description: String {
        return rawValue
    }
}
