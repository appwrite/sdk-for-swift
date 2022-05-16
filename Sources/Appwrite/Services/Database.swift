import AsyncHTTPClient
import Foundation
import NIO
import AppwriteModels

open class Database: Service {
    ///
    /// List Collections
    ///
    /// Get a list of all the user collections. You can use the query params to
    /// filter your results. On admin mode, this endpoint will return a list of all
    /// of the project's collections. [Learn more about different API
    /// modes](/docs/admin).
    ///
    /// @param String search
    /// @param Int limit
    /// @param Int offset
    /// @param String cursor
    /// @param String cursorDirection
    /// @param String orderType
    /// @throws Exception
    /// @return array
    ///
    open func listCollections(
        search: String? = nil,
        limit: Int? = nil,
        offset: Int? = nil,
        cursor: String? = nil,
        cursorDirection: String? = nil,
        orderType: String? = nil
    ) async throws -> AppwriteModels.CollectionList {
        let path: String = "/database/collections"
        let params: [String: Any?] = [
            "search": search,
            "limit": limit,
            "offset": offset,
            "cursor": cursor,
            "cursorDirection": cursorDirection,
            "orderType": orderType
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
    /// Create a new Collection.
    ///
    /// @param String collectionId
    /// @param String name
    /// @param String permission
    /// @param [Any] read
    /// @param [Any] write
    /// @throws Exception
    /// @return array
    ///
    open func createCollection(
        collectionId: String,
        name: String,
        permission: String,
        read: [Any],
        write: [Any]
    ) async throws -> AppwriteModels.Collection {
        let path: String = "/database/collections"
        let params: [String: Any?] = [
            "collectionId": collectionId,
            "name": name,
            "permission": permission,
            "read": read,
            "write": write
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
    /// @param String collectionId
    /// @throws Exception
    /// @return array
    ///
    open func getCollection(
        collectionId: String
    ) async throws -> AppwriteModels.Collection {
        var path: String = "/database/collections/{collectionId}"
        path = path.replacingOccurrences(
          of: "{collectionId}",
          with: collectionId
        )
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
    /// @param String collectionId
    /// @param String name
    /// @param String permission
    /// @param [Any] read
    /// @param [Any] write
    /// @param Bool enabled
    /// @throws Exception
    /// @return array
    ///
    open func updateCollection(
        collectionId: String,
        name: String,
        permission: String,
        read: [Any]? = nil,
        write: [Any]? = nil,
        enabled: Bool? = nil
    ) async throws -> AppwriteModels.Collection {
        var path: String = "/database/collections/{collectionId}"
        path = path.replacingOccurrences(
          of: "{collectionId}",
          with: collectionId
        )
        let params: [String: Any?] = [
            "name": name,
            "permission": permission,
            "read": read,
            "write": write,
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
    /// @param String collectionId
    /// @throws Exception
    /// @return array
    ///
    open func deleteCollection(
        collectionId: String
    ) async throws -> Any {
        var path: String = "/database/collections/{collectionId}"
        path = path.replacingOccurrences(
          of: "{collectionId}",
          with: collectionId
        )
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
    /// @param String collectionId
    /// @throws Exception
    /// @return array
    ///
    open func listAttributes(
        collectionId: String
    ) async throws -> AppwriteModels.AttributeList {
        var path: String = "/database/collections/{collectionId}/attributes"
        path = path.replacingOccurrences(
          of: "{collectionId}",
          with: collectionId
        )
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
    /// @param String collectionId
    /// @param String key
    /// @param Bool required
    /// @param Bool default
    /// @param Bool array
    /// @throws Exception
    /// @return array
    ///
    open func createBooleanAttribute(
        collectionId: String,
        key: String,
        xrequired: Bool,
        xdefault: Bool? = nil,
        array: Bool? = nil
    ) async throws -> AppwriteModels.AttributeBoolean {
        var path: String = "/database/collections/{collectionId}/attributes/boolean"
        path = path.replacingOccurrences(
          of: "{collectionId}",
          with: collectionId
        )
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
    /// Create Email Attribute
    ///
    /// Create an email attribute.
    /// 
    ///
    /// @param String collectionId
    /// @param String key
    /// @param Bool required
    /// @param String default
    /// @param Bool array
    /// @throws Exception
    /// @return array
    ///
    open func createEmailAttribute(
        collectionId: String,
        key: String,
        xrequired: Bool,
        xdefault: String? = nil,
        array: Bool? = nil
    ) async throws -> AppwriteModels.AttributeEmail {
        var path: String = "/database/collections/{collectionId}/attributes/email"
        path = path.replacingOccurrences(
          of: "{collectionId}",
          with: collectionId
        )
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
    /// @param String collectionId
    /// @param String key
    /// @param [Any] elements
    /// @param Bool required
    /// @param String default
    /// @param Bool array
    /// @throws Exception
    /// @return array
    ///
    open func createEnumAttribute(
        collectionId: String,
        key: String,
        elements: [Any],
        xrequired: Bool,
        xdefault: String? = nil,
        array: Bool? = nil
    ) async throws -> AppwriteModels.AttributeEnum {
        var path: String = "/database/collections/{collectionId}/attributes/enum"
        path = path.replacingOccurrences(
          of: "{collectionId}",
          with: collectionId
        )
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
        collectionId: String,
        key: String,
        xrequired: Bool,
        min: Double? = nil,
        max: Double? = nil,
        xdefault: Double? = nil,
        array: Bool? = nil
    ) async throws -> AppwriteModels.AttributeFloat {
        var path: String = "/database/collections/{collectionId}/attributes/float"
        path = path.replacingOccurrences(
          of: "{collectionId}",
          with: collectionId
        )
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
        collectionId: String,
        key: String,
        xrequired: Bool,
        min: Int? = nil,
        max: Int? = nil,
        xdefault: Int? = nil,
        array: Bool? = nil
    ) async throws -> AppwriteModels.AttributeInteger {
        var path: String = "/database/collections/{collectionId}/attributes/integer"
        path = path.replacingOccurrences(
          of: "{collectionId}",
          with: collectionId
        )
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
    /// @param String collectionId
    /// @param String key
    /// @param Bool required
    /// @param String default
    /// @param Bool array
    /// @throws Exception
    /// @return array
    ///
    open func createIpAttribute(
        collectionId: String,
        key: String,
        xrequired: Bool,
        xdefault: String? = nil,
        array: Bool? = nil
    ) async throws -> AppwriteModels.AttributeIp {
        var path: String = "/database/collections/{collectionId}/attributes/ip"
        path = path.replacingOccurrences(
          of: "{collectionId}",
          with: collectionId
        )
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
        collectionId: String,
        key: String,
        size: Int,
        xrequired: Bool,
        xdefault: String? = nil,
        array: Bool? = nil
    ) async throws -> AppwriteModels.AttributeString {
        var path: String = "/database/collections/{collectionId}/attributes/string"
        path = path.replacingOccurrences(
          of: "{collectionId}",
          with: collectionId
        )
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
    /// @param String collectionId
    /// @param String key
    /// @param Bool required
    /// @param String default
    /// @param Bool array
    /// @throws Exception
    /// @return array
    ///
    open func createUrlAttribute(
        collectionId: String,
        key: String,
        xrequired: Bool,
        xdefault: String? = nil,
        array: Bool? = nil
    ) async throws -> AppwriteModels.AttributeUrl {
        var path: String = "/database/collections/{collectionId}/attributes/url"
        path = path.replacingOccurrences(
          of: "{collectionId}",
          with: collectionId
        )
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
    /// @param String collectionId
    /// @param String key
    /// @throws Exception
    /// @return array
    ///
    open func getAttribute(
        collectionId: String,
        key: String
    ) async throws -> Any {
        var path: String = "/database/collections/{collectionId}/attributes/{key}"
        path = path.replacingOccurrences(
          of: "{collectionId}",
          with: collectionId
        )
        path = path.replacingOccurrences(
          of: "{key}",
          with: key
        )
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
    /// @param String collectionId
    /// @param String key
    /// @throws Exception
    /// @return array
    ///
    open func deleteAttribute(
        collectionId: String,
        key: String
    ) async throws -> Any {
        var path: String = "/database/collections/{collectionId}/attributes/{key}"
        path = path.replacingOccurrences(
          of: "{collectionId}",
          with: collectionId
        )
        path = path.replacingOccurrences(
          of: "{key}",
          with: key
        )
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
    /// Get a list of all the user documents. You can use the query params to
    /// filter your results. On admin mode, this endpoint will return a list of all
    /// of the project's documents. [Learn more about different API
    /// modes](/docs/admin).
    ///
    /// @param String collectionId
    /// @param [Any] queries
    /// @param Int limit
    /// @param Int offset
    /// @param String cursor
    /// @param String cursorDirection
    /// @param [Any] orderAttributes
    /// @param [Any] orderTypes
    /// @throws Exception
    /// @return array
    ///
    open func listDocuments(
        collectionId: String,
        queries: [Any]? = nil,
        limit: Int? = nil,
        offset: Int? = nil,
        cursor: String? = nil,
        cursorDirection: String? = nil,
        orderAttributes: [Any]? = nil,
        orderTypes: [Any]? = nil
    ) async throws -> AppwriteModels.DocumentList {
        var path: String = "/database/collections/{collectionId}/documents"
        path = path.replacingOccurrences(
          of: "{collectionId}",
          with: collectionId
        )
        let params: [String: Any?] = [
            "queries": queries,
            "limit": limit,
            "offset": offset,
            "cursor": cursor,
            "cursorDirection": cursorDirection,
            "orderAttributes": orderAttributes,
            "orderTypes": orderTypes
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
    /// integration](/docs/server/database#databaseCreateCollection) API or
    /// directly from your database console.
    ///
    /// @param String collectionId
    /// @param String documentId
    /// @param Any data
    /// @param [Any] read
    /// @param [Any] write
    /// @throws Exception
    /// @return array
    ///
    open func createDocument(
        collectionId: String,
        documentId: String,
        data: Any,
        read: [Any]? = nil,
        write: [Any]? = nil
    ) async throws -> AppwriteModels.Document {
        var path: String = "/database/collections/{collectionId}/documents"
        path = path.replacingOccurrences(
          of: "{collectionId}",
          with: collectionId
        )
        let params: [String: Any?] = [
            "documentId": documentId,
            "data": data,
            "read": read,
            "write": write
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
    /// @param String collectionId
    /// @param String documentId
    /// @throws Exception
    /// @return array
    ///
    open func getDocument(
        collectionId: String,
        documentId: String
    ) async throws -> AppwriteModels.Document {
        var path: String = "/database/collections/{collectionId}/documents/{documentId}"
        path = path.replacingOccurrences(
          of: "{collectionId}",
          with: collectionId
        )
        path = path.replacingOccurrences(
          of: "{documentId}",
          with: documentId
        )
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
    /// @param String collectionId
    /// @param String documentId
    /// @param Any data
    /// @param [Any] read
    /// @param [Any] write
    /// @throws Exception
    /// @return array
    ///
    open func updateDocument(
        collectionId: String,
        documentId: String,
        data: Any,
        read: [Any]? = nil,
        write: [Any]? = nil
    ) async throws -> AppwriteModels.Document {
        var path: String = "/database/collections/{collectionId}/documents/{documentId}"
        path = path.replacingOccurrences(
          of: "{collectionId}",
          with: collectionId
        )
        path = path.replacingOccurrences(
          of: "{documentId}",
          with: documentId
        )
        let params: [String: Any?] = [
            "data": data,
            "read": read,
            "write": write
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
    /// @param String collectionId
    /// @param String documentId
    /// @throws Exception
    /// @return array
    ///
    open func deleteDocument(
        collectionId: String,
        documentId: String
    ) async throws -> Any {
        var path: String = "/database/collections/{collectionId}/documents/{documentId}"
        path = path.replacingOccurrences(
          of: "{collectionId}",
          with: collectionId
        )
        path = path.replacingOccurrences(
          of: "{documentId}",
          with: documentId
        )
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
    /// @param String collectionId
    /// @throws Exception
    /// @return array
    ///
    open func listIndexes(
        collectionId: String
    ) async throws -> AppwriteModels.IndexList {
        var path: String = "/database/collections/{collectionId}/indexes"
        path = path.replacingOccurrences(
          of: "{collectionId}",
          with: collectionId
        )
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
    /// @param String collectionId
    /// @param String key
    /// @param String type
    /// @param [Any] attributes
    /// @param [Any] orders
    /// @throws Exception
    /// @return array
    ///
    open func createIndex(
        collectionId: String,
        key: String,
        type: String,
        attributes: [Any],
        orders: [Any]? = nil
    ) async throws -> AppwriteModels.Index {
        var path: String = "/database/collections/{collectionId}/indexes"
        path = path.replacingOccurrences(
          of: "{collectionId}",
          with: collectionId
        )
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
    /// @param String collectionId
    /// @param String key
    /// @throws Exception
    /// @return array
    ///
    open func getIndex(
        collectionId: String,
        key: String
    ) async throws -> AppwriteModels.Index {
        var path: String = "/database/collections/{collectionId}/indexes/{key}"
        path = path.replacingOccurrences(
          of: "{collectionId}",
          with: collectionId
        )
        path = path.replacingOccurrences(
          of: "{key}",
          with: key
        )
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
    /// @param String collectionId
    /// @param String key
    /// @throws Exception
    /// @return array
    ///
    open func deleteIndex(
        collectionId: String,
        key: String
    ) async throws -> Any {
        var path: String = "/database/collections/{collectionId}/indexes/{key}"
        path = path.replacingOccurrences(
          of: "{collectionId}",
          with: collectionId
        )
        path = path.replacingOccurrences(
          of: "{key}",
          with: key
        )
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
    /// Get a list of all the user collections. You can use the query params to
    /// filter your results. On admin mode, this endpoint will return a list of all
    /// of the project's collections. [Learn more about different API
    /// modes](/docs/admin).
    ///
    /// @param String search
    /// @param Int limit
    /// @param Int offset
    /// @param String cursor
    /// @param String cursorDirection
    /// @param String orderType
    /// @throws Exception
    /// @return array
    ///
    @available(*, deprecated, message: "Use the async overload instead")
    open func listCollections(
        search: String? = nil,
        limit: Int? = nil,
        offset: Int? = nil,
        cursor: String? = nil,
        cursorDirection: String? = nil,
        orderType: String? = nil,
        completion: ((Result<AppwriteModels.CollectionList, AppwriteError>) -> Void)? = nil
    ) {
        Task {
            do {
                let result = try await listCollections(
                    search: search,
                    limit: limit,
                    offset: offset,
                    cursor: cursor,
                    cursorDirection: cursorDirection,
                    orderType: orderType
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
    /// Create a new Collection.
    ///
    /// @param String collectionId
    /// @param String name
    /// @param String permission
    /// @param [Any] read
    /// @param [Any] write
    /// @throws Exception
    /// @return array
    ///
    @available(*, deprecated, message: "Use the async overload instead")
    open func createCollection(
        collectionId: String,
        name: String,
        permission: String,
        read: [Any],
        write: [Any],
        completion: ((Result<AppwriteModels.Collection, AppwriteError>) -> Void)? = nil
    ) {
        Task {
            do {
                let result = try await createCollection(
                    collectionId: collectionId,
                    name: name,
                    permission: permission,
                    read: read,
                    write: write
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
    /// @param String collectionId
    /// @throws Exception
    /// @return array
    ///
    @available(*, deprecated, message: "Use the async overload instead")
    open func getCollection(
        collectionId: String,
        completion: ((Result<AppwriteModels.Collection, AppwriteError>) -> Void)? = nil
    ) {
        Task {
            do {
                let result = try await getCollection(
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
    /// @param String collectionId
    /// @param String name
    /// @param String permission
    /// @param [Any] read
    /// @param [Any] write
    /// @param Bool enabled
    /// @throws Exception
    /// @return array
    ///
    @available(*, deprecated, message: "Use the async overload instead")
    open func updateCollection(
        collectionId: String,
        name: String,
        permission: String,
        read: [Any]? = nil,
        write: [Any]? = nil,
        enabled: Bool? = nil,
        completion: ((Result<AppwriteModels.Collection, AppwriteError>) -> Void)? = nil
    ) {
        Task {
            do {
                let result = try await updateCollection(
                    collectionId: collectionId,
                    name: name,
                    permission: permission,
                    read: read,
                    write: write,
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
    /// @param String collectionId
    /// @throws Exception
    /// @return array
    ///
    @available(*, deprecated, message: "Use the async overload instead")
    open func deleteCollection(
        collectionId: String,
        completion: ((Result<Any, AppwriteError>) -> Void)? = nil
    ) {
        Task {
            do {
                let result = try await deleteCollection(
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
    /// @param String collectionId
    /// @throws Exception
    /// @return array
    ///
    @available(*, deprecated, message: "Use the async overload instead")
    open func listAttributes(
        collectionId: String,
        completion: ((Result<AppwriteModels.AttributeList, AppwriteError>) -> Void)? = nil
    ) {
        Task {
            do {
                let result = try await listAttributes(
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
    /// @param String collectionId
    /// @param String key
    /// @param [Any] elements
    /// @param Bool required
    /// @param String default
    /// @param Bool array
    /// @throws Exception
    /// @return array
    ///
    @available(*, deprecated, message: "Use the async overload instead")
    open func createEnumAttribute(
        collectionId: String,
        key: String,
        elements: [Any],
        xrequired: Bool,
        xdefault: String? = nil,
        array: Bool? = nil,
        completion: ((Result<AppwriteModels.AttributeEnum, AppwriteError>) -> Void)? = nil
    ) {
        Task {
            do {
                let result = try await createEnumAttribute(
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
    /// @param String collectionId
    /// @param String key
    /// @throws Exception
    /// @return array
    ///
    @available(*, deprecated, message: "Use the async overload instead")
    open func getAttribute(
        collectionId: String,
        key: String,
        completion: ((Result<Any, AppwriteError>) -> Void)? = nil
    ) {
        Task {
            do {
                let result = try await getAttribute(
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
    /// @param String collectionId
    /// @param String key
    /// @throws Exception
    /// @return array
    ///
    @available(*, deprecated, message: "Use the async overload instead")
    open func deleteAttribute(
        collectionId: String,
        key: String,
        completion: ((Result<Any, AppwriteError>) -> Void)? = nil
    ) {
        Task {
            do {
                let result = try await deleteAttribute(
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
    /// Get a list of all the user documents. You can use the query params to
    /// filter your results. On admin mode, this endpoint will return a list of all
    /// of the project's documents. [Learn more about different API
    /// modes](/docs/admin).
    ///
    /// @param String collectionId
    /// @param [Any] queries
    /// @param Int limit
    /// @param Int offset
    /// @param String cursor
    /// @param String cursorDirection
    /// @param [Any] orderAttributes
    /// @param [Any] orderTypes
    /// @throws Exception
    /// @return array
    ///
    @available(*, deprecated, message: "Use the async overload instead")
    open func listDocuments(
        collectionId: String,
        queries: [Any]? = nil,
        limit: Int? = nil,
        offset: Int? = nil,
        cursor: String? = nil,
        cursorDirection: String? = nil,
        orderAttributes: [Any]? = nil,
        orderTypes: [Any]? = nil,
        completion: ((Result<AppwriteModels.DocumentList, AppwriteError>) -> Void)? = nil
    ) {
        Task {
            do {
                let result = try await listDocuments(
                    collectionId: collectionId,
                    queries: queries,
                    limit: limit,
                    offset: offset,
                    cursor: cursor,
                    cursorDirection: cursorDirection,
                    orderAttributes: orderAttributes,
                    orderTypes: orderTypes
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
    /// integration](/docs/server/database#databaseCreateCollection) API or
    /// directly from your database console.
    ///
    /// @param String collectionId
    /// @param String documentId
    /// @param Any data
    /// @param [Any] read
    /// @param [Any] write
    /// @throws Exception
    /// @return array
    ///
    @available(*, deprecated, message: "Use the async overload instead")
    open func createDocument(
        collectionId: String,
        documentId: String,
        data: Any,
        read: [Any]? = nil,
        write: [Any]? = nil,
        completion: ((Result<AppwriteModels.Document, AppwriteError>) -> Void)? = nil
    ) {
        Task {
            do {
                let result = try await createDocument(
                    collectionId: collectionId,
                    documentId: documentId,
                    data: data,
                    read: read,
                    write: write
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
    /// @param String collectionId
    /// @param String documentId
    /// @throws Exception
    /// @return array
    ///
    @available(*, deprecated, message: "Use the async overload instead")
    open func getDocument(
        collectionId: String,
        documentId: String,
        completion: ((Result<AppwriteModels.Document, AppwriteError>) -> Void)? = nil
    ) {
        Task {
            do {
                let result = try await getDocument(
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
    /// @param String collectionId
    /// @param String documentId
    /// @param Any data
    /// @param [Any] read
    /// @param [Any] write
    /// @throws Exception
    /// @return array
    ///
    @available(*, deprecated, message: "Use the async overload instead")
    open func updateDocument(
        collectionId: String,
        documentId: String,
        data: Any,
        read: [Any]? = nil,
        write: [Any]? = nil,
        completion: ((Result<AppwriteModels.Document, AppwriteError>) -> Void)? = nil
    ) {
        Task {
            do {
                let result = try await updateDocument(
                    collectionId: collectionId,
                    documentId: documentId,
                    data: data,
                    read: read,
                    write: write
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
    /// @param String collectionId
    /// @param String documentId
    /// @throws Exception
    /// @return array
    ///
    @available(*, deprecated, message: "Use the async overload instead")
    open func deleteDocument(
        collectionId: String,
        documentId: String,
        completion: ((Result<Any, AppwriteError>) -> Void)? = nil
    ) {
        Task {
            do {
                let result = try await deleteDocument(
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
    /// @param String collectionId
    /// @throws Exception
    /// @return array
    ///
    @available(*, deprecated, message: "Use the async overload instead")
    open func listIndexes(
        collectionId: String,
        completion: ((Result<AppwriteModels.IndexList, AppwriteError>) -> Void)? = nil
    ) {
        Task {
            do {
                let result = try await listIndexes(
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
    /// @param String collectionId
    /// @param String key
    /// @param String type
    /// @param [Any] attributes
    /// @param [Any] orders
    /// @throws Exception
    /// @return array
    ///
    @available(*, deprecated, message: "Use the async overload instead")
    open func createIndex(
        collectionId: String,
        key: String,
        type: String,
        attributes: [Any],
        orders: [Any]? = nil,
        completion: ((Result<AppwriteModels.Index, AppwriteError>) -> Void)? = nil
    ) {
        Task {
            do {
                let result = try await createIndex(
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
    /// @param String collectionId
    /// @param String key
    /// @throws Exception
    /// @return array
    ///
    @available(*, deprecated, message: "Use the async overload instead")
    open func getIndex(
        collectionId: String,
        key: String,
        completion: ((Result<AppwriteModels.Index, AppwriteError>) -> Void)? = nil
    ) {
        Task {
            do {
                let result = try await getIndex(
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
    /// @param String collectionId
    /// @param String key
    /// @throws Exception
    /// @return array
    ///
    @available(*, deprecated, message: "Use the async overload instead")
    open func deleteIndex(
        collectionId: String,
        key: String,
        completion: ((Result<Any, AppwriteError>) -> Void)? = nil
    ) {
        Task {
            do {
                let result = try await deleteIndex(
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
