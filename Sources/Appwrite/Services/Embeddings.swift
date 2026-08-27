import AppwriteEnums
import AppwriteModels
import AsyncHTTPClient
import Foundation
import JSONCodable
import NIO

///
open class Embeddings: Service {

    ///
    /// Generate vector embeddings for an array of text using the selected
    /// embedding model. Use the returned vectors to power semantic search and
    /// similarity queries against your vector collections.
    ///
    /// - Parameters:
    ///   - texts: [String]
    ///   - model: AppwriteEnums.EmbeddingModel (optional)
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.EmbeddingList
    ///
    open func createTextEmbeddings(
        texts: [String],
        model: AppwriteEnums.EmbeddingModel? = nil
    ) async throws -> AppwriteModels.EmbeddingList {
        let apiPath: String = "/embeddings/text"

        let apiParams: [String: Any?] = [
            "texts": texts,
            "model": model?.rawValue,
        ]

        let apiHeaders: [String: String] = [
            "X-Appwrite-Project": client.config["project"] ?? "",
            "content-type": "application/json",
            "accept": "application/json",
        ]

        let converter: (Any) throws -> AppwriteModels.EmbeddingList = { response in
            return AppwriteModels.EmbeddingList.from(map: response as! [String: Any])
        }

        return try await client.call(
            method: "POST",
            path: apiPath,
            headers: apiHeaders,
            params: apiParams,
            converter: converter
        )
    }
}
