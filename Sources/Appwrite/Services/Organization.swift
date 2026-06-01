import AsyncHTTPClient
import Foundation
import NIO
import JSONCodable
import AppwriteEnums
import AppwriteModels

/// 
open class Organization: Service {

    ///
    /// Get a list of all API keys from the current organization.
    ///
    /// - Parameters:
    ///   - queries: [String] (optional)
    ///   - total: Bool (optional)
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.KeyList
    ///
    open func listKeys(
        queries: [String]? = nil,
        total: Bool? = nil
    ) async throws -> AppwriteModels.KeyList {
        let apiPath: String = "/organization/keys"

        let apiParams: [String: Any?] = [
            "queries": queries,
            "total": total
        ]

        let apiHeaders: [String: String] = [:]

        let converter: (Any) throws -> AppwriteModels.KeyList = { response in
            return AppwriteModels.KeyList.from(map: response as! [String: Any])
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
    /// Create a new organization API key.
    ///
    /// - Parameters:
    ///   - keyId: String
    ///   - name: String
    ///   - scopes: [AppwriteEnums.OrganizationKeyScopes]
    ///   - expire: String (optional)
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.Key
    ///
    open func createKey(
        keyId: String,
        name: String,
        scopes: [AppwriteEnums.OrganizationKeyScopes],
        expire: String? = nil
    ) async throws -> AppwriteModels.Key {
        let apiPath: String = "/organization/keys"

        let apiParams: [String: Any?] = [
            "keyId": keyId,
            "name": name,
            "scopes": scopes.map { $0.rawValue },
            "expire": expire
        ]

        let apiHeaders: [String: String] = [
            "content-type": "application/json"
        ]

        let converter: (Any) throws -> AppwriteModels.Key = { response in
            return AppwriteModels.Key.from(map: response as! [String: Any])
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
    /// Get a key by its unique ID. This endpoint returns details about a specific
    /// API key in your organization including its scopes.
    ///
    /// - Parameters:
    ///   - keyId: String
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.Key
    ///
    open func getKey(
        keyId: String
    ) async throws -> AppwriteModels.Key {
        let apiPath: String = "/organization/keys/{keyId}"
            .replacingOccurrences(of: "{keyId}", with: keyId)

        let apiParams: [String: Any] = [:]

        let apiHeaders: [String: String] = [:]

        let converter: (Any) throws -> AppwriteModels.Key = { response in
            return AppwriteModels.Key.from(map: response as! [String: Any])
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
    /// Update a key by its unique ID. Use this endpoint to update the name,
    /// scopes, or expiration time of an API key.
    ///
    /// - Parameters:
    ///   - keyId: String
    ///   - name: String
    ///   - scopes: [AppwriteEnums.OrganizationKeyScopes]
    ///   - expire: String (optional)
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.Key
    ///
    open func updateKey(
        keyId: String,
        name: String,
        scopes: [AppwriteEnums.OrganizationKeyScopes],
        expire: String? = nil
    ) async throws -> AppwriteModels.Key {
        let apiPath: String = "/organization/keys/{keyId}"
            .replacingOccurrences(of: "{keyId}", with: keyId)

        let apiParams: [String: Any?] = [
            "name": name,
            "scopes": scopes.map { $0.rawValue },
            "expire": expire
        ]

        let apiHeaders: [String: String] = [
            "content-type": "application/json"
        ]

        let converter: (Any) throws -> AppwriteModels.Key = { response in
            return AppwriteModels.Key.from(map: response as! [String: Any])
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
    /// Delete a key by its unique ID. Once deleted, the key can no longer be used
    /// to authenticate API calls.
    ///
    /// - Parameters:
    ///   - keyId: String
    /// - Throws: Exception if the request fails
    /// - Returns: Any
    ///
    open func deleteKey(
        keyId: String
    ) async throws -> Any {
        let apiPath: String = "/organization/keys/{keyId}"
            .replacingOccurrences(of: "{keyId}", with: keyId)

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
    /// Get a list of all projects. You can use the query params to filter your
    /// results.
    ///
    /// - Parameters:
    ///   - queries: [String] (optional)
    ///   - search: String (optional)
    ///   - total: Bool (optional)
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.ProjectList
    ///
    open func listProjects(
        queries: [String]? = nil,
        search: String? = nil,
        total: Bool? = nil
    ) async throws -> AppwriteModels.ProjectList {
        let apiPath: String = "/organization/projects"

        let apiParams: [String: Any?] = [
            "queries": queries,
            "search": search,
            "total": total
        ]

        let apiHeaders: [String: String] = [:]

        let converter: (Any) throws -> AppwriteModels.ProjectList = { response in
            return AppwriteModels.ProjectList.from(map: response as! [String: Any])
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
    /// Create a new project.
    ///
    /// - Parameters:
    ///   - projectId: String
    ///   - name: String
    ///   - region: AppwriteEnums.Region (optional)
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.Project
    ///
    open func createProject(
        projectId: String,
        name: String,
        region: AppwriteEnums.Region? = nil
    ) async throws -> AppwriteModels.Project {
        let apiPath: String = "/organization/projects"

        let apiParams: [String: Any?] = [
            "projectId": projectId,
            "name": name,
            "region": region?.rawValue
        ]

        let apiHeaders: [String: String] = [
            "content-type": "application/json"
        ]

        let converter: (Any) throws -> AppwriteModels.Project = { response in
            return AppwriteModels.Project.from(map: response as! [String: Any])
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
    /// Get a project.
    ///
    /// - Parameters:
    ///   - projectId: String
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.Project
    ///
    open func getProject(
        projectId: String
    ) async throws -> AppwriteModels.Project {
        let apiPath: String = "/organization/projects/{projectId}"
            .replacingOccurrences(of: "{projectId}", with: projectId)

        let apiParams: [String: Any] = [:]

        let apiHeaders: [String: String] = [:]

        let converter: (Any) throws -> AppwriteModels.Project = { response in
            return AppwriteModels.Project.from(map: response as! [String: Any])
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
    /// Update a project by its unique ID.
    ///
    /// - Parameters:
    ///   - projectId: String
    ///   - name: String
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.Project
    ///
    open func updateProject(
        projectId: String,
        name: String
    ) async throws -> AppwriteModels.Project {
        let apiPath: String = "/organization/projects/{projectId}"
            .replacingOccurrences(of: "{projectId}", with: projectId)

        let apiParams: [String: Any?] = [
            "name": name
        ]

        let apiHeaders: [String: String] = [
            "content-type": "application/json"
        ]

        let converter: (Any) throws -> AppwriteModels.Project = { response in
            return AppwriteModels.Project.from(map: response as! [String: Any])
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
    /// Delete a project by its unique ID.
    ///
    /// - Parameters:
    ///   - projectId: String
    /// - Throws: Exception if the request fails
    /// - Returns: Any
    ///
    open func deleteProject(
        projectId: String
    ) async throws -> Any {
        let apiPath: String = "/organization/projects/{projectId}"
            .replacingOccurrences(of: "{projectId}", with: projectId)

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
