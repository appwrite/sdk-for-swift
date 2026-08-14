import Foundation

public enum EmbeddingModel: String, Codable, CustomStringConvertible {
    case nomicEmbedText = "nomic-embed-text"
    case embeddingGemma = "embedding-gemma"
    case allMinilm = "all-minilm"
    case bgeSmall = "bge-small"

    public var description: String {
        return rawValue
    }
}
