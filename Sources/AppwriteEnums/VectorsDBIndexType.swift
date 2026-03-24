import Foundation

public enum VectorsDBIndexType: String, CustomStringConvertible {
    case hnswEuclidean = "hnsw_euclidean"
    case hnswDot = "hnsw_dot"
    case hnswCosine = "hnsw_cosine"
    case object = "object"
    case key = "key"
    case unique = "unique"

    public var description: String {
        return rawValue
    }
}
