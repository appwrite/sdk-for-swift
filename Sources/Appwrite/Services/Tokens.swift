import AsyncHTTPClient
import Foundation
import NIO
import JSONCodable
import AppwriteEnums
import AppwriteModels

/// 
open class Tokens: Service {

    ///
    /// List all the tokens created for a specific file or bucket. You can use the
    /// query params to filter your results.
    ///
    /// @param String bucketId
    /// @param String fileId
    /// @param [String] queries
    /// @throws Exception
    /// @return array
    ///
    open func list(
        bucketId: String,
        fileId: String,
        queries: [String]? = nil
    ) async throws -> AppwriteModels.ResourceTokenList {
        let apiPath: String = "/tokens/buckets/{bucketId}/files/{fileId}"
            .replacingOccurrences(of: "{bucketId}", with: bucketId)
            .replacingOccurrences(of: "{fileId}", with: fileId)

        let apiParams: [String: Any?] = [
            "queries": queries
        ]

        let apiHeaders: [String: String] = [:]

        let converter: (Any) -> AppwriteModels.ResourceTokenList = { response in
            return AppwriteModels.ResourceTokenList.from(map: response as! [String: Any])
        }

        return try await client.call(
            method: "GET",
            path: apiPath,
            headers: apiHeaders,
            params: apiParams,
            converter: converter
        )
    }

    ///
    /// Create a new token. A token is linked to a file. Token can be passed as a
    /// header or request get parameter.
    ///
    /// @param String bucketId
    /// @param String fileId
    /// @param String expire
    /// @throws Exception
    /// @return array
    ///
    open func createFileToken(
        bucketId: String,
        fileId: String,
        expire: String? = nil
    ) async throws -> AppwriteModels.ResourceToken {
        let apiPath: String = "/tokens/buckets/{bucketId}/files/{fileId}"
            .replacingOccurrences(of: "{bucketId}", with: bucketId)
            .replacingOccurrences(of: "{fileId}", with: fileId)

        let apiParams: [String: Any?] = [
            "expire": expire
        ]

        let apiHeaders: [String: String] = [
            "content-type": "application/json"
        ]

        let converter: (Any) -> AppwriteModels.ResourceToken = { response in
            return AppwriteModels.ResourceToken.from(map: response as! [String: Any])
        }

        return try await client.call(
            method: "POST",
            path: apiPath,
            headers: apiHeaders,
            params: apiParams,
            converter: converter
        )
    }

    ///
    /// Get a token by its unique ID.
    ///
    /// @param String tokenId
    /// @throws Exception
    /// @return array
    ///
    open func get(
        tokenId: String
    ) async throws -> AppwriteModels.ResourceToken {
        let apiPath: String = "/tokens/{tokenId}"
            .replacingOccurrences(of: "{tokenId}", with: tokenId)

        let apiParams: [String: Any] = [:]

        let apiHeaders: [String: String] = [:]

        let converter: (Any) -> AppwriteModels.ResourceToken = { response in
            return AppwriteModels.ResourceToken.from(map: response as! [String: Any])
        }

        return try await client.call(
            method: "GET",
            path: apiPath,
            headers: apiHeaders,
            params: apiParams,
            converter: converter
        )
    }

    ///
    /// Update a token by its unique ID. Use this endpoint to update a token's
    /// expiry date.
    ///
    /// @param String tokenId
    /// @param String expire
    /// @throws Exception
    /// @return array
    ///
    open func update(
        tokenId: String,
        expire: String? = nil
    ) async throws -> AppwriteModels.ResourceToken {
        let apiPath: String = "/tokens/{tokenId}"
            .replacingOccurrences(of: "{tokenId}", with: tokenId)

        let apiParams: [String: Any?] = [
            "expire": expire
        ]

        let apiHeaders: [String: String] = [
            "content-type": "application/json"
        ]

        let converter: (Any) -> AppwriteModels.ResourceToken = { response in
            return AppwriteModels.ResourceToken.from(map: response as! [String: Any])
        }

        return try await client.call(
            method: "PATCH",
            path: apiPath,
            headers: apiHeaders,
            params: apiParams,
            converter: converter
        )
    }

    ///
    /// Delete a token by its unique ID.
    ///
    /// @param String tokenId
    /// @throws Exception
    /// @return array
    ///
    open func delete(
        tokenId: String
    ) async throws -> Any {
        let apiPath: String = "/tokens/{tokenId}"
            .replacingOccurrences(of: "{tokenId}", with: tokenId)

        let apiParams: [String: Any] = [:]

        let apiHeaders: [String: String] = [
            "content-type": "application/json"
        ]

        return try await client.call(
            method: "DELETE",
            path: apiPath,
            headers: apiHeaders,
            params: apiParams        )
    }


}