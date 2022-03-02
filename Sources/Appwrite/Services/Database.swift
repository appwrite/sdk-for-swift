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
        orderType: String? = nil,
        completion: ((Result<AppwriteModels.CollectionList, AppwriteError>) -> Void)? = nil
    ) {
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

        let convert: ([String: Any]) -> AppwriteModels.CollectionList = { dict in
            return AppwriteModels.CollectionList.from(map: dict)
        }

        client.call(
            method: "GET",
            path: path,
            headers: headers,
            params: params,
            convert: convert,
            completion: completion
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
        write: [Any],
        completion: ((Result<AppwriteModels.Collection, AppwriteError>) -> Void)? = nil
    ) {
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

        let convert: ([String: Any]) -> AppwriteModels.Collection = { dict in
            return AppwriteModels.Collection.from(map: dict)
        }

        client.call(
            method: "POST",
            path: path,
            headers: headers,
            params: params,
            convert: convert,
            completion: completion
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
        collectionId: String,
        completion: ((Result<AppwriteModels.Collection, AppwriteError>) -> Void)? = nil
    ) {
        var path: String = "/database/collections/{collectionId}"

        path = path.replacingOccurrences(
          of: "{collectionId}",
          with: collectionId        
        )

        let params: [String: Any?] = [:]

        let headers: [String: String] = [
            "content-type": "application/json"
        ]

        let convert: ([String: Any]) -> AppwriteModels.Collection = { dict in
            return AppwriteModels.Collection.from(map: dict)
        }

        client.call(
            method: "GET",
            path: path,
            headers: headers,
            params: params,
            convert: convert,
            completion: completion
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
        enabled: Bool? = nil,
        completion: ((Result<AppwriteModels.Collection, AppwriteError>) -> Void)? = nil
    ) {
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

        let convert: ([String: Any]) -> AppwriteModels.Collection = { dict in
            return AppwriteModels.Collection.from(map: dict)
        }

        client.call(
            method: "PUT",
            path: path,
            headers: headers,
            params: params,
            convert: convert,
            completion: completion
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
        collectionId: String,
        completion: ((Result<Any, AppwriteError>) -> Void)? = nil
    ) {
        var path: String = "/database/collections/{collectionId}"

        path = path.replacingOccurrences(
          of: "{collectionId}",
          with: collectionId        
        )

        let params: [String: Any?] = [:]

        let headers: [String: String] = [
            "content-type": "application/json"
        ]

        client.call(
            method: "DELETE",
            path: path,
            headers: headers,
            params: params,
            completion: completion
        )
    }

    ///
    /// List Attributes
    ///
    /// @param String collectionId
    /// @throws Exception
    /// @return array
    ///
    open func listAttributes(
        collectionId: String,
        completion: ((Result<AppwriteModels.AttributeList, AppwriteError>) -> Void)? = nil
    ) {
        var path: String = "/database/collections/{collectionId}/attributes"

        path = path.replacingOccurrences(
          of: "{collectionId}",
          with: collectionId        
        )

        let params: [String: Any?] = [:]

        let headers: [String: String] = [
            "content-type": "application/json"
        ]

        let convert: ([String: Any]) -> AppwriteModels.AttributeList = { dict in
            return AppwriteModels.AttributeList.from(map: dict)
        }

        client.call(
            method: "GET",
            path: path,
            headers: headers,
            params: params,
            convert: convert,
            completion: completion
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
        array: Bool? = nil,
        completion: ((Result<AppwriteModels.AttributeBoolean, AppwriteError>) -> Void)? = nil
    ) {
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

        let convert: ([String: Any]) -> AppwriteModels.AttributeBoolean = { dict in
            return AppwriteModels.AttributeBoolean.from(map: dict)
        }

        client.call(
            method: "POST",
            path: path,
            headers: headers,
            params: params,
            convert: convert,
            completion: completion
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
        array: Bool? = nil,
        completion: ((Result<AppwriteModels.AttributeEmail, AppwriteError>) -> Void)? = nil
    ) {
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

        let convert: ([String: Any]) -> AppwriteModels.AttributeEmail = { dict in
            return AppwriteModels.AttributeEmail.from(map: dict)
        }

        client.call(
            method: "POST",
            path: path,
            headers: headers,
            params: params,
            convert: convert,
            completion: completion
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
        array: Bool? = nil,
        completion: ((Result<AppwriteModels.AttributeEnum, AppwriteError>) -> Void)? = nil
    ) {
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

        let convert: ([String: Any]) -> AppwriteModels.AttributeEnum = { dict in
            return AppwriteModels.AttributeEnum.from(map: dict)
        }

        client.call(
            method: "POST",
            path: path,
            headers: headers,
            params: params,
            convert: convert,
            completion: completion
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
        array: Bool? = nil,
        completion: ((Result<AppwriteModels.AttributeFloat, AppwriteError>) -> Void)? = nil
    ) {
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

        let convert: ([String: Any]) -> AppwriteModels.AttributeFloat = { dict in
            return AppwriteModels.AttributeFloat.from(map: dict)
        }

        client.call(
            method: "POST",
            path: path,
            headers: headers,
            params: params,
            convert: convert,
            completion: completion
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
        array: Bool? = nil,
        completion: ((Result<AppwriteModels.AttributeInteger, AppwriteError>) -> Void)? = nil
    ) {
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

        let convert: ([String: Any]) -> AppwriteModels.AttributeInteger = { dict in
            return AppwriteModels.AttributeInteger.from(map: dict)
        }

        client.call(
            method: "POST",
            path: path,
            headers: headers,
            params: params,
            convert: convert,
            completion: completion
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
        array: Bool? = nil,
        completion: ((Result<AppwriteModels.AttributeIp, AppwriteError>) -> Void)? = nil
    ) {
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

        let convert: ([String: Any]) -> AppwriteModels.AttributeIp = { dict in
            return AppwriteModels.AttributeIp.from(map: dict)
        }

        client.call(
            method: "POST",
            path: path,
            headers: headers,
            params: params,
            convert: convert,
            completion: completion
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
        array: Bool? = nil,
        completion: ((Result<AppwriteModels.AttributeString, AppwriteError>) -> Void)? = nil
    ) {
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

        let convert: ([String: Any]) -> AppwriteModels.AttributeString = { dict in
            return AppwriteModels.AttributeString.from(map: dict)
        }

        client.call(
            method: "POST",
            path: path,
            headers: headers,
            params: params,
            convert: convert,
            completion: completion
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
        array: Bool? = nil,
        completion: ((Result<AppwriteModels.AttributeUrl, AppwriteError>) -> Void)? = nil
    ) {
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

        let convert: ([String: Any]) -> AppwriteModels.AttributeUrl = { dict in
            return AppwriteModels.AttributeUrl.from(map: dict)
        }

        client.call(
            method: "POST",
            path: path,
            headers: headers,
            params: params,
            convert: convert,
            completion: completion
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
        key: String,
        completion: ((Result<Any, AppwriteError>) -> Void)? = nil
    ) {
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

        client.call(
            method: "GET",
            path: path,
            headers: headers,
            params: params,
            completion: completion
        )
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
        key: String,
        completion: ((Result<Any, AppwriteError>) -> Void)? = nil
    ) {
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

        client.call(
            method: "DELETE",
            path: path,
            headers: headers,
            params: params,
            completion: completion
        )
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
        orderTypes: [Any]? = nil,
        completion: ((Result<AppwriteModels.DocumentList, AppwriteError>) -> Void)? = nil
    ) {
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

        let convert: ([String: Any]) -> AppwriteModels.DocumentList = { dict in
            return AppwriteModels.DocumentList.from(map: dict)
        }

        client.call(
            method: "GET",
            path: path,
            headers: headers,
            params: params,
            convert: convert,
            completion: completion
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
        write: [Any]? = nil,
        completion: ((Result<AppwriteModels.Document, AppwriteError>) -> Void)? = nil
    ) {
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

        let convert: ([String: Any]) -> AppwriteModels.Document = { dict in
            return AppwriteModels.Document.from(map: dict)
        }

        client.call(
            method: "POST",
            path: path,
            headers: headers,
            params: params,
            convert: convert,
            completion: completion
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
        documentId: String,
        completion: ((Result<AppwriteModels.Document, AppwriteError>) -> Void)? = nil
    ) {
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

        let convert: ([String: Any]) -> AppwriteModels.Document = { dict in
            return AppwriteModels.Document.from(map: dict)
        }

        client.call(
            method: "GET",
            path: path,
            headers: headers,
            params: params,
            convert: convert,
            completion: completion
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
        write: [Any]? = nil,
        completion: ((Result<AppwriteModels.Document, AppwriteError>) -> Void)? = nil
    ) {
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

        let convert: ([String: Any]) -> AppwriteModels.Document = { dict in
            return AppwriteModels.Document.from(map: dict)
        }

        client.call(
            method: "PATCH",
            path: path,
            headers: headers,
            params: params,
            convert: convert,
            completion: completion
        )
    }

    ///
    /// Delete Document
    ///
    /// Delete a document by its unique ID. This endpoint deletes only the parent
    /// documents, its attributes and relations to other documents. Child documents
    /// **will not** be deleted.
    ///
    /// @param String collectionId
    /// @param String documentId
    /// @throws Exception
    /// @return array
    ///
    open func deleteDocument(
        collectionId: String,
        documentId: String,
        completion: ((Result<Any, AppwriteError>) -> Void)? = nil
    ) {
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

        client.call(
            method: "DELETE",
            path: path,
            headers: headers,
            params: params,
            completion: completion
        )
    }

    ///
    /// List Indexes
    ///
    /// @param String collectionId
    /// @throws Exception
    /// @return array
    ///
    open func listIndexes(
        collectionId: String,
        completion: ((Result<AppwriteModels.IndexList, AppwriteError>) -> Void)? = nil
    ) {
        var path: String = "/database/collections/{collectionId}/indexes"

        path = path.replacingOccurrences(
          of: "{collectionId}",
          with: collectionId        
        )

        let params: [String: Any?] = [:]

        let headers: [String: String] = [
            "content-type": "application/json"
        ]

        let convert: ([String: Any]) -> AppwriteModels.IndexList = { dict in
            return AppwriteModels.IndexList.from(map: dict)
        }

        client.call(
            method: "GET",
            path: path,
            headers: headers,
            params: params,
            convert: convert,
            completion: completion
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
        orders: [Any]? = nil,
        completion: ((Result<AppwriteModels.Index, AppwriteError>) -> Void)? = nil
    ) {
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

        let convert: ([String: Any]) -> AppwriteModels.Index = { dict in
            return AppwriteModels.Index.from(map: dict)
        }

        client.call(
            method: "POST",
            path: path,
            headers: headers,
            params: params,
            convert: convert,
            completion: completion
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
        key: String,
        completion: ((Result<AppwriteModels.Index, AppwriteError>) -> Void)? = nil
    ) {
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

        let convert: ([String: Any]) -> AppwriteModels.Index = { dict in
            return AppwriteModels.Index.from(map: dict)
        }

        client.call(
            method: "GET",
            path: path,
            headers: headers,
            params: params,
            convert: convert,
            completion: completion
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
        key: String,
        completion: ((Result<Any, AppwriteError>) -> Void)? = nil
    ) {
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

        client.call(
            method: "DELETE",
            path: path,
            headers: headers,
            params: params,
            completion: completion
        )
    }

}
