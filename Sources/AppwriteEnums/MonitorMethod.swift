import Foundation

public enum MonitorMethod: String, Codable, CustomStringConvertible {
    case gET = "GET"
    case hEAD = "HEAD"
    case pOST = "POST"
    case pUT = "PUT"
    case pATCH = "PATCH"
    case dELETE = "DELETE"
    case oPTIONS = "OPTIONS"

    public var description: String {
        return rawValue
    }
}
