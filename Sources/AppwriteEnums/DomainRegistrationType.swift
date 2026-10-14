import Foundation

public enum DomainRegistrationType: String, Codable, CustomStringConvertible {
    case new = "new"
    case transfer = "transfer"
    case renewal = "renewal"
    case trade = "trade"

    public var description: String {
        return rawValue
    }
}
