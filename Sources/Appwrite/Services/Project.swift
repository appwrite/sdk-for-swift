import AsyncHTTPClient
import Foundation
import NIO
import JSONCodable
import AppwriteModels

/// The Project service allows you to manage all the projects in your Appwrite server.
open class Project: Service {

    ///
    /// List Variables
    ///
    /// Get a list of all project variables. These variables will be accessible in
    /// all Appwrite Functions at runtime.
    ///
    /// @throws Exception
    /// @return array
    ///
    open func listVariables(
    ) async throws -> AppwriteModels.VariableList {
        let api_path: String = "/project/variables"

        let params: [String: Any] = [:]

        let headers: [String: String] = [
            "content-type": "application/json"
        ]

        let converter: (Any) -> AppwriteModels.VariableList = { response in
            return AppwriteModels.VariableList.from(map: response as! [String: Any])
        }

        return try await client.call(
            method: "GET",
            path: api_path,
            headers: headers,
            params: params,
            converter: converter
        )
    }

    ///
    /// Create Variable
    ///
    /// Create a new project variable. This variable will be accessible in all
    /// Appwrite Functions at runtime.
    ///
    /// @param String key
    /// @param String value
    /// @throws Exception
    /// @return array
    ///
    open func createVariable(
        key: String,
        value: String
    ) async throws -> AppwriteModels.Variable {
        let api_path: String = "/project/variables"

        let params: [String: Any?] = [
            "key": key,
            "value": value
        ]

        let headers: [String: String] = [
            "content-type": "application/json"
        ]

        let converter: (Any) -> AppwriteModels.Variable = { response in
            return AppwriteModels.Variable.from(map: response as! [String: Any])
        }

        return try await client.call(
            method: "POST",
            path: api_path,
            headers: headers,
            params: params,
            converter: converter
        )
    }

    ///
    /// Get Variable
    ///
    /// Get a project variable by its unique ID.
    ///
    /// @param String variableId
    /// @throws Exception
    /// @return array
    ///
    open func getVariable(
        variableId: String
    ) async throws -> AppwriteModels.Variable {
        let api_path: String = "/project/variables/{variableId}"
            .replacingOccurrences(of: "{variableId}", with: variableId)

        let params: [String: Any] = [:]

        let headers: [String: String] = [
            "content-type": "application/json"
        ]

        let converter: (Any) -> AppwriteModels.Variable = { response in
            return AppwriteModels.Variable.from(map: response as! [String: Any])
        }

        return try await client.call(
            method: "GET",
            path: api_path,
            headers: headers,
            params: params,
            converter: converter
        )
    }

    ///
    /// Update Variable
    ///
    /// Update project variable by its unique ID. This variable will be accessible
    /// in all Appwrite Functions at runtime.
    ///
    /// @param String variableId
    /// @param String key
    /// @param String value
    /// @throws Exception
    /// @return array
    ///
    open func updateVariable(
        variableId: String,
        key: String,
        value: String? = nil
    ) async throws -> AppwriteModels.Variable {
        let api_path: String = "/project/variables/{variableId}"
            .replacingOccurrences(of: "{variableId}", with: variableId)

        let params: [String: Any?] = [
            "key": key,
            "value": value
        ]

        let headers: [String: String] = [
            "content-type": "application/json"
        ]

        let converter: (Any) -> AppwriteModels.Variable = { response in
            return AppwriteModels.Variable.from(map: response as! [String: Any])
        }

        return try await client.call(
            method: "PUT",
            path: api_path,
            headers: headers,
            params: params,
            converter: converter
        )
    }

    ///
    /// Delete Variable
    ///
    /// Delete a project variable by its unique ID. 
    ///
    /// @param String variableId
    /// @throws Exception
    /// @return array
    ///
    open func deleteVariable(
        variableId: String
    ) async throws -> Any {
        let api_path: String = "/project/variables/{variableId}"
            .replacingOccurrences(of: "{variableId}", with: variableId)

        let params: [String: Any] = [:]

        let headers: [String: String] = [
            "content-type": "application/json"
        ]

        return try await client.call(
            method: "DELETE",
            path: api_path,
            headers: headers,
            params: params        )
    }


}