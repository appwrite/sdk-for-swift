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
    /// @param [String] queries
    /// @param String search
    /// @throws Exception
    /// @return array
    ///
    open func list(
        queries: [String]? = nil,
        search: String? = nil
    ) async throws -> AppwriteModels.DatabaseList {
        let apiPath: String = "/databases"

        let apiParams: [String: Any?] = [
            "queries": queries,
            "search": search
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
    /// @param String databaseId
    /// @param String name
    /// @param Bool enabled
    /// @throws Exception
    /// @return array
    ///
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
    /// Get a database by its unique ID. This endpoint response returns a JSON
    /// object with the database metadata.
    ///
    /// @param String databaseId
    /// @throws Exception
    /// @return array
    ///
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
    /// @param String databaseId
    /// @param String name
    /// @param Bool enabled
    /// @throws Exception
    /// @return array
    ///
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
    /// @param String databaseId
    /// @throws Exception
    /// @return array
    ///
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
    /// @param String databaseId
    /// @param [String] queries
    /// @param String search
    /// @throws Exception
    /// @return array
    ///
    open func listCollections(
        databaseId: String,
        queries: [String]? = nil,
        search: String? = nil
    ) async throws -> AppwriteModels.CollectionList {
        let apiPath: String = "/databases/{databaseId}/collections"
            .replacingOccurrences(of: "{databaseId}", with: databaseId)

        let apiParams: [String: Any?] = [
            "queries": queries,
            "search": search
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
    /// @param String databaseId
    /// @param String collectionId
    /// @param String name
    /// @param [String] permissions
    /// @param Bool documentSecurity
    /// @param Bool enabled
    /// @throws Exception
    /// @return array
    ///
    open func createCollection(
        databaseId: String,
        collectionId: String,
        name: String,
        permissions: [String]? = nil,
        documentSecurity: Bool? = nil,
        enabled: Bool? = nil
    ) async throws -> AppwriteModels.Collection {
        let apiPath: String = "/databases/{databaseId}/collections"
            .replacingOccurrences(of: "{databaseId}", with: databaseId)

        let apiParams: [String: Any?] = [
            "collectionId": collectionId,
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
    /// @param String databaseId
    /// @param String collectionId
    /// @throws Exception
    /// @return array
    ///
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
    /// @param String databaseId
    /// @param String collectionId
    /// @param String name
    /// @param [String] permissions
    /// @param Bool documentSecurity
    /// @param Bool enabled
    /// @throws Exception
    /// @return array
    ///
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
    /// @param String databaseId
    /// @param String collectionId
    /// @throws Exception
    /// @return array
    ///
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
    /// @param String databaseId
    /// @param String collectionId
    /// @param [String] queries
    /// @throws Exception
    /// @return array
    ///
    open func listAttributes(
        databaseId: String,
        collectionId: String,
        queries: [String]? = nil
    ) async throws -> AppwriteModels.AttributeList {
        let apiPath: String = "/databases/{databaseId}/collections/{collectionId}/attributes"
            .replacingOccurrences(of: "{databaseId}", with: databaseId)
            .replacingOccurrences(of: "{collectionId}", with: collectionId)

        let apiParams: [String: Any?] = [
            "queries": queries
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
    /// @param String databaseId
    /// @param String collectionId
    /// @param String key
    /// @param Bool required
    /// @param Bool default
    /// @param Bool array
    /// @throws Exception
    /// @return array
    ///
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
    /// @param String databaseId
    /// @param String collectionId
    /// @param String key
    /// @param Bool required
    /// @param Bool default
    /// @param String newKey
    /// @throws Exception
    /// @return array
    ///
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
    /// @param String databaseId
    /// @param String collectionId
    /// @param String key
    /// @param Bool required
    /// @param String default
    /// @param Bool array
    /// @throws Exception
    /// @return array
    ///
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
    /// @param String databaseId
    /// @param String collectionId
    /// @param String key
    /// @param Bool required
    /// @param String default
    /// @param String newKey
    /// @throws Exception
    /// @return array
    ///
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
    /// @param String databaseId
    /// @param String collectionId
    /// @param String key
    /// @param Bool required
    /// @param String default
    /// @param Bool array
    /// @throws Exception
    /// @return array
    ///
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
    /// @param String databaseId
    /// @param String collectionId
    /// @param String key
    /// @param Bool required
    /// @param String default
    /// @param String newKey
    /// @throws Exception
    /// @return array
    ///
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
    /// Create an enumeration attribute. The `elements` param acts as a white-list
    /// of accepted values for this attribute. 
    /// 
    ///
    /// @param String databaseId
    /// @param String collectionId
    /// @param String key
    /// @param [String] elements
    /// @param Bool required
    /// @param String default
    /// @param Bool array
    /// @throws Exception
    /// @return array
    ///
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
    /// @param String databaseId
    /// @param String collectionId
    /// @param String key
    /// @param [String] elements
    /// @param Bool required
    /// @param String default
    /// @param String newKey
    /// @throws Exception
    /// @return array
    ///
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
    /// @param String databaseId
    /// @param String collectionId
    /// @param String key
    /// @param Bool required
    /// @param Double min
    /// @param Double max
    /// @param Double default
    /// @param Bool array
    /// @throws Exception
    /// @return array
    ///
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
    /// @param String databaseId
    /// @param String collectionId
    /// @param String key
    /// @param Bool required
    /// @param Double default
    /// @param Double min
    /// @param Double max
    /// @param String newKey
    /// @throws Exception
    /// @return array
    ///
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
    /// @param String databaseId
    /// @param String collectionId
    /// @param String key
    /// @param Bool required
    /// @param Int min
    /// @param Int max
    /// @param Int default
    /// @param Bool array
    /// @throws Exception
    /// @return array
    ///
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
    /// @param String databaseId
    /// @param String collectionId
    /// @param String key
    /// @param Bool required
    /// @param Int default
    /// @param Int min
    /// @param Int max
    /// @param String newKey
    /// @throws Exception
    /// @return array
    ///
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
    /// @param String databaseId
    /// @param String collectionId
    /// @param String key
    /// @param Bool required
    /// @param String default
    /// @param Bool array
    /// @throws Exception
    /// @return array
    ///
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
    /// @param String databaseId
    /// @param String collectionId
    /// @param String key
    /// @param Bool required
    /// @param String default
    /// @param String newKey
    /// @throws Exception
    /// @return array
    ///
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
    /// Create relationship attribute. [Learn more about relationship
    /// attributes](https://appwrite.io/docs/databases-relationships#relationship-attributes).
    /// 
    ///
    /// @param String databaseId
    /// @param String collectionId
    /// @param String relatedCollectionId
    /// @param AppwriteEnums.RelationshipType type
    /// @param Bool twoWay
    /// @param String key
    /// @param String twoWayKey
    /// @param AppwriteEnums.RelationMutate onDelete
    /// @throws Exception
    /// @return array
    ///
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
    /// @param String databaseId
    /// @param String collectionId
    /// @param String key
    /// @param Int size
    /// @param Bool required
    /// @param String default
    /// @param Bool array
    /// @param Bool encrypt
    /// @throws Exception
    /// @return array
    ///
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
    /// @param String databaseId
    /// @param String collectionId
    /// @param String key
    /// @param Bool required
    /// @param String default
    /// @param Int size
    /// @param String newKey
    /// @throws Exception
    /// @return array
    ///
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
    /// @param String databaseId
    /// @param String collectionId
    /// @param String key
    /// @param Bool required
    /// @param String default
    /// @param Bool array
    /// @throws Exception
    /// @return array
    ///
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
    /// @param String databaseId
    /// @param String collectionId
    /// @param String key
    /// @param Bool required
    /// @param String default
    /// @param String newKey
    /// @throws Exception
    /// @return array
    ///
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
    /// @param String databaseId
    /// @param String collectionId
    /// @param String key
    /// @throws Exception
    /// @return array
    ///
    open func getAttribute(
        databaseId: String,
        collectionId: String,
        key: String
    ) async throws -> Any {
        let apiPath: String = "/databases/{databaseId}/collections/{collectionId}/attributes/{key}"
            .replacingOccurrences(of: "{databaseId}", with: databaseId)
            .replacingOccurrences(of: "{collectionId}", with: collectionId)
            .replacingOccurrences(of: "{key}", with: key)

        let apiParams: [String: Any] = [:]

        let apiHeaders: [String: String] = [:]

        return try await client.call(
            method: "GET",
            path: apiPath,
            headers: apiHeaders,
            params: apiParams        )
    }

    ///
    /// Deletes an attribute.
    ///
    /// @param String databaseId
    /// @param String collectionId
    /// @param String key
    /// @throws Exception
    /// @return array
    ///
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
    /// @param String databaseId
    /// @param String collectionId
    /// @param String key
    /// @param AppwriteEnums.RelationMutate onDelete
    /// @param String newKey
    /// @throws Exception
    /// @return array
    ///
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
    /// @param String databaseId
    /// @param String collectionId
    /// @param [String] queries
    /// @throws Exception
    /// @return array
    ///
    open func listDocuments<T>(
        databaseId: String,
        collectionId: String,
        queries: [String]? = nil,
        nestedType: T.Type
    ) async throws -> AppwriteModels.DocumentList<T> {
        let apiPath: String = "/databases/{databaseId}/collections/{collectionId}/documents"
            .replacingOccurrences(of: "{databaseId}", with: databaseId)
            .replacingOccurrences(of: "{collectionId}", with: collectionId)

        let apiParams: [String: Any?] = [
            "queries": queries
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
    /// @param String databaseId
    /// @param String collectionId
    /// @param [String] queries
    /// @throws Exception
    /// @return array
    ///
    open func listDocuments(
        databaseId: String,
        collectionId: String,
        queries: [String]? = nil
    ) async throws -> AppwriteModels.DocumentList<[String: AnyCodable]> {
        return try await listDocuments(
            databaseId: databaseId,
            collectionId: collectionId,
            queries: queries,
            nestedType: [String: AnyCodable].self
        )
    }

    ///
    /// Create a new Document. Before using this route, you should create a new
    /// collection resource using either a [server
    /// integration](https://appwrite.io/docs/server/databases#databasesCreateCollection)
    /// API or directly from your database console.
    ///
    /// @param String databaseId
    /// @param String collectionId
    /// @param String documentId
    /// @param Any data
    /// @param [String] permissions
    /// @throws Exception
    /// @return array
    ///
    open func createDocument<T>(
        databaseId: String,
        collectionId: String,
        documentId: String,
        data: Any,
        permissions: [String]? = nil,
        nestedType: T.Type
    ) async throws -> AppwriteModels.Document<T> {
        let apiPath: String = "/databases/{databaseId}/collections/{collectionId}/documents"
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
    /// Create a new Document. Before using this route, you should create a new
    /// collection resource using either a [server
    /// integration](https://appwrite.io/docs/server/databases#databasesCreateCollection)
    /// API or directly from your database console.
    ///
    /// @param String databaseId
    /// @param String collectionId
    /// @param String documentId
    /// @param Any data
    /// @param [String] permissions
    /// @throws Exception
    /// @return array
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
    /// **WARNING: Experimental Feature** - This endpoint is experimental and not
    /// yet officially supported. It may be subject to breaking changes or removal
    /// in future versions.
    /// 
    /// Create new Documents. Before using this route, you should create a new
    /// collection resource using either a [server
    /// integration](https://appwrite.io/docs/server/databases#databasesCreateCollection)
    /// API or directly from your database console.
    ///
    /// @param String databaseId
    /// @param String collectionId
    /// @param [Any] documents
    /// @throws Exception
    /// @return array
    ///
    open func createDocuments<T>(
        databaseId: String,
        collectionId: String,
        documents: [Any],
        nestedType: T.Type
    ) async throws -> AppwriteModels.DocumentList<T> {
        let apiPath: String = "/databases/{databaseId}/collections/{collectionId}/documents"
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
    /// **WARNING: Experimental Feature** - This endpoint is experimental and not
    /// yet officially supported. It may be subject to breaking changes or removal
    /// in future versions.
    /// 
    /// Create new Documents. Before using this route, you should create a new
    /// collection resource using either a [server
    /// integration](https://appwrite.io/docs/server/databases#databasesCreateCollection)
    /// API or directly from your database console.
    ///
    /// @param String databaseId
    /// @param String collectionId
    /// @param [Any] documents
    /// @throws Exception
    /// @return array
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
    /// **WARNING: Experimental Feature** - This endpoint is experimental and not
    /// yet officially supported. It may be subject to breaking changes or removal
    /// in future versions.
    /// 
    /// Create or update Documents. Before using this route, you should create a
    /// new collection resource using either a [server
    /// integration](https://appwrite.io/docs/server/databases#databasesCreateCollection)
    /// API or directly from your database console.
    /// 
    ///
    /// @param String databaseId
    /// @param String collectionId
    /// @param [Any] documents
    /// @throws Exception
    /// @return array
    ///
    open func upsertDocuments<T>(
        databaseId: String,
        collectionId: String,
        documents: [Any]? = nil,
        nestedType: T.Type
    ) async throws -> AppwriteModels.DocumentList<T> {
        let apiPath: String = "/databases/{databaseId}/collections/{collectionId}/documents"
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
            method: "PUT",
            path: apiPath,
            headers: apiHeaders,
            params: apiParams,
            converter: converter
        )
    }

    ///
    /// **WARNING: Experimental Feature** - This endpoint is experimental and not
    /// yet officially supported. It may be subject to breaking changes or removal
    /// in future versions.
    /// 
    /// Create or update Documents. Before using this route, you should create a
    /// new collection resource using either a [server
    /// integration](https://appwrite.io/docs/server/databases#databasesCreateCollection)
    /// API or directly from your database console.
    /// 
    ///
    /// @param String databaseId
    /// @param String collectionId
    /// @param [Any] documents
    /// @throws Exception
    /// @return array
    ///
    open func upsertDocuments(
        databaseId: String,
        collectionId: String,
        documents: [Any]? = nil
    ) async throws -> AppwriteModels.DocumentList<[String: AnyCodable]> {
        return try await upsertDocuments(
            databaseId: databaseId,
            collectionId: collectionId,
            documents: documents,
            nestedType: [String: AnyCodable].self
        )
    }

    ///
    /// Update all documents that match your queries, if no queries are submitted
    /// then all documents are updated. You can pass only specific fields to be
    /// updated.
    ///
    /// @param String databaseId
    /// @param String collectionId
    /// @param Any data
    /// @param [String] queries
    /// @throws Exception
    /// @return array
    ///
    open func updateDocuments<T>(
        databaseId: String,
        collectionId: String,
        data: Any? = nil,
        queries: [String]? = nil,
        nestedType: T.Type
    ) async throws -> AppwriteModels.DocumentList<T> {
        let apiPath: String = "/databases/{databaseId}/collections/{collectionId}/documents"
            .replacingOccurrences(of: "{databaseId}", with: databaseId)
            .replacingOccurrences(of: "{collectionId}", with: collectionId)

        let apiParams: [String: Any?] = [
            "data": data,
            "queries": queries
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
    /// @param String databaseId
    /// @param String collectionId
    /// @param Any data
    /// @param [String] queries
    /// @throws Exception
    /// @return array
    ///
    open func updateDocuments(
        databaseId: String,
        collectionId: String,
        data: Any? = nil,
        queries: [String]? = nil
    ) async throws -> AppwriteModels.DocumentList<[String: AnyCodable]> {
        return try await updateDocuments(
            databaseId: databaseId,
            collectionId: collectionId,
            data: data,
            queries: queries,
            nestedType: [String: AnyCodable].self
        )
    }

    ///
    /// **WARNING: Experimental Feature** - This endpoint is experimental and not
    /// yet officially supported. It may be subject to breaking changes or removal
    /// in future versions.
    /// 
    /// Bulk delete documents using queries, if no queries are passed then all
    /// documents are deleted.
    ///
    /// @param String databaseId
    /// @param String collectionId
    /// @param [String] queries
    /// @throws Exception
    /// @return array
    ///
    open func deleteDocuments<T>(
        databaseId: String,
        collectionId: String,
        queries: [String]? = nil,
        nestedType: T.Type
    ) async throws -> AppwriteModels.DocumentList<T> {
        let apiPath: String = "/databases/{databaseId}/collections/{collectionId}/documents"
            .replacingOccurrences(of: "{databaseId}", with: databaseId)
            .replacingOccurrences(of: "{collectionId}", with: collectionId)

        let apiParams: [String: Any?] = [
            "queries": queries
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
    /// **WARNING: Experimental Feature** - This endpoint is experimental and not
    /// yet officially supported. It may be subject to breaking changes or removal
    /// in future versions.
    /// 
    /// Bulk delete documents using queries, if no queries are passed then all
    /// documents are deleted.
    ///
    /// @param String databaseId
    /// @param String collectionId
    /// @param [String] queries
    /// @throws Exception
    /// @return array
    ///
    open func deleteDocuments(
        databaseId: String,
        collectionId: String,
        queries: [String]? = nil
    ) async throws -> AppwriteModels.DocumentList<[String: AnyCodable]> {
        return try await deleteDocuments(
            databaseId: databaseId,
            collectionId: collectionId,
            queries: queries,
            nestedType: [String: AnyCodable].self
        )
    }

    ///
    /// Get a document by its unique ID. This endpoint response returns a JSON
    /// object with the document data.
    ///
    /// @param String databaseId
    /// @param String collectionId
    /// @param String documentId
    /// @param [String] queries
    /// @throws Exception
    /// @return array
    ///
    open func getDocument<T>(
        databaseId: String,
        collectionId: String,
        documentId: String,
        queries: [String]? = nil,
        nestedType: T.Type
    ) async throws -> AppwriteModels.Document<T> {
        let apiPath: String = "/databases/{databaseId}/collections/{collectionId}/documents/{documentId}"
            .replacingOccurrences(of: "{databaseId}", with: databaseId)
            .replacingOccurrences(of: "{collectionId}", with: collectionId)
            .replacingOccurrences(of: "{documentId}", with: documentId)

        let apiParams: [String: Any?] = [
            "queries": queries
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
    /// @param String databaseId
    /// @param String collectionId
    /// @param String documentId
    /// @param [String] queries
    /// @throws Exception
    /// @return array
    ///
    open func getDocument(
        databaseId: String,
        collectionId: String,
        documentId: String,
        queries: [String]? = nil
    ) async throws -> AppwriteModels.Document<[String: AnyCodable]> {
        return try await getDocument(
            databaseId: databaseId,
            collectionId: collectionId,
            documentId: documentId,
            queries: queries,
            nestedType: [String: AnyCodable].self
        )
    }

    ///
    /// **WARNING: Experimental Feature** - This endpoint is experimental and not
    /// yet officially supported. It may be subject to breaking changes or removal
    /// in future versions.
    /// 
    /// Create or update a Document. Before using this route, you should create a
    /// new collection resource using either a [server
    /// integration](https://appwrite.io/docs/server/databases#databasesCreateCollection)
    /// API or directly from your database console.
    ///
    /// @param String databaseId
    /// @param String collectionId
    /// @param String documentId
    /// @param Any data
    /// @param [String] permissions
    /// @throws Exception
    /// @return array
    ///
    open func upsertDocument<T>(
        databaseId: String,
        collectionId: String,
        documentId: String,
        data: Any,
        permissions: [String]? = nil,
        nestedType: T.Type
    ) async throws -> AppwriteModels.Document<T> {
        let apiPath: String = "/databases/{databaseId}/collections/{collectionId}/documents/{documentId}"
            .replacingOccurrences(of: "{databaseId}", with: databaseId)
            .replacingOccurrences(of: "{collectionId}", with: collectionId)
            .replacingOccurrences(of: "{documentId}", with: documentId)

        let apiParams: [String: Any?] = [
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
            method: "PUT",
            path: apiPath,
            headers: apiHeaders,
            params: apiParams,
            converter: converter
        )
    }

    ///
    /// **WARNING: Experimental Feature** - This endpoint is experimental and not
    /// yet officially supported. It may be subject to breaking changes or removal
    /// in future versions.
    /// 
    /// Create or update a Document. Before using this route, you should create a
    /// new collection resource using either a [server
    /// integration](https://appwrite.io/docs/server/databases#databasesCreateCollection)
    /// API or directly from your database console.
    ///
    /// @param String databaseId
    /// @param String collectionId
    /// @param String documentId
    /// @param Any data
    /// @param [String] permissions
    /// @throws Exception
    /// @return array
    ///
    open func upsertDocument(
        databaseId: String,
        collectionId: String,
        documentId: String,
        data: Any,
        permissions: [String]? = nil
    ) async throws -> AppwriteModels.Document<[String: AnyCodable]> {
        return try await upsertDocument(
            databaseId: databaseId,
            collectionId: collectionId,
            documentId: documentId,
            data: data,
            permissions: permissions,
            nestedType: [String: AnyCodable].self
        )
    }

    ///
    /// Update a document by its unique ID. Using the patch method you can pass
    /// only specific fields that will get updated.
    ///
    /// @param String databaseId
    /// @param String collectionId
    /// @param String documentId
    /// @param Any data
    /// @param [String] permissions
    /// @throws Exception
    /// @return array
    ///
    open func updateDocument<T>(
        databaseId: String,
        collectionId: String,
        documentId: String,
        data: Any? = nil,
        permissions: [String]? = nil,
        nestedType: T.Type
    ) async throws -> AppwriteModels.Document<T> {
        let apiPath: String = "/databases/{databaseId}/collections/{collectionId}/documents/{documentId}"
            .replacingOccurrences(of: "{databaseId}", with: databaseId)
            .replacingOccurrences(of: "{collectionId}", with: collectionId)
            .replacingOccurrences(of: "{documentId}", with: documentId)

        let apiParams: [String: Any?] = [
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
    /// @param String databaseId
    /// @param String collectionId
    /// @param String documentId
    /// @param Any data
    /// @param [String] permissions
    /// @throws Exception
    /// @return array
    ///
    open func updateDocument(
        databaseId: String,
        collectionId: String,
        documentId: String,
        data: Any? = nil,
        permissions: [String]? = nil
    ) async throws -> AppwriteModels.Document<[String: AnyCodable]> {
        return try await updateDocument(
            databaseId: databaseId,
            collectionId: collectionId,
            documentId: documentId,
            data: data,
            permissions: permissions,
            nestedType: [String: AnyCodable].self
        )
    }

    ///
    /// Delete a document by its unique ID.
    ///
    /// @param String databaseId
    /// @param String collectionId
    /// @param String documentId
    /// @throws Exception
    /// @return array
    ///
    open func deleteDocument(
        databaseId: String,
        collectionId: String,
        documentId: String
    ) async throws -> Any {
        let apiPath: String = "/databases/{databaseId}/collections/{collectionId}/documents/{documentId}"
            .replacingOccurrences(of: "{databaseId}", with: databaseId)
            .replacingOccurrences(of: "{collectionId}", with: collectionId)
            .replacingOccurrences(of: "{documentId}", with: documentId)

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
    /// List indexes in the collection.
    ///
    /// @param String databaseId
    /// @param String collectionId
    /// @param [String] queries
    /// @throws Exception
    /// @return array
    ///
    open func listIndexes(
        databaseId: String,
        collectionId: String,
        queries: [String]? = nil
    ) async throws -> AppwriteModels.IndexList {
        let apiPath: String = "/databases/{databaseId}/collections/{collectionId}/indexes"
            .replacingOccurrences(of: "{databaseId}", with: databaseId)
            .replacingOccurrences(of: "{collectionId}", with: collectionId)

        let apiParams: [String: Any?] = [
            "queries": queries
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
    /// @param String databaseId
    /// @param String collectionId
    /// @param String key
    /// @param AppwriteEnums.IndexType type
    /// @param [String] attributes
    /// @param [String] orders
    /// @param [Int] lengths
    /// @throws Exception
    /// @return array
    ///
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
    /// Get index by ID.
    ///
    /// @param String databaseId
    /// @param String collectionId
    /// @param String key
    /// @throws Exception
    /// @return array
    ///
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
    /// @param String databaseId
    /// @param String collectionId
    /// @param String key
    /// @throws Exception
    /// @return array
    ///
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