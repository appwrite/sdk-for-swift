import AsyncHTTPClient
import Foundation
import NIO
import JSONCodable
import AppwriteEnums
import AppwriteModels

/// The Databases service allows you to create structured collections of documents, query and filter lists of documents
open class Databases: Service {

    ///
    /// Get a list of all databases from the current Appwrite project. You can use
    /// the search parameter to filter your results.
    ///
    /// - Parameters:
    ///   - queries: [String] (optional)
    ///   - search: String (optional)
    ///   - total: Bool (optional)
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.DatabaseList
    ///
    @available(*, deprecated, message: "This API has been deprecated since 1.8.0. Please use `TablesDB.list` instead.")
    open func list(
        queries: [String]? = nil,
        search: String? = nil,
        total: Bool? = nil
    ) async throws -> AppwriteModels.DatabaseList {
        let apiPath: String = "/databases"

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
    /// Create a new Database.
    /// 
    ///
    /// - Parameters:
    ///   - databaseId: String
    ///   - name: String
    ///   - enabled: Bool (optional)
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.Database
    ///
    @available(*, deprecated, message: "This API has been deprecated since 1.8.0. Please use `TablesDB.create` instead.")
    open func create(
        databaseId: String,
        name: String,
        enabled: Bool? = nil
    ) async throws -> AppwriteModels.Database {
        let apiPath: String = "/databases"

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
        let apiPath: String = "/databases/transactions"

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
        let apiPath: String = "/databases/transactions"

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
        let apiPath: String = "/databases/transactions/{transactionId}"
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
        let apiPath: String = "/databases/transactions/{transactionId}"
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
        let apiPath: String = "/databases/transactions/{transactionId}"
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
    /// Create multiple operations in a single transaction.
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
        let apiPath: String = "/databases/transactions/{transactionId}/operations"
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
    /// Get a database by its unique ID. This endpoint response returns a JSON
    /// object with the database metadata.
    ///
    /// - Parameters:
    ///   - databaseId: String
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.Database
    ///
    @available(*, deprecated, message: "This API has been deprecated since 1.8.0. Please use `TablesDB.get` instead.")
    open func get(
        databaseId: String
    ) async throws -> AppwriteModels.Database {
        let apiPath: String = "/databases/{databaseId}"
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
    /// Update a database by its unique ID.
    ///
    /// - Parameters:
    ///   - databaseId: String
    ///   - name: String
    ///   - enabled: Bool (optional)
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.Database
    ///
    @available(*, deprecated, message: "This API has been deprecated since 1.8.0. Please use `TablesDB.update` instead.")
    open func update(
        databaseId: String,
        name: String,
        enabled: Bool? = nil
    ) async throws -> AppwriteModels.Database {
        let apiPath: String = "/databases/{databaseId}"
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
    /// Delete a database by its unique ID. Only API keys with with databases.write
    /// scope can delete a database.
    ///
    /// - Parameters:
    ///   - databaseId: String
    /// - Throws: Exception if the request fails
    /// - Returns: Any
    ///
    @available(*, deprecated, message: "This API has been deprecated since 1.8.0. Please use `TablesDB.delete` instead.")
    open func delete(
        databaseId: String
    ) async throws -> Any {
        let apiPath: String = "/databases/{databaseId}"
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
    /// Get a list of all collections that belong to the provided databaseId. You
    /// can use the search parameter to filter your results.
    ///
    /// - Parameters:
    ///   - databaseId: String
    ///   - queries: [String] (optional)
    ///   - search: String (optional)
    ///   - total: Bool (optional)
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.CollectionList
    ///
    @available(*, deprecated, message: "This API has been deprecated since 1.8.0. Please use `TablesDB.listTables` instead.")
    open func listCollections(
        databaseId: String,
        queries: [String]? = nil,
        search: String? = nil,
        total: Bool? = nil
    ) async throws -> AppwriteModels.CollectionList {
        let apiPath: String = "/databases/{databaseId}/collections"
            .replacingOccurrences(of: "{databaseId}", with: databaseId)

        let apiParams: [String: Any?] = [
            "queries": queries,
            "search": search,
            "total": total
        ]

        let apiHeaders: [String: String] = [:]

        let converter: (Any) -> AppwriteModels.CollectionList = { response in
            return AppwriteModels.CollectionList.from(map: response as! [String: Any])
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
    /// integration](https://appwrite.io/docs/server/databases#databasesCreateCollection)
    /// API or directly from your database console.
    ///
    /// - Parameters:
    ///   - databaseId: String
    ///   - collectionId: String
    ///   - name: String
    ///   - permissions: [String] (optional)
    ///   - documentSecurity: Bool (optional)
    ///   - enabled: Bool (optional)
    ///   - attributes: [Any] (optional)
    ///   - indexes: [Any] (optional)
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.Collection
    ///
    @available(*, deprecated, message: "This API has been deprecated since 1.8.0. Please use `TablesDB.createTable` instead.")
    open func createCollection(
        databaseId: String,
        collectionId: String,
        name: String,
        permissions: [String]? = nil,
        documentSecurity: Bool? = nil,
        enabled: Bool? = nil,
        attributes: [Any]? = nil,
        indexes: [Any]? = nil
    ) async throws -> AppwriteModels.Collection {
        let apiPath: String = "/databases/{databaseId}/collections"
            .replacingOccurrences(of: "{databaseId}", with: databaseId)

        let apiParams: [String: Any?] = [
            "collectionId": collectionId,
            "name": name,
            "permissions": permissions,
            "documentSecurity": documentSecurity,
            "enabled": enabled,
            "attributes": attributes,
            "indexes": indexes
        ]

        let apiHeaders: [String: String] = [
            "content-type": "application/json"
        ]

        let converter: (Any) -> AppwriteModels.Collection = { response in
            return AppwriteModels.Collection.from(map: response as! [String: Any])
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
    /// - Returns: AppwriteModels.Collection
    ///
    @available(*, deprecated, message: "This API has been deprecated since 1.8.0. Please use `TablesDB.getTable` instead.")
    open func getCollection(
        databaseId: String,
        collectionId: String
    ) async throws -> AppwriteModels.Collection {
        let apiPath: String = "/databases/{databaseId}/collections/{collectionId}"
            .replacingOccurrences(of: "{databaseId}", with: databaseId)
            .replacingOccurrences(of: "{collectionId}", with: collectionId)

        let apiParams: [String: Any] = [:]

        let apiHeaders: [String: String] = [:]

        let converter: (Any) -> AppwriteModels.Collection = { response in
            return AppwriteModels.Collection.from(map: response as! [String: Any])
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
    ///   - permissions: [String] (optional)
    ///   - documentSecurity: Bool (optional)
    ///   - enabled: Bool (optional)
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.Collection
    ///
    @available(*, deprecated, message: "This API has been deprecated since 1.8.0. Please use `TablesDB.updateTable` instead.")
    open func updateCollection(
        databaseId: String,
        collectionId: String,
        name: String,
        permissions: [String]? = nil,
        documentSecurity: Bool? = nil,
        enabled: Bool? = nil
    ) async throws -> AppwriteModels.Collection {
        let apiPath: String = "/databases/{databaseId}/collections/{collectionId}"
            .replacingOccurrences(of: "{databaseId}", with: databaseId)
            .replacingOccurrences(of: "{collectionId}", with: collectionId)

        let apiParams: [String: Any?] = [
            "name": name,
            "permissions": permissions,
            "documentSecurity": documentSecurity,
            "enabled": enabled
        ]

        let apiHeaders: [String: String] = [
            "content-type": "application/json"
        ]

        let converter: (Any) -> AppwriteModels.Collection = { response in
            return AppwriteModels.Collection.from(map: response as! [String: Any])
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
    @available(*, deprecated, message: "This API has been deprecated since 1.8.0. Please use `TablesDB.deleteTable` instead.")
    open func deleteCollection(
        databaseId: String,
        collectionId: String
    ) async throws -> Any {
        let apiPath: String = "/databases/{databaseId}/collections/{collectionId}"
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
    /// List attributes in the collection.
    ///
    /// - Parameters:
    ///   - databaseId: String
    ///   - collectionId: String
    ///   - queries: [String] (optional)
    ///   - total: Bool (optional)
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.AttributeList
    ///
    @available(*, deprecated, message: "This API has been deprecated since 1.8.0. Please use `TablesDB.listColumns` instead.")
    open func listAttributes(
        databaseId: String,
        collectionId: String,
        queries: [String]? = nil,
        total: Bool? = nil
    ) async throws -> AppwriteModels.AttributeList {
        let apiPath: String = "/databases/{databaseId}/collections/{collectionId}/attributes"
            .replacingOccurrences(of: "{databaseId}", with: databaseId)
            .replacingOccurrences(of: "{collectionId}", with: collectionId)

        let apiParams: [String: Any?] = [
            "queries": queries,
            "total": total
        ]

        let apiHeaders: [String: String] = [:]

        let converter: (Any) -> AppwriteModels.AttributeList = { response in
            return AppwriteModels.AttributeList.from(map: response as! [String: Any])
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
    /// Create a boolean attribute.
    /// 
    ///
    /// - Parameters:
    ///   - databaseId: String
    ///   - collectionId: String
    ///   - key: String
    ///   - required: Bool
    ///   - default: Bool (optional)
    ///   - array: Bool (optional)
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.AttributeBoolean
    ///
    @available(*, deprecated, message: "This API has been deprecated since 1.8.0. Please use `TablesDB.createBooleanColumn` instead.")
    open func createBooleanAttribute(
        databaseId: String,
        collectionId: String,
        key: String,
        `required`: Bool,
        `default`: Bool? = nil,
        array: Bool? = nil
    ) async throws -> AppwriteModels.AttributeBoolean {
        let apiPath: String = "/databases/{databaseId}/collections/{collectionId}/attributes/boolean"
            .replacingOccurrences(of: "{databaseId}", with: databaseId)
            .replacingOccurrences(of: "{collectionId}", with: collectionId)

        let apiParams: [String: Any?] = [
            "key": key,
            "required": `required`,
            "default": `default`,
            "array": array
        ]

        let apiHeaders: [String: String] = [
            "content-type": "application/json"
        ]

        let converter: (Any) -> AppwriteModels.AttributeBoolean = { response in
            return AppwriteModels.AttributeBoolean.from(map: response as! [String: Any])
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
    /// Update a boolean attribute. Changing the `default` value will not update
    /// already existing documents.
    ///
    /// - Parameters:
    ///   - databaseId: String
    ///   - collectionId: String
    ///   - key: String
    ///   - required: Bool
    ///   - default: Bool (optional)
    ///   - newKey: String (optional)
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.AttributeBoolean
    ///
    @available(*, deprecated, message: "This API has been deprecated since 1.8.0. Please use `TablesDB.updateBooleanColumn` instead.")
    open func updateBooleanAttribute(
        databaseId: String,
        collectionId: String,
        key: String,
        `required`: Bool,
        `default`: Bool? = nil,
        newKey: String? = nil
    ) async throws -> AppwriteModels.AttributeBoolean {
        let apiPath: String = "/databases/{databaseId}/collections/{collectionId}/attributes/boolean/{key}"
            .replacingOccurrences(of: "{databaseId}", with: databaseId)
            .replacingOccurrences(of: "{collectionId}", with: collectionId)
            .replacingOccurrences(of: "{key}", with: key)

        let apiParams: [String: Any?] = [
            "required": `required`,
            "default": `default`,
            "newKey": newKey
        ]

        let apiHeaders: [String: String] = [
            "content-type": "application/json"
        ]

        let converter: (Any) -> AppwriteModels.AttributeBoolean = { response in
            return AppwriteModels.AttributeBoolean.from(map: response as! [String: Any])
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
    /// Create a date time attribute according to the ISO 8601 standard.
    ///
    /// - Parameters:
    ///   - databaseId: String
    ///   - collectionId: String
    ///   - key: String
    ///   - required: Bool
    ///   - default: String (optional)
    ///   - array: Bool (optional)
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.AttributeDatetime
    ///
    @available(*, deprecated, message: "This API has been deprecated since 1.8.0. Please use `TablesDB.createDatetimeColumn` instead.")
    open func createDatetimeAttribute(
        databaseId: String,
        collectionId: String,
        key: String,
        `required`: Bool,
        `default`: String? = nil,
        array: Bool? = nil
    ) async throws -> AppwriteModels.AttributeDatetime {
        let apiPath: String = "/databases/{databaseId}/collections/{collectionId}/attributes/datetime"
            .replacingOccurrences(of: "{databaseId}", with: databaseId)
            .replacingOccurrences(of: "{collectionId}", with: collectionId)

        let apiParams: [String: Any?] = [
            "key": key,
            "required": `required`,
            "default": `default`,
            "array": array
        ]

        let apiHeaders: [String: String] = [
            "content-type": "application/json"
        ]

        let converter: (Any) -> AppwriteModels.AttributeDatetime = { response in
            return AppwriteModels.AttributeDatetime.from(map: response as! [String: Any])
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
    /// Update a date time attribute. Changing the `default` value will not update
    /// already existing documents.
    ///
    /// - Parameters:
    ///   - databaseId: String
    ///   - collectionId: String
    ///   - key: String
    ///   - required: Bool
    ///   - default: String (optional)
    ///   - newKey: String (optional)
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.AttributeDatetime
    ///
    @available(*, deprecated, message: "This API has been deprecated since 1.8.0. Please use `TablesDB.updateDatetimeColumn` instead.")
    open func updateDatetimeAttribute(
        databaseId: String,
        collectionId: String,
        key: String,
        `required`: Bool,
        `default`: String? = nil,
        newKey: String? = nil
    ) async throws -> AppwriteModels.AttributeDatetime {
        let apiPath: String = "/databases/{databaseId}/collections/{collectionId}/attributes/datetime/{key}"
            .replacingOccurrences(of: "{databaseId}", with: databaseId)
            .replacingOccurrences(of: "{collectionId}", with: collectionId)
            .replacingOccurrences(of: "{key}", with: key)

        let apiParams: [String: Any?] = [
            "required": `required`,
            "default": `default`,
            "newKey": newKey
        ]

        let apiHeaders: [String: String] = [
            "content-type": "application/json"
        ]

        let converter: (Any) -> AppwriteModels.AttributeDatetime = { response in
            return AppwriteModels.AttributeDatetime.from(map: response as! [String: Any])
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
    /// Create an email attribute.
    /// 
    ///
    /// - Parameters:
    ///   - databaseId: String
    ///   - collectionId: String
    ///   - key: String
    ///   - required: Bool
    ///   - default: String (optional)
    ///   - array: Bool (optional)
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.AttributeEmail
    ///
    @available(*, deprecated, message: "This API has been deprecated since 1.8.0. Please use `TablesDB.createEmailColumn` instead.")
    open func createEmailAttribute(
        databaseId: String,
        collectionId: String,
        key: String,
        `required`: Bool,
        `default`: String? = nil,
        array: Bool? = nil
    ) async throws -> AppwriteModels.AttributeEmail {
        let apiPath: String = "/databases/{databaseId}/collections/{collectionId}/attributes/email"
            .replacingOccurrences(of: "{databaseId}", with: databaseId)
            .replacingOccurrences(of: "{collectionId}", with: collectionId)

        let apiParams: [String: Any?] = [
            "key": key,
            "required": `required`,
            "default": `default`,
            "array": array
        ]

        let apiHeaders: [String: String] = [
            "content-type": "application/json"
        ]

        let converter: (Any) -> AppwriteModels.AttributeEmail = { response in
            return AppwriteModels.AttributeEmail.from(map: response as! [String: Any])
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
    /// Update an email attribute. Changing the `default` value will not update
    /// already existing documents.
    /// 
    ///
    /// - Parameters:
    ///   - databaseId: String
    ///   - collectionId: String
    ///   - key: String
    ///   - required: Bool
    ///   - default: String (optional)
    ///   - newKey: String (optional)
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.AttributeEmail
    ///
    @available(*, deprecated, message: "This API has been deprecated since 1.8.0. Please use `TablesDB.updateEmailColumn` instead.")
    open func updateEmailAttribute(
        databaseId: String,
        collectionId: String,
        key: String,
        `required`: Bool,
        `default`: String? = nil,
        newKey: String? = nil
    ) async throws -> AppwriteModels.AttributeEmail {
        let apiPath: String = "/databases/{databaseId}/collections/{collectionId}/attributes/email/{key}"
            .replacingOccurrences(of: "{databaseId}", with: databaseId)
            .replacingOccurrences(of: "{collectionId}", with: collectionId)
            .replacingOccurrences(of: "{key}", with: key)

        let apiParams: [String: Any?] = [
            "required": `required`,
            "default": `default`,
            "newKey": newKey
        ]

        let apiHeaders: [String: String] = [
            "content-type": "application/json"
        ]

        let converter: (Any) -> AppwriteModels.AttributeEmail = { response in
            return AppwriteModels.AttributeEmail.from(map: response as! [String: Any])
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
    /// Create an enum attribute. The `elements` param acts as a white-list of
    /// accepted values for this attribute. 
    /// 
    ///
    /// - Parameters:
    ///   - databaseId: String
    ///   - collectionId: String
    ///   - key: String
    ///   - elements: [String]
    ///   - required: Bool
    ///   - default: String (optional)
    ///   - array: Bool (optional)
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.AttributeEnum
    ///
    @available(*, deprecated, message: "This API has been deprecated since 1.8.0. Please use `TablesDB.createEnumColumn` instead.")
    open func createEnumAttribute(
        databaseId: String,
        collectionId: String,
        key: String,
        elements: [String],
        `required`: Bool,
        `default`: String? = nil,
        array: Bool? = nil
    ) async throws -> AppwriteModels.AttributeEnum {
        let apiPath: String = "/databases/{databaseId}/collections/{collectionId}/attributes/enum"
            .replacingOccurrences(of: "{databaseId}", with: databaseId)
            .replacingOccurrences(of: "{collectionId}", with: collectionId)

        let apiParams: [String: Any?] = [
            "key": key,
            "elements": elements,
            "required": `required`,
            "default": `default`,
            "array": array
        ]

        let apiHeaders: [String: String] = [
            "content-type": "application/json"
        ]

        let converter: (Any) -> AppwriteModels.AttributeEnum = { response in
            return AppwriteModels.AttributeEnum.from(map: response as! [String: Any])
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
    /// Update an enum attribute. Changing the `default` value will not update
    /// already existing documents.
    /// 
    ///
    /// - Parameters:
    ///   - databaseId: String
    ///   - collectionId: String
    ///   - key: String
    ///   - elements: [String]
    ///   - required: Bool
    ///   - default: String (optional)
    ///   - newKey: String (optional)
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.AttributeEnum
    ///
    @available(*, deprecated, message: "This API has been deprecated since 1.8.0. Please use `TablesDB.updateEnumColumn` instead.")
    open func updateEnumAttribute(
        databaseId: String,
        collectionId: String,
        key: String,
        elements: [String],
        `required`: Bool,
        `default`: String? = nil,
        newKey: String? = nil
    ) async throws -> AppwriteModels.AttributeEnum {
        let apiPath: String = "/databases/{databaseId}/collections/{collectionId}/attributes/enum/{key}"
            .replacingOccurrences(of: "{databaseId}", with: databaseId)
            .replacingOccurrences(of: "{collectionId}", with: collectionId)
            .replacingOccurrences(of: "{key}", with: key)

        let apiParams: [String: Any?] = [
            "elements": elements,
            "required": `required`,
            "default": `default`,
            "newKey": newKey
        ]

        let apiHeaders: [String: String] = [
            "content-type": "application/json"
        ]

        let converter: (Any) -> AppwriteModels.AttributeEnum = { response in
            return AppwriteModels.AttributeEnum.from(map: response as! [String: Any])
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
    /// Create a float attribute. Optionally, minimum and maximum values can be
    /// provided.
    /// 
    ///
    /// - Parameters:
    ///   - databaseId: String
    ///   - collectionId: String
    ///   - key: String
    ///   - required: Bool
    ///   - min: Double (optional)
    ///   - max: Double (optional)
    ///   - default: Double (optional)
    ///   - array: Bool (optional)
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.AttributeFloat
    ///
    @available(*, deprecated, message: "This API has been deprecated since 1.8.0. Please use `TablesDB.createFloatColumn` instead.")
    open func createFloatAttribute(
        databaseId: String,
        collectionId: String,
        key: String,
        `required`: Bool,
        min: Double? = nil,
        max: Double? = nil,
        `default`: Double? = nil,
        array: Bool? = nil
    ) async throws -> AppwriteModels.AttributeFloat {
        let apiPath: String = "/databases/{databaseId}/collections/{collectionId}/attributes/float"
            .replacingOccurrences(of: "{databaseId}", with: databaseId)
            .replacingOccurrences(of: "{collectionId}", with: collectionId)

        let apiParams: [String: Any?] = [
            "key": key,
            "required": `required`,
            "min": min,
            "max": max,
            "default": `default`,
            "array": array
        ]

        let apiHeaders: [String: String] = [
            "content-type": "application/json"
        ]

        let converter: (Any) -> AppwriteModels.AttributeFloat = { response in
            return AppwriteModels.AttributeFloat.from(map: response as! [String: Any])
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
    /// Update a float attribute. Changing the `default` value will not update
    /// already existing documents.
    /// 
    ///
    /// - Parameters:
    ///   - databaseId: String
    ///   - collectionId: String
    ///   - key: String
    ///   - required: Bool
    ///   - default: Double (optional)
    ///   - min: Double (optional)
    ///   - max: Double (optional)
    ///   - newKey: String (optional)
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.AttributeFloat
    ///
    @available(*, deprecated, message: "This API has been deprecated since 1.8.0. Please use `TablesDB.updateFloatColumn` instead.")
    open func updateFloatAttribute(
        databaseId: String,
        collectionId: String,
        key: String,
        `required`: Bool,
        `default`: Double? = nil,
        min: Double? = nil,
        max: Double? = nil,
        newKey: String? = nil
    ) async throws -> AppwriteModels.AttributeFloat {
        let apiPath: String = "/databases/{databaseId}/collections/{collectionId}/attributes/float/{key}"
            .replacingOccurrences(of: "{databaseId}", with: databaseId)
            .replacingOccurrences(of: "{collectionId}", with: collectionId)
            .replacingOccurrences(of: "{key}", with: key)

        let apiParams: [String: Any?] = [
            "required": `required`,
            "min": min,
            "max": max,
            "default": `default`,
            "newKey": newKey
        ]

        let apiHeaders: [String: String] = [
            "content-type": "application/json"
        ]

        let converter: (Any) -> AppwriteModels.AttributeFloat = { response in
            return AppwriteModels.AttributeFloat.from(map: response as! [String: Any])
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
    /// Create an integer attribute. Optionally, minimum and maximum values can be
    /// provided.
    /// 
    ///
    /// - Parameters:
    ///   - databaseId: String
    ///   - collectionId: String
    ///   - key: String
    ///   - required: Bool
    ///   - min: Int (optional)
    ///   - max: Int (optional)
    ///   - default: Int (optional)
    ///   - array: Bool (optional)
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.AttributeInteger
    ///
    @available(*, deprecated, message: "This API has been deprecated since 1.8.0. Please use `TablesDB.createIntegerColumn` instead.")
    open func createIntegerAttribute(
        databaseId: String,
        collectionId: String,
        key: String,
        `required`: Bool,
        min: Int? = nil,
        max: Int? = nil,
        `default`: Int? = nil,
        array: Bool? = nil
    ) async throws -> AppwriteModels.AttributeInteger {
        let apiPath: String = "/databases/{databaseId}/collections/{collectionId}/attributes/integer"
            .replacingOccurrences(of: "{databaseId}", with: databaseId)
            .replacingOccurrences(of: "{collectionId}", with: collectionId)

        let apiParams: [String: Any?] = [
            "key": key,
            "required": `required`,
            "min": min,
            "max": max,
            "default": `default`,
            "array": array
        ]

        let apiHeaders: [String: String] = [
            "content-type": "application/json"
        ]

        let converter: (Any) -> AppwriteModels.AttributeInteger = { response in
            return AppwriteModels.AttributeInteger.from(map: response as! [String: Any])
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
    /// Update an integer attribute. Changing the `default` value will not update
    /// already existing documents.
    /// 
    ///
    /// - Parameters:
    ///   - databaseId: String
    ///   - collectionId: String
    ///   - key: String
    ///   - required: Bool
    ///   - default: Int (optional)
    ///   - min: Int (optional)
    ///   - max: Int (optional)
    ///   - newKey: String (optional)
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.AttributeInteger
    ///
    @available(*, deprecated, message: "This API has been deprecated since 1.8.0. Please use `TablesDB.updateIntegerColumn` instead.")
    open func updateIntegerAttribute(
        databaseId: String,
        collectionId: String,
        key: String,
        `required`: Bool,
        `default`: Int? = nil,
        min: Int? = nil,
        max: Int? = nil,
        newKey: String? = nil
    ) async throws -> AppwriteModels.AttributeInteger {
        let apiPath: String = "/databases/{databaseId}/collections/{collectionId}/attributes/integer/{key}"
            .replacingOccurrences(of: "{databaseId}", with: databaseId)
            .replacingOccurrences(of: "{collectionId}", with: collectionId)
            .replacingOccurrences(of: "{key}", with: key)

        let apiParams: [String: Any?] = [
            "required": `required`,
            "min": min,
            "max": max,
            "default": `default`,
            "newKey": newKey
        ]

        let apiHeaders: [String: String] = [
            "content-type": "application/json"
        ]

        let converter: (Any) -> AppwriteModels.AttributeInteger = { response in
            return AppwriteModels.AttributeInteger.from(map: response as! [String: Any])
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
    /// Create IP address attribute.
    /// 
    ///
    /// - Parameters:
    ///   - databaseId: String
    ///   - collectionId: String
    ///   - key: String
    ///   - required: Bool
    ///   - default: String (optional)
    ///   - array: Bool (optional)
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.AttributeIp
    ///
    @available(*, deprecated, message: "This API has been deprecated since 1.8.0. Please use `TablesDB.createIpColumn` instead.")
    open func createIpAttribute(
        databaseId: String,
        collectionId: String,
        key: String,
        `required`: Bool,
        `default`: String? = nil,
        array: Bool? = nil
    ) async throws -> AppwriteModels.AttributeIp {
        let apiPath: String = "/databases/{databaseId}/collections/{collectionId}/attributes/ip"
            .replacingOccurrences(of: "{databaseId}", with: databaseId)
            .replacingOccurrences(of: "{collectionId}", with: collectionId)

        let apiParams: [String: Any?] = [
            "key": key,
            "required": `required`,
            "default": `default`,
            "array": array
        ]

        let apiHeaders: [String: String] = [
            "content-type": "application/json"
        ]

        let converter: (Any) -> AppwriteModels.AttributeIp = { response in
            return AppwriteModels.AttributeIp.from(map: response as! [String: Any])
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
    /// Update an ip attribute. Changing the `default` value will not update
    /// already existing documents.
    /// 
    ///
    /// - Parameters:
    ///   - databaseId: String
    ///   - collectionId: String
    ///   - key: String
    ///   - required: Bool
    ///   - default: String (optional)
    ///   - newKey: String (optional)
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.AttributeIp
    ///
    @available(*, deprecated, message: "This API has been deprecated since 1.8.0. Please use `TablesDB.updateIpColumn` instead.")
    open func updateIpAttribute(
        databaseId: String,
        collectionId: String,
        key: String,
        `required`: Bool,
        `default`: String? = nil,
        newKey: String? = nil
    ) async throws -> AppwriteModels.AttributeIp {
        let apiPath: String = "/databases/{databaseId}/collections/{collectionId}/attributes/ip/{key}"
            .replacingOccurrences(of: "{databaseId}", with: databaseId)
            .replacingOccurrences(of: "{collectionId}", with: collectionId)
            .replacingOccurrences(of: "{key}", with: key)

        let apiParams: [String: Any?] = [
            "required": `required`,
            "default": `default`,
            "newKey": newKey
        ]

        let apiHeaders: [String: String] = [
            "content-type": "application/json"
        ]

        let converter: (Any) -> AppwriteModels.AttributeIp = { response in
            return AppwriteModels.AttributeIp.from(map: response as! [String: Any])
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
    /// Create a geometric line attribute.
    ///
    /// - Parameters:
    ///   - databaseId: String
    ///   - collectionId: String
    ///   - key: String
    ///   - required: Bool
    ///   - default: [AnyCodable] (optional)
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.AttributeLine
    ///
    @available(*, deprecated, message: "This API has been deprecated since 1.8.0. Please use `TablesDB.createLineColumn` instead.")
    open func createLineAttribute(
        databaseId: String,
        collectionId: String,
        key: String,
        `required`: Bool,
        `default`: [AnyCodable]? = nil
    ) async throws -> AppwriteModels.AttributeLine {
        let apiPath: String = "/databases/{databaseId}/collections/{collectionId}/attributes/line"
            .replacingOccurrences(of: "{databaseId}", with: databaseId)
            .replacingOccurrences(of: "{collectionId}", with: collectionId)

        let apiParams: [String: Any?] = [
            "key": key,
            "required": `required`,
            "default": `default`
        ]

        let apiHeaders: [String: String] = [
            "content-type": "application/json"
        ]

        let converter: (Any) -> AppwriteModels.AttributeLine = { response in
            return AppwriteModels.AttributeLine.from(map: response as! [String: Any])
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
    /// Update a line attribute. Changing the `default` value will not update
    /// already existing documents.
    ///
    /// - Parameters:
    ///   - databaseId: String
    ///   - collectionId: String
    ///   - key: String
    ///   - required: Bool
    ///   - default: [AnyCodable] (optional)
    ///   - newKey: String (optional)
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.AttributeLine
    ///
    @available(*, deprecated, message: "This API has been deprecated since 1.8.0. Please use `TablesDB.updateLineColumn` instead.")
    open func updateLineAttribute(
        databaseId: String,
        collectionId: String,
        key: String,
        `required`: Bool,
        `default`: [AnyCodable]? = nil,
        newKey: String? = nil
    ) async throws -> AppwriteModels.AttributeLine {
        let apiPath: String = "/databases/{databaseId}/collections/{collectionId}/attributes/line/{key}"
            .replacingOccurrences(of: "{databaseId}", with: databaseId)
            .replacingOccurrences(of: "{collectionId}", with: collectionId)
            .replacingOccurrences(of: "{key}", with: key)

        let apiParams: [String: Any?] = [
            "required": `required`,
            "default": `default`,
            "newKey": newKey
        ]

        let apiHeaders: [String: String] = [
            "content-type": "application/json"
        ]

        let converter: (Any) -> AppwriteModels.AttributeLine = { response in
            return AppwriteModels.AttributeLine.from(map: response as! [String: Any])
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
    /// Create a geometric point attribute.
    ///
    /// - Parameters:
    ///   - databaseId: String
    ///   - collectionId: String
    ///   - key: String
    ///   - required: Bool
    ///   - default: [AnyCodable] (optional)
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.AttributePoint
    ///
    @available(*, deprecated, message: "This API has been deprecated since 1.8.0. Please use `TablesDB.createPointColumn` instead.")
    open func createPointAttribute(
        databaseId: String,
        collectionId: String,
        key: String,
        `required`: Bool,
        `default`: [AnyCodable]? = nil
    ) async throws -> AppwriteModels.AttributePoint {
        let apiPath: String = "/databases/{databaseId}/collections/{collectionId}/attributes/point"
            .replacingOccurrences(of: "{databaseId}", with: databaseId)
            .replacingOccurrences(of: "{collectionId}", with: collectionId)

        let apiParams: [String: Any?] = [
            "key": key,
            "required": `required`,
            "default": `default`
        ]

        let apiHeaders: [String: String] = [
            "content-type": "application/json"
        ]

        let converter: (Any) -> AppwriteModels.AttributePoint = { response in
            return AppwriteModels.AttributePoint.from(map: response as! [String: Any])
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
    /// Update a point attribute. Changing the `default` value will not update
    /// already existing documents.
    ///
    /// - Parameters:
    ///   - databaseId: String
    ///   - collectionId: String
    ///   - key: String
    ///   - required: Bool
    ///   - default: [AnyCodable] (optional)
    ///   - newKey: String (optional)
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.AttributePoint
    ///
    @available(*, deprecated, message: "This API has been deprecated since 1.8.0. Please use `TablesDB.updatePointColumn` instead.")
    open func updatePointAttribute(
        databaseId: String,
        collectionId: String,
        key: String,
        `required`: Bool,
        `default`: [AnyCodable]? = nil,
        newKey: String? = nil
    ) async throws -> AppwriteModels.AttributePoint {
        let apiPath: String = "/databases/{databaseId}/collections/{collectionId}/attributes/point/{key}"
            .replacingOccurrences(of: "{databaseId}", with: databaseId)
            .replacingOccurrences(of: "{collectionId}", with: collectionId)
            .replacingOccurrences(of: "{key}", with: key)

        let apiParams: [String: Any?] = [
            "required": `required`,
            "default": `default`,
            "newKey": newKey
        ]

        let apiHeaders: [String: String] = [
            "content-type": "application/json"
        ]

        let converter: (Any) -> AppwriteModels.AttributePoint = { response in
            return AppwriteModels.AttributePoint.from(map: response as! [String: Any])
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
    /// Create a geometric polygon attribute.
    ///
    /// - Parameters:
    ///   - databaseId: String
    ///   - collectionId: String
    ///   - key: String
    ///   - required: Bool
    ///   - default: [AnyCodable] (optional)
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.AttributePolygon
    ///
    @available(*, deprecated, message: "This API has been deprecated since 1.8.0. Please use `TablesDB.createPolygonColumn` instead.")
    open func createPolygonAttribute(
        databaseId: String,
        collectionId: String,
        key: String,
        `required`: Bool,
        `default`: [AnyCodable]? = nil
    ) async throws -> AppwriteModels.AttributePolygon {
        let apiPath: String = "/databases/{databaseId}/collections/{collectionId}/attributes/polygon"
            .replacingOccurrences(of: "{databaseId}", with: databaseId)
            .replacingOccurrences(of: "{collectionId}", with: collectionId)

        let apiParams: [String: Any?] = [
            "key": key,
            "required": `required`,
            "default": `default`
        ]

        let apiHeaders: [String: String] = [
            "content-type": "application/json"
        ]

        let converter: (Any) -> AppwriteModels.AttributePolygon = { response in
            return AppwriteModels.AttributePolygon.from(map: response as! [String: Any])
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
    /// Update a polygon attribute. Changing the `default` value will not update
    /// already existing documents.
    ///
    /// - Parameters:
    ///   - databaseId: String
    ///   - collectionId: String
    ///   - key: String
    ///   - required: Bool
    ///   - default: [AnyCodable] (optional)
    ///   - newKey: String (optional)
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.AttributePolygon
    ///
    @available(*, deprecated, message: "This API has been deprecated since 1.8.0. Please use `TablesDB.updatePolygonColumn` instead.")
    open func updatePolygonAttribute(
        databaseId: String,
        collectionId: String,
        key: String,
        `required`: Bool,
        `default`: [AnyCodable]? = nil,
        newKey: String? = nil
    ) async throws -> AppwriteModels.AttributePolygon {
        let apiPath: String = "/databases/{databaseId}/collections/{collectionId}/attributes/polygon/{key}"
            .replacingOccurrences(of: "{databaseId}", with: databaseId)
            .replacingOccurrences(of: "{collectionId}", with: collectionId)
            .replacingOccurrences(of: "{key}", with: key)

        let apiParams: [String: Any?] = [
            "required": `required`,
            "default": `default`,
            "newKey": newKey
        ]

        let apiHeaders: [String: String] = [
            "content-type": "application/json"
        ]

        let converter: (Any) -> AppwriteModels.AttributePolygon = { response in
            return AppwriteModels.AttributePolygon.from(map: response as! [String: Any])
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
    /// Create relationship attribute. [Learn more about relationship
    /// attributes](https://appwrite.io/docs/databases-relationships#relationship-attributes).
    /// 
    ///
    /// - Parameters:
    ///   - databaseId: String
    ///   - collectionId: String
    ///   - relatedCollectionId: String
    ///   - type: AppwriteEnums.RelationshipType
    ///   - twoWay: Bool (optional)
    ///   - key: String (optional)
    ///   - twoWayKey: String (optional)
    ///   - onDelete: AppwriteEnums.RelationMutate (optional)
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.AttributeRelationship
    ///
    @available(*, deprecated, message: "This API has been deprecated since 1.8.0. Please use `TablesDB.createRelationshipColumn` instead.")
    open func createRelationshipAttribute(
        databaseId: String,
        collectionId: String,
        relatedCollectionId: String,
        type: AppwriteEnums.RelationshipType,
        twoWay: Bool? = nil,
        key: String? = nil,
        twoWayKey: String? = nil,
        onDelete: AppwriteEnums.RelationMutate? = nil
    ) async throws -> AppwriteModels.AttributeRelationship {
        let apiPath: String = "/databases/{databaseId}/collections/{collectionId}/attributes/relationship"
            .replacingOccurrences(of: "{databaseId}", with: databaseId)
            .replacingOccurrences(of: "{collectionId}", with: collectionId)

        let apiParams: [String: Any?] = [
            "relatedCollectionId": relatedCollectionId,
            "type": type,
            "twoWay": twoWay,
            "key": key,
            "twoWayKey": twoWayKey,
            "onDelete": onDelete
        ]

        let apiHeaders: [String: String] = [
            "content-type": "application/json"
        ]

        let converter: (Any) -> AppwriteModels.AttributeRelationship = { response in
            return AppwriteModels.AttributeRelationship.from(map: response as! [String: Any])
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
    /// Create a string attribute.
    /// 
    ///
    /// - Parameters:
    ///   - databaseId: String
    ///   - collectionId: String
    ///   - key: String
    ///   - size: Int
    ///   - required: Bool
    ///   - default: String (optional)
    ///   - array: Bool (optional)
    ///   - encrypt: Bool (optional)
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.AttributeString
    ///
    @available(*, deprecated, message: "This API has been deprecated since 1.8.0. Please use `TablesDB.createStringColumn` instead.")
    open func createStringAttribute(
        databaseId: String,
        collectionId: String,
        key: String,
        size: Int,
        `required`: Bool,
        `default`: String? = nil,
        array: Bool? = nil,
        encrypt: Bool? = nil
    ) async throws -> AppwriteModels.AttributeString {
        let apiPath: String = "/databases/{databaseId}/collections/{collectionId}/attributes/string"
            .replacingOccurrences(of: "{databaseId}", with: databaseId)
            .replacingOccurrences(of: "{collectionId}", with: collectionId)

        let apiParams: [String: Any?] = [
            "key": key,
            "size": size,
            "required": `required`,
            "default": `default`,
            "array": array,
            "encrypt": encrypt
        ]

        let apiHeaders: [String: String] = [
            "content-type": "application/json"
        ]

        let converter: (Any) -> AppwriteModels.AttributeString = { response in
            return AppwriteModels.AttributeString.from(map: response as! [String: Any])
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
    /// Update a string attribute. Changing the `default` value will not update
    /// already existing documents.
    /// 
    ///
    /// - Parameters:
    ///   - databaseId: String
    ///   - collectionId: String
    ///   - key: String
    ///   - required: Bool
    ///   - default: String (optional)
    ///   - size: Int (optional)
    ///   - newKey: String (optional)
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.AttributeString
    ///
    @available(*, deprecated, message: "This API has been deprecated since 1.8.0. Please use `TablesDB.updateStringColumn` instead.")
    open func updateStringAttribute(
        databaseId: String,
        collectionId: String,
        key: String,
        `required`: Bool,
        `default`: String? = nil,
        size: Int? = nil,
        newKey: String? = nil
    ) async throws -> AppwriteModels.AttributeString {
        let apiPath: String = "/databases/{databaseId}/collections/{collectionId}/attributes/string/{key}"
            .replacingOccurrences(of: "{databaseId}", with: databaseId)
            .replacingOccurrences(of: "{collectionId}", with: collectionId)
            .replacingOccurrences(of: "{key}", with: key)

        let apiParams: [String: Any?] = [
            "required": `required`,
            "default": `default`,
            "size": size,
            "newKey": newKey
        ]

        let apiHeaders: [String: String] = [
            "content-type": "application/json"
        ]

        let converter: (Any) -> AppwriteModels.AttributeString = { response in
            return AppwriteModels.AttributeString.from(map: response as! [String: Any])
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
    /// Create a URL attribute.
    /// 
    ///
    /// - Parameters:
    ///   - databaseId: String
    ///   - collectionId: String
    ///   - key: String
    ///   - required: Bool
    ///   - default: String (optional)
    ///   - array: Bool (optional)
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.AttributeUrl
    ///
    @available(*, deprecated, message: "This API has been deprecated since 1.8.0. Please use `TablesDB.createUrlColumn` instead.")
    open func createUrlAttribute(
        databaseId: String,
        collectionId: String,
        key: String,
        `required`: Bool,
        `default`: String? = nil,
        array: Bool? = nil
    ) async throws -> AppwriteModels.AttributeUrl {
        let apiPath: String = "/databases/{databaseId}/collections/{collectionId}/attributes/url"
            .replacingOccurrences(of: "{databaseId}", with: databaseId)
            .replacingOccurrences(of: "{collectionId}", with: collectionId)

        let apiParams: [String: Any?] = [
            "key": key,
            "required": `required`,
            "default": `default`,
            "array": array
        ]

        let apiHeaders: [String: String] = [
            "content-type": "application/json"
        ]

        let converter: (Any) -> AppwriteModels.AttributeUrl = { response in
            return AppwriteModels.AttributeUrl.from(map: response as! [String: Any])
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
    /// Update an url attribute. Changing the `default` value will not update
    /// already existing documents.
    /// 
    ///
    /// - Parameters:
    ///   - databaseId: String
    ///   - collectionId: String
    ///   - key: String
    ///   - required: Bool
    ///   - default: String (optional)
    ///   - newKey: String (optional)
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.AttributeUrl
    ///
    @available(*, deprecated, message: "This API has been deprecated since 1.8.0. Please use `TablesDB.updateUrlColumn` instead.")
    open func updateUrlAttribute(
        databaseId: String,
        collectionId: String,
        key: String,
        `required`: Bool,
        `default`: String? = nil,
        newKey: String? = nil
    ) async throws -> AppwriteModels.AttributeUrl {
        let apiPath: String = "/databases/{databaseId}/collections/{collectionId}/attributes/url/{key}"
            .replacingOccurrences(of: "{databaseId}", with: databaseId)
            .replacingOccurrences(of: "{collectionId}", with: collectionId)
            .replacingOccurrences(of: "{key}", with: key)

        let apiParams: [String: Any?] = [
            "required": `required`,
            "default": `default`,
            "newKey": newKey
        ]

        let apiHeaders: [String: String] = [
            "content-type": "application/json"
        ]

        let converter: (Any) -> AppwriteModels.AttributeUrl = { response in
            return AppwriteModels.AttributeUrl.from(map: response as! [String: Any])
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
    /// Get attribute by ID.
    ///
    /// - Parameters:
    ///   - databaseId: String
    ///   - collectionId: String
    ///   - key: String
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.AttributeBoolean
    ///
    @available(*, deprecated, message: "This API has been deprecated since 1.8.0. Please use `TablesDB.getColumn` instead.")
    open func getAttribute(
        databaseId: String,
        collectionId: String,
        key: String
    ) async throws -> AppwriteModels.AttributeBoolean {
        let apiPath: String = "/databases/{databaseId}/collections/{collectionId}/attributes/{key}"
            .replacingOccurrences(of: "{databaseId}", with: databaseId)
            .replacingOccurrences(of: "{collectionId}", with: collectionId)
            .replacingOccurrences(of: "{key}", with: key)

        let apiParams: [String: Any] = [:]

        let apiHeaders: [String: String] = [:]

        let converter: (Any) -> AppwriteModels.AttributeBoolean = { response in
            return AppwriteModels.AttributeBoolean.from(map: response as! [String: Any])
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
    /// Deletes an attribute.
    ///
    /// - Parameters:
    ///   - databaseId: String
    ///   - collectionId: String
    ///   - key: String
    /// - Throws: Exception if the request fails
    /// - Returns: Any
    ///
    @available(*, deprecated, message: "This API has been deprecated since 1.8.0. Please use `TablesDB.deleteColumn` instead.")
    open func deleteAttribute(
        databaseId: String,
        collectionId: String,
        key: String
    ) async throws -> Any {
        let apiPath: String = "/databases/{databaseId}/collections/{collectionId}/attributes/{key}"
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

    ///
    /// Update relationship attribute. [Learn more about relationship
    /// attributes](https://appwrite.io/docs/databases-relationships#relationship-attributes).
    /// 
    ///
    /// - Parameters:
    ///   - databaseId: String
    ///   - collectionId: String
    ///   - key: String
    ///   - onDelete: AppwriteEnums.RelationMutate (optional)
    ///   - newKey: String (optional)
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.AttributeRelationship
    ///
    @available(*, deprecated, message: "This API has been deprecated since 1.8.0. Please use `TablesDB.updateRelationshipColumn` instead.")
    open func updateRelationshipAttribute(
        databaseId: String,
        collectionId: String,
        key: String,
        onDelete: AppwriteEnums.RelationMutate? = nil,
        newKey: String? = nil
    ) async throws -> AppwriteModels.AttributeRelationship {
        let apiPath: String = "/databases/{databaseId}/collections/{collectionId}/attributes/{key}/relationship"
            .replacingOccurrences(of: "{databaseId}", with: databaseId)
            .replacingOccurrences(of: "{collectionId}", with: collectionId)
            .replacingOccurrences(of: "{key}", with: key)

        let apiParams: [String: Any?] = [
            "onDelete": onDelete,
            "newKey": newKey
        ]

        let apiHeaders: [String: String] = [
            "content-type": "application/json"
        ]

        let converter: (Any) -> AppwriteModels.AttributeRelationship = { response in
            return AppwriteModels.AttributeRelationship.from(map: response as! [String: Any])
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
    /// Get a list of all the user's documents in a given collection. You can use
    /// the query params to filter your results.
    ///
    /// - Parameters:
    ///   - databaseId: String
    ///   - collectionId: String
    ///   - queries: [String] (optional)
    ///   - transactionId: String (optional)
    ///   - total: Bool (optional)
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.DocumentList<T>
    ///
    @available(*, deprecated, message: "This API has been deprecated since 1.8.0. Please use `TablesDB.listRows` instead.")
    open func listDocuments<T>(
        databaseId: String,
        collectionId: String,
        queries: [String]? = nil,
        transactionId: String? = nil,
        total: Bool? = nil,
        nestedType: T.Type
    ) async throws -> AppwriteModels.DocumentList<T> {
        let apiPath: String = "/databases/{databaseId}/collections/{collectionId}/documents"
            .replacingOccurrences(of: "{databaseId}", with: databaseId)
            .replacingOccurrences(of: "{collectionId}", with: collectionId)

        let apiParams: [String: Any?] = [
            "queries": queries,
            "transactionId": transactionId,
            "total": total
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
    /// Get a list of all the user's documents in a given collection. You can use
    /// the query params to filter your results.
    ///
    /// - Parameters:
    ///   - databaseId: String
    ///   - collectionId: String
    ///   - queries: [String] (optional)
    ///   - transactionId: String (optional)
    ///   - total: Bool (optional)
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.DocumentList<T>
    ///
    @available(*, deprecated, message: "This API has been deprecated since 1.8.0. Please use `TablesDB.listRows` instead.")
    open func listDocuments(
        databaseId: String,
        collectionId: String,
        queries: [String]? = nil,
        transactionId: String? = nil,
        total: Bool? = nil
    ) async throws -> AppwriteModels.DocumentList<[String: AnyCodable]> {
        return try await listDocuments(
            databaseId: databaseId,
            collectionId: collectionId,
            queries: queries,
            transactionId: transactionId,
            total: total,
            nestedType: [String: AnyCodable].self
        )
    }

    ///
    /// Create a new Document. Before using this route, you should create a new
    /// collection resource using either a [server
    /// integration](https://appwrite.io/docs/server/databases#databasesCreateCollection)
    /// API or directly from your database console.
    ///
    /// - Parameters:
    ///   - databaseId: String
    ///   - collectionId: String
    ///   - documentId: String
    ///   - data: Any
    ///   - permissions: [String] (optional)
    ///   - transactionId: String (optional)
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.Document<T>
    ///
    @available(*, deprecated, message: "This API has been deprecated since 1.8.0. Please use `TablesDB.createRow` instead.")
    open func createDocument<T>(
        databaseId: String,
        collectionId: String,
        documentId: String,
        data: Any,
        permissions: [String]? = nil,
        transactionId: String? = nil,
        nestedType: T.Type
    ) async throws -> AppwriteModels.Document<T> {
        let apiPath: String = "/databases/{databaseId}/collections/{collectionId}/documents"
            .replacingOccurrences(of: "{databaseId}", with: databaseId)
            .replacingOccurrences(of: "{collectionId}", with: collectionId)

        let apiParams: [String: Any?] = [
            "documentId": documentId,
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
    /// integration](https://appwrite.io/docs/server/databases#databasesCreateCollection)
    /// API or directly from your database console.
    ///
    /// - Parameters:
    ///   - databaseId: String
    ///   - collectionId: String
    ///   - documentId: String
    ///   - data: Any
    ///   - permissions: [String] (optional)
    ///   - transactionId: String (optional)
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.Document<T>
    ///
    @available(*, deprecated, message: "This API has been deprecated since 1.8.0. Please use `TablesDB.createRow` instead.")
    open func createDocument(
        databaseId: String,
        collectionId: String,
        documentId: String,
        data: Any,
        permissions: [String]? = nil,
        transactionId: String? = nil
    ) async throws -> AppwriteModels.Document<[String: AnyCodable]> {
        return try await createDocument(
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
    /// Create new Documents. Before using this route, you should create a new
    /// collection resource using either a [server
    /// integration](https://appwrite.io/docs/server/databases#databasesCreateCollection)
    /// API or directly from your database console.
    ///
    /// - Parameters:
    ///   - databaseId: String
    ///   - collectionId: String
    ///   - documents: [Any]
    ///   - transactionId: String (optional)
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.DocumentList<T>
    ///
    @available(*, deprecated, message: "This API has been deprecated since 1.8.0. Please use `TablesDB.createRows` instead.")
    open func createDocuments<T>(
        databaseId: String,
        collectionId: String,
        documents: [Any],
        transactionId: String? = nil,
        nestedType: T.Type
    ) async throws -> AppwriteModels.DocumentList<T> {
        let apiPath: String = "/databases/{databaseId}/collections/{collectionId}/documents"
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
    /// integration](https://appwrite.io/docs/server/databases#databasesCreateCollection)
    /// API or directly from your database console.
    ///
    /// - Parameters:
    ///   - databaseId: String
    ///   - collectionId: String
    ///   - documents: [Any]
    ///   - transactionId: String (optional)
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.DocumentList<T>
    ///
    @available(*, deprecated, message: "This API has been deprecated since 1.8.0. Please use `TablesDB.createRows` instead.")
    open func createDocuments(
        databaseId: String,
        collectionId: String,
        documents: [Any],
        transactionId: String? = nil
    ) async throws -> AppwriteModels.DocumentList<[String: AnyCodable]> {
        return try await createDocuments(
            databaseId: databaseId,
            collectionId: collectionId,
            documents: documents,
            transactionId: transactionId,
            nestedType: [String: AnyCodable].self
        )
    }

    ///
    /// Create or update Documents. Before using this route, you should create a
    /// new collection resource using either a [server
    /// integration](https://appwrite.io/docs/server/databases#databasesCreateCollection)
    /// API or directly from your database console.
    /// 
    ///
    /// - Parameters:
    ///   - databaseId: String
    ///   - collectionId: String
    ///   - documents: [Any]
    ///   - transactionId: String (optional)
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.DocumentList<T>
    ///
    @available(*, deprecated, message: "This API has been deprecated since 1.8.0. Please use `TablesDB.upsertRows` instead.")
    open func upsertDocuments<T>(
        databaseId: String,
        collectionId: String,
        documents: [Any],
        transactionId: String? = nil,
        nestedType: T.Type
    ) async throws -> AppwriteModels.DocumentList<T> {
        let apiPath: String = "/databases/{databaseId}/collections/{collectionId}/documents"
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
    /// Create or update Documents. Before using this route, you should create a
    /// new collection resource using either a [server
    /// integration](https://appwrite.io/docs/server/databases#databasesCreateCollection)
    /// API or directly from your database console.
    /// 
    ///
    /// - Parameters:
    ///   - databaseId: String
    ///   - collectionId: String
    ///   - documents: [Any]
    ///   - transactionId: String (optional)
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.DocumentList<T>
    ///
    @available(*, deprecated, message: "This API has been deprecated since 1.8.0. Please use `TablesDB.upsertRows` instead.")
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
    @available(*, deprecated, message: "This API has been deprecated since 1.8.0. Please use `TablesDB.updateRows` instead.")
    open func updateDocuments<T>(
        databaseId: String,
        collectionId: String,
        data: Any? = nil,
        queries: [String]? = nil,
        transactionId: String? = nil,
        nestedType: T.Type
    ) async throws -> AppwriteModels.DocumentList<T> {
        let apiPath: String = "/databases/{databaseId}/collections/{collectionId}/documents"
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
    @available(*, deprecated, message: "This API has been deprecated since 1.8.0. Please use `TablesDB.updateRows` instead.")
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
    @available(*, deprecated, message: "This API has been deprecated since 1.8.0. Please use `TablesDB.deleteRows` instead.")
    open func deleteDocuments<T>(
        databaseId: String,
        collectionId: String,
        queries: [String]? = nil,
        transactionId: String? = nil,
        nestedType: T.Type
    ) async throws -> AppwriteModels.DocumentList<T> {
        let apiPath: String = "/databases/{databaseId}/collections/{collectionId}/documents"
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
    @available(*, deprecated, message: "This API has been deprecated since 1.8.0. Please use `TablesDB.deleteRows` instead.")
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
    @available(*, deprecated, message: "This API has been deprecated since 1.8.0. Please use `TablesDB.getRow` instead.")
    open func getDocument<T>(
        databaseId: String,
        collectionId: String,
        documentId: String,
        queries: [String]? = nil,
        transactionId: String? = nil,
        nestedType: T.Type
    ) async throws -> AppwriteModels.Document<T> {
        let apiPath: String = "/databases/{databaseId}/collections/{collectionId}/documents/{documentId}"
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
    @available(*, deprecated, message: "This API has been deprecated since 1.8.0. Please use `TablesDB.getRow` instead.")
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
    /// integration](https://appwrite.io/docs/server/databases#databasesCreateCollection)
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
    @available(*, deprecated, message: "This API has been deprecated since 1.8.0. Please use `TablesDB.upsertRow` instead.")
    open func upsertDocument<T>(
        databaseId: String,
        collectionId: String,
        documentId: String,
        data: Any? = nil,
        permissions: [String]? = nil,
        transactionId: String? = nil,
        nestedType: T.Type
    ) async throws -> AppwriteModels.Document<T> {
        let apiPath: String = "/databases/{databaseId}/collections/{collectionId}/documents/{documentId}"
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
    /// Create or update a Document. Before using this route, you should create a
    /// new collection resource using either a [server
    /// integration](https://appwrite.io/docs/server/databases#databasesCreateCollection)
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
    @available(*, deprecated, message: "This API has been deprecated since 1.8.0. Please use `TablesDB.upsertRow` instead.")
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
    @available(*, deprecated, message: "This API has been deprecated since 1.8.0. Please use `TablesDB.updateRow` instead.")
    open func updateDocument<T>(
        databaseId: String,
        collectionId: String,
        documentId: String,
        data: Any? = nil,
        permissions: [String]? = nil,
        transactionId: String? = nil,
        nestedType: T.Type
    ) async throws -> AppwriteModels.Document<T> {
        let apiPath: String = "/databases/{databaseId}/collections/{collectionId}/documents/{documentId}"
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
    @available(*, deprecated, message: "This API has been deprecated since 1.8.0. Please use `TablesDB.updateRow` instead.")
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
    @available(*, deprecated, message: "This API has been deprecated since 1.8.0. Please use `TablesDB.deleteRow` instead.")
    open func deleteDocument(
        databaseId: String,
        collectionId: String,
        documentId: String,
        transactionId: String? = nil
    ) async throws -> Any {
        let apiPath: String = "/databases/{databaseId}/collections/{collectionId}/documents/{documentId}"
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
    /// Decrement a specific attribute of a document by a given value.
    ///
    /// - Parameters:
    ///   - databaseId: String
    ///   - collectionId: String
    ///   - documentId: String
    ///   - attribute: String
    ///   - value: Double (optional)
    ///   - min: Double (optional)
    ///   - transactionId: String (optional)
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.Document<T>
    ///
    @available(*, deprecated, message: "This API has been deprecated since 1.8.0. Please use `TablesDB.decrementRowColumn` instead.")
    open func decrementDocumentAttribute<T>(
        databaseId: String,
        collectionId: String,
        documentId: String,
        attribute: String,
        value: Double? = nil,
        min: Double? = nil,
        transactionId: String? = nil,
        nestedType: T.Type
    ) async throws -> AppwriteModels.Document<T> {
        let apiPath: String = "/databases/{databaseId}/collections/{collectionId}/documents/{documentId}/{attribute}/decrement"
            .replacingOccurrences(of: "{databaseId}", with: databaseId)
            .replacingOccurrences(of: "{collectionId}", with: collectionId)
            .replacingOccurrences(of: "{documentId}", with: documentId)
            .replacingOccurrences(of: "{attribute}", with: attribute)

        let apiParams: [String: Any?] = [
            "value": value,
            "min": min,
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
    /// Decrement a specific attribute of a document by a given value.
    ///
    /// - Parameters:
    ///   - databaseId: String
    ///   - collectionId: String
    ///   - documentId: String
    ///   - attribute: String
    ///   - value: Double (optional)
    ///   - min: Double (optional)
    ///   - transactionId: String (optional)
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.Document<T>
    ///
    @available(*, deprecated, message: "This API has been deprecated since 1.8.0. Please use `TablesDB.decrementRowColumn` instead.")
    open func decrementDocumentAttribute(
        databaseId: String,
        collectionId: String,
        documentId: String,
        attribute: String,
        value: Double? = nil,
        min: Double? = nil,
        transactionId: String? = nil
    ) async throws -> AppwriteModels.Document<[String: AnyCodable]> {
        return try await decrementDocumentAttribute(
            databaseId: databaseId,
            collectionId: collectionId,
            documentId: documentId,
            attribute: attribute,
            value: value,
            min: min,
            transactionId: transactionId,
            nestedType: [String: AnyCodable].self
        )
    }

    ///
    /// Increment a specific attribute of a document by a given value.
    ///
    /// - Parameters:
    ///   - databaseId: String
    ///   - collectionId: String
    ///   - documentId: String
    ///   - attribute: String
    ///   - value: Double (optional)
    ///   - max: Double (optional)
    ///   - transactionId: String (optional)
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.Document<T>
    ///
    @available(*, deprecated, message: "This API has been deprecated since 1.8.0. Please use `TablesDB.incrementRowColumn` instead.")
    open func incrementDocumentAttribute<T>(
        databaseId: String,
        collectionId: String,
        documentId: String,
        attribute: String,
        value: Double? = nil,
        max: Double? = nil,
        transactionId: String? = nil,
        nestedType: T.Type
    ) async throws -> AppwriteModels.Document<T> {
        let apiPath: String = "/databases/{databaseId}/collections/{collectionId}/documents/{documentId}/{attribute}/increment"
            .replacingOccurrences(of: "{databaseId}", with: databaseId)
            .replacingOccurrences(of: "{collectionId}", with: collectionId)
            .replacingOccurrences(of: "{documentId}", with: documentId)
            .replacingOccurrences(of: "{attribute}", with: attribute)

        let apiParams: [String: Any?] = [
            "value": value,
            "max": max,
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
    /// Increment a specific attribute of a document by a given value.
    ///
    /// - Parameters:
    ///   - databaseId: String
    ///   - collectionId: String
    ///   - documentId: String
    ///   - attribute: String
    ///   - value: Double (optional)
    ///   - max: Double (optional)
    ///   - transactionId: String (optional)
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.Document<T>
    ///
    @available(*, deprecated, message: "This API has been deprecated since 1.8.0. Please use `TablesDB.incrementRowColumn` instead.")
    open func incrementDocumentAttribute(
        databaseId: String,
        collectionId: String,
        documentId: String,
        attribute: String,
        value: Double? = nil,
        max: Double? = nil,
        transactionId: String? = nil
    ) async throws -> AppwriteModels.Document<[String: AnyCodable]> {
        return try await incrementDocumentAttribute(
            databaseId: databaseId,
            collectionId: collectionId,
            documentId: documentId,
            attribute: attribute,
            value: value,
            max: max,
            transactionId: transactionId,
            nestedType: [String: AnyCodable].self
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
    @available(*, deprecated, message: "This API has been deprecated since 1.8.0. Please use `TablesDB.listIndexes` instead.")
    open func listIndexes(
        databaseId: String,
        collectionId: String,
        queries: [String]? = nil,
        total: Bool? = nil
    ) async throws -> AppwriteModels.IndexList {
        let apiPath: String = "/databases/{databaseId}/collections/{collectionId}/indexes"
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
    /// Creates an index on the attributes listed. Your index should include all
    /// the attributes you will query in a single request.
    /// Attributes can be `key`, `fulltext`, and `unique`.
    ///
    /// - Parameters:
    ///   - databaseId: String
    ///   - collectionId: String
    ///   - key: String
    ///   - type: AppwriteEnums.IndexType
    ///   - attributes: [String]
    ///   - orders: [String] (optional)
    ///   - lengths: [Int] (optional)
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.Index
    ///
    @available(*, deprecated, message: "This API has been deprecated since 1.8.0. Please use `TablesDB.createIndex` instead.")
    open func createIndex(
        databaseId: String,
        collectionId: String,
        key: String,
        type: AppwriteEnums.IndexType,
        attributes: [String],
        orders: [String]? = nil,
        lengths: [Int]? = nil
    ) async throws -> AppwriteModels.Index {
        let apiPath: String = "/databases/{databaseId}/collections/{collectionId}/indexes"
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
    /// Get an index by its unique ID.
    ///
    /// - Parameters:
    ///   - databaseId: String
    ///   - collectionId: String
    ///   - key: String
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.Index
    ///
    @available(*, deprecated, message: "This API has been deprecated since 1.8.0. Please use `TablesDB.getIndex` instead.")
    open func getIndex(
        databaseId: String,
        collectionId: String,
        key: String
    ) async throws -> AppwriteModels.Index {
        let apiPath: String = "/databases/{databaseId}/collections/{collectionId}/indexes/{key}"
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
    /// Delete an index.
    ///
    /// - Parameters:
    ///   - databaseId: String
    ///   - collectionId: String
    ///   - key: String
    /// - Throws: Exception if the request fails
    /// - Returns: Any
    ///
    @available(*, deprecated, message: "This API has been deprecated since 1.8.0. Please use `TablesDB.deleteIndex` instead.")
    open func deleteIndex(
        databaseId: String,
        collectionId: String,
        key: String
    ) async throws -> Any {
        let apiPath: String = "/databases/{databaseId}/collections/{collectionId}/indexes/{key}"
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