import Foundation

public enum Region: String, Codable, CustomStringConvertible {
    case fra = "fra"
    case nyc = "nyc"
    case syd = "syd"
    case sfo = "sfo"
    case sgp = "sgp"
    case tor = "tor"

    public var description: String {
        return rawValue
    }
}
