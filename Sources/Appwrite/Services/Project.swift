import AsyncHTTPClient
import Foundation
import NIO
import JSONCodable
import AppwriteEnums
import AppwriteModels

/// The Project service allows you to manage all the projects in your Appwrite server.
open class Project: Service {

    ///
    /// Get a list of all project environment variables.
    ///
    /// - Parameters:
    ///   - queries: [String] (optional)
    ///   - total: Bool (optional)
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.VariableList
    ///
    open func listVariables(
        queries: [String]? = nil,
        total: Bool? = nil
    ) async throws -> AppwriteModels.VariableList {
        let apiPath: String = "/project/variables"

        let apiParams: [String: Any?] = [
            "queries": queries,
            "total": total
        ]

        let apiHeaders: [String: String] = [:]

        let converter: (Any) -> AppwriteModels.VariableList = { response in
            return AppwriteModels.VariableList.from(map: response as! [String: Any])
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
    /// Create a new project environment variable. These variables can be accessed
    /// by all functions and sites in the project.
    ///
    /// - Parameters:
    ///   - variableId: String
    ///   - key: String
    ///   - value: String
    ///   - secret: Bool (optional)
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.Variable
    ///
    open func createVariable(
        variableId: String,
        key: String,
        value: String,
        secret: Bool? = nil
    ) async throws -> AppwriteModels.Variable {
        let apiPath: String = "/project/variables"

        let apiParams: [String: Any?] = [
            "variableId": variableId,
            "key": key,
            "value": value,
            "secret": secret
        ]

        let apiHeaders: [String: String] = [
            "content-type": "application/json"
        ]

        let converter: (Any) -> AppwriteModels.Variable = { response in
            return AppwriteModels.Variable.from(map: response as! [String: Any])
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
    /// Get a variable by its unique ID. 
    ///
    /// - Parameters:
    ///   - variableId: String
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.Variable
    ///
    open func getVariable(
        variableId: String
    ) async throws -> AppwriteModels.Variable {
        let apiPath: String = "/project/variables/{variableId}"
            .replacingOccurrences(of: "{variableId}", with: variableId)

        let apiParams: [String: Any] = [:]

        let apiHeaders: [String: String] = [:]

        let converter: (Any) -> AppwriteModels.Variable = { response in
            return AppwriteModels.Variable.from(map: response as! [String: Any])
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
    /// Update variable by its unique ID.
    ///
    /// - Parameters:
    ///   - variableId: String
    ///   - key: String (optional)
    ///   - value: String (optional)
    ///   - secret: Bool (optional)
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.Variable
    ///
    open func updateVariable(
        variableId: String,
        key: String? = nil,
        value: String? = nil,
        secret: Bool? = nil
    ) async throws -> AppwriteModels.Variable {
        let apiPath: String = "/project/variables/{variableId}"
            .replacingOccurrences(of: "{variableId}", with: variableId)

        let apiParams: [String: Any?] = [
            "key": key,
            "value": value,
            "secret": secret
        ]

        let apiHeaders: [String: String] = [
            "content-type": "application/json"
        ]

        let converter: (Any) -> AppwriteModels.Variable = { response in
            return AppwriteModels.Variable.from(map: response as! [String: Any])
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
    /// Delete a variable by its unique ID. 
    ///
    /// - Parameters:
    ///   - variableId: String
    /// - Throws: Exception if the request fails
    /// - Returns: Any
    ///
    open func deleteVariable(
        variableId: String
    ) async throws -> Any {
        let apiPath: String = "/project/variables/{variableId}"
            .replacingOccurrences(of: "{variableId}", with: variableId)

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