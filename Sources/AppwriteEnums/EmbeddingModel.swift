import Foundation

public enum EmbeddingModel: String, Codable, CustomStringConvertible {
    case nomicEmbedText = "nomic-embed-text"
    case allMinilm = "all-minilm"

    public var description: String {
        return rawValue
    }
}
