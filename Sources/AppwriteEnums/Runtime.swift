import Foundation

public enum Runtime: String, Codable {
    case node180 = "node-18.0"
    case php80 = "php-8.0"
    case ruby31 = "ruby-3.1"
    case python39 = "python-3.9"

    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encode(rawValue)
    }
}
