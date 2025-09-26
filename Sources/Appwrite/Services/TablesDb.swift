import AsyncHTTPClient
import Foundation
import NIO
import JSONCodable
import AppwriteEnums
import AppwriteModels

/// 
open class TablesDB: Service {

    ///
    /// Get a list of all databases from the current Appwrite project. You can use
    /// the search parameter to filter your results.
    ///
    /// - Parameters:
    ///   - queries: [String] (optional)
    ///   - search: String (optional)
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.DatabaseList
    ///
    open func list(
        queries: [String]? = nil,
        search: String? = nil
    ) async throws -> AppwriteModels.DatabaseList {
        let apiPath: String = "/tablesdb"

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
        let apiPath: String = "/tablesdb"

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
    /// - Parameters:
    ///   - databaseId: String
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.Database
    ///
    open func get(
        databaseId: String
    ) async throws -> AppwriteModels.Database {
        let apiPath: String = "/tablesdb/{databaseId}"
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
    open func update(
        databaseId: String,
        name: String,
        enabled: Bool? = nil
    ) async throws -> AppwriteModels.Database {
        let apiPath: String = "/tablesdb/{databaseId}"
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
    open func delete(
        databaseId: String
    ) async throws -> Any {
        let apiPath: String = "/tablesdb/{databaseId}"
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
    /// Get a list of all tables that belong to the provided databaseId. You can
    /// use the search parameter to filter your results.
    ///
    /// - Parameters:
    ///   - databaseId: String
    ///   - queries: [String] (optional)
    ///   - search: String (optional)
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.TableList
    ///
    open func listTables(
        databaseId: String,
        queries: [String]? = nil,
        search: String? = nil
    ) async throws -> AppwriteModels.TableList {
        let apiPath: String = "/tablesdb/{databaseId}/tables"
            .replacingOccurrences(of: "{databaseId}", with: databaseId)

        let apiParams: [String: Any?] = [
            "queries": queries,
            "search": search
        ]

        let apiHeaders: [String: String] = [:]

        let converter: (Any) -> AppwriteModels.TableList = { response in
            return AppwriteModels.TableList.from(map: response as! [String: Any])
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
    /// Create a new Table. Before using this route, you should create a new
    /// database resource using either a [server
    /// integration](https://appwrite.io/docs/server/tablesdb#tablesDBCreateTable)
    /// API or directly from your database console.
    ///
    /// - Parameters:
    ///   - databaseId: String
    ///   - tableId: String
    ///   - name: String
    ///   - permissions: [String] (optional)
    ///   - rowSecurity: Bool (optional)
    ///   - enabled: Bool (optional)
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.Table
    ///
    open func createTable(
        databaseId: String,
        tableId: String,
        name: String,
        permissions: [String]? = nil,
        rowSecurity: Bool? = nil,
        enabled: Bool? = nil
    ) async throws -> AppwriteModels.Table {
        let apiPath: String = "/tablesdb/{databaseId}/tables"
            .replacingOccurrences(of: "{databaseId}", with: databaseId)

        let apiParams: [String: Any?] = [
            "tableId": tableId,
            "name": name,
            "permissions": permissions,
            "rowSecurity": rowSecurity,
            "enabled": enabled
        ]

        let apiHeaders: [String: String] = [
            "content-type": "application/json"
        ]

        let converter: (Any) -> AppwriteModels.Table = { response in
            return AppwriteModels.Table.from(map: response as! [String: Any])
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
    /// Get a table by its unique ID. This endpoint response returns a JSON object
    /// with the table metadata.
    ///
    /// - Parameters:
    ///   - databaseId: String
    ///   - tableId: String
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.Table
    ///
    open func getTable(
        databaseId: String,
        tableId: String
    ) async throws -> AppwriteModels.Table {
        let apiPath: String = "/tablesdb/{databaseId}/tables/{tableId}"
            .replacingOccurrences(of: "{databaseId}", with: databaseId)
            .replacingOccurrences(of: "{tableId}", with: tableId)

        let apiParams: [String: Any] = [:]

        let apiHeaders: [String: String] = [:]

        let converter: (Any) -> AppwriteModels.Table = { response in
            return AppwriteModels.Table.from(map: response as! [String: Any])
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
    /// Update a table by its unique ID.
    ///
    /// - Parameters:
    ///   - databaseId: String
    ///   - tableId: String
    ///   - name: String
    ///   - permissions: [String] (optional)
    ///   - rowSecurity: Bool (optional)
    ///   - enabled: Bool (optional)
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.Table
    ///
    open func updateTable(
        databaseId: String,
        tableId: String,
        name: String,
        permissions: [String]? = nil,
        rowSecurity: Bool? = nil,
        enabled: Bool? = nil
    ) async throws -> AppwriteModels.Table {
        let apiPath: String = "/tablesdb/{databaseId}/tables/{tableId}"
            .replacingOccurrences(of: "{databaseId}", with: databaseId)
            .replacingOccurrences(of: "{tableId}", with: tableId)

        let apiParams: [String: Any?] = [
            "name": name,
            "permissions": permissions,
            "rowSecurity": rowSecurity,
            "enabled": enabled
        ]

        let apiHeaders: [String: String] = [
            "content-type": "application/json"
        ]

        let converter: (Any) -> AppwriteModels.Table = { response in
            return AppwriteModels.Table.from(map: response as! [String: Any])
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
    /// Delete a table by its unique ID. Only users with write permissions have
    /// access to delete this resource.
    ///
    /// - Parameters:
    ///   - databaseId: String
    ///   - tableId: String
    /// - Throws: Exception if the request fails
    /// - Returns: Any
    ///
    open func deleteTable(
        databaseId: String,
        tableId: String
    ) async throws -> Any {
        let apiPath: String = "/tablesdb/{databaseId}/tables/{tableId}"
            .replacingOccurrences(of: "{databaseId}", with: databaseId)
            .replacingOccurrences(of: "{tableId}", with: tableId)

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
    /// List columns in the table.
    ///
    /// - Parameters:
    ///   - databaseId: String
    ///   - tableId: String
    ///   - queries: [String] (optional)
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.ColumnList
    ///
    open func listColumns(
        databaseId: String,
        tableId: String,
        queries: [String]? = nil
    ) async throws -> AppwriteModels.ColumnList {
        let apiPath: String = "/tablesdb/{databaseId}/tables/{tableId}/columns"
            .replacingOccurrences(of: "{databaseId}", with: databaseId)
            .replacingOccurrences(of: "{tableId}", with: tableId)

        let apiParams: [String: Any?] = [
            "queries": queries
        ]

        let apiHeaders: [String: String] = [:]

        let converter: (Any) -> AppwriteModels.ColumnList = { response in
            return AppwriteModels.ColumnList.from(map: response as! [String: Any])
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
    /// Create a boolean column.
    /// 
    ///
    /// - Parameters:
    ///   - databaseId: String
    ///   - tableId: String
    ///   - key: String
    ///   - required: Bool
    ///   - default: Bool (optional)
    ///   - array: Bool (optional)
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.ColumnBoolean
    ///
    open func createBooleanColumn(
        databaseId: String,
        tableId: String,
        key: String,
        `required`: Bool,
        `default`: Bool? = nil,
        array: Bool? = nil
    ) async throws -> AppwriteModels.ColumnBoolean {
        let apiPath: String = "/tablesdb/{databaseId}/tables/{tableId}/columns/boolean"
            .replacingOccurrences(of: "{databaseId}", with: databaseId)
            .replacingOccurrences(of: "{tableId}", with: tableId)

        let apiParams: [String: Any?] = [
            "key": key,
            "required": `required`,
            "default": `default`,
            "array": array
        ]

        let apiHeaders: [String: String] = [
            "content-type": "application/json"
        ]

        let converter: (Any) -> AppwriteModels.ColumnBoolean = { response in
            return AppwriteModels.ColumnBoolean.from(map: response as! [String: Any])
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
    /// Update a boolean column. Changing the `default` value will not update
    /// already existing rows.
    ///
    /// - Parameters:
    ///   - databaseId: String
    ///   - tableId: String
    ///   - key: String
    ///   - required: Bool
    ///   - default: Bool (optional)
    ///   - newKey: String (optional)
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.ColumnBoolean
    ///
    open func updateBooleanColumn(
        databaseId: String,
        tableId: String,
        key: String,
        `required`: Bool,
        `default`: Bool? = nil,
        newKey: String? = nil
    ) async throws -> AppwriteModels.ColumnBoolean {
        let apiPath: String = "/tablesdb/{databaseId}/tables/{tableId}/columns/boolean/{key}"
            .replacingOccurrences(of: "{databaseId}", with: databaseId)
            .replacingOccurrences(of: "{tableId}", with: tableId)
            .replacingOccurrences(of: "{key}", with: key)

        let apiParams: [String: Any?] = [
            "required": `required`,
            "default": `default`,
            "newKey": newKey
        ]

        let apiHeaders: [String: String] = [
            "content-type": "application/json"
        ]

        let converter: (Any) -> AppwriteModels.ColumnBoolean = { response in
            return AppwriteModels.ColumnBoolean.from(map: response as! [String: Any])
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
    /// Create a date time column according to the ISO 8601 standard.
    ///
    /// - Parameters:
    ///   - databaseId: String
    ///   - tableId: String
    ///   - key: String
    ///   - required: Bool
    ///   - default: String (optional)
    ///   - array: Bool (optional)
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.ColumnDatetime
    ///
    open func createDatetimeColumn(
        databaseId: String,
        tableId: String,
        key: String,
        `required`: Bool,
        `default`: String? = nil,
        array: Bool? = nil
    ) async throws -> AppwriteModels.ColumnDatetime {
        let apiPath: String = "/tablesdb/{databaseId}/tables/{tableId}/columns/datetime"
            .replacingOccurrences(of: "{databaseId}", with: databaseId)
            .replacingOccurrences(of: "{tableId}", with: tableId)

        let apiParams: [String: Any?] = [
            "key": key,
            "required": `required`,
            "default": `default`,
            "array": array
        ]

        let apiHeaders: [String: String] = [
            "content-type": "application/json"
        ]

        let converter: (Any) -> AppwriteModels.ColumnDatetime = { response in
            return AppwriteModels.ColumnDatetime.from(map: response as! [String: Any])
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
    /// Update a date time column. Changing the `default` value will not update
    /// already existing rows.
    ///
    /// - Parameters:
    ///   - databaseId: String
    ///   - tableId: String
    ///   - key: String
    ///   - required: Bool
    ///   - default: String (optional)
    ///   - newKey: String (optional)
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.ColumnDatetime
    ///
    open func updateDatetimeColumn(
        databaseId: String,
        tableId: String,
        key: String,
        `required`: Bool,
        `default`: String? = nil,
        newKey: String? = nil
    ) async throws -> AppwriteModels.ColumnDatetime {
        let apiPath: String = "/tablesdb/{databaseId}/tables/{tableId}/columns/datetime/{key}"
            .replacingOccurrences(of: "{databaseId}", with: databaseId)
            .replacingOccurrences(of: "{tableId}", with: tableId)
            .replacingOccurrences(of: "{key}", with: key)

        let apiParams: [String: Any?] = [
            "required": `required`,
            "default": `default`,
            "newKey": newKey
        ]

        let apiHeaders: [String: String] = [
            "content-type": "application/json"
        ]

        let converter: (Any) -> AppwriteModels.ColumnDatetime = { response in
            return AppwriteModels.ColumnDatetime.from(map: response as! [String: Any])
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
    /// Create an email column.
    /// 
    ///
    /// - Parameters:
    ///   - databaseId: String
    ///   - tableId: String
    ///   - key: String
    ///   - required: Bool
    ///   - default: String (optional)
    ///   - array: Bool (optional)
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.ColumnEmail
    ///
    open func createEmailColumn(
        databaseId: String,
        tableId: String,
        key: String,
        `required`: Bool,
        `default`: String? = nil,
        array: Bool? = nil
    ) async throws -> AppwriteModels.ColumnEmail {
        let apiPath: String = "/tablesdb/{databaseId}/tables/{tableId}/columns/email"
            .replacingOccurrences(of: "{databaseId}", with: databaseId)
            .replacingOccurrences(of: "{tableId}", with: tableId)

        let apiParams: [String: Any?] = [
            "key": key,
            "required": `required`,
            "default": `default`,
            "array": array
        ]

        let apiHeaders: [String: String] = [
            "content-type": "application/json"
        ]

        let converter: (Any) -> AppwriteModels.ColumnEmail = { response in
            return AppwriteModels.ColumnEmail.from(map: response as! [String: Any])
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
    /// Update an email column. Changing the `default` value will not update
    /// already existing rows.
    /// 
    ///
    /// - Parameters:
    ///   - databaseId: String
    ///   - tableId: String
    ///   - key: String
    ///   - required: Bool
    ///   - default: String (optional)
    ///   - newKey: String (optional)
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.ColumnEmail
    ///
    open func updateEmailColumn(
        databaseId: String,
        tableId: String,
        key: String,
        `required`: Bool,
        `default`: String? = nil,
        newKey: String? = nil
    ) async throws -> AppwriteModels.ColumnEmail {
        let apiPath: String = "/tablesdb/{databaseId}/tables/{tableId}/columns/email/{key}"
            .replacingOccurrences(of: "{databaseId}", with: databaseId)
            .replacingOccurrences(of: "{tableId}", with: tableId)
            .replacingOccurrences(of: "{key}", with: key)

        let apiParams: [String: Any?] = [
            "required": `required`,
            "default": `default`,
            "newKey": newKey
        ]

        let apiHeaders: [String: String] = [
            "content-type": "application/json"
        ]

        let converter: (Any) -> AppwriteModels.ColumnEmail = { response in
            return AppwriteModels.ColumnEmail.from(map: response as! [String: Any])
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
    /// Create an enumeration column. The `elements` param acts as a white-list of
    /// accepted values for this column.
    ///
    /// - Parameters:
    ///   - databaseId: String
    ///   - tableId: String
    ///   - key: String
    ///   - elements: [String]
    ///   - required: Bool
    ///   - default: String (optional)
    ///   - array: Bool (optional)
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.ColumnEnum
    ///
    open func createEnumColumn(
        databaseId: String,
        tableId: String,
        key: String,
        elements: [String],
        `required`: Bool,
        `default`: String? = nil,
        array: Bool? = nil
    ) async throws -> AppwriteModels.ColumnEnum {
        let apiPath: String = "/tablesdb/{databaseId}/tables/{tableId}/columns/enum"
            .replacingOccurrences(of: "{databaseId}", with: databaseId)
            .replacingOccurrences(of: "{tableId}", with: tableId)

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

        let converter: (Any) -> AppwriteModels.ColumnEnum = { response in
            return AppwriteModels.ColumnEnum.from(map: response as! [String: Any])
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
    /// Update an enum column. Changing the `default` value will not update already
    /// existing rows.
    /// 
    ///
    /// - Parameters:
    ///   - databaseId: String
    ///   - tableId: String
    ///   - key: String
    ///   - elements: [String]
    ///   - required: Bool
    ///   - default: String (optional)
    ///   - newKey: String (optional)
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.ColumnEnum
    ///
    open func updateEnumColumn(
        databaseId: String,
        tableId: String,
        key: String,
        elements: [String],
        `required`: Bool,
        `default`: String? = nil,
        newKey: String? = nil
    ) async throws -> AppwriteModels.ColumnEnum {
        let apiPath: String = "/tablesdb/{databaseId}/tables/{tableId}/columns/enum/{key}"
            .replacingOccurrences(of: "{databaseId}", with: databaseId)
            .replacingOccurrences(of: "{tableId}", with: tableId)
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

        let converter: (Any) -> AppwriteModels.ColumnEnum = { response in
            return AppwriteModels.ColumnEnum.from(map: response as! [String: Any])
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
    /// Create a float column. Optionally, minimum and maximum values can be
    /// provided.
    /// 
    ///
    /// - Parameters:
    ///   - databaseId: String
    ///   - tableId: String
    ///   - key: String
    ///   - required: Bool
    ///   - min: Double (optional)
    ///   - max: Double (optional)
    ///   - default: Double (optional)
    ///   - array: Bool (optional)
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.ColumnFloat
    ///
    open func createFloatColumn(
        databaseId: String,
        tableId: String,
        key: String,
        `required`: Bool,
        min: Double? = nil,
        max: Double? = nil,
        `default`: Double? = nil,
        array: Bool? = nil
    ) async throws -> AppwriteModels.ColumnFloat {
        let apiPath: String = "/tablesdb/{databaseId}/tables/{tableId}/columns/float"
            .replacingOccurrences(of: "{databaseId}", with: databaseId)
            .replacingOccurrences(of: "{tableId}", with: tableId)

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

        let converter: (Any) -> AppwriteModels.ColumnFloat = { response in
            return AppwriteModels.ColumnFloat.from(map: response as! [String: Any])
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
    /// Update a float column. Changing the `default` value will not update already
    /// existing rows.
    /// 
    ///
    /// - Parameters:
    ///   - databaseId: String
    ///   - tableId: String
    ///   - key: String
    ///   - required: Bool
    ///   - default: Double (optional)
    ///   - min: Double (optional)
    ///   - max: Double (optional)
    ///   - newKey: String (optional)
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.ColumnFloat
    ///
    open func updateFloatColumn(
        databaseId: String,
        tableId: String,
        key: String,
        `required`: Bool,
        `default`: Double? = nil,
        min: Double? = nil,
        max: Double? = nil,
        newKey: String? = nil
    ) async throws -> AppwriteModels.ColumnFloat {
        let apiPath: String = "/tablesdb/{databaseId}/tables/{tableId}/columns/float/{key}"
            .replacingOccurrences(of: "{databaseId}", with: databaseId)
            .replacingOccurrences(of: "{tableId}", with: tableId)
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

        let converter: (Any) -> AppwriteModels.ColumnFloat = { response in
            return AppwriteModels.ColumnFloat.from(map: response as! [String: Any])
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
    /// Create an integer column. Optionally, minimum and maximum values can be
    /// provided.
    /// 
    ///
    /// - Parameters:
    ///   - databaseId: String
    ///   - tableId: String
    ///   - key: String
    ///   - required: Bool
    ///   - min: Int (optional)
    ///   - max: Int (optional)
    ///   - default: Int (optional)
    ///   - array: Bool (optional)
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.ColumnInteger
    ///
    open func createIntegerColumn(
        databaseId: String,
        tableId: String,
        key: String,
        `required`: Bool,
        min: Int? = nil,
        max: Int? = nil,
        `default`: Int? = nil,
        array: Bool? = nil
    ) async throws -> AppwriteModels.ColumnInteger {
        let apiPath: String = "/tablesdb/{databaseId}/tables/{tableId}/columns/integer"
            .replacingOccurrences(of: "{databaseId}", with: databaseId)
            .replacingOccurrences(of: "{tableId}", with: tableId)

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

        let converter: (Any) -> AppwriteModels.ColumnInteger = { response in
            return AppwriteModels.ColumnInteger.from(map: response as! [String: Any])
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
    /// Update an integer column. Changing the `default` value will not update
    /// already existing rows.
    /// 
    ///
    /// - Parameters:
    ///   - databaseId: String
    ///   - tableId: String
    ///   - key: String
    ///   - required: Bool
    ///   - default: Int (optional)
    ///   - min: Int (optional)
    ///   - max: Int (optional)
    ///   - newKey: String (optional)
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.ColumnInteger
    ///
    open func updateIntegerColumn(
        databaseId: String,
        tableId: String,
        key: String,
        `required`: Bool,
        `default`: Int? = nil,
        min: Int? = nil,
        max: Int? = nil,
        newKey: String? = nil
    ) async throws -> AppwriteModels.ColumnInteger {
        let apiPath: String = "/tablesdb/{databaseId}/tables/{tableId}/columns/integer/{key}"
            .replacingOccurrences(of: "{databaseId}", with: databaseId)
            .replacingOccurrences(of: "{tableId}", with: tableId)
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

        let converter: (Any) -> AppwriteModels.ColumnInteger = { response in
            return AppwriteModels.ColumnInteger.from(map: response as! [String: Any])
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
    /// Create IP address column.
    /// 
    ///
    /// - Parameters:
    ///   - databaseId: String
    ///   - tableId: String
    ///   - key: String
    ///   - required: Bool
    ///   - default: String (optional)
    ///   - array: Bool (optional)
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.ColumnIp
    ///
    open func createIpColumn(
        databaseId: String,
        tableId: String,
        key: String,
        `required`: Bool,
        `default`: String? = nil,
        array: Bool? = nil
    ) async throws -> AppwriteModels.ColumnIp {
        let apiPath: String = "/tablesdb/{databaseId}/tables/{tableId}/columns/ip"
            .replacingOccurrences(of: "{databaseId}", with: databaseId)
            .replacingOccurrences(of: "{tableId}", with: tableId)

        let apiParams: [String: Any?] = [
            "key": key,
            "required": `required`,
            "default": `default`,
            "array": array
        ]

        let apiHeaders: [String: String] = [
            "content-type": "application/json"
        ]

        let converter: (Any) -> AppwriteModels.ColumnIp = { response in
            return AppwriteModels.ColumnIp.from(map: response as! [String: Any])
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
    /// Update an ip column. Changing the `default` value will not update already
    /// existing rows.
    /// 
    ///
    /// - Parameters:
    ///   - databaseId: String
    ///   - tableId: String
    ///   - key: String
    ///   - required: Bool
    ///   - default: String (optional)
    ///   - newKey: String (optional)
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.ColumnIp
    ///
    open func updateIpColumn(
        databaseId: String,
        tableId: String,
        key: String,
        `required`: Bool,
        `default`: String? = nil,
        newKey: String? = nil
    ) async throws -> AppwriteModels.ColumnIp {
        let apiPath: String = "/tablesdb/{databaseId}/tables/{tableId}/columns/ip/{key}"
            .replacingOccurrences(of: "{databaseId}", with: databaseId)
            .replacingOccurrences(of: "{tableId}", with: tableId)
            .replacingOccurrences(of: "{key}", with: key)

        let apiParams: [String: Any?] = [
            "required": `required`,
            "default": `default`,
            "newKey": newKey
        ]

        let apiHeaders: [String: String] = [
            "content-type": "application/json"
        ]

        let converter: (Any) -> AppwriteModels.ColumnIp = { response in
            return AppwriteModels.ColumnIp.from(map: response as! [String: Any])
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
    /// Create a geometric line column.
    ///
    /// - Parameters:
    ///   - databaseId: String
    ///   - tableId: String
    ///   - key: String
    ///   - required: Bool
    ///   - default: [AnyCodable] (optional)
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.ColumnLine
    ///
    open func createLineColumn(
        databaseId: String,
        tableId: String,
        key: String,
        `required`: Bool,
        `default`: [AnyCodable]? = nil
    ) async throws -> AppwriteModels.ColumnLine {
        let apiPath: String = "/tablesdb/{databaseId}/tables/{tableId}/columns/line"
            .replacingOccurrences(of: "{databaseId}", with: databaseId)
            .replacingOccurrences(of: "{tableId}", with: tableId)

        let apiParams: [String: Any?] = [
            "key": key,
            "required": `required`,
            "default": `default`
        ]

        let apiHeaders: [String: String] = [
            "content-type": "application/json"
        ]

        let converter: (Any) -> AppwriteModels.ColumnLine = { response in
            return AppwriteModels.ColumnLine.from(map: response as! [String: Any])
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
    /// Update a line column. Changing the `default` value will not update already
    /// existing rows.
    ///
    /// - Parameters:
    ///   - databaseId: String
    ///   - tableId: String
    ///   - key: String
    ///   - required: Bool
    ///   - default: [AnyCodable] (optional)
    ///   - newKey: String (optional)
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.ColumnLine
    ///
    open func updateLineColumn(
        databaseId: String,
        tableId: String,
        key: String,
        `required`: Bool,
        `default`: [AnyCodable]? = nil,
        newKey: String? = nil
    ) async throws -> AppwriteModels.ColumnLine {
        let apiPath: String = "/tablesdb/{databaseId}/tables/{tableId}/columns/line/{key}"
            .replacingOccurrences(of: "{databaseId}", with: databaseId)
            .replacingOccurrences(of: "{tableId}", with: tableId)
            .replacingOccurrences(of: "{key}", with: key)

        let apiParams: [String: Any?] = [
            "required": `required`,
            "default": `default`,
            "newKey": newKey
        ]

        let apiHeaders: [String: String] = [
            "content-type": "application/json"
        ]

        let converter: (Any) -> AppwriteModels.ColumnLine = { response in
            return AppwriteModels.ColumnLine.from(map: response as! [String: Any])
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
    /// Create a geometric point column.
    ///
    /// - Parameters:
    ///   - databaseId: String
    ///   - tableId: String
    ///   - key: String
    ///   - required: Bool
    ///   - default: [AnyCodable] (optional)
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.ColumnPoint
    ///
    open func createPointColumn(
        databaseId: String,
        tableId: String,
        key: String,
        `required`: Bool,
        `default`: [AnyCodable]? = nil
    ) async throws -> AppwriteModels.ColumnPoint {
        let apiPath: String = "/tablesdb/{databaseId}/tables/{tableId}/columns/point"
            .replacingOccurrences(of: "{databaseId}", with: databaseId)
            .replacingOccurrences(of: "{tableId}", with: tableId)

        let apiParams: [String: Any?] = [
            "key": key,
            "required": `required`,
            "default": `default`
        ]

        let apiHeaders: [String: String] = [
            "content-type": "application/json"
        ]

        let converter: (Any) -> AppwriteModels.ColumnPoint = { response in
            return AppwriteModels.ColumnPoint.from(map: response as! [String: Any])
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
    /// Update a point column. Changing the `default` value will not update already
    /// existing rows.
    ///
    /// - Parameters:
    ///   - databaseId: String
    ///   - tableId: String
    ///   - key: String
    ///   - required: Bool
    ///   - default: [AnyCodable] (optional)
    ///   - newKey: String (optional)
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.ColumnPoint
    ///
    open func updatePointColumn(
        databaseId: String,
        tableId: String,
        key: String,
        `required`: Bool,
        `default`: [AnyCodable]? = nil,
        newKey: String? = nil
    ) async throws -> AppwriteModels.ColumnPoint {
        let apiPath: String = "/tablesdb/{databaseId}/tables/{tableId}/columns/point/{key}"
            .replacingOccurrences(of: "{databaseId}", with: databaseId)
            .replacingOccurrences(of: "{tableId}", with: tableId)
            .replacingOccurrences(of: "{key}", with: key)

        let apiParams: [String: Any?] = [
            "required": `required`,
            "default": `default`,
            "newKey": newKey
        ]

        let apiHeaders: [String: String] = [
            "content-type": "application/json"
        ]

        let converter: (Any) -> AppwriteModels.ColumnPoint = { response in
            return AppwriteModels.ColumnPoint.from(map: response as! [String: Any])
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
    /// Create a geometric polygon column.
    ///
    /// - Parameters:
    ///   - databaseId: String
    ///   - tableId: String
    ///   - key: String
    ///   - required: Bool
    ///   - default: [AnyCodable] (optional)
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.ColumnPolygon
    ///
    open func createPolygonColumn(
        databaseId: String,
        tableId: String,
        key: String,
        `required`: Bool,
        `default`: [AnyCodable]? = nil
    ) async throws -> AppwriteModels.ColumnPolygon {
        let apiPath: String = "/tablesdb/{databaseId}/tables/{tableId}/columns/polygon"
            .replacingOccurrences(of: "{databaseId}", with: databaseId)
            .replacingOccurrences(of: "{tableId}", with: tableId)

        let apiParams: [String: Any?] = [
            "key": key,
            "required": `required`,
            "default": `default`
        ]

        let apiHeaders: [String: String] = [
            "content-type": "application/json"
        ]

        let converter: (Any) -> AppwriteModels.ColumnPolygon = { response in
            return AppwriteModels.ColumnPolygon.from(map: response as! [String: Any])
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
    /// Update a polygon column. Changing the `default` value will not update
    /// already existing rows.
    ///
    /// - Parameters:
    ///   - databaseId: String
    ///   - tableId: String
    ///   - key: String
    ///   - required: Bool
    ///   - default: [AnyCodable] (optional)
    ///   - newKey: String (optional)
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.ColumnPolygon
    ///
    open func updatePolygonColumn(
        databaseId: String,
        tableId: String,
        key: String,
        `required`: Bool,
        `default`: [AnyCodable]? = nil,
        newKey: String? = nil
    ) async throws -> AppwriteModels.ColumnPolygon {
        let apiPath: String = "/tablesdb/{databaseId}/tables/{tableId}/columns/polygon/{key}"
            .replacingOccurrences(of: "{databaseId}", with: databaseId)
            .replacingOccurrences(of: "{tableId}", with: tableId)
            .replacingOccurrences(of: "{key}", with: key)

        let apiParams: [String: Any?] = [
            "required": `required`,
            "default": `default`,
            "newKey": newKey
        ]

        let apiHeaders: [String: String] = [
            "content-type": "application/json"
        ]

        let converter: (Any) -> AppwriteModels.ColumnPolygon = { response in
            return AppwriteModels.ColumnPolygon.from(map: response as! [String: Any])
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
    /// Create relationship column. [Learn more about relationship
    /// columns](https://appwrite.io/docs/databases-relationships#relationship-columns).
    /// 
    ///
    /// - Parameters:
    ///   - databaseId: String
    ///   - tableId: String
    ///   - relatedTableId: String
    ///   - type: RelationshipType
    ///   - twoWay: Bool (optional)
    ///   - key: String (optional)
    ///   - twoWayKey: String (optional)
    ///   - onDelete: RelationMutate (optional)
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.ColumnRelationship
    ///
    open func createRelationshipColumn(
        databaseId: String,
        tableId: String,
        relatedTableId: String,
        type: RelationshipType,
        twoWay: Bool? = nil,
        key: String? = nil,
        twoWayKey: String? = nil,
        onDelete: RelationMutate? = nil
    ) async throws -> AppwriteModels.ColumnRelationship {
        let apiPath: String = "/tablesdb/{databaseId}/tables/{tableId}/columns/relationship"
            .replacingOccurrences(of: "{databaseId}", with: databaseId)
            .replacingOccurrences(of: "{tableId}", with: tableId)

        let apiParams: [String: Any?] = [
            "relatedTableId": relatedTableId,
            "type": type,
            "twoWay": twoWay,
            "key": key,
            "twoWayKey": twoWayKey,
            "onDelete": onDelete
        ]

        let apiHeaders: [String: String] = [
            "content-type": "application/json"
        ]

        let converter: (Any) -> AppwriteModels.ColumnRelationship = { response in
            return AppwriteModels.ColumnRelationship.from(map: response as! [String: Any])
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
    /// Create a string column.
    /// 
    ///
    /// - Parameters:
    ///   - databaseId: String
    ///   - tableId: String
    ///   - key: String
    ///   - size: Int
    ///   - required: Bool
    ///   - default: String (optional)
    ///   - array: Bool (optional)
    ///   - encrypt: Bool (optional)
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.ColumnString
    ///
    open func createStringColumn(
        databaseId: String,
        tableId: String,
        key: String,
        size: Int,
        `required`: Bool,
        `default`: String? = nil,
        array: Bool? = nil,
        encrypt: Bool? = nil
    ) async throws -> AppwriteModels.ColumnString {
        let apiPath: String = "/tablesdb/{databaseId}/tables/{tableId}/columns/string"
            .replacingOccurrences(of: "{databaseId}", with: databaseId)
            .replacingOccurrences(of: "{tableId}", with: tableId)

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

        let converter: (Any) -> AppwriteModels.ColumnString = { response in
            return AppwriteModels.ColumnString.from(map: response as! [String: Any])
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
    /// Update a string column. Changing the `default` value will not update
    /// already existing rows.
    /// 
    ///
    /// - Parameters:
    ///   - databaseId: String
    ///   - tableId: String
    ///   - key: String
    ///   - required: Bool
    ///   - default: String (optional)
    ///   - size: Int (optional)
    ///   - newKey: String (optional)
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.ColumnString
    ///
    open func updateStringColumn(
        databaseId: String,
        tableId: String,
        key: String,
        `required`: Bool,
        `default`: String? = nil,
        size: Int? = nil,
        newKey: String? = nil
    ) async throws -> AppwriteModels.ColumnString {
        let apiPath: String = "/tablesdb/{databaseId}/tables/{tableId}/columns/string/{key}"
            .replacingOccurrences(of: "{databaseId}", with: databaseId)
            .replacingOccurrences(of: "{tableId}", with: tableId)
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

        let converter: (Any) -> AppwriteModels.ColumnString = { response in
            return AppwriteModels.ColumnString.from(map: response as! [String: Any])
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
    /// Create a URL column.
    /// 
    ///
    /// - Parameters:
    ///   - databaseId: String
    ///   - tableId: String
    ///   - key: String
    ///   - required: Bool
    ///   - default: String (optional)
    ///   - array: Bool (optional)
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.ColumnUrl
    ///
    open func createUrlColumn(
        databaseId: String,
        tableId: String,
        key: String,
        `required`: Bool,
        `default`: String? = nil,
        array: Bool? = nil
    ) async throws -> AppwriteModels.ColumnUrl {
        let apiPath: String = "/tablesdb/{databaseId}/tables/{tableId}/columns/url"
            .replacingOccurrences(of: "{databaseId}", with: databaseId)
            .replacingOccurrences(of: "{tableId}", with: tableId)

        let apiParams: [String: Any?] = [
            "key": key,
            "required": `required`,
            "default": `default`,
            "array": array
        ]

        let apiHeaders: [String: String] = [
            "content-type": "application/json"
        ]

        let converter: (Any) -> AppwriteModels.ColumnUrl = { response in
            return AppwriteModels.ColumnUrl.from(map: response as! [String: Any])
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
    /// Update an url column. Changing the `default` value will not update already
    /// existing rows.
    /// 
    ///
    /// - Parameters:
    ///   - databaseId: String
    ///   - tableId: String
    ///   - key: String
    ///   - required: Bool
    ///   - default: String (optional)
    ///   - newKey: String (optional)
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.ColumnUrl
    ///
    open func updateUrlColumn(
        databaseId: String,
        tableId: String,
        key: String,
        `required`: Bool,
        `default`: String? = nil,
        newKey: String? = nil
    ) async throws -> AppwriteModels.ColumnUrl {
        let apiPath: String = "/tablesdb/{databaseId}/tables/{tableId}/columns/url/{key}"
            .replacingOccurrences(of: "{databaseId}", with: databaseId)
            .replacingOccurrences(of: "{tableId}", with: tableId)
            .replacingOccurrences(of: "{key}", with: key)

        let apiParams: [String: Any?] = [
            "required": `required`,
            "default": `default`,
            "newKey": newKey
        ]

        let apiHeaders: [String: String] = [
            "content-type": "application/json"
        ]

        let converter: (Any) -> AppwriteModels.ColumnUrl = { response in
            return AppwriteModels.ColumnUrl.from(map: response as! [String: Any])
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
    /// Get column by ID.
    ///
    /// - Parameters:
    ///   - databaseId: String
    ///   - tableId: String
    ///   - key: String
    /// - Throws: Exception if the request fails
    /// - Returns: Any
    ///
    open func getColumn(
        databaseId: String,
        tableId: String,
        key: String
    ) async throws -> Any {
        let apiPath: String = "/tablesdb/{databaseId}/tables/{tableId}/columns/{key}"
            .replacingOccurrences(of: "{databaseId}", with: databaseId)
            .replacingOccurrences(of: "{tableId}", with: tableId)
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
    /// Deletes a column.
    ///
    /// - Parameters:
    ///   - databaseId: String
    ///   - tableId: String
    ///   - key: String
    /// - Throws: Exception if the request fails
    /// - Returns: Any
    ///
    open func deleteColumn(
        databaseId: String,
        tableId: String,
        key: String
    ) async throws -> Any {
        let apiPath: String = "/tablesdb/{databaseId}/tables/{tableId}/columns/{key}"
            .replacingOccurrences(of: "{databaseId}", with: databaseId)
            .replacingOccurrences(of: "{tableId}", with: tableId)
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
    /// Update relationship column. [Learn more about relationship
    /// columns](https://appwrite.io/docs/databases-relationships#relationship-columns).
    /// 
    ///
    /// - Parameters:
    ///   - databaseId: String
    ///   - tableId: String
    ///   - key: String
    ///   - onDelete: RelationMutate (optional)
    ///   - newKey: String (optional)
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.ColumnRelationship
    ///
    open func updateRelationshipColumn(
        databaseId: String,
        tableId: String,
        key: String,
        onDelete: RelationMutate? = nil,
        newKey: String? = nil
    ) async throws -> AppwriteModels.ColumnRelationship {
        let apiPath: String = "/tablesdb/{databaseId}/tables/{tableId}/columns/{key}/relationship"
            .replacingOccurrences(of: "{databaseId}", with: databaseId)
            .replacingOccurrences(of: "{tableId}", with: tableId)
            .replacingOccurrences(of: "{key}", with: key)

        let apiParams: [String: Any?] = [
            "onDelete": onDelete,
            "newKey": newKey
        ]

        let apiHeaders: [String: String] = [
            "content-type": "application/json"
        ]

        let converter: (Any) -> AppwriteModels.ColumnRelationship = { response in
            return AppwriteModels.ColumnRelationship.from(map: response as! [String: Any])
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
    /// List indexes on the table.
    ///
    /// - Parameters:
    ///   - databaseId: String
    ///   - tableId: String
    ///   - queries: [String] (optional)
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.ColumnIndexList
    ///
    open func listIndexes(
        databaseId: String,
        tableId: String,
        queries: [String]? = nil
    ) async throws -> AppwriteModels.ColumnIndexList {
        let apiPath: String = "/tablesdb/{databaseId}/tables/{tableId}/indexes"
            .replacingOccurrences(of: "{databaseId}", with: databaseId)
            .replacingOccurrences(of: "{tableId}", with: tableId)

        let apiParams: [String: Any?] = [
            "queries": queries
        ]

        let apiHeaders: [String: String] = [:]

        let converter: (Any) -> AppwriteModels.ColumnIndexList = { response in
            return AppwriteModels.ColumnIndexList.from(map: response as! [String: Any])
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
    /// Creates an index on the columns listed. Your index should include all the
    /// columns you will query in a single request.
    /// Type can be `key`, `fulltext`, or `unique`.
    ///
    /// - Parameters:
    ///   - databaseId: String
    ///   - tableId: String
    ///   - key: String
    ///   - type: IndexType
    ///   - columns: [String]
    ///   - orders: [String] (optional)
    ///   - lengths: [Int] (optional)
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.ColumnIndex
    ///
    open func createIndex(
        databaseId: String,
        tableId: String,
        key: String,
        type: IndexType,
        columns: [String],
        orders: [String]? = nil,
        lengths: [Int]? = nil
    ) async throws -> AppwriteModels.ColumnIndex {
        let apiPath: String = "/tablesdb/{databaseId}/tables/{tableId}/indexes"
            .replacingOccurrences(of: "{databaseId}", with: databaseId)
            .replacingOccurrences(of: "{tableId}", with: tableId)

        let apiParams: [String: Any?] = [
            "key": key,
            "type": type,
            "columns": columns,
            "orders": orders,
            "lengths": lengths
        ]

        let apiHeaders: [String: String] = [
            "content-type": "application/json"
        ]

        let converter: (Any) -> AppwriteModels.ColumnIndex = { response in
            return AppwriteModels.ColumnIndex.from(map: response as! [String: Any])
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
    ///   - tableId: String
    ///   - key: String
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.ColumnIndex
    ///
    open func getIndex(
        databaseId: String,
        tableId: String,
        key: String
    ) async throws -> AppwriteModels.ColumnIndex {
        let apiPath: String = "/tablesdb/{databaseId}/tables/{tableId}/indexes/{key}"
            .replacingOccurrences(of: "{databaseId}", with: databaseId)
            .replacingOccurrences(of: "{tableId}", with: tableId)
            .replacingOccurrences(of: "{key}", with: key)

        let apiParams: [String: Any] = [:]

        let apiHeaders: [String: String] = [:]

        let converter: (Any) -> AppwriteModels.ColumnIndex = { response in
            return AppwriteModels.ColumnIndex.from(map: response as! [String: Any])
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
    ///   - tableId: String
    ///   - key: String
    /// - Throws: Exception if the request fails
    /// - Returns: Any
    ///
    open func deleteIndex(
        databaseId: String,
        tableId: String,
        key: String
    ) async throws -> Any {
        let apiPath: String = "/tablesdb/{databaseId}/tables/{tableId}/indexes/{key}"
            .replacingOccurrences(of: "{databaseId}", with: databaseId)
            .replacingOccurrences(of: "{tableId}", with: tableId)
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
    /// Get a list of all the user's rows in a given table. You can use the query
    /// params to filter your results.
    ///
    /// - Parameters:
    ///   - databaseId: String
    ///   - tableId: String
    ///   - queries: [String] (optional)
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.RowList<T>
    ///
    open func listRows<T>(
        databaseId: String,
        tableId: String,
        queries: [String]? = nil,
        nestedType: T.Type
    ) async throws -> AppwriteModels.RowList<T> {
        let apiPath: String = "/tablesdb/{databaseId}/tables/{tableId}/rows"
            .replacingOccurrences(of: "{databaseId}", with: databaseId)
            .replacingOccurrences(of: "{tableId}", with: tableId)

        let apiParams: [String: Any?] = [
            "queries": queries
        ]

        let apiHeaders: [String: String] = [:]

        let converter: (Any) -> AppwriteModels.RowList<T> = { response in
            return AppwriteModels.RowList.from(map: response as! [String: Any])
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
    /// Get a list of all the user's rows in a given table. You can use the query
    /// params to filter your results.
    ///
    /// - Parameters:
    ///   - databaseId: String
    ///   - tableId: String
    ///   - queries: [String] (optional)
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.RowList<T>
    ///
    open func listRows(
        databaseId: String,
        tableId: String,
        queries: [String]? = nil
    ) async throws -> AppwriteModels.RowList<[String: AnyCodable]> {
        return try await listRows(
            databaseId: databaseId,
            tableId: tableId,
            queries: queries,
            nestedType: [String: AnyCodable].self
        )
    }

    ///
    /// Create a new Row. Before using this route, you should create a new table
    /// resource using either a [server
    /// integration](https://appwrite.io/docs/server/tablesdb#tablesDBCreateTable)
    /// API or directly from your database console.
    ///
    /// - Parameters:
    ///   - databaseId: String
    ///   - tableId: String
    ///   - rowId: String
    ///   - data: Any
    ///   - permissions: [String] (optional)
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.Row<T>
    ///
    open func createRow<T>(
        databaseId: String,
        tableId: String,
        rowId: String,
        data: Any,
        permissions: [String]? = nil,
        nestedType: T.Type
    ) async throws -> AppwriteModels.Row<T> {
        let apiPath: String = "/tablesdb/{databaseId}/tables/{tableId}/rows"
            .replacingOccurrences(of: "{databaseId}", with: databaseId)
            .replacingOccurrences(of: "{tableId}", with: tableId)

        let apiParams: [String: Any?] = [
            "rowId": rowId,
            "data": data,
            "permissions": permissions
        ]

        let apiHeaders: [String: String] = [
            "content-type": "application/json"
        ]

        let converter: (Any) -> AppwriteModels.Row<T> = { response in
            return AppwriteModels.Row.from(map: response as! [String: Any])
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
    /// Create a new Row. Before using this route, you should create a new table
    /// resource using either a [server
    /// integration](https://appwrite.io/docs/server/tablesdb#tablesDBCreateTable)
    /// API or directly from your database console.
    ///
    /// - Parameters:
    ///   - databaseId: String
    ///   - tableId: String
    ///   - rowId: String
    ///   - data: Any
    ///   - permissions: [String] (optional)
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.Row<T>
    ///
    open func createRow(
        databaseId: String,
        tableId: String,
        rowId: String,
        data: Any,
        permissions: [String]? = nil
    ) async throws -> AppwriteModels.Row<[String: AnyCodable]> {
        return try await createRow(
            databaseId: databaseId,
            tableId: tableId,
            rowId: rowId,
            data: data,
            permissions: permissions,
            nestedType: [String: AnyCodable].self
        )
    }

    ///
    /// Create new Rows. Before using this route, you should create a new table
    /// resource using either a [server
    /// integration](https://appwrite.io/docs/server/tablesdb#tablesDBCreateTable)
    /// API or directly from your database console.
    ///
    /// - Parameters:
    ///   - databaseId: String
    ///   - tableId: String
    ///   - rows: [Any]
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.RowList<T>
    ///
    open func createRows<T>(
        databaseId: String,
        tableId: String,
        rows: [Any],
        nestedType: T.Type
    ) async throws -> AppwriteModels.RowList<T> {
        let apiPath: String = "/tablesdb/{databaseId}/tables/{tableId}/rows"
            .replacingOccurrences(of: "{databaseId}", with: databaseId)
            .replacingOccurrences(of: "{tableId}", with: tableId)

        let apiParams: [String: Any?] = [
            "rows": rows
        ]

        let apiHeaders: [String: String] = [
            "content-type": "application/json"
        ]

        let converter: (Any) -> AppwriteModels.RowList<T> = { response in
            return AppwriteModels.RowList.from(map: response as! [String: Any])
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
    /// Create new Rows. Before using this route, you should create a new table
    /// resource using either a [server
    /// integration](https://appwrite.io/docs/server/tablesdb#tablesDBCreateTable)
    /// API or directly from your database console.
    ///
    /// - Parameters:
    ///   - databaseId: String
    ///   - tableId: String
    ///   - rows: [Any]
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.RowList<T>
    ///
    open func createRows(
        databaseId: String,
        tableId: String,
        rows: [Any]
    ) async throws -> AppwriteModels.RowList<[String: AnyCodable]> {
        return try await createRows(
            databaseId: databaseId,
            tableId: tableId,
            rows: rows,
            nestedType: [String: AnyCodable].self
        )
    }

    ///
    /// Create or update Rows. Before using this route, you should create a new
    /// table resource using either a [server
    /// integration](https://appwrite.io/docs/server/tablesdb#tablesDBCreateTable)
    /// API or directly from your database console.
    /// 
    ///
    /// - Parameters:
    ///   - databaseId: String
    ///   - tableId: String
    ///   - rows: [Any]
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.RowList<T>
    ///
    open func upsertRows<T>(
        databaseId: String,
        tableId: String,
        rows: [Any],
        nestedType: T.Type
    ) async throws -> AppwriteModels.RowList<T> {
        let apiPath: String = "/tablesdb/{databaseId}/tables/{tableId}/rows"
            .replacingOccurrences(of: "{databaseId}", with: databaseId)
            .replacingOccurrences(of: "{tableId}", with: tableId)

        let apiParams: [String: Any?] = [
            "rows": rows
        ]

        let apiHeaders: [String: String] = [
            "content-type": "application/json"
        ]

        let converter: (Any) -> AppwriteModels.RowList<T> = { response in
            return AppwriteModels.RowList.from(map: response as! [String: Any])
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
    /// Create or update Rows. Before using this route, you should create a new
    /// table resource using either a [server
    /// integration](https://appwrite.io/docs/server/tablesdb#tablesDBCreateTable)
    /// API or directly from your database console.
    /// 
    ///
    /// - Parameters:
    ///   - databaseId: String
    ///   - tableId: String
    ///   - rows: [Any]
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.RowList<T>
    ///
    open func upsertRows(
        databaseId: String,
        tableId: String,
        rows: [Any]
    ) async throws -> AppwriteModels.RowList<[String: AnyCodable]> {
        return try await upsertRows(
            databaseId: databaseId,
            tableId: tableId,
            rows: rows,
            nestedType: [String: AnyCodable].self
        )
    }

    ///
    /// Update all rows that match your queries, if no queries are submitted then
    /// all rows are updated. You can pass only specific fields to be updated.
    ///
    /// - Parameters:
    ///   - databaseId: String
    ///   - tableId: String
    ///   - data: Any (optional)
    ///   - queries: [String] (optional)
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.RowList<T>
    ///
    open func updateRows<T>(
        databaseId: String,
        tableId: String,
        data: Any? = nil,
        queries: [String]? = nil,
        nestedType: T.Type
    ) async throws -> AppwriteModels.RowList<T> {
        let apiPath: String = "/tablesdb/{databaseId}/tables/{tableId}/rows"
            .replacingOccurrences(of: "{databaseId}", with: databaseId)
            .replacingOccurrences(of: "{tableId}", with: tableId)

        let apiParams: [String: Any?] = [
            "data": data,
            "queries": queries
        ]

        let apiHeaders: [String: String] = [
            "content-type": "application/json"
        ]

        let converter: (Any) -> AppwriteModels.RowList<T> = { response in
            return AppwriteModels.RowList.from(map: response as! [String: Any])
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
    /// Update all rows that match your queries, if no queries are submitted then
    /// all rows are updated. You can pass only specific fields to be updated.
    ///
    /// - Parameters:
    ///   - databaseId: String
    ///   - tableId: String
    ///   - data: Any (optional)
    ///   - queries: [String] (optional)
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.RowList<T>
    ///
    open func updateRows(
        databaseId: String,
        tableId: String,
        data: Any? = nil,
        queries: [String]? = nil
    ) async throws -> AppwriteModels.RowList<[String: AnyCodable]> {
        return try await updateRows(
            databaseId: databaseId,
            tableId: tableId,
            data: data,
            queries: queries,
            nestedType: [String: AnyCodable].self
        )
    }

    ///
    /// Bulk delete rows using queries, if no queries are passed then all rows are
    /// deleted.
    ///
    /// - Parameters:
    ///   - databaseId: String
    ///   - tableId: String
    ///   - queries: [String] (optional)
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.RowList<T>
    ///
    open func deleteRows<T>(
        databaseId: String,
        tableId: String,
        queries: [String]? = nil,
        nestedType: T.Type
    ) async throws -> AppwriteModels.RowList<T> {
        let apiPath: String = "/tablesdb/{databaseId}/tables/{tableId}/rows"
            .replacingOccurrences(of: "{databaseId}", with: databaseId)
            .replacingOccurrences(of: "{tableId}", with: tableId)

        let apiParams: [String: Any?] = [
            "queries": queries
        ]

        let apiHeaders: [String: String] = [
            "content-type": "application/json"
        ]

        let converter: (Any) -> AppwriteModels.RowList<T> = { response in
            return AppwriteModels.RowList.from(map: response as! [String: Any])
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
    /// Bulk delete rows using queries, if no queries are passed then all rows are
    /// deleted.
    ///
    /// - Parameters:
    ///   - databaseId: String
    ///   - tableId: String
    ///   - queries: [String] (optional)
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.RowList<T>
    ///
    open func deleteRows(
        databaseId: String,
        tableId: String,
        queries: [String]? = nil
    ) async throws -> AppwriteModels.RowList<[String: AnyCodable]> {
        return try await deleteRows(
            databaseId: databaseId,
            tableId: tableId,
            queries: queries,
            nestedType: [String: AnyCodable].self
        )
    }

    ///
    /// Get a row by its unique ID. This endpoint response returns a JSON object
    /// with the row data.
    ///
    /// - Parameters:
    ///   - databaseId: String
    ///   - tableId: String
    ///   - rowId: String
    ///   - queries: [String] (optional)
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.Row<T>
    ///
    open func getRow<T>(
        databaseId: String,
        tableId: String,
        rowId: String,
        queries: [String]? = nil,
        nestedType: T.Type
    ) async throws -> AppwriteModels.Row<T> {
        let apiPath: String = "/tablesdb/{databaseId}/tables/{tableId}/rows/{rowId}"
            .replacingOccurrences(of: "{databaseId}", with: databaseId)
            .replacingOccurrences(of: "{tableId}", with: tableId)
            .replacingOccurrences(of: "{rowId}", with: rowId)

        let apiParams: [String: Any?] = [
            "queries": queries
        ]

        let apiHeaders: [String: String] = [:]

        let converter: (Any) -> AppwriteModels.Row<T> = { response in
            return AppwriteModels.Row.from(map: response as! [String: Any])
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
    /// Get a row by its unique ID. This endpoint response returns a JSON object
    /// with the row data.
    ///
    /// - Parameters:
    ///   - databaseId: String
    ///   - tableId: String
    ///   - rowId: String
    ///   - queries: [String] (optional)
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.Row<T>
    ///
    open func getRow(
        databaseId: String,
        tableId: String,
        rowId: String,
        queries: [String]? = nil
    ) async throws -> AppwriteModels.Row<[String: AnyCodable]> {
        return try await getRow(
            databaseId: databaseId,
            tableId: tableId,
            rowId: rowId,
            queries: queries,
            nestedType: [String: AnyCodable].self
        )
    }

    ///
    /// Create or update a Row. Before using this route, you should create a new
    /// table resource using either a [server
    /// integration](https://appwrite.io/docs/server/tablesdb#tablesDBCreateTable)
    /// API or directly from your database console.
    ///
    /// - Parameters:
    ///   - databaseId: String
    ///   - tableId: String
    ///   - rowId: String
    ///   - data: Any (optional)
    ///   - permissions: [String] (optional)
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.Row<T>
    ///
    open func upsertRow<T>(
        databaseId: String,
        tableId: String,
        rowId: String,
        data: Any? = nil,
        permissions: [String]? = nil,
        nestedType: T.Type
    ) async throws -> AppwriteModels.Row<T> {
        let apiPath: String = "/tablesdb/{databaseId}/tables/{tableId}/rows/{rowId}"
            .replacingOccurrences(of: "{databaseId}", with: databaseId)
            .replacingOccurrences(of: "{tableId}", with: tableId)
            .replacingOccurrences(of: "{rowId}", with: rowId)

        let apiParams: [String: Any?] = [
            "data": data,
            "permissions": permissions
        ]

        let apiHeaders: [String: String] = [
            "content-type": "application/json"
        ]

        let converter: (Any) -> AppwriteModels.Row<T> = { response in
            return AppwriteModels.Row.from(map: response as! [String: Any])
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
    /// Create or update a Row. Before using this route, you should create a new
    /// table resource using either a [server
    /// integration](https://appwrite.io/docs/server/tablesdb#tablesDBCreateTable)
    /// API or directly from your database console.
    ///
    /// - Parameters:
    ///   - databaseId: String
    ///   - tableId: String
    ///   - rowId: String
    ///   - data: Any (optional)
    ///   - permissions: [String] (optional)
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.Row<T>
    ///
    open func upsertRow(
        databaseId: String,
        tableId: String,
        rowId: String,
        data: Any? = nil,
        permissions: [String]? = nil
    ) async throws -> AppwriteModels.Row<[String: AnyCodable]> {
        return try await upsertRow(
            databaseId: databaseId,
            tableId: tableId,
            rowId: rowId,
            data: data,
            permissions: permissions,
            nestedType: [String: AnyCodable].self
        )
    }

    ///
    /// Update a row by its unique ID. Using the patch method you can pass only
    /// specific fields that will get updated.
    ///
    /// - Parameters:
    ///   - databaseId: String
    ///   - tableId: String
    ///   - rowId: String
    ///   - data: Any (optional)
    ///   - permissions: [String] (optional)
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.Row<T>
    ///
    open func updateRow<T>(
        databaseId: String,
        tableId: String,
        rowId: String,
        data: Any? = nil,
        permissions: [String]? = nil,
        nestedType: T.Type
    ) async throws -> AppwriteModels.Row<T> {
        let apiPath: String = "/tablesdb/{databaseId}/tables/{tableId}/rows/{rowId}"
            .replacingOccurrences(of: "{databaseId}", with: databaseId)
            .replacingOccurrences(of: "{tableId}", with: tableId)
            .replacingOccurrences(of: "{rowId}", with: rowId)

        let apiParams: [String: Any?] = [
            "data": data,
            "permissions": permissions
        ]

        let apiHeaders: [String: String] = [
            "content-type": "application/json"
        ]

        let converter: (Any) -> AppwriteModels.Row<T> = { response in
            return AppwriteModels.Row.from(map: response as! [String: Any])
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
    /// Update a row by its unique ID. Using the patch method you can pass only
    /// specific fields that will get updated.
    ///
    /// - Parameters:
    ///   - databaseId: String
    ///   - tableId: String
    ///   - rowId: String
    ///   - data: Any (optional)
    ///   - permissions: [String] (optional)
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.Row<T>
    ///
    open func updateRow(
        databaseId: String,
        tableId: String,
        rowId: String,
        data: Any? = nil,
        permissions: [String]? = nil
    ) async throws -> AppwriteModels.Row<[String: AnyCodable]> {
        return try await updateRow(
            databaseId: databaseId,
            tableId: tableId,
            rowId: rowId,
            data: data,
            permissions: permissions,
            nestedType: [String: AnyCodable].self
        )
    }

    ///
    /// Delete a row by its unique ID.
    ///
    /// - Parameters:
    ///   - databaseId: String
    ///   - tableId: String
    ///   - rowId: String
    /// - Throws: Exception if the request fails
    /// - Returns: Any
    ///
    open func deleteRow(
        databaseId: String,
        tableId: String,
        rowId: String
    ) async throws -> Any {
        let apiPath: String = "/tablesdb/{databaseId}/tables/{tableId}/rows/{rowId}"
            .replacingOccurrences(of: "{databaseId}", with: databaseId)
            .replacingOccurrences(of: "{tableId}", with: tableId)
            .replacingOccurrences(of: "{rowId}", with: rowId)

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
    /// Decrement a specific column of a row by a given value.
    ///
    /// - Parameters:
    ///   - databaseId: String
    ///   - tableId: String
    ///   - rowId: String
    ///   - column: String
    ///   - value: Double (optional)
    ///   - min: Double (optional)
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.Row<T>
    ///
    open func decrementRowColumn<T>(
        databaseId: String,
        tableId: String,
        rowId: String,
        column: String,
        value: Double? = nil,
        min: Double? = nil,
        nestedType: T.Type
    ) async throws -> AppwriteModels.Row<T> {
        let apiPath: String = "/tablesdb/{databaseId}/tables/{tableId}/rows/{rowId}/{column}/decrement"
            .replacingOccurrences(of: "{databaseId}", with: databaseId)
            .replacingOccurrences(of: "{tableId}", with: tableId)
            .replacingOccurrences(of: "{rowId}", with: rowId)
            .replacingOccurrences(of: "{column}", with: column)

        let apiParams: [String: Any?] = [
            "value": value,
            "min": min
        ]

        let apiHeaders: [String: String] = [
            "content-type": "application/json"
        ]

        let converter: (Any) -> AppwriteModels.Row<T> = { response in
            return AppwriteModels.Row.from(map: response as! [String: Any])
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
    /// Decrement a specific column of a row by a given value.
    ///
    /// - Parameters:
    ///   - databaseId: String
    ///   - tableId: String
    ///   - rowId: String
    ///   - column: String
    ///   - value: Double (optional)
    ///   - min: Double (optional)
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.Row<T>
    ///
    open func decrementRowColumn(
        databaseId: String,
        tableId: String,
        rowId: String,
        column: String,
        value: Double? = nil,
        min: Double? = nil
    ) async throws -> AppwriteModels.Row<[String: AnyCodable]> {
        return try await decrementRowColumn(
            databaseId: databaseId,
            tableId: tableId,
            rowId: rowId,
            column: column,
            value: value,
            min: min,
            nestedType: [String: AnyCodable].self
        )
    }

    ///
    /// Increment a specific column of a row by a given value.
    ///
    /// - Parameters:
    ///   - databaseId: String
    ///   - tableId: String
    ///   - rowId: String
    ///   - column: String
    ///   - value: Double (optional)
    ///   - max: Double (optional)
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.Row<T>
    ///
    open func incrementRowColumn<T>(
        databaseId: String,
        tableId: String,
        rowId: String,
        column: String,
        value: Double? = nil,
        max: Double? = nil,
        nestedType: T.Type
    ) async throws -> AppwriteModels.Row<T> {
        let apiPath: String = "/tablesdb/{databaseId}/tables/{tableId}/rows/{rowId}/{column}/increment"
            .replacingOccurrences(of: "{databaseId}", with: databaseId)
            .replacingOccurrences(of: "{tableId}", with: tableId)
            .replacingOccurrences(of: "{rowId}", with: rowId)
            .replacingOccurrences(of: "{column}", with: column)

        let apiParams: [String: Any?] = [
            "value": value,
            "max": max
        ]

        let apiHeaders: [String: String] = [
            "content-type": "application/json"
        ]

        let converter: (Any) -> AppwriteModels.Row<T> = { response in
            return AppwriteModels.Row.from(map: response as! [String: Any])
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
    /// Increment a specific column of a row by a given value.
    ///
    /// - Parameters:
    ///   - databaseId: String
    ///   - tableId: String
    ///   - rowId: String
    ///   - column: String
    ///   - value: Double (optional)
    ///   - max: Double (optional)
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.Row<T>
    ///
    open func incrementRowColumn(
        databaseId: String,
        tableId: String,
        rowId: String,
        column: String,
        value: Double? = nil,
        max: Double? = nil
    ) async throws -> AppwriteModels.Row<[String: AnyCodable]> {
        return try await incrementRowColumn(
            databaseId: databaseId,
            tableId: tableId,
            rowId: rowId,
            column: column,
            value: value,
            max: max,
            nestedType: [String: AnyCodable].self
        )
    }


}