import AsyncHTTPClient
import Foundation
import NIO
import JSONCodable
import AppwriteEnums
import AppwriteModels

/// 
open class VectorsDB: Service {

    ///
    /// - Parameters:
    ///   - queries: [String] (optional)
    ///   - search: String (optional)
    ///   - total: Bool (optional)
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.DatabaseList
    ///
    open func list(
        queries: [String]? = nil,
        search: String? = nil,
        total: Bool? = nil
    ) async throws -> AppwriteModels.DatabaseList {
        let apiPath: String = "/vectorsdb"

        let apiParams: [String: Any?] = [
            "queries": queries,
            "search": search,
            "total": total
        ]

        let apiHeaders: [String: String] = [:]

        let converter: (Any) -> AppwriteModels.DatabaseList = { response in
            return AppwriteModels.DatabaseList.from(map: response as! [String: Any])
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
    /// - Parameters:
    ///   - databaseId: String
    ///   - name: String
    ///   - enabled: Bool (optional)
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.Database
    ///
    open func create(
        databaseId: String,
        name: String,
        enabled: Bool? = nil
    ) async throws -> AppwriteModels.Database {
        let apiPath: String = "/vectorsdb"

        let apiParams: [String: Any?] = [
            "databaseId": databaseId,
            "name": name,
            "enabled": enabled
        ]

        let apiHeaders: [String: String] = [
            "content-type": "application/json"
        ]

        let converter: (Any) -> AppwriteModels.Database = { response in
            return AppwriteModels.Database.from(map: response as! [String: Any])
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
    /// - Parameters:
    ///   - texts: [String]
    ///   - model: AppwriteEnums.Model (optional)
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.EmbeddingList
    ///
    open func createTextEmbeddings(
        texts: [String],
        model: AppwriteEnums.Model? = nil
    ) async throws -> AppwriteModels.EmbeddingList {
        let apiPath: String = "/vectorsdb/embeddings/text"

        let apiParams: [String: Any?] = [
            "texts": texts,
            "model": model
        ]

        let apiHeaders: [String: String] = [
            "content-type": "application/json"
        ]

        let converter: (Any) -> AppwriteModels.EmbeddingList = { response in
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

    ///
    /// - Parameters:
    ///   - queries: [String] (optional)
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.TransactionList
    ///
    open func listTransactions(
        queries: [String]? = nil
    ) async throws -> AppwriteModels.TransactionList {
        let apiPath: String = "/vectorsdb/transactions"

        let apiParams: [String: Any?] = [
            "queries": queries
        ]

        let apiHeaders: [String: String] = [:]

        let converter: (Any) -> AppwriteModels.TransactionList = { response in
            return AppwriteModels.TransactionList.from(map: response as! [String: Any])
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
    /// - Parameters:
    ///   - ttl: Int (optional)
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.Transaction
    ///
    open func createTransaction(
        ttl: Int? = nil
    ) async throws -> AppwriteModels.Transaction {
        let apiPath: String = "/vectorsdb/transactions"

        let apiParams: [String: Any?] = [
            "ttl": ttl
        ]

        let apiHeaders: [String: String] = [
            "content-type": "application/json"
        ]

        let converter: (Any) -> AppwriteModels.Transaction = { response in
            return AppwriteModels.Transaction.from(map: response as! [String: Any])
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
    /// - Parameters:
    ///   - transactionId: String
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.Transaction
    ///
    open func getTransaction(
        transactionId: String
    ) async throws -> AppwriteModels.Transaction {
        let apiPath: String = "/vectorsdb/transactions/{transactionId}"
            .replacingOccurrences(of: "{transactionId}", with: transactionId)

        let apiParams: [String: Any] = [:]

        let apiHeaders: [String: String] = [:]

        let converter: (Any) -> AppwriteModels.Transaction = { response in
            return AppwriteModels.Transaction.from(map: response as! [String: Any])
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
    /// - Parameters:
    ///   - transactionId: String
    ///   - commit: Bool (optional)
    ///   - rollback: Bool (optional)
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.Transaction
    ///
    open func updateTransaction(
        transactionId: String,
        commit: Bool? = nil,
        rollback: Bool? = nil
    ) async throws -> AppwriteModels.Transaction {
        let apiPath: String = "/vectorsdb/transactions/{transactionId}"
            .replacingOccurrences(of: "{transactionId}", with: transactionId)

        let apiParams: [String: Any?] = [
            "commit": commit,
            "rollback": rollback
        ]

        let apiHeaders: [String: String] = [
            "content-type": "application/json"
        ]

        let converter: (Any) -> AppwriteModels.Transaction = { response in
            return AppwriteModels.Transaction.from(map: response as! [String: Any])
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
    /// - Parameters:
    ///   - transactionId: String
    /// - Throws: Exception if the request fails
    /// - Returns: Any
    ///
    open func deleteTransaction(
        transactionId: String
    ) async throws -> Any {
        let apiPath: String = "/vectorsdb/transactions/{transactionId}"
            .replacingOccurrences(of: "{transactionId}", with: transactionId)

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

    ///
    /// - Parameters:
    ///   - transactionId: String
    ///   - operations: [Any] (optional)
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.Transaction
    ///
    open func createOperations(
        transactionId: String,
        operations: [Any]? = nil
    ) async throws -> AppwriteModels.Transaction {
        let apiPath: String = "/vectorsdb/transactions/{transactionId}/operations"
            .replacingOccurrences(of: "{transactionId}", with: transactionId)

        let apiParams: [String: Any?] = [
            "operations": operations
        ]

        let apiHeaders: [String: String] = [
            "content-type": "application/json"
        ]

        let converter: (Any) -> AppwriteModels.Transaction = { response in
            return AppwriteModels.Transaction.from(map: response as! [String: Any])
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
    /// - Parameters:
    ///   - databaseId: String
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.Database
    ///
    open func get(
        databaseId: String
    ) async throws -> AppwriteModels.Database {
        let apiPath: String = "/vectorsdb/{databaseId}"
            .replacingOccurrences(of: "{databaseId}", with: databaseId)

        let apiParams: [String: Any] = [:]

        let apiHeaders: [String: String] = [:]

        let converter: (Any) -> AppwriteModels.Database = { response in
            return AppwriteModels.Database.from(map: response as! [String: Any])
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
    /// - Parameters:
    ///   - databaseId: String
    ///   - name: String
    ///   - enabled: Bool (optional)
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.Database
    ///
    open func update(
        databaseId: String,
        name: String,
        enabled: Bool? = nil
    ) async throws -> AppwriteModels.Database {
        let apiPath: String = "/vectorsdb/{databaseId}"
            .replacingOccurrences(of: "{databaseId}", with: databaseId)

        let apiParams: [String: Any?] = [
            "name": name,
            "enabled": enabled
        ]

        let apiHeaders: [String: String] = [
            "content-type": "application/json"
        ]

        let converter: (Any) -> AppwriteModels.Database = { response in
            return AppwriteModels.Database.from(map: response as! [String: Any])
        }

        return try await client.call(
            method: "PUT",
            path: apiPath,
            headers: apiHeaders,
            params: apiParams,
            converter: converter
        )
    }

    ///
    /// - Parameters:
    ///   - databaseId: String
    /// - Throws: Exception if the request fails
    /// - Returns: Any
    ///
    open func delete(
        databaseId: String
    ) async throws -> Any {
        let apiPath: String = "/vectorsdb/{databaseId}"
            .replacingOccurrences(of: "{databaseId}", with: databaseId)

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

    ///
    /// - Parameters:
    ///   - databaseId: String
    ///   - queries: [String] (optional)
    ///   - search: String (optional)
    ///   - total: Bool (optional)
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.VectorsdbCollectionList
    ///
    open func listCollections(
        databaseId: String,
        queries: [String]? = nil,
        search: String? = nil,
        total: Bool? = nil
    ) async throws -> AppwriteModels.VectorsdbCollectionList {
        let apiPath: String = "/vectorsdb/{databaseId}/collections"
            .replacingOccurrences(of: "{databaseId}", with: databaseId)

        let apiParams: [String: Any?] = [
            "queries": queries,
            "search": search,
            "total": total
        ]

        let apiHeaders: [String: String] = [:]

        let converter: (Any) -> AppwriteModels.VectorsdbCollectionList = { response in
            return AppwriteModels.VectorsdbCollectionList.from(map: response as! [String: Any])
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
    /// - Parameters:
    ///   - databaseId: String
    ///   - collectionId: String
    ///   - name: String
    ///   - dimension: Int
    ///   - permissions: [String] (optional)
    ///   - documentSecurity: Bool (optional)
    ///   - enabled: Bool (optional)
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.VectorsdbCollection
    ///
    open func createCollection(
        databaseId: String,
        collectionId: String,
        name: String,
        dimension: Int,
        permissions: [String]? = nil,
        documentSecurity: Bool? = nil,
        enabled: Bool? = nil
    ) async throws -> AppwriteModels.VectorsdbCollection {
        let apiPath: String = "/vectorsdb/{databaseId}/collections"
            .replacingOccurrences(of: "{databaseId}", with: databaseId)

        let apiParams: [String: Any?] = [
            "collectionId": collectionId,
            "name": name,
            "dimension": dimension,
            "permissions": permissions,
            "documentSecurity": documentSecurity,
            "enabled": enabled
        ]

        let apiHeaders: [String: String] = [
            "content-type": "application/json"
        ]

        let converter: (Any) -> AppwriteModels.VectorsdbCollection = { response in
            return AppwriteModels.VectorsdbCollection.from(map: response as! [String: Any])
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
    /// - Parameters:
    ///   - databaseId: String
    ///   - collectionId: String
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.VectorsdbCollection
    ///
    open func getCollection(
        databaseId: String,
        collectionId: String
    ) async throws -> AppwriteModels.VectorsdbCollection {
        let apiPath: String = "/vectorsdb/{databaseId}/collections/{collectionId}"
            .replacingOccurrences(of: "{databaseId}", with: databaseId)
            .replacingOccurrences(of: "{collectionId}", with: collectionId)

        let apiParams: [String: Any] = [:]

        let apiHeaders: [String: String] = [:]

        let converter: (Any) -> AppwriteModels.VectorsdbCollection = { response in
            return AppwriteModels.VectorsdbCollection.from(map: response as! [String: Any])
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
    /// - Parameters:
    ///   - databaseId: String
    ///   - collectionId: String
    ///   - name: String
    ///   - dimension: Int (optional)
    ///   - permissions: [String] (optional)
    ///   - documentSecurity: Bool (optional)
    ///   - enabled: Bool (optional)
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.VectorsdbCollection
    ///
    open func updateCollection(
        databaseId: String,
        collectionId: String,
        name: String,
        dimension: Int? = nil,
        permissions: [String]? = nil,
        documentSecurity: Bool? = nil,
        enabled: Bool? = nil
    ) async throws -> AppwriteModels.VectorsdbCollection {
        let apiPath: String = "/vectorsdb/{databaseId}/collections/{collectionId}"
            .replacingOccurrences(of: "{databaseId}", with: databaseId)
            .replacingOccurrences(of: "{collectionId}", with: collectionId)

        let apiParams: [String: Any?] = [
            "name": name,
            "dimension": dimension,
            "permissions": permissions,
            "documentSecurity": documentSecurity,
            "enabled": enabled
        ]

        let apiHeaders: [String: String] = [
            "content-type": "application/json"
        ]

        let converter: (Any) -> AppwriteModels.VectorsdbCollection = { response in
            return AppwriteModels.VectorsdbCollection.from(map: response as! [String: Any])
        }

        return try await client.call(
            method: "PUT",
            path: apiPath,
            headers: apiHeaders,
            params: apiParams,
            converter: converter
        )
    }

    ///
    /// - Parameters:
    ///   - databaseId: String
    ///   - collectionId: String
    /// - Throws: Exception if the request fails
    /// - Returns: Any
    ///
    open func deleteCollection(
        databaseId: String,
        collectionId: String
    ) async throws -> Any {
        let apiPath: String = "/vectorsdb/{databaseId}/collections/{collectionId}"
            .replacingOccurrences(of: "{databaseId}", with: databaseId)
            .replacingOccurrences(of: "{collectionId}", with: collectionId)

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

    ///
    /// - Parameters:
    ///   - databaseId: String
    ///   - collectionId: String
    ///   - queries: [String] (optional)
    ///   - transactionId: String (optional)
    ///   - total: Bool (optional)
    ///   - ttl: Int (optional)
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.DocumentList<T>
    ///
    open func listDocuments<T>(
        databaseId: String,
        collectionId: String,
        queries: [String]? = nil,
        transactionId: String? = nil,
        total: Bool? = nil,
        ttl: Int? = nil,
        nestedType: T.Type
    ) async throws -> AppwriteModels.DocumentList<T> {
        let apiPath: String = "/vectorsdb/{databaseId}/collections/{collectionId}/documents"
            .replacingOccurrences(of: "{databaseId}", with: databaseId)
            .replacingOccurrences(of: "{collectionId}", with: collectionId)

        let apiParams: [String: Any?] = [
            "queries": queries,
            "transactionId": transactionId,
            "total": total,
            "ttl": ttl
        ]

        let apiHeaders: [String: String] = [:]

        let converter: (Any) -> AppwriteModels.DocumentList<T> = { response in
            return AppwriteModels.DocumentList.from(map: response as! [String: Any])
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
    /// - Parameters:
    ///   - databaseId: String
    ///   - collectionId: String
    ///   - queries: [String] (optional)
    ///   - transactionId: String (optional)
    ///   - total: Bool (optional)
    ///   - ttl: Int (optional)
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.DocumentList<T>
    ///
    open func listDocuments(
        databaseId: String,
        collectionId: String,
        queries: [String]? = nil,
        transactionId: String? = nil,
        total: Bool? = nil,
        ttl: Int? = nil
    ) async throws -> AppwriteModels.DocumentList<[String: AnyCodable]> {
        return try await listDocuments(
            databaseId: databaseId,
            collectionId: collectionId,
            queries: queries,
            transactionId: transactionId,
            total: total,
            ttl: ttl,
            nestedType: [String: AnyCodable].self
        )
    }

    ///
    /// - Parameters:
    ///   - databaseId: String
    ///   - collectionId: String
    ///   - documentId: String
    ///   - data: Any
    ///   - permissions: [String] (optional)
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.Document<T>
    ///
    open func createDocument<T>(
        databaseId: String,
        collectionId: String,
        documentId: String,
        data: Any,
        permissions: [String]? = nil,
        nestedType: T.Type
    ) async throws -> AppwriteModels.Document<T> {
        let apiPath: String = "/vectorsdb/{databaseId}/collections/{collectionId}/documents"
            .replacingOccurrences(of: "{databaseId}", with: databaseId)
            .replacingOccurrences(of: "{collectionId}", with: collectionId)

        let apiParams: [String: Any?] = [
            "documentId": documentId,
            "data": data,
            "permissions": permissions
        ]

        let apiHeaders: [String: String] = [
            "content-type": "application/json"
        ]

        let converter: (Any) -> AppwriteModels.Document<T> = { response in
            return AppwriteModels.Document.from(map: response as! [String: Any])
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
    /// - Parameters:
    ///   - databaseId: String
    ///   - collectionId: String
    ///   - documentId: String
    ///   - data: Any
    ///   - permissions: [String] (optional)
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.Document<T>
    ///
    open func createDocument(
        databaseId: String,
        collectionId: String,
        documentId: String,
        data: Any,
        permissions: [String]? = nil
    ) async throws -> AppwriteModels.Document<[String: AnyCodable]> {
        return try await createDocument(
            databaseId: databaseId,
            collectionId: collectionId,
            documentId: documentId,
            data: data,
            permissions: permissions,
            nestedType: [String: AnyCodable].self
        )
    }

    ///
    /// - Parameters:
    ///   - databaseId: String
    ///   - collectionId: String
    ///   - documents: [Any]
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.DocumentList<T>
    ///
    open func createDocuments<T>(
        databaseId: String,
        collectionId: String,
        documents: [Any],
        nestedType: T.Type
    ) async throws -> AppwriteModels.DocumentList<T> {
        let apiPath: String = "/vectorsdb/{databaseId}/collections/{collectionId}/documents"
            .replacingOccurrences(of: "{databaseId}", with: databaseId)
            .replacingOccurrences(of: "{collectionId}", with: collectionId)

        let apiParams: [String: Any?] = [
            "documents": documents
        ]

        let apiHeaders: [String: String] = [
            "content-type": "application/json"
        ]

        let converter: (Any) -> AppwriteModels.DocumentList<T> = { response in
            return AppwriteModels.DocumentList.from(map: response as! [String: Any])
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
    /// - Parameters:
    ///   - databaseId: String
    ///   - collectionId: String
    ///   - documents: [Any]
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.DocumentList<T>
    ///
    open func createDocuments(
        databaseId: String,
        collectionId: String,
        documents: [Any]
    ) async throws -> AppwriteModels.DocumentList<[String: AnyCodable]> {
        return try await createDocuments(
            databaseId: databaseId,
            collectionId: collectionId,
            documents: documents,
            nestedType: [String: AnyCodable].self
        )
    }

    ///
    /// - Parameters:
    ///   - databaseId: String
    ///   - collectionId: String
    ///   - documents: [Any]
    ///   - transactionId: String (optional)
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.DocumentList<T>
    ///
    open func upsertDocuments<T>(
        databaseId: String,
        collectionId: String,
        documents: [Any],
        transactionId: String? = nil,
        nestedType: T.Type
    ) async throws -> AppwriteModels.DocumentList<T> {
        let apiPath: String = "/vectorsdb/{databaseId}/collections/{collectionId}/documents"
            .replacingOccurrences(of: "{databaseId}", with: databaseId)
            .replacingOccurrences(of: "{collectionId}", with: collectionId)

        let apiParams: [String: Any?] = [
            "documents": documents,
            "transactionId": transactionId
        ]

        let apiHeaders: [String: String] = [
            "content-type": "application/json"
        ]

        let converter: (Any) -> AppwriteModels.DocumentList<T> = { response in
            return AppwriteModels.DocumentList.from(map: response as! [String: Any])
        }

        return try await client.call(
            method: "PUT",
            path: apiPath,
            headers: apiHeaders,
            params: apiParams,
            converter: converter
        )
    }

    ///
    /// - Parameters:
    ///   - databaseId: String
    ///   - collectionId: String
    ///   - documents: [Any]
    ///   - transactionId: String (optional)
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.DocumentList<T>
    ///
    open func upsertDocuments(
        databaseId: String,
        collectionId: String,
        documents: [Any],
        transactionId: String? = nil
    ) async throws -> AppwriteModels.DocumentList<[String: AnyCodable]> {
        return try await upsertDocuments(
            databaseId: databaseId,
            collectionId: collectionId,
            documents: documents,
            transactionId: transactionId,
            nestedType: [String: AnyCodable].self
        )
    }

    ///
    /// - Parameters:
    ///   - databaseId: String
    ///   - collectionId: String
    ///   - data: Any (optional)
    ///   - queries: [String] (optional)
    ///   - transactionId: String (optional)
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.DocumentList<T>
    ///
    open func updateDocuments<T>(
        databaseId: String,
        collectionId: String,
        data: Any? = nil,
        queries: [String]? = nil,
        transactionId: String? = nil,
        nestedType: T.Type
    ) async throws -> AppwriteModels.DocumentList<T> {
        let apiPath: String = "/vectorsdb/{databaseId}/collections/{collectionId}/documents"
            .replacingOccurrences(of: "{databaseId}", with: databaseId)
            .replacingOccurrences(of: "{collectionId}", with: collectionId)

        let apiParams: [String: Any?] = [
            "data": data,
            "queries": queries,
            "transactionId": transactionId
        ]

        let apiHeaders: [String: String] = [
            "content-type": "application/json"
        ]

        let converter: (Any) -> AppwriteModels.DocumentList<T> = { response in
            return AppwriteModels.DocumentList.from(map: response as! [String: Any])
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
    /// - Parameters:
    ///   - databaseId: String
    ///   - collectionId: String
    ///   - data: Any (optional)
    ///   - queries: [String] (optional)
    ///   - transactionId: String (optional)
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.DocumentList<T>
    ///
    open func updateDocuments(
        databaseId: String,
        collectionId: String,
        data: Any? = nil,
        queries: [String]? = nil,
        transactionId: String? = nil
    ) async throws -> AppwriteModels.DocumentList<[String: AnyCodable]> {
        return try await updateDocuments(
            databaseId: databaseId,
            collectionId: collectionId,
            data: data,
            queries: queries,
            transactionId: transactionId,
            nestedType: [String: AnyCodable].self
        )
    }

    ///
    /// - Parameters:
    ///   - databaseId: String
    ///   - collectionId: String
    ///   - queries: [String] (optional)
    ///   - transactionId: String (optional)
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.DocumentList<T>
    ///
    open func deleteDocuments<T>(
        databaseId: String,
        collectionId: String,
        queries: [String]? = nil,
        transactionId: String? = nil,
        nestedType: T.Type
    ) async throws -> AppwriteModels.DocumentList<T> {
        let apiPath: String = "/vectorsdb/{databaseId}/collections/{collectionId}/documents"
            .replacingOccurrences(of: "{databaseId}", with: databaseId)
            .replacingOccurrences(of: "{collectionId}", with: collectionId)

        let apiParams: [String: Any?] = [
            "queries": queries,
            "transactionId": transactionId
        ]

        let apiHeaders: [String: String] = [
            "content-type": "application/json"
        ]

        let converter: (Any) -> AppwriteModels.DocumentList<T> = { response in
            return AppwriteModels.DocumentList.from(map: response as! [String: Any])
        }

        return try await client.call(
            method: "DELETE",
            path: apiPath,
            headers: apiHeaders,
            params: apiParams,
            converter: converter
        )
    }

    ///
    /// - Parameters:
    ///   - databaseId: String
    ///   - collectionId: String
    ///   - queries: [String] (optional)
    ///   - transactionId: String (optional)
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.DocumentList<T>
    ///
    open func deleteDocuments(
        databaseId: String,
        collectionId: String,
        queries: [String]? = nil,
        transactionId: String? = nil
    ) async throws -> AppwriteModels.DocumentList<[String: AnyCodable]> {
        return try await deleteDocuments(
            databaseId: databaseId,
            collectionId: collectionId,
            queries: queries,
            transactionId: transactionId,
            nestedType: [String: AnyCodable].self
        )
    }

    ///
    /// - Parameters:
    ///   - databaseId: String
    ///   - collectionId: String
    ///   - documentId: String
    ///   - queries: [String] (optional)
    ///   - transactionId: String (optional)
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.Document<T>
    ///
    open func getDocument<T>(
        databaseId: String,
        collectionId: String,
        documentId: String,
        queries: [String]? = nil,
        transactionId: String? = nil,
        nestedType: T.Type
    ) async throws -> AppwriteModels.Document<T> {
        let apiPath: String = "/vectorsdb/{databaseId}/collections/{collectionId}/documents/{documentId}"
            .replacingOccurrences(of: "{databaseId}", with: databaseId)
            .replacingOccurrences(of: "{collectionId}", with: collectionId)
            .replacingOccurrences(of: "{documentId}", with: documentId)

        let apiParams: [String: Any?] = [
            "queries": queries,
            "transactionId": transactionId
        ]

        let apiHeaders: [String: String] = [:]

        let converter: (Any) -> AppwriteModels.Document<T> = { response in
            return AppwriteModels.Document.from(map: response as! [String: Any])
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
    /// - Parameters:
    ///   - databaseId: String
    ///   - collectionId: String
    ///   - documentId: String
    ///   - queries: [String] (optional)
    ///   - transactionId: String (optional)
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.Document<T>
    ///
    open func getDocument(
        databaseId: String,
        collectionId: String,
        documentId: String,
        queries: [String]? = nil,
        transactionId: String? = nil
    ) async throws -> AppwriteModels.Document<[String: AnyCodable]> {
        return try await getDocument(
            databaseId: databaseId,
            collectionId: collectionId,
            documentId: documentId,
            queries: queries,
            transactionId: transactionId,
            nestedType: [String: AnyCodable].self
        )
    }

    ///
    /// - Parameters:
    ///   - databaseId: String
    ///   - collectionId: String
    ///   - documentId: String
    ///   - data: Any (optional)
    ///   - permissions: [String] (optional)
    ///   - transactionId: String (optional)
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.Document<T>
    ///
    open func upsertDocument<T>(
        databaseId: String,
        collectionId: String,
        documentId: String,
        data: Any? = nil,
        permissions: [String]? = nil,
        transactionId: String? = nil,
        nestedType: T.Type
    ) async throws -> AppwriteModels.Document<T> {
        let apiPath: String = "/vectorsdb/{databaseId}/collections/{collectionId}/documents/{documentId}"
            .replacingOccurrences(of: "{databaseId}", with: databaseId)
            .replacingOccurrences(of: "{collectionId}", with: collectionId)
            .replacingOccurrences(of: "{documentId}", with: documentId)

        let apiParams: [String: Any?] = [
            "data": data,
            "permissions": permissions,
            "transactionId": transactionId
        ]

        let apiHeaders: [String: String] = [
            "content-type": "application/json"
        ]

        let converter: (Any) -> AppwriteModels.Document<T> = { response in
            return AppwriteModels.Document.from(map: response as! [String: Any])
        }

        return try await client.call(
            method: "PUT",
            path: apiPath,
            headers: apiHeaders,
            params: apiParams,
            converter: converter
        )
    }

    ///
    /// - Parameters:
    ///   - databaseId: String
    ///   - collectionId: String
    ///   - documentId: String
    ///   - data: Any (optional)
    ///   - permissions: [String] (optional)
    ///   - transactionId: String (optional)
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.Document<T>
    ///
    open func upsertDocument(
        databaseId: String,
        collectionId: String,
        documentId: String,
        data: Any? = nil,
        permissions: [String]? = nil,
        transactionId: String? = nil
    ) async throws -> AppwriteModels.Document<[String: AnyCodable]> {
        return try await upsertDocument(
            databaseId: databaseId,
            collectionId: collectionId,
            documentId: documentId,
            data: data,
            permissions: permissions,
            transactionId: transactionId,
            nestedType: [String: AnyCodable].self
        )
    }

    ///
    /// - Parameters:
    ///   - databaseId: String
    ///   - collectionId: String
    ///   - documentId: String
    ///   - data: Any (optional)
    ///   - permissions: [String] (optional)
    ///   - transactionId: String (optional)
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.Document<T>
    ///
    open func updateDocument<T>(
        databaseId: String,
        collectionId: String,
        documentId: String,
        data: Any? = nil,
        permissions: [String]? = nil,
        transactionId: String? = nil,
        nestedType: T.Type
    ) async throws -> AppwriteModels.Document<T> {
        let apiPath: String = "/vectorsdb/{databaseId}/collections/{collectionId}/documents/{documentId}"
            .replacingOccurrences(of: "{databaseId}", with: databaseId)
            .replacingOccurrences(of: "{collectionId}", with: collectionId)
            .replacingOccurrences(of: "{documentId}", with: documentId)

        let apiParams: [String: Any?] = [
            "data": data,
            "permissions": permissions,
            "transactionId": transactionId
        ]

        let apiHeaders: [String: String] = [
            "content-type": "application/json"
        ]

        let converter: (Any) -> AppwriteModels.Document<T> = { response in
            return AppwriteModels.Document.from(map: response as! [String: Any])
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
    /// - Parameters:
    ///   - databaseId: String
    ///   - collectionId: String
    ///   - documentId: String
    ///   - data: Any (optional)
    ///   - permissions: [String] (optional)
    ///   - transactionId: String (optional)
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.Document<T>
    ///
    open func updateDocument(
        databaseId: String,
        collectionId: String,
        documentId: String,
        data: Any? = nil,
        permissions: [String]? = nil,
        transactionId: String? = nil
    ) async throws -> AppwriteModels.Document<[String: AnyCodable]> {
        return try await updateDocument(
            databaseId: databaseId,
            collectionId: collectionId,
            documentId: documentId,
            data: data,
            permissions: permissions,
            transactionId: transactionId,
            nestedType: [String: AnyCodable].self
        )
    }

    ///
    /// - Parameters:
    ///   - databaseId: String
    ///   - collectionId: String
    ///   - documentId: String
    ///   - transactionId: String (optional)
    /// - Throws: Exception if the request fails
    /// - Returns: Any
    ///
    open func deleteDocument(
        databaseId: String,
        collectionId: String,
        documentId: String,
        transactionId: String? = nil
    ) async throws -> Any {
        let apiPath: String = "/vectorsdb/{databaseId}/collections/{collectionId}/documents/{documentId}"
            .replacingOccurrences(of: "{databaseId}", with: databaseId)
            .replacingOccurrences(of: "{collectionId}", with: collectionId)
            .replacingOccurrences(of: "{documentId}", with: documentId)

        let apiParams: [String: Any?] = [
            "transactionId": transactionId
        ]

        let apiHeaders: [String: String] = [
            "content-type": "application/json"
        ]

        return try await client.call(
            method: "DELETE",
            path: apiPath,
            headers: apiHeaders,
            params: apiParams        )
    }

    ///
    /// - Parameters:
    ///   - databaseId: String
    ///   - collectionId: String
    ///   - queries: [String] (optional)
    ///   - total: Bool (optional)
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.IndexList
    ///
    open func listIndexes(
        databaseId: String,
        collectionId: String,
        queries: [String]? = nil,
        total: Bool? = nil
    ) async throws -> AppwriteModels.IndexList {
        let apiPath: String = "/vectorsdb/{databaseId}/collections/{collectionId}/indexes"
            .replacingOccurrences(of: "{databaseId}", with: databaseId)
            .replacingOccurrences(of: "{collectionId}", with: collectionId)

        let apiParams: [String: Any?] = [
            "queries": queries,
            "total": total
        ]

        let apiHeaders: [String: String] = [:]

        let converter: (Any) -> AppwriteModels.IndexList = { response in
            return AppwriteModels.IndexList.from(map: response as! [String: Any])
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
    /// - Parameters:
    ///   - databaseId: String
    ///   - collectionId: String
    ///   - key: String
    ///   - type: AppwriteEnums.VectorsDBIndexType
    ///   - attributes: [String]
    ///   - orders: [AppwriteEnums.OrderBy] (optional)
    ///   - lengths: [Int] (optional)
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.Index
    ///
    open func createIndex(
        databaseId: String,
        collectionId: String,
        key: String,
        type: AppwriteEnums.VectorsDBIndexType,
        attributes: [String],
        orders: [AppwriteEnums.OrderBy]? = nil,
        lengths: [Int]? = nil
    ) async throws -> AppwriteModels.Index {
        let apiPath: String = "/vectorsdb/{databaseId}/collections/{collectionId}/indexes"
            .replacingOccurrences(of: "{databaseId}", with: databaseId)
            .replacingOccurrences(of: "{collectionId}", with: collectionId)

        let apiParams: [String: Any?] = [
            "key": key,
            "type": type,
            "attributes": attributes,
            "orders": orders,
            "lengths": lengths
        ]

        let apiHeaders: [String: String] = [
            "content-type": "application/json"
        ]

        let converter: (Any) -> AppwriteModels.Index = { response in
            return AppwriteModels.Index.from(map: response as! [String: Any])
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
    /// - Parameters:
    ///   - databaseId: String
    ///   - collectionId: String
    ///   - key: String
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.Index
    ///
    open func getIndex(
        databaseId: String,
        collectionId: String,
        key: String
    ) async throws -> AppwriteModels.Index {
        let apiPath: String = "/vectorsdb/{databaseId}/collections/{collectionId}/indexes/{key}"
            .replacingOccurrences(of: "{databaseId}", with: databaseId)
            .replacingOccurrences(of: "{collectionId}", with: collectionId)
            .replacingOccurrences(of: "{key}", with: key)

        let apiParams: [String: Any] = [:]

        let apiHeaders: [String: String] = [:]

        let converter: (Any) -> AppwriteModels.Index = { response in
            return AppwriteModels.Index.from(map: response as! [String: Any])
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
    /// - Parameters:
    ///   - databaseId: String
    ///   - collectionId: String
    ///   - key: String
    /// - Throws: Exception if the request fails
    /// - Returns: Any
    ///
    open func deleteIndex(
        databaseId: String,
        collectionId: String,
        key: String
    ) async throws -> Any {
        let apiPath: String = "/vectorsdb/{databaseId}/collections/{collectionId}/indexes/{key}"
            .replacingOccurrences(of: "{databaseId}", with: databaseId)
            .replacingOccurrences(of: "{collectionId}", with: collectionId)
            .replacingOccurrences(of: "{key}", with: key)

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