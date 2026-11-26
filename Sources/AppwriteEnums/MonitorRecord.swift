import Foundation

public enum MonitorRecord: String, Codable, CustomStringConvertible {
    case a = "A"
    case aAAA = "AAAA"
    case cNAME = "CNAME"
    case mX = "MX"
    case tXT = "TXT"
    case nS = "NS"

    public var description: String {
        return rawValue
    }
}
