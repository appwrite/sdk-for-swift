import Foundation

public enum Model: String, CustomStringConvertible {
    case embeddinggemma = "embeddinggemma"

    public var description: String {
        return rawValue
    }
}
