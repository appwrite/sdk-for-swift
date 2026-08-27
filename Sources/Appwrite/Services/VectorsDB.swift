import AppwriteEnums
import AppwriteModels
import AsyncHTTPClient
import Foundation
import JSONCodable
import NIO

///
open class VectorsDB: Service {

    ///
    /// Get a list of all databases from the current Appwrite project. You can use
    /// the search parameter to filter your results.
    ///
    /// - Parameters:
    ///   - queries: [String] (optional)
    ///   - total: Bool (optional)
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.DatabaseList
    ///
    open func list(
        queries: [String]? = nil,
        total: Bool? = nil
    ) async throws -> AppwriteModels.DatabaseList {
        let apiPath: String = "/vectorsdb"

        let apiParams: [String: Any?] = [
            "queries": queries,
            "total": total,
        ]

        let apiHeaders: [String: String] = [
            "X-Appwrite-Project": client.config["project"] ?? "",
            "accept": "application/json",
        ]

        let converter: (Any) throws -> AppwriteModels.DatabaseList = { response in
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
    /// Create a new Database.
    ///
    /// - Parameters:
    ///   - databaseId: String
    ///   - name: String
    ///   - enabled: Bool (optional)
    ///   - specification: String (optional)
    ///   - replicas: Int (optional)
    ///   - syncMode: String (optional)
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.Database
    ///
    open func create(
        databaseId: String,
        name: String,
        enabled: Bool? = nil,
        specification: String? = nil,
        replicas: Int? = nil,
        syncMode: String? = nil
    ) async throws -> AppwriteModels.Database {
        let apiPath: String = "/vectorsdb"

        let apiParams: [String: Any?] = [
            "databaseId": databaseId,
            "name": name,
            "enabled": enabled,
            "specification": specification,
            "replicas": replicas,
            "syncMode": syncMode,
        ]

        let apiHeaders: [String: String] = [
            "X-Appwrite-Project": client.config["project"] ?? "",
            "content-type": "application/json",
            "accept": "application/json",
        ]

        let converter: (Any) throws -> AppwriteModels.Database = { response in
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
    /// List the dedicated database specifications available on the current plan.
    /// Each specification reports its resource limits, pricing, and whether it is
    /// enabled for the organization.
    ///
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.DedicatedDatabaseSpecificationList
    ///
    open func listSpecifications() async throws -> AppwriteModels.DedicatedDatabaseSpecificationList {
        let apiPath: String = "/vectorsdb/specifications"

        let apiParams: [String: Any] = [:]

        let apiHeaders: [String: String] = [
            "X-Appwrite-Project": client.config["project"] ?? "",
            "accept": "application/json",
        ]

        let converter: (Any) throws -> AppwriteModels.DedicatedDatabaseSpecificationList = { response in
            return AppwriteModels.DedicatedDatabaseSpecificationList.from(map: response as! [String: Any])
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
    /// List transactions across all databases.
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

        let apiHeaders: [String: String] = [
            "X-Appwrite-Project": client.config["project"] ?? "",
            "accept": "application/json",
        ]

        let converter: (Any) throws -> AppwriteModels.TransactionList = { response in
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
    /// Create a new transaction.
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
            "X-Appwrite-Project": client.config["project"] ?? "",
            "content-type": "application/json",
            "accept": "application/json",
        ]

        let converter: (Any) throws -> AppwriteModels.Transaction = { response in
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
    /// Get a transaction by its unique ID.
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

        let apiHeaders: [String: String] = [
            "X-Appwrite-Project": client.config["project"] ?? "",
            "accept": "application/json",
        ]

        let converter: (Any) throws -> AppwriteModels.Transaction = { response in
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
    /// Update a transaction, to either commit or roll back its operations.
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
            "rollback": rollback,
        ]

        let apiHeaders: [String: String] = [
            "X-Appwrite-Project": client.config["project"] ?? "",
            "content-type": "application/json",
            "accept": "application/json",
        ]

        let converter: (Any) throws -> AppwriteModels.Transaction = { response in
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
    /// Delete a transaction by its unique ID.
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
            "X-Appwrite-Project": client.config["project"] ?? "",
            "content-type": "application/json",
        ]

        return try await client.call(
            method: "DELETE",
            path: apiPath,
            headers: apiHeaders,
            params: apiParams
        )
    }
    ///
    /// Create multiple operations in a single transaction.
    ///
    /// - Parameters:
    ///   - transactionId: String
    ///   - operations: [AnyCodable] (optional)
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.Transaction
    ///
    open func createOperations(
        transactionId: String,
        operations: [AnyCodable]? = nil
    ) async throws -> AppwriteModels.Transaction {
        let apiPath: String = "/vectorsdb/transactions/{transactionId}/operations"
            .replacingOccurrences(of: "{transactionId}", with: transactionId)

        let apiParams: [String: Any?] = [
            "operations": operations
        ]

        let apiHeaders: [String: String] = [
            "X-Appwrite-Project": client.config["project"] ?? "",
            "content-type": "application/json",
            "accept": "application/json",
        ]

        let converter: (Any) throws -> AppwriteModels.Transaction = { response in
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
    /// Get a database by its unique ID. This endpoint response returns a JSON
    /// object with the database metadata.
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

        let apiHeaders: [String: String] = [
            "X-Appwrite-Project": client.config["project"] ?? "",
            "accept": "application/json",
        ]

        let converter: (Any) throws -> AppwriteModels.Database = { response in
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
    /// Update a database by its unique ID.
    ///
    /// - Parameters:
    ///   - databaseId: String
    ///   - name: String
    ///   - enabled: Bool (optional)
    ///   - specification: String (optional)
    ///   - replicas: Int (optional)
    ///   - syncMode: String (optional)
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.Database
    ///
    open func update(
        databaseId: String,
        name: String,
        enabled: Bool? = nil,
        specification: String? = nil,
        replicas: Int? = nil,
        syncMode: String? = nil
    ) async throws -> AppwriteModels.Database {
        let apiPath: String = "/vectorsdb/{databaseId}"
            .replacingOccurrences(of: "{databaseId}", with: databaseId)

        let apiParams: [String: Any?] = [
            "name": name,
            "enabled": enabled,
            "specification": specification,
            "replicas": replicas,
            "syncMode": syncMode,
        ]

        let apiHeaders: [String: String] = [
            "X-Appwrite-Project": client.config["project"] ?? "",
            "content-type": "application/json",
            "accept": "application/json",
        ]

        let converter: (Any) throws -> AppwriteModels.Database = { response in
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
    /// Delete a database by its unique ID. Only API keys with with databases.write
    /// scope can delete a database.
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
            "X-Appwrite-Project": client.config["project"] ?? "",
            "content-type": "application/json",
        ]

        return try await client.call(
            method: "DELETE",
            path: apiPath,
            headers: apiHeaders,
            params: apiParams
        )
    }
    ///
    /// Get a list of all collections that belong to the provided databaseId. You
    /// can use the search parameter to filter your results.
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
            "total": total,
        ]

        let apiHeaders: [String: String] = [
            "X-Appwrite-Project": client.config["project"] ?? "",
            "accept": "application/json",
        ]

        let converter: (Any) throws -> AppwriteModels.VectorsdbCollectionList = { response in
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
    /// Create a new Collection. Before using this route, you should create a new
    /// database resource using either a [server
    /// integration](https://appwrite.io/docs/server/databases#documentsDBCreateCollection)
    /// API or directly from your database console.
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
            "enabled": enabled,
        ]

        let apiHeaders: [String: String] = [
            "X-Appwrite-Project": client.config["project"] ?? "",
            "content-type": "application/json",
            "accept": "application/json",
        ]

        let converter: (Any) throws -> AppwriteModels.VectorsdbCollection = { response in
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
    /// Get a collection by its unique ID. This endpoint response returns a JSON
    /// object with the collection metadata.
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

        let apiHeaders: [String: String] = [
            "X-Appwrite-Project": client.config["project"] ?? "",
            "accept": "application/json",
        ]

        let converter: (Any) throws -> AppwriteModels.VectorsdbCollection = { response in
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
    /// Update a collection by its unique ID.
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
            "enabled": enabled,
        ]

        let apiHeaders: [String: String] = [
            "X-Appwrite-Project": client.config["project"] ?? "",
            "content-type": "application/json",
            "accept": "application/json",
        ]

        let converter: (Any) throws -> AppwriteModels.VectorsdbCollection = { response in
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
    /// Delete a collection by its unique ID. Only users with write permissions
    /// have access to delete this resource.
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
            "X-Appwrite-Project": client.config["project"] ?? "",
            "content-type": "application/json",
        ]

        return try await client.call(
            method: "DELETE",
            path: apiPath,
            headers: apiHeaders,
            params: apiParams
        )
    }
    ///
    /// Get a list of all the user's documents in a given collection. You can use
    /// the query params to filter your results.
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
            "ttl": ttl,
        ]

        let apiHeaders: [String: String] = [
            "X-Appwrite-Project": client.config["project"] ?? "",
            "accept": "application/json",
        ]

        let converter: (Any) throws -> AppwriteModels.DocumentList<T> = { response in
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
    /// Get a list of all the user's documents in a given collection. You can use
    /// the query params to filter your results.
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
    /// Create a new Document. Before using this route, you should create a new
    /// collection resource using either a [server
    /// integration](https://appwrite.io/docs/server/databases#documentsDBCreateCollection)
    /// API or directly from your database console.
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
            "permissions": permissions,
        ]

        let apiHeaders: [String: String] = [
            "X-Appwrite-Project": client.config["project"] ?? "",
            "content-type": "application/json",
            "accept": "application/json",
        ]

        let converter: (Any) throws -> AppwriteModels.Document<T> = { response in
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
    /// Create a new Document. Before using this route, you should create a new
    /// collection resource using either a [server
    /// integration](https://appwrite.io/docs/server/databases#documentsDBCreateCollection)
    /// API or directly from your database console.
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
    /// Create new Documents. Before using this route, you should create a new
    /// collection resource using either a [server
    /// integration](https://appwrite.io/docs/server/databases#documentsDBCreateCollection)
    /// API or directly from your database console.
    ///
    /// - Parameters:
    ///   - databaseId: String
    ///   - collectionId: String
    ///   - documents: [AnyCodable]
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.DocumentList<T>
    ///
    open func createDocuments<T>(
        databaseId: String,
        collectionId: String,
        documents: [AnyCodable],
        nestedType: T.Type
    ) async throws -> AppwriteModels.DocumentList<T> {
        let apiPath: String = "/vectorsdb/{databaseId}/collections/{collectionId}/documents"
            .replacingOccurrences(of: "{databaseId}", with: databaseId)
            .replacingOccurrences(of: "{collectionId}", with: collectionId)

        let apiParams: [String: Any?] = [
            "documents": documents
        ]

        let apiHeaders: [String: String] = [
            "X-Appwrite-Project": client.config["project"] ?? "",
            "content-type": "application/json",
            "accept": "application/json",
        ]

        let converter: (Any) throws -> AppwriteModels.DocumentList<T> = { response in
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
    /// Create new Documents. Before using this route, you should create a new
    /// collection resource using either a [server
    /// integration](https://appwrite.io/docs/server/databases#documentsDBCreateCollection)
    /// API or directly from your database console.
    ///
    /// - Parameters:
    ///   - databaseId: String
    ///   - collectionId: String
    ///   - documents: [AnyCodable]
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.DocumentList<T>
    ///
    open func createDocuments(
        databaseId: String,
        collectionId: String,
        documents: [AnyCodable]
    ) async throws -> AppwriteModels.DocumentList<[String: AnyCodable]> {
        return try await createDocuments(
            databaseId: databaseId,
            collectionId: collectionId,
            documents: documents,
            nestedType: [String: AnyCodable].self
        )
    }
    ///
    /// Create or update Documents. Before using this route, you should create a
    /// new collection resource using either a [server
    /// integration](https://appwrite.io/docs/server/databases#documentsDBCreateCollection)
    /// API or directly from your database console.
    ///
    /// - Parameters:
    ///   - databaseId: String
    ///   - collectionId: String
    ///   - documents: [AnyCodable]
    ///   - transactionId: String (optional)
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.DocumentList<T>
    ///
    open func upsertDocuments<T>(
        databaseId: String,
        collectionId: String,
        documents: [AnyCodable],
        transactionId: String? = nil,
        nestedType: T.Type
    ) async throws -> AppwriteModels.DocumentList<T> {
        let apiPath: String = "/vectorsdb/{databaseId}/collections/{collectionId}/documents"
            .replacingOccurrences(of: "{databaseId}", with: databaseId)
            .replacingOccurrences(of: "{collectionId}", with: collectionId)

        let apiParams: [String: Any?] = [
            "documents": documents,
            "transactionId": transactionId,
        ]

        let apiHeaders: [String: String] = [
            "X-Appwrite-Project": client.config["project"] ?? "",
            "content-type": "application/json",
            "accept": "application/json",
        ]

        let converter: (Any) throws -> AppwriteModels.DocumentList<T> = { response in
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
    /// Create or update Documents. Before using this route, you should create a
    /// new collection resource using either a [server
    /// integration](https://appwrite.io/docs/server/databases#documentsDBCreateCollection)
    /// API or directly from your database console.
    ///
    /// - Parameters:
    ///   - databaseId: String
    ///   - collectionId: String
    ///   - documents: [AnyCodable]
    ///   - transactionId: String (optional)
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.DocumentList<T>
    ///
    open func upsertDocuments(
        databaseId: String,
        collectionId: String,
        documents: [AnyCodable],
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
    /// Update all documents that match your queries, if no queries are submitted
    /// then all documents are updated. You can pass only specific fields to be
    /// updated.
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
            "transactionId": transactionId,
        ]

        let apiHeaders: [String: String] = [
            "X-Appwrite-Project": client.config["project"] ?? "",
            "content-type": "application/json",
            "accept": "application/json",
        ]

        let converter: (Any) throws -> AppwriteModels.DocumentList<T> = { response in
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
    /// Update all documents that match your queries, if no queries are submitted
    /// then all documents are updated. You can pass only specific fields to be
    /// updated.
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
    /// Bulk delete documents using queries, if no queries are passed then all
    /// documents are deleted.
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
            "transactionId": transactionId,
        ]

        let apiHeaders: [String: String] = [
            "X-Appwrite-Project": client.config["project"] ?? "",
            "content-type": "application/json",
            "accept": "application/json",
        ]

        let converter: (Any) throws -> AppwriteModels.DocumentList<T> = { response in
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
    /// Bulk delete documents using queries, if no queries are passed then all
    /// documents are deleted.
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
    /// Get a list of all the user's documents in a given collection using a POST
    /// request. This behaves identically to the list documents endpoint but
    /// accepts the queries in the request body, allowing much larger `queries`
    /// arrays than can fit in a URL query string.
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
    open func createQuery<T>(
        databaseId: String,
        collectionId: String,
        queries: [String]? = nil,
        transactionId: String? = nil,
        total: Bool? = nil,
        ttl: Int? = nil,
        nestedType: T.Type
    ) async throws -> AppwriteModels.DocumentList<T> {
        let apiPath: String = "/vectorsdb/{databaseId}/collections/{collectionId}/documents/query"
            .replacingOccurrences(of: "{databaseId}", with: databaseId)
            .replacingOccurrences(of: "{collectionId}", with: collectionId)

        let apiParams: [String: Any?] = [
            "queries": queries,
            "transactionId": transactionId,
            "total": total,
            "ttl": ttl,
        ]

        let apiHeaders: [String: String] = [
            "X-Appwrite-Project": client.config["project"] ?? "",
            "content-type": "application/json",
            "accept": "application/json",
        ]

        let converter: (Any) throws -> AppwriteModels.DocumentList<T> = { response in
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
    /// Get a list of all the user's documents in a given collection using a POST
    /// request. This behaves identically to the list documents endpoint but
    /// accepts the queries in the request body, allowing much larger `queries`
    /// arrays than can fit in a URL query string.
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
    open func createQuery(
        databaseId: String,
        collectionId: String,
        queries: [String]? = nil,
        transactionId: String? = nil,
        total: Bool? = nil,
        ttl: Int? = nil
    ) async throws -> AppwriteModels.DocumentList<[String: AnyCodable]> {
        return try await createQuery(
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
    /// Get a document by its unique ID. This endpoint response returns a JSON
    /// object with the document data.
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
            "transactionId": transactionId,
        ]

        let apiHeaders: [String: String] = [
            "X-Appwrite-Project": client.config["project"] ?? "",
            "accept": "application/json",
        ]

        let converter: (Any) throws -> AppwriteModels.Document<T> = { response in
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
    /// Get a document by its unique ID. This endpoint response returns a JSON
    /// object with the document data.
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
    /// Create or update a Document. Before using this route, you should create a
    /// new collection resource using either a [server
    /// integration](https://appwrite.io/docs/server/databases#documentsDBCreateCollection)
    /// API or directly from your database console.
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
            "transactionId": transactionId,
        ]

        let apiHeaders: [String: String] = [
            "X-Appwrite-Project": client.config["project"] ?? "",
            "content-type": "application/json",
            "accept": "application/json",
        ]

        let converter: (Any) throws -> AppwriteModels.Document<T> = { response in
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
    /// Create or update a Document. Before using this route, you should create a
    /// new collection resource using either a [server
    /// integration](https://appwrite.io/docs/server/databases#documentsDBCreateCollection)
    /// API or directly from your database console.
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
    /// Update a document by its unique ID. Using the patch method you can pass
    /// only specific fields that will get updated.
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
            "transactionId": transactionId,
        ]

        let apiHeaders: [String: String] = [
            "X-Appwrite-Project": client.config["project"] ?? "",
            "content-type": "application/json",
            "accept": "application/json",
        ]

        let converter: (Any) throws -> AppwriteModels.Document<T> = { response in
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
    /// Update a document by its unique ID. Using the patch method you can pass
    /// only specific fields that will get updated.
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
    /// Delete a document by its unique ID.
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
            "X-Appwrite-Project": client.config["project"] ?? "",
            "content-type": "application/json",
        ]

        return try await client.call(
            method: "DELETE",
            path: apiPath,
            headers: apiHeaders,
            params: apiParams
        )
    }
    ///
    /// List indexes in the collection.
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
            "total": total,
        ]

        let apiHeaders: [String: String] = [
            "X-Appwrite-Project": client.config["project"] ?? "",
            "accept": "application/json",
        ]

        let converter: (Any) throws -> AppwriteModels.IndexList = { response in
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
    /// Creates an index on the attributes listed. Your index should include all
    /// the attributes you will query in a single request.
    /// Attributes can be `key`, `fulltext`, and `unique`.
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
            "type": type.rawValue,
            "attributes": attributes,
            "orders": orders?.map { $0.rawValue },
            "lengths": lengths,
        ]

        let apiHeaders: [String: String] = [
            "X-Appwrite-Project": client.config["project"] ?? "",
            "content-type": "application/json",
            "accept": "application/json",
        ]

        let converter: (Any) throws -> AppwriteModels.Index = { response in
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
    /// Get index by ID.
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

        let apiHeaders: [String: String] = [
            "X-Appwrite-Project": client.config["project"] ?? "",
            "accept": "application/json",
        ]

        let converter: (Any) throws -> AppwriteModels.Index = { response in
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
    /// Delete an index.
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
            "X-Appwrite-Project": client.config["project"] ?? "",
            "content-type": "application/json",
        ]

        return try await client.call(
            method: "DELETE",
            path: apiPath,
            headers: apiHeaders,
            params: apiParams
        )
    }
    ///
    /// Trigger a manual failover for a dedicated database with high availability
    /// enabled. Promotes a replica to primary. The failover runs asynchronously;
    /// poll the database document for status updates. A database left
    /// mid-operation also accepts this call as a repair once nothing is driving
    /// the operation it is stuck in. Repairing a failover that did not finish, a
    /// `failed` database, a stranded upgrade or migrate, or a stranded compute
    /// resize additionally requires `targetReplicaId` to name the member to
    /// promote, because the default target may be the member that operation
    /// already promoted.
    ///
    /// - Parameters:
    ///   - databaseId: String
    ///   - targetReplicaId: String (optional)
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.DedicatedDatabase
    ///
    open func createFailover(
        databaseId: String,
        targetReplicaId: String? = nil
    ) async throws -> AppwriteModels.DedicatedDatabase {
        let apiPath: String = "/vectorsdb/{databaseId}/failovers"
            .replacingOccurrences(of: "{databaseId}", with: databaseId)

        let apiParams: [String: Any?] = [
            "targetReplicaId": targetReplicaId
        ]

        let apiHeaders: [String: String] = [
            "X-Appwrite-Project": client.config["project"] ?? "",
            "content-type": "application/json",
            "accept": "application/json",
        ]

        let converter: (Any) throws -> AppwriteModels.DedicatedDatabase = { response in
            return AppwriteModels.DedicatedDatabase.from(map: response as! [String: Any])
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
    /// List the lifecycle operations recorded for a dedicated database, newest
    /// first. Every provision, update, restore, backup and replication action is
    /// recorded here with its outcome, including an attempt that was abandoned
    /// because another worker took over the database.
    ///
    /// - Parameters:
    ///   - databaseId: String
    ///   - status: String (optional)
    ///   - limit: Int (optional)
    ///   - offset: Int (optional)
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.DedicatedDatabaseOperationList
    ///
    open func listOperations(
        databaseId: String,
        status: String? = nil,
        limit: Int? = nil,
        offset: Int? = nil
    ) async throws -> AppwriteModels.DedicatedDatabaseOperationList {
        let apiPath: String = "/vectorsdb/{databaseId}/operations"
            .replacingOccurrences(of: "{databaseId}", with: databaseId)

        let apiParams: [String: Any?] = [
            "status": status,
            "limit": limit,
            "offset": offset,
        ]

        let apiHeaders: [String: String] = [
            "X-Appwrite-Project": client.config["project"] ?? "",
            "accept": "application/json",
        ]

        let converter: (Any) throws -> AppwriteModels.DedicatedDatabaseOperationList = { response in
            return AppwriteModels.DedicatedDatabaseOperationList.from(map: response as! [String: Any])
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
    /// Get high availability status for a dedicated database. Returns replica
    /// statuses, replication lag, and sync mode.
    ///
    /// - Parameters:
    ///   - databaseId: String
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.DedicatedDatabaseReplicas
    ///
    open func getReplicas(
        databaseId: String
    ) async throws -> AppwriteModels.DedicatedDatabaseReplicas {
        let apiPath: String = "/vectorsdb/{databaseId}/replicas"
            .replacingOccurrences(of: "{databaseId}", with: databaseId)

        let apiParams: [String: Any] = [:]

        let apiHeaders: [String: String] = [
            "X-Appwrite-Project": client.config["project"] ?? "",
            "accept": "application/json",
        ]

        let converter: (Any) throws -> AppwriteModels.DedicatedDatabaseReplicas = { response in
            return AppwriteModels.DedicatedDatabaseReplicas.from(map: response as! [String: Any])
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
    /// Get real-time health and status information for a dedicated database.
    /// Returns health status, readiness, uptime, connection info, replica status,
    /// and volume information.
    ///
    /// - Parameters:
    ///   - databaseId: String
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.DatabaseStatus
    ///
    open func getStatus(
        databaseId: String
    ) async throws -> AppwriteModels.DatabaseStatus {
        let apiPath: String = "/vectorsdb/{databaseId}/status"
            .replacingOccurrences(of: "{databaseId}", with: databaseId)

        let apiParams: [String: Any] = [:]

        let apiHeaders: [String: String] = [
            "X-Appwrite-Project": client.config["project"] ?? "",
            "accept": "application/json",
        ]

        let converter: (Any) throws -> AppwriteModels.DatabaseStatus = { response in
            return AppwriteModels.DatabaseStatus.from(map: response as! [String: Any])
        }

        return try await client.call(
            method: "GET",
            path: apiPath,
            headers: apiHeaders,
            params: apiParams,
            converter: converter
        )
    }
}
