import AsyncHTTPClient
import Foundation
import NIO
import AppwriteModels

open class Databases: Service {
    ///
    /// List Databases
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
        let path: String = "/databases"
        let params: [String: Any?] = [
            "queries": queries,
            "search": search
        ]

        let headers: [String: String] = [
            "content-type": "application/json"
        ]
        let converter: ([String: Any]) -> AppwriteModels.DatabaseList = { dict in
            return AppwriteModels.DatabaseList.from(map: dict)
        }
        return try await client.call(
            method: "GET",
            path: path,
            headers: headers,
            params: params,
            converter: converter
        )
    }

    ///
    /// Create Database
    ///
    /// Create a new Database.
    /// 
    ///
    /// @param String databaseId
    /// @param String name
    /// @throws Exception
    /// @return array
    ///
    open func create(
        databaseId: String,
        name: String
    ) async throws -> AppwriteModels.Database {
        let path: String = "/databases"
        let params: [String: Any?] = [
            "databaseId": databaseId,
            "name": name
        ]

        let headers: [String: String] = [
            "content-type": "application/json"
        ]
        let converter: ([String: Any]) -> AppwriteModels.Database = { dict in
            return AppwriteModels.Database.from(map: dict)
        }
        return try await client.call(
            method: "POST",
            path: path,
            headers: headers,
            params: params,
            converter: converter
        )
    }

    ///
    /// Get Database
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
        var path: String = "/databases/{databaseId}"
        path = path.replacingOccurrences(
          of: "{databaseId}",
          with: databaseId        )
        let params: [String: Any?] = [:]

        let headers: [String: String] = [
            "content-type": "application/json"
        ]
        let converter: ([String: Any]) -> AppwriteModels.Database = { dict in
            return AppwriteModels.Database.from(map: dict)
        }
        return try await client.call(
            method: "GET",
            path: path,
            headers: headers,
            params: params,
            converter: converter
        )
    }

    ///
    /// Update Database
    ///
    /// Update a database by its unique ID.
    ///
    /// @param String databaseId
    /// @param String name
    /// @throws Exception
    /// @return array
    ///
    open func update(
        databaseId: String,
        name: String
    ) async throws -> AppwriteModels.Database {
        var path: String = "/databases/{databaseId}"
        path = path.replacingOccurrences(
          of: "{databaseId}",
          with: databaseId        )
        let params: [String: Any?] = [
            "name": name
        ]

        let headers: [String: String] = [
            "content-type": "application/json"
        ]
        let converter: ([String: Any]) -> AppwriteModels.Database = { dict in
            return AppwriteModels.Database.from(map: dict)
        }
        return try await client.call(
            method: "PUT",
            path: path,
            headers: headers,
            params: params,
            converter: converter
        )
    }

    ///
    /// Delete Database
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
        var path: String = "/databases/{databaseId}"
        path = path.replacingOccurrences(
          of: "{databaseId}",
          with: databaseId        )
        let params: [String: Any?] = [:]

        let headers: [String: String] = [
            "content-type": "application/json"
        ]
        return try await client.call(
            method: "DELETE",
            path: path,
            headers: headers,
            params: params        )
    }

    ///
    /// List Collections
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
        var path: String = "/databases/{databaseId}/collections"
        path = path.replacingOccurrences(
          of: "{databaseId}",
          with: databaseId        )
        let params: [String: Any?] = [
            "queries": queries,
            "search": search
        ]

        let headers: [String: String] = [
            "content-type": "application/json"
        ]
        let converter: ([String: Any]) -> AppwriteModels.CollectionList = { dict in
            return AppwriteModels.CollectionList.from(map: dict)
        }
        return try await client.call(
            method: "GET",
            path: path,
            headers: headers,
            params: params,
            converter: converter
        )
    }

    ///
    /// Create Collection
    ///
    /// Create a new Collection. Before using this route, you should create a new
    /// database resource using either a [server
    /// integration](/docs/server/databases#databasesCreateCollection) API or
    /// directly from your database console.
    ///
    /// @param String databaseId
    /// @param String collectionId
    /// @param String name
    /// @param [String] permissions
    /// @param Bool documentSecurity
    /// @throws Exception
    /// @return array
    ///
    open func createCollection(
        databaseId: String,
        collectionId: String,
        name: String,
        permissions: [String]? = nil,
        documentSecurity: Bool? = nil
    ) async throws -> AppwriteModels.Collection {
        var path: String = "/databases/{databaseId}/collections"
        path = path.replacingOccurrences(
          of: "{databaseId}",
          with: databaseId        )
        let params: [String: Any?] = [
            "collectionId": collectionId,
            "name": name,
            "permissions": permissions,
            "documentSecurity": documentSecurity
        ]

        let headers: [String: String] = [
            "content-type": "application/json"
        ]
        let converter: ([String: Any]) -> AppwriteModels.Collection = { dict in
            return AppwriteModels.Collection.from(map: dict)
        }
        return try await client.call(
            method: "POST",
            path: path,
            headers: headers,
            params: params,
            converter: converter
        )
    }

    ///
    /// Get Collection
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
        var path: String = "/databases/{databaseId}/collections/{collectionId}"
        path = path.replacingOccurrences(
          of: "{databaseId}",
          with: databaseId        )
        path = path.replacingOccurrences(
          of: "{collectionId}",
          with: collectionId        )
        let params: [String: Any?] = [:]

        let headers: [String: String] = [
            "content-type": "application/json"
        ]
        let converter: ([String: Any]) -> AppwriteModels.Collection = { dict in
            return AppwriteModels.Collection.from(map: dict)
        }
        return try await client.call(
            method: "GET",
            path: path,
            headers: headers,
            params: params,
            converter: converter
        )
    }

    ///
    /// Update Collection
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
        var path: String = "/databases/{databaseId}/collections/{collectionId}"
        path = path.replacingOccurrences(
          of: "{databaseId}",
          with: databaseId        )
        path = path.replacingOccurrences(
          of: "{collectionId}",
          with: collectionId        )
        let params: [String: Any?] = [
            "name": name,
            "permissions": permissions,
            "documentSecurity": documentSecurity,
            "enabled": enabled
        ]

        let headers: [String: String] = [
            "content-type": "application/json"
        ]
        let converter: ([String: Any]) -> AppwriteModels.Collection = { dict in
            return AppwriteModels.Collection.from(map: dict)
        }
        return try await client.call(
            method: "PUT",
            path: path,
            headers: headers,
            params: params,
            converter: converter
        )
    }

    ///
    /// Delete Collection
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
        var path: String = "/databases/{databaseId}/collections/{collectionId}"
        path = path.replacingOccurrences(
          of: "{databaseId}",
          with: databaseId        )
        path = path.replacingOccurrences(
          of: "{collectionId}",
          with: collectionId        )
        let params: [String: Any?] = [:]

        let headers: [String: String] = [
            "content-type": "application/json"
        ]
        return try await client.call(
            method: "DELETE",
            path: path,
            headers: headers,
            params: params        )
    }

    ///
    /// List Attributes
    ///
    /// @param String databaseId
    /// @param String collectionId
    /// @throws Exception
    /// @return array
    ///
    open func listAttributes(
        databaseId: String,
        collectionId: String
    ) async throws -> AppwriteModels.AttributeList {
        var path: String = "/databases/{databaseId}/collections/{collectionId}/attributes"
        path = path.replacingOccurrences(
          of: "{databaseId}",
          with: databaseId        )
        path = path.replacingOccurrences(
          of: "{collectionId}",
          with: collectionId        )
        let params: [String: Any?] = [:]

        let headers: [String: String] = [
            "content-type": "application/json"
        ]
        let converter: ([String: Any]) -> AppwriteModels.AttributeList = { dict in
            return AppwriteModels.AttributeList.from(map: dict)
        }
        return try await client.call(
            method: "GET",
            path: path,
            headers: headers,
            params: params,
            converter: converter
        )
    }

    ///
    /// Create Boolean Attribute
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
        xrequired: Bool,
        xdefault: Bool? = nil,
        array: Bool? = nil
    ) async throws -> AppwriteModels.AttributeBoolean {
        var path: String = "/databases/{databaseId}/collections/{collectionId}/attributes/boolean"
        path = path.replacingOccurrences(
          of: "{databaseId}",
          with: databaseId        )
        path = path.replacingOccurrences(
          of: "{collectionId}",
          with: collectionId        )
        let params: [String: Any?] = [
            "key": key,
            "required": xrequired,
            "default": xdefault,
            "array": array
        ]

        let headers: [String: String] = [
            "content-type": "application/json"
        ]
        let converter: ([String: Any]) -> AppwriteModels.AttributeBoolean = { dict in
            return AppwriteModels.AttributeBoolean.from(map: dict)
        }
        return try await client.call(
            method: "POST",
            path: path,
            headers: headers,
            params: params,
            converter: converter
        )
    }

    ///
    /// Create DateTime Attribute
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
        xrequired: Bool,
        xdefault: String? = nil,
        array: Bool? = nil
    ) async throws -> AppwriteModels.AttributeDatetime {
        var path: String = "/databases/{databaseId}/collections/{collectionId}/attributes/datetime"
        path = path.replacingOccurrences(
          of: "{databaseId}",
          with: databaseId        )
        path = path.replacingOccurrences(
          of: "{collectionId}",
          with: collectionId        )
        let params: [String: Any?] = [
            "key": key,
            "required": xrequired,
            "default": xdefault,
            "array": array
        ]

        let headers: [String: String] = [
            "content-type": "application/json"
        ]
        let converter: ([String: Any]) -> AppwriteModels.AttributeDatetime = { dict in
            return AppwriteModels.AttributeDatetime.from(map: dict)
        }
        return try await client.call(
            method: "POST",
            path: path,
            headers: headers,
            params: params,
            converter: converter
        )
    }

    ///
    /// Create Email Attribute
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
        xrequired: Bool,
        xdefault: String? = nil,
        array: Bool? = nil
    ) async throws -> AppwriteModels.AttributeEmail {
        var path: String = "/databases/{databaseId}/collections/{collectionId}/attributes/email"
        path = path.replacingOccurrences(
          of: "{databaseId}",
          with: databaseId        )
        path = path.replacingOccurrences(
          of: "{collectionId}",
          with: collectionId        )
        let params: [String: Any?] = [
            "key": key,
            "required": xrequired,
            "default": xdefault,
            "array": array
        ]

        let headers: [String: String] = [
            "content-type": "application/json"
        ]
        let converter: ([String: Any]) -> AppwriteModels.AttributeEmail = { dict in
            return AppwriteModels.AttributeEmail.from(map: dict)
        }
        return try await client.call(
            method: "POST",
            path: path,
            headers: headers,
            params: params,
            converter: converter
        )
    }

    ///
    /// Create Enum Attribute
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
        xrequired: Bool,
        xdefault: String? = nil,
        array: Bool? = nil
    ) async throws -> AppwriteModels.AttributeEnum {
        var path: String = "/databases/{databaseId}/collections/{collectionId}/attributes/enum"
        path = path.replacingOccurrences(
          of: "{databaseId}",
          with: databaseId        )
        path = path.replacingOccurrences(
          of: "{collectionId}",
          with: collectionId        )
        let params: [String: Any?] = [
            "key": key,
            "elements": elements,
            "required": xrequired,
            "default": xdefault,
            "array": array
        ]

        let headers: [String: String] = [
            "content-type": "application/json"
        ]
        let converter: ([String: Any]) -> AppwriteModels.AttributeEnum = { dict in
            return AppwriteModels.AttributeEnum.from(map: dict)
        }
        return try await client.call(
            method: "POST",
            path: path,
            headers: headers,
            params: params,
            converter: converter
        )
    }

    ///
    /// Create Float Attribute
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
        xrequired: Bool,
        min: Double? = nil,
        max: Double? = nil,
        xdefault: Double? = nil,
        array: Bool? = nil
    ) async throws -> AppwriteModels.AttributeFloat {
        var path: String = "/databases/{databaseId}/collections/{collectionId}/attributes/float"
        path = path.replacingOccurrences(
          of: "{databaseId}",
          with: databaseId        )
        path = path.replacingOccurrences(
          of: "{collectionId}",
          with: collectionId        )
        let params: [String: Any?] = [
            "key": key,
            "required": xrequired,
            "min": min,
            "max": max,
            "default": xdefault,
            "array": array
        ]

        let headers: [String: String] = [
            "content-type": "application/json"
        ]
        let converter: ([String: Any]) -> AppwriteModels.AttributeFloat = { dict in
            return AppwriteModels.AttributeFloat.from(map: dict)
        }
        return try await client.call(
            method: "POST",
            path: path,
            headers: headers,
            params: params,
            converter: converter
        )
    }

    ///
    /// Create Integer Attribute
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
        xrequired: Bool,
        min: Int? = nil,
        max: Int? = nil,
        xdefault: Int? = nil,
        array: Bool? = nil
    ) async throws -> AppwriteModels.AttributeInteger {
        var path: String = "/databases/{databaseId}/collections/{collectionId}/attributes/integer"
        path = path.replacingOccurrences(
          of: "{databaseId}",
          with: databaseId        )
        path = path.replacingOccurrences(
          of: "{collectionId}",
          with: collectionId        )
        let params: [String: Any?] = [
            "key": key,
            "required": xrequired,
            "min": min,
            "max": max,
            "default": xdefault,
            "array": array
        ]

        let headers: [String: String] = [
            "content-type": "application/json"
        ]
        let converter: ([String: Any]) -> AppwriteModels.AttributeInteger = { dict in
            return AppwriteModels.AttributeInteger.from(map: dict)
        }
        return try await client.call(
            method: "POST",
            path: path,
            headers: headers,
            params: params,
            converter: converter
        )
    }

    ///
    /// Create IP Address Attribute
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
        xrequired: Bool,
        xdefault: String? = nil,
        array: Bool? = nil
    ) async throws -> AppwriteModels.AttributeIp {
        var path: String = "/databases/{databaseId}/collections/{collectionId}/attributes/ip"
        path = path.replacingOccurrences(
          of: "{databaseId}",
          with: databaseId        )
        path = path.replacingOccurrences(
          of: "{collectionId}",
          with: collectionId        )
        let params: [String: Any?] = [
            "key": key,
            "required": xrequired,
            "default": xdefault,
            "array": array
        ]

        let headers: [String: String] = [
            "content-type": "application/json"
        ]
        let converter: ([String: Any]) -> AppwriteModels.AttributeIp = { dict in
            return AppwriteModels.AttributeIp.from(map: dict)
        }
        return try await client.call(
            method: "POST",
            path: path,
            headers: headers,
            params: params,
            converter: converter
        )
    }

    ///
    /// Create String Attribute
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
    /// @throws Exception
    /// @return array
    ///
    open func createStringAttribute(
        databaseId: String,
        collectionId: String,
        key: String,
        size: Int,
        xrequired: Bool,
        xdefault: String? = nil,
        array: Bool? = nil
    ) async throws -> AppwriteModels.AttributeString {
        var path: String = "/databases/{databaseId}/collections/{collectionId}/attributes/string"
        path = path.replacingOccurrences(
          of: "{databaseId}",
          with: databaseId        )
        path = path.replacingOccurrences(
          of: "{collectionId}",
          with: collectionId        )
        let params: [String: Any?] = [
            "key": key,
            "size": size,
            "required": xrequired,
            "default": xdefault,
            "array": array
        ]

        let headers: [String: String] = [
            "content-type": "application/json"
        ]
        let converter: ([String: Any]) -> AppwriteModels.AttributeString = { dict in
            return AppwriteModels.AttributeString.from(map: dict)
        }
        return try await client.call(
            method: "POST",
            path: path,
            headers: headers,
            params: params,
            converter: converter
        )
    }

    ///
    /// Create URL Attribute
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
        xrequired: Bool,
        xdefault: String? = nil,
        array: Bool? = nil
    ) async throws -> AppwriteModels.AttributeUrl {
        var path: String = "/databases/{databaseId}/collections/{collectionId}/attributes/url"
        path = path.replacingOccurrences(
          of: "{databaseId}",
          with: databaseId        )
        path = path.replacingOccurrences(
          of: "{collectionId}",
          with: collectionId        )
        let params: [String: Any?] = [
            "key": key,
            "required": xrequired,
            "default": xdefault,
            "array": array
        ]

        let headers: [String: String] = [
            "content-type": "application/json"
        ]
        let converter: ([String: Any]) -> AppwriteModels.AttributeUrl = { dict in
            return AppwriteModels.AttributeUrl.from(map: dict)
        }
        return try await client.call(
            method: "POST",
            path: path,
            headers: headers,
            params: params,
            converter: converter
        )
    }

    ///
    /// Get Attribute
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
        var path: String = "/databases/{databaseId}/collections/{collectionId}/attributes/{key}"
        path = path.replacingOccurrences(
          of: "{databaseId}",
          with: databaseId        )
        path = path.replacingOccurrences(
          of: "{collectionId}",
          with: collectionId        )
        path = path.replacingOccurrences(
          of: "{key}",
          with: key        )
        let params: [String: Any?] = [:]

        let headers: [String: String] = [
            "content-type": "application/json"
        ]
        return try await client.call(
            method: "GET",
            path: path,
            headers: headers,
            params: params        )
    }

    ///
    /// Delete Attribute
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
        var path: String = "/databases/{databaseId}/collections/{collectionId}/attributes/{key}"
        path = path.replacingOccurrences(
          of: "{databaseId}",
          with: databaseId        )
        path = path.replacingOccurrences(
          of: "{collectionId}",
          with: collectionId        )
        path = path.replacingOccurrences(
          of: "{key}",
          with: key        )
        let params: [String: Any?] = [:]

        let headers: [String: String] = [
            "content-type": "application/json"
        ]
        return try await client.call(
            method: "DELETE",
            path: path,
            headers: headers,
            params: params        )
    }

    ///
    /// List Documents
    ///
    /// Get a list of all the user's documents in a given collection. You can use
    /// the query params to filter your results. On admin mode, this endpoint will
    /// return a list of all of documents belonging to the provided collectionId.
    /// [Learn more about different API modes](/docs/admin).
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
    ) async throws -> AppwriteModels.DocumentList {
        var path: String = "/databases/{databaseId}/collections/{collectionId}/documents"
        path = path.replacingOccurrences(
          of: "{databaseId}",
          with: databaseId        )
        path = path.replacingOccurrences(
          of: "{collectionId}",
          with: collectionId        )
        let params: [String: Any?] = [
            "queries": queries
        ]

        let headers: [String: String] = [
            "content-type": "application/json"
        ]
        let converter: ([String: Any]) -> AppwriteModels.DocumentList = { dict in
            return AppwriteModels.DocumentList.from(map: dict)
        }
        return try await client.call(
            method: "GET",
            path: path,
            headers: headers,
            params: params,
            converter: converter
        )
    }

    ///
    /// Create Document
    ///
    /// Create a new Document. Before using this route, you should create a new
    /// collection resource using either a [server
    /// integration](/docs/server/databases#databasesCreateCollection) API or
    /// directly from your database console.
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
    ) async throws -> AppwriteModels.Document {
        var path: String = "/databases/{databaseId}/collections/{collectionId}/documents"
        path = path.replacingOccurrences(
          of: "{databaseId}",
          with: databaseId        )
        path = path.replacingOccurrences(
          of: "{collectionId}",
          with: collectionId        )
        let params: [String: Any?] = [
            "documentId": documentId,
            "data": data,
            "permissions": permissions
        ]

        let headers: [String: String] = [
            "content-type": "application/json"
        ]
        let converter: ([String: Any]) -> AppwriteModels.Document = { dict in
            return AppwriteModels.Document.from(map: dict)
        }
        return try await client.call(
            method: "POST",
            path: path,
            headers: headers,
            params: params,
            converter: converter
        )
    }

    ///
    /// Get Document
    ///
    /// Get a document by its unique ID. This endpoint response returns a JSON
    /// object with the document data.
    ///
    /// @param String databaseId
    /// @param String collectionId
    /// @param String documentId
    /// @throws Exception
    /// @return array
    ///
    open func getDocument(
        databaseId: String,
        collectionId: String,
        documentId: String
    ) async throws -> AppwriteModels.Document {
        var path: String = "/databases/{databaseId}/collections/{collectionId}/documents/{documentId}"
        path = path.replacingOccurrences(
          of: "{databaseId}",
          with: databaseId        )
        path = path.replacingOccurrences(
          of: "{collectionId}",
          with: collectionId        )
        path = path.replacingOccurrences(
          of: "{documentId}",
          with: documentId        )
        let params: [String: Any?] = [:]

        let headers: [String: String] = [
            "content-type": "application/json"
        ]
        let converter: ([String: Any]) -> AppwriteModels.Document = { dict in
            return AppwriteModels.Document.from(map: dict)
        }
        return try await client.call(
            method: "GET",
            path: path,
            headers: headers,
            params: params,
            converter: converter
        )
    }

    ///
    /// Update Document
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
    ) async throws -> AppwriteModels.Document {
        var path: String = "/databases/{databaseId}/collections/{collectionId}/documents/{documentId}"
        path = path.replacingOccurrences(
          of: "{databaseId}",
          with: databaseId        )
        path = path.replacingOccurrences(
          of: "{collectionId}",
          with: collectionId        )
        path = path.replacingOccurrences(
          of: "{documentId}",
          with: documentId        )
        let params: [String: Any?] = [
            "data": data,
            "permissions": permissions
        ]

        let headers: [String: String] = [
            "content-type": "application/json"
        ]
        let converter: ([String: Any]) -> AppwriteModels.Document = { dict in
            return AppwriteModels.Document.from(map: dict)
        }
        return try await client.call(
            method: "PATCH",
            path: path,
            headers: headers,
            params: params,
            converter: converter
        )
    }

    ///
    /// Delete Document
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
        var path: String = "/databases/{databaseId}/collections/{collectionId}/documents/{documentId}"
        path = path.replacingOccurrences(
          of: "{databaseId}",
          with: databaseId        )
        path = path.replacingOccurrences(
          of: "{collectionId}",
          with: collectionId        )
        path = path.replacingOccurrences(
          of: "{documentId}",
          with: documentId        )
        let params: [String: Any?] = [:]

        let headers: [String: String] = [
            "content-type": "application/json"
        ]
        return try await client.call(
            method: "DELETE",
            path: path,
            headers: headers,
            params: params        )
    }

    ///
    /// List Indexes
    ///
    /// @param String databaseId
    /// @param String collectionId
    /// @throws Exception
    /// @return array
    ///
    open func listIndexes(
        databaseId: String,
        collectionId: String
    ) async throws -> AppwriteModels.IndexList {
        var path: String = "/databases/{databaseId}/collections/{collectionId}/indexes"
        path = path.replacingOccurrences(
          of: "{databaseId}",
          with: databaseId        )
        path = path.replacingOccurrences(
          of: "{collectionId}",
          with: collectionId        )
        let params: [String: Any?] = [:]

        let headers: [String: String] = [
            "content-type": "application/json"
        ]
        let converter: ([String: Any]) -> AppwriteModels.IndexList = { dict in
            return AppwriteModels.IndexList.from(map: dict)
        }
        return try await client.call(
            method: "GET",
            path: path,
            headers: headers,
            params: params,
            converter: converter
        )
    }

    ///
    /// Create Index
    ///
    /// @param String databaseId
    /// @param String collectionId
    /// @param String key
    /// @param String type
    /// @param [String] attributes
    /// @param [String] orders
    /// @throws Exception
    /// @return array
    ///
    open func createIndex(
        databaseId: String,
        collectionId: String,
        key: String,
        type: String,
        attributes: [String],
        orders: [String]? = nil
    ) async throws -> AppwriteModels.Index {
        var path: String = "/databases/{databaseId}/collections/{collectionId}/indexes"
        path = path.replacingOccurrences(
          of: "{databaseId}",
          with: databaseId        )
        path = path.replacingOccurrences(
          of: "{collectionId}",
          with: collectionId        )
        let params: [String: Any?] = [
            "key": key,
            "type": type,
            "attributes": attributes,
            "orders": orders
        ]

        let headers: [String: String] = [
            "content-type": "application/json"
        ]
        let converter: ([String: Any]) -> AppwriteModels.Index = { dict in
            return AppwriteModels.Index.from(map: dict)
        }
        return try await client.call(
            method: "POST",
            path: path,
            headers: headers,
            params: params,
            converter: converter
        )
    }

    ///
    /// Get Index
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
        var path: String = "/databases/{databaseId}/collections/{collectionId}/indexes/{key}"
        path = path.replacingOccurrences(
          of: "{databaseId}",
          with: databaseId        )
        path = path.replacingOccurrences(
          of: "{collectionId}",
          with: collectionId        )
        path = path.replacingOccurrences(
          of: "{key}",
          with: key        )
        let params: [String: Any?] = [:]

        let headers: [String: String] = [
            "content-type": "application/json"
        ]
        let converter: ([String: Any]) -> AppwriteModels.Index = { dict in
            return AppwriteModels.Index.from(map: dict)
        }
        return try await client.call(
            method: "GET",
            path: path,
            headers: headers,
            params: params,
            converter: converter
        )
    }

    ///
    /// Delete Index
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
        var path: String = "/databases/{databaseId}/collections/{collectionId}/indexes/{key}"
        path = path.replacingOccurrences(
          of: "{databaseId}",
          with: databaseId        )
        path = path.replacingOccurrences(
          of: "{collectionId}",
          with: collectionId        )
        path = path.replacingOccurrences(
          of: "{key}",
          with: key        )
        let params: [String: Any?] = [:]

        let headers: [String: String] = [
            "content-type": "application/json"
        ]
        return try await client.call(
            method: "DELETE",
            path: path,
            headers: headers,
            params: params        )
    }


    ///
    /// List Databases
    ///
    /// Get a list of all databases from the current Appwrite project. You can use
    /// the search parameter to filter your results.
    ///
    /// @param [String] queries
    /// @param String search
    /// @throws Exception
    /// @return array
    ///
    @available(*, deprecated, message: "Use the async overload instead")
    open func list(
        queries: [String]? = nil,
        search: String? = nil,
        completion: ((Result<AppwriteModels.DatabaseList, AppwriteError>) -> Void)? = nil
    ) {
        Task {
            do {
                let result = try await list(
                    queries: queries,
                    search: search
                )
                completion?(.success(result))
            } catch {
                completion?(.failure(error as! AppwriteError))
            }
        }
    }

    ///
    /// Create Database
    ///
    /// Create a new Database.
    /// 
    ///
    /// @param String databaseId
    /// @param String name
    /// @throws Exception
    /// @return array
    ///
    @available(*, deprecated, message: "Use the async overload instead")
    open func create(
        databaseId: String,
        name: String,
        completion: ((Result<AppwriteModels.Database, AppwriteError>) -> Void)? = nil
    ) {
        Task {
            do {
                let result = try await create(
                    databaseId: databaseId,
                    name: name
                )
                completion?(.success(result))
            } catch {
                completion?(.failure(error as! AppwriteError))
            }
        }
    }

    ///
    /// Get Database
    ///
    /// Get a database by its unique ID. This endpoint response returns a JSON
    /// object with the database metadata.
    ///
    /// @param String databaseId
    /// @throws Exception
    /// @return array
    ///
    @available(*, deprecated, message: "Use the async overload instead")
    open func get(
        databaseId: String,
        completion: ((Result<AppwriteModels.Database, AppwriteError>) -> Void)? = nil
    ) {
        Task {
            do {
                let result = try await get(
                    databaseId: databaseId
                )
                completion?(.success(result))
            } catch {
                completion?(.failure(error as! AppwriteError))
            }
        }
    }

    ///
    /// Update Database
    ///
    /// Update a database by its unique ID.
    ///
    /// @param String databaseId
    /// @param String name
    /// @throws Exception
    /// @return array
    ///
    @available(*, deprecated, message: "Use the async overload instead")
    open func update(
        databaseId: String,
        name: String,
        completion: ((Result<AppwriteModels.Database, AppwriteError>) -> Void)? = nil
    ) {
        Task {
            do {
                let result = try await update(
                    databaseId: databaseId,
                    name: name
                )
                completion?(.success(result))
            } catch {
                completion?(.failure(error as! AppwriteError))
            }
        }
    }

    ///
    /// Delete Database
    ///
    /// Delete a database by its unique ID. Only API keys with with databases.write
    /// scope can delete a database.
    ///
    /// @param String databaseId
    /// @throws Exception
    /// @return array
    ///
    @available(*, deprecated, message: "Use the async overload instead")
    open func delete(
        databaseId: String,
        completion: ((Result<Any, AppwriteError>) -> Void)? = nil
    ) {
        Task {
            do {
                let result = try await delete(
                    databaseId: databaseId
                )
                completion?(.success(result))
            } catch {
                completion?(.failure(error as! AppwriteError))
            }
        }
    }

    ///
    /// List Collections
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
    @available(*, deprecated, message: "Use the async overload instead")
    open func listCollections(
        databaseId: String,
        queries: [String]? = nil,
        search: String? = nil,
        completion: ((Result<AppwriteModels.CollectionList, AppwriteError>) -> Void)? = nil
    ) {
        Task {
            do {
                let result = try await listCollections(
                    databaseId: databaseId,
                    queries: queries,
                    search: search
                )
                completion?(.success(result))
            } catch {
                completion?(.failure(error as! AppwriteError))
            }
        }
    }

    ///
    /// Create Collection
    ///
    /// Create a new Collection. Before using this route, you should create a new
    /// database resource using either a [server
    /// integration](/docs/server/databases#databasesCreateCollection) API or
    /// directly from your database console.
    ///
    /// @param String databaseId
    /// @param String collectionId
    /// @param String name
    /// @param [String] permissions
    /// @param Bool documentSecurity
    /// @throws Exception
    /// @return array
    ///
    @available(*, deprecated, message: "Use the async overload instead")
    open func createCollection(
        databaseId: String,
        collectionId: String,
        name: String,
        permissions: [String]? = nil,
        documentSecurity: Bool? = nil,
        completion: ((Result<AppwriteModels.Collection, AppwriteError>) -> Void)? = nil
    ) {
        Task {
            do {
                let result = try await createCollection(
                    databaseId: databaseId,
                    collectionId: collectionId,
                    name: name,
                    permissions: permissions,
                    documentSecurity: documentSecurity
                )
                completion?(.success(result))
            } catch {
                completion?(.failure(error as! AppwriteError))
            }
        }
    }

    ///
    /// Get Collection
    ///
    /// Get a collection by its unique ID. This endpoint response returns a JSON
    /// object with the collection metadata.
    ///
    /// @param String databaseId
    /// @param String collectionId
    /// @throws Exception
    /// @return array
    ///
    @available(*, deprecated, message: "Use the async overload instead")
    open func getCollection(
        databaseId: String,
        collectionId: String,
        completion: ((Result<AppwriteModels.Collection, AppwriteError>) -> Void)? = nil
    ) {
        Task {
            do {
                let result = try await getCollection(
                    databaseId: databaseId,
                    collectionId: collectionId
                )
                completion?(.success(result))
            } catch {
                completion?(.failure(error as! AppwriteError))
            }
        }
    }

    ///
    /// Update Collection
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
    @available(*, deprecated, message: "Use the async overload instead")
    open func updateCollection(
        databaseId: String,
        collectionId: String,
        name: String,
        permissions: [String]? = nil,
        documentSecurity: Bool? = nil,
        enabled: Bool? = nil,
        completion: ((Result<AppwriteModels.Collection, AppwriteError>) -> Void)? = nil
    ) {
        Task {
            do {
                let result = try await updateCollection(
                    databaseId: databaseId,
                    collectionId: collectionId,
                    name: name,
                    permissions: permissions,
                    documentSecurity: documentSecurity,
                    enabled: enabled
                )
                completion?(.success(result))
            } catch {
                completion?(.failure(error as! AppwriteError))
            }
        }
    }

    ///
    /// Delete Collection
    ///
    /// Delete a collection by its unique ID. Only users with write permissions
    /// have access to delete this resource.
    ///
    /// @param String databaseId
    /// @param String collectionId
    /// @throws Exception
    /// @return array
    ///
    @available(*, deprecated, message: "Use the async overload instead")
    open func deleteCollection(
        databaseId: String,
        collectionId: String,
        completion: ((Result<Any, AppwriteError>) -> Void)? = nil
    ) {
        Task {
            do {
                let result = try await deleteCollection(
                    databaseId: databaseId,
                    collectionId: collectionId
                )
                completion?(.success(result))
            } catch {
                completion?(.failure(error as! AppwriteError))
            }
        }
    }

    ///
    /// List Attributes
    ///
    /// @param String databaseId
    /// @param String collectionId
    /// @throws Exception
    /// @return array
    ///
    @available(*, deprecated, message: "Use the async overload instead")
    open func listAttributes(
        databaseId: String,
        collectionId: String,
        completion: ((Result<AppwriteModels.AttributeList, AppwriteError>) -> Void)? = nil
    ) {
        Task {
            do {
                let result = try await listAttributes(
                    databaseId: databaseId,
                    collectionId: collectionId
                )
                completion?(.success(result))
            } catch {
                completion?(.failure(error as! AppwriteError))
            }
        }
    }

    ///
    /// Create Boolean Attribute
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
    @available(*, deprecated, message: "Use the async overload instead")
    open func createBooleanAttribute(
        databaseId: String,
        collectionId: String,
        key: String,
        xrequired: Bool,
        xdefault: Bool? = nil,
        array: Bool? = nil,
        completion: ((Result<AppwriteModels.AttributeBoolean, AppwriteError>) -> Void)? = nil
    ) {
        Task {
            do {
                let result = try await createBooleanAttribute(
                    databaseId: databaseId,
                    collectionId: collectionId,
                    key: key,
                    xrequired: xrequired,
                    xdefault: xdefault,
                    array: array
                )
                completion?(.success(result))
            } catch {
                completion?(.failure(error as! AppwriteError))
            }
        }
    }

    ///
    /// Create DateTime Attribute
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
    @available(*, deprecated, message: "Use the async overload instead")
    open func createDatetimeAttribute(
        databaseId: String,
        collectionId: String,
        key: String,
        xrequired: Bool,
        xdefault: String? = nil,
        array: Bool? = nil,
        completion: ((Result<AppwriteModels.AttributeDatetime, AppwriteError>) -> Void)? = nil
    ) {
        Task {
            do {
                let result = try await createDatetimeAttribute(
                    databaseId: databaseId,
                    collectionId: collectionId,
                    key: key,
                    xrequired: xrequired,
                    xdefault: xdefault,
                    array: array
                )
                completion?(.success(result))
            } catch {
                completion?(.failure(error as! AppwriteError))
            }
        }
    }

    ///
    /// Create Email Attribute
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
    @available(*, deprecated, message: "Use the async overload instead")
    open func createEmailAttribute(
        databaseId: String,
        collectionId: String,
        key: String,
        xrequired: Bool,
        xdefault: String? = nil,
        array: Bool? = nil,
        completion: ((Result<AppwriteModels.AttributeEmail, AppwriteError>) -> Void)? = nil
    ) {
        Task {
            do {
                let result = try await createEmailAttribute(
                    databaseId: databaseId,
                    collectionId: collectionId,
                    key: key,
                    xrequired: xrequired,
                    xdefault: xdefault,
                    array: array
                )
                completion?(.success(result))
            } catch {
                completion?(.failure(error as! AppwriteError))
            }
        }
    }

    ///
    /// Create Enum Attribute
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
    @available(*, deprecated, message: "Use the async overload instead")
    open func createEnumAttribute(
        databaseId: String,
        collectionId: String,
        key: String,
        elements: [String],
        xrequired: Bool,
        xdefault: String? = nil,
        array: Bool? = nil,
        completion: ((Result<AppwriteModels.AttributeEnum, AppwriteError>) -> Void)? = nil
    ) {
        Task {
            do {
                let result = try await createEnumAttribute(
                    databaseId: databaseId,
                    collectionId: collectionId,
                    key: key,
                    elements: elements,
                    xrequired: xrequired,
                    xdefault: xdefault,
                    array: array
                )
                completion?(.success(result))
            } catch {
                completion?(.failure(error as! AppwriteError))
            }
        }
    }

    ///
    /// Create Float Attribute
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
    @available(*, deprecated, message: "Use the async overload instead")
    open func createFloatAttribute(
        databaseId: String,
        collectionId: String,
        key: String,
        xrequired: Bool,
        min: Double? = nil,
        max: Double? = nil,
        xdefault: Double? = nil,
        array: Bool? = nil,
        completion: ((Result<AppwriteModels.AttributeFloat, AppwriteError>) -> Void)? = nil
    ) {
        Task {
            do {
                let result = try await createFloatAttribute(
                    databaseId: databaseId,
                    collectionId: collectionId,
                    key: key,
                    xrequired: xrequired,
                    min: min,
                    max: max,
                    xdefault: xdefault,
                    array: array
                )
                completion?(.success(result))
            } catch {
                completion?(.failure(error as! AppwriteError))
            }
        }
    }

    ///
    /// Create Integer Attribute
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
    @available(*, deprecated, message: "Use the async overload instead")
    open func createIntegerAttribute(
        databaseId: String,
        collectionId: String,
        key: String,
        xrequired: Bool,
        min: Int? = nil,
        max: Int? = nil,
        xdefault: Int? = nil,
        array: Bool? = nil,
        completion: ((Result<AppwriteModels.AttributeInteger, AppwriteError>) -> Void)? = nil
    ) {
        Task {
            do {
                let result = try await createIntegerAttribute(
                    databaseId: databaseId,
                    collectionId: collectionId,
                    key: key,
                    xrequired: xrequired,
                    min: min,
                    max: max,
                    xdefault: xdefault,
                    array: array
                )
                completion?(.success(result))
            } catch {
                completion?(.failure(error as! AppwriteError))
            }
        }
    }

    ///
    /// Create IP Address Attribute
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
    @available(*, deprecated, message: "Use the async overload instead")
    open func createIpAttribute(
        databaseId: String,
        collectionId: String,
        key: String,
        xrequired: Bool,
        xdefault: String? = nil,
        array: Bool? = nil,
        completion: ((Result<AppwriteModels.AttributeIp, AppwriteError>) -> Void)? = nil
    ) {
        Task {
            do {
                let result = try await createIpAttribute(
                    databaseId: databaseId,
                    collectionId: collectionId,
                    key: key,
                    xrequired: xrequired,
                    xdefault: xdefault,
                    array: array
                )
                completion?(.success(result))
            } catch {
                completion?(.failure(error as! AppwriteError))
            }
        }
    }

    ///
    /// Create String Attribute
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
    /// @throws Exception
    /// @return array
    ///
    @available(*, deprecated, message: "Use the async overload instead")
    open func createStringAttribute(
        databaseId: String,
        collectionId: String,
        key: String,
        size: Int,
        xrequired: Bool,
        xdefault: String? = nil,
        array: Bool? = nil,
        completion: ((Result<AppwriteModels.AttributeString, AppwriteError>) -> Void)? = nil
    ) {
        Task {
            do {
                let result = try await createStringAttribute(
                    databaseId: databaseId,
                    collectionId: collectionId,
                    key: key,
                    size: size,
                    xrequired: xrequired,
                    xdefault: xdefault,
                    array: array
                )
                completion?(.success(result))
            } catch {
                completion?(.failure(error as! AppwriteError))
            }
        }
    }

    ///
    /// Create URL Attribute
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
    @available(*, deprecated, message: "Use the async overload instead")
    open func createUrlAttribute(
        databaseId: String,
        collectionId: String,
        key: String,
        xrequired: Bool,
        xdefault: String? = nil,
        array: Bool? = nil,
        completion: ((Result<AppwriteModels.AttributeUrl, AppwriteError>) -> Void)? = nil
    ) {
        Task {
            do {
                let result = try await createUrlAttribute(
                    databaseId: databaseId,
                    collectionId: collectionId,
                    key: key,
                    xrequired: xrequired,
                    xdefault: xdefault,
                    array: array
                )
                completion?(.success(result))
            } catch {
                completion?(.failure(error as! AppwriteError))
            }
        }
    }

    ///
    /// Get Attribute
    ///
    /// @param String databaseId
    /// @param String collectionId
    /// @param String key
    /// @throws Exception
    /// @return array
    ///
    @available(*, deprecated, message: "Use the async overload instead")
    open func getAttribute(
        databaseId: String,
        collectionId: String,
        key: String,
        completion: ((Result<Any, AppwriteError>) -> Void)? = nil
    ) {
        Task {
            do {
                let result = try await getAttribute(
                    databaseId: databaseId,
                    collectionId: collectionId,
                    key: key
                )
                completion?(.success(result))
            } catch {
                completion?(.failure(error as! AppwriteError))
            }
        }
    }

    ///
    /// Delete Attribute
    ///
    /// @param String databaseId
    /// @param String collectionId
    /// @param String key
    /// @throws Exception
    /// @return array
    ///
    @available(*, deprecated, message: "Use the async overload instead")
    open func deleteAttribute(
        databaseId: String,
        collectionId: String,
        key: String,
        completion: ((Result<Any, AppwriteError>) -> Void)? = nil
    ) {
        Task {
            do {
                let result = try await deleteAttribute(
                    databaseId: databaseId,
                    collectionId: collectionId,
                    key: key
                )
                completion?(.success(result))
            } catch {
                completion?(.failure(error as! AppwriteError))
            }
        }
    }

    ///
    /// List Documents
    ///
    /// Get a list of all the user's documents in a given collection. You can use
    /// the query params to filter your results. On admin mode, this endpoint will
    /// return a list of all of documents belonging to the provided collectionId.
    /// [Learn more about different API modes](/docs/admin).
    ///
    /// @param String databaseId
    /// @param String collectionId
    /// @param [String] queries
    /// @throws Exception
    /// @return array
    ///
    @available(*, deprecated, message: "Use the async overload instead")
    open func listDocuments(
        databaseId: String,
        collectionId: String,
        queries: [String]? = nil,
        completion: ((Result<AppwriteModels.DocumentList, AppwriteError>) -> Void)? = nil
    ) {
        Task {
            do {
                let result = try await listDocuments(
                    databaseId: databaseId,
                    collectionId: collectionId,
                    queries: queries
                )
                completion?(.success(result))
            } catch {
                completion?(.failure(error as! AppwriteError))
            }
        }
    }

    ///
    /// Create Document
    ///
    /// Create a new Document. Before using this route, you should create a new
    /// collection resource using either a [server
    /// integration](/docs/server/databases#databasesCreateCollection) API or
    /// directly from your database console.
    ///
    /// @param String databaseId
    /// @param String collectionId
    /// @param String documentId
    /// @param Any data
    /// @param [String] permissions
    /// @throws Exception
    /// @return array
    ///
    @available(*, deprecated, message: "Use the async overload instead")
    open func createDocument(
        databaseId: String,
        collectionId: String,
        documentId: String,
        data: Any,
        permissions: [String]? = nil,
        completion: ((Result<AppwriteModels.Document, AppwriteError>) -> Void)? = nil
    ) {
        Task {
            do {
                let result = try await createDocument(
                    databaseId: databaseId,
                    collectionId: collectionId,
                    documentId: documentId,
                    data: data,
                    permissions: permissions
                )
                completion?(.success(result))
            } catch {
                completion?(.failure(error as! AppwriteError))
            }
        }
    }

    ///
    /// Get Document
    ///
    /// Get a document by its unique ID. This endpoint response returns a JSON
    /// object with the document data.
    ///
    /// @param String databaseId
    /// @param String collectionId
    /// @param String documentId
    /// @throws Exception
    /// @return array
    ///
    @available(*, deprecated, message: "Use the async overload instead")
    open func getDocument(
        databaseId: String,
        collectionId: String,
        documentId: String,
        completion: ((Result<AppwriteModels.Document, AppwriteError>) -> Void)? = nil
    ) {
        Task {
            do {
                let result = try await getDocument(
                    databaseId: databaseId,
                    collectionId: collectionId,
                    documentId: documentId
                )
                completion?(.success(result))
            } catch {
                completion?(.failure(error as! AppwriteError))
            }
        }
    }

    ///
    /// Update Document
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
    @available(*, deprecated, message: "Use the async overload instead")
    open func updateDocument(
        databaseId: String,
        collectionId: String,
        documentId: String,
        data: Any? = nil,
        permissions: [String]? = nil,
        completion: ((Result<AppwriteModels.Document, AppwriteError>) -> Void)? = nil
    ) {
        Task {
            do {
                let result = try await updateDocument(
                    databaseId: databaseId,
                    collectionId: collectionId,
                    documentId: documentId,
                    data: data,
                    permissions: permissions
                )
                completion?(.success(result))
            } catch {
                completion?(.failure(error as! AppwriteError))
            }
        }
    }

    ///
    /// Delete Document
    ///
    /// Delete a document by its unique ID.
    ///
    /// @param String databaseId
    /// @param String collectionId
    /// @param String documentId
    /// @throws Exception
    /// @return array
    ///
    @available(*, deprecated, message: "Use the async overload instead")
    open func deleteDocument(
        databaseId: String,
        collectionId: String,
        documentId: String,
        completion: ((Result<Any, AppwriteError>) -> Void)? = nil
    ) {
        Task {
            do {
                let result = try await deleteDocument(
                    databaseId: databaseId,
                    collectionId: collectionId,
                    documentId: documentId
                )
                completion?(.success(result))
            } catch {
                completion?(.failure(error as! AppwriteError))
            }
        }
    }

    ///
    /// List Indexes
    ///
    /// @param String databaseId
    /// @param String collectionId
    /// @throws Exception
    /// @return array
    ///
    @available(*, deprecated, message: "Use the async overload instead")
    open func listIndexes(
        databaseId: String,
        collectionId: String,
        completion: ((Result<AppwriteModels.IndexList, AppwriteError>) -> Void)? = nil
    ) {
        Task {
            do {
                let result = try await listIndexes(
                    databaseId: databaseId,
                    collectionId: collectionId
                )
                completion?(.success(result))
            } catch {
                completion?(.failure(error as! AppwriteError))
            }
        }
    }

    ///
    /// Create Index
    ///
    /// @param String databaseId
    /// @param String collectionId
    /// @param String key
    /// @param String type
    /// @param [String] attributes
    /// @param [String] orders
    /// @throws Exception
    /// @return array
    ///
    @available(*, deprecated, message: "Use the async overload instead")
    open func createIndex(
        databaseId: String,
        collectionId: String,
        key: String,
        type: String,
        attributes: [String],
        orders: [String]? = nil,
        completion: ((Result<AppwriteModels.Index, AppwriteError>) -> Void)? = nil
    ) {
        Task {
            do {
                let result = try await createIndex(
                    databaseId: databaseId,
                    collectionId: collectionId,
                    key: key,
                    type: type,
                    attributes: attributes,
                    orders: orders
                )
                completion?(.success(result))
            } catch {
                completion?(.failure(error as! AppwriteError))
            }
        }
    }

    ///
    /// Get Index
    ///
    /// @param String databaseId
    /// @param String collectionId
    /// @param String key
    /// @throws Exception
    /// @return array
    ///
    @available(*, deprecated, message: "Use the async overload instead")
    open func getIndex(
        databaseId: String,
        collectionId: String,
        key: String,
        completion: ((Result<AppwriteModels.Index, AppwriteError>) -> Void)? = nil
    ) {
        Task {
            do {
                let result = try await getIndex(
                    databaseId: databaseId,
                    collectionId: collectionId,
                    key: key
                )
                completion?(.success(result))
            } catch {
                completion?(.failure(error as! AppwriteError))
            }
        }
    }

    ///
    /// Delete Index
    ///
    /// @param String databaseId
    /// @param String collectionId
    /// @param String key
    /// @throws Exception
    /// @return array
    ///
    @available(*, deprecated, message: "Use the async overload instead")
    open func deleteIndex(
        databaseId: String,
        collectionId: String,
        key: String,
        completion: ((Result<Any, AppwriteError>) -> Void)? = nil
    ) {
        Task {
            do {
                let result = try await deleteIndex(
                    databaseId: databaseId,
                    collectionId: collectionId,
                    key: key
                )
                completion?(.success(result))
            } catch {
                completion?(.failure(error as! AppwriteError))
            }
        }
    }

}
