import AsyncHTTPClient
import Foundation
import NIO
import JSONCodable
import AppwriteEnums
import AppwriteModels

/// The Organization service allows you to manage organization-level projects.
open class Organization: Service {

    ///
    /// Get the current organization.
    ///
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.Organization<T>
    ///
    open func get<T>(
        nestedType: T.Type
    ) async throws -> AppwriteModels.Organization<T> {
        let apiPath: String = "/organization"

        let apiParams: [String: Any] = [:]

        let apiHeaders: [String: String] = [
            "X-Appwrite-Project": client.config["project"] ?? "",
            "accept": "application/json"
        ]

        let converter: (Any) throws -> AppwriteModels.Organization<T> = { response in
            return AppwriteModels.Organization.from(map: response as! [String: Any])
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
    /// Get the current organization.
    ///
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.Organization<T>
    ///
    open func get(
    ) async throws -> AppwriteModels.Organization<[String: AnyCodable]> {
        return try await get(
            nestedType: [String: AnyCodable].self
        )
    }

    ///
    /// Update the current organization's name.
    ///
    /// - Parameters:
    ///   - name: String
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.Organization<T>
    ///
    open func update<T>(
        name: String,
        nestedType: T.Type
    ) async throws -> AppwriteModels.Organization<T> {
        let apiPath: String = "/organization"

        let apiParams: [String: Any?] = [
            "name": name
        ]

        let apiHeaders: [String: String] = [
            "X-Appwrite-Project": client.config["project"] ?? "",
            "content-type": "application/json",
            "accept": "application/json"
        ]

        let converter: (Any) throws -> AppwriteModels.Organization<T> = { response in
            return AppwriteModels.Organization.from(map: response as! [String: Any])
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
    /// Update the current organization's name.
    ///
    /// - Parameters:
    ///   - name: String
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.Organization<T>
    ///
    open func update(
        name: String
    ) async throws -> AppwriteModels.Organization<[String: AnyCodable]> {
        return try await update(
            name: name,
            nestedType: [String: AnyCodable].self
        )
    }

    ///
    /// Delete the current organization. All projects that belong to the
    /// organization are deleted as well.
    ///
    /// - Throws: Exception if the request fails
    /// - Returns: Any
    ///
    open func delete(
    ) async throws -> Any {
        let apiPath: String = "/organization"

        let apiParams: [String: Any] = [:]

        let apiHeaders: [String: String] = [
            "X-Appwrite-Project": client.config["project"] ?? "",
            "content-type": "application/json"
        ]

        return try await client.call(
            method: "DELETE",
            path: apiPath,
            headers: apiHeaders,
            params: apiParams        )
    }

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

        let apiHeaders: [String: String] = [
            "X-Appwrite-Project": client.config["project"] ?? "",
            "accept": "application/json"
        ]

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
            "X-Appwrite-Project": client.config["project"] ?? "",
            "content-type": "application/json",
            "accept": "application/json"
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

        let apiHeaders: [String: String] = [
            "X-Appwrite-Project": client.config["project"] ?? "",
            "accept": "application/json"
        ]

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
            "X-Appwrite-Project": client.config["project"] ?? "",
            "content-type": "application/json",
            "accept": "application/json"
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
            "X-Appwrite-Project": client.config["project"] ?? "",
            "content-type": "application/json"
        ]

        return try await client.call(
            method: "DELETE",
            path: apiPath,
            headers: apiHeaders,
            params: apiParams        )
    }

    ///
    /// Get a list of all memberships from the current organization.
    ///
    /// - Parameters:
    ///   - queries: [String] (optional)
    ///   - search: String (optional)
    ///   - total: Bool (optional)
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.MembershipList
    ///
    open func listMemberships(
        queries: [String]? = nil,
        search: String? = nil,
        total: Bool? = nil
    ) async throws -> AppwriteModels.MembershipList {
        let apiPath: String = "/organization/memberships"

        let apiParams: [String: Any?] = [
            "queries": queries,
            "search": search,
            "total": total
        ]

        let apiHeaders: [String: String] = [
            "X-Appwrite-Project": client.config["project"] ?? "",
            "accept": "application/json"
        ]

        let converter: (Any) throws -> AppwriteModels.MembershipList = { response in
            return AppwriteModels.MembershipList.from(map: response as! [String: Any])
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
    /// Invite a new member to join the current organization. An email with a link
    /// to join the organization will be sent to the new member's email address. If
    /// member doesn't exist in the project it will be automatically created.
    ///
    /// - Parameters:
    ///   - roles: [String]
    ///   - email: String (optional)
    ///   - userId: String (optional)
    ///   - phone: String (optional)
    ///   - url: String (optional)
    ///   - name: String (optional)
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.Membership
    ///
    open func createMembership(
        roles: [String],
        email: String? = nil,
        userId: String? = nil,
        phone: String? = nil,
        url: String? = nil,
        name: String? = nil
    ) async throws -> AppwriteModels.Membership {
        let apiPath: String = "/organization/memberships"

        let apiParams: [String: Any?] = [
            "email": email,
            "userId": userId,
            "phone": phone,
            "roles": roles,
            "url": url,
            "name": name
        ]

        let apiHeaders: [String: String] = [
            "X-Appwrite-Project": client.config["project"] ?? "",
            "content-type": "application/json",
            "accept": "application/json"
        ]

        let converter: (Any) throws -> AppwriteModels.Membership = { response in
            return AppwriteModels.Membership.from(map: response as! [String: Any])
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
    /// Get a membership from the current organization by its unique ID.
    ///
    /// - Parameters:
    ///   - membershipId: String
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.Membership
    ///
    open func getMembership(
        membershipId: String
    ) async throws -> AppwriteModels.Membership {
        let apiPath: String = "/organization/memberships/{membershipId}"
            .replacingOccurrences(of: "{membershipId}", with: membershipId)

        let apiParams: [String: Any] = [:]

        let apiHeaders: [String: String] = [
            "X-Appwrite-Project": client.config["project"] ?? "",
            "accept": "application/json"
        ]

        let converter: (Any) throws -> AppwriteModels.Membership = { response in
            return AppwriteModels.Membership.from(map: response as! [String: Any])
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
    /// Modify the roles of a member in the current organization.
    ///
    /// - Parameters:
    ///   - membershipId: String
    ///   - roles: [String]
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.Membership
    ///
    open func updateMembership(
        membershipId: String,
        roles: [String]
    ) async throws -> AppwriteModels.Membership {
        let apiPath: String = "/organization/memberships/{membershipId}"
            .replacingOccurrences(of: "{membershipId}", with: membershipId)

        let apiParams: [String: Any?] = [
            "roles": roles
        ]

        let apiHeaders: [String: String] = [
            "X-Appwrite-Project": client.config["project"] ?? "",
            "content-type": "application/json",
            "accept": "application/json"
        ]

        let converter: (Any) throws -> AppwriteModels.Membership = { response in
            return AppwriteModels.Membership.from(map: response as! [String: Any])
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
    /// Remove a member from the current organization. The member is removed
    /// whether they accepted the invitation or not; a pending invitation is
    /// revoked.
    ///
    /// - Parameters:
    ///   - membershipId: String
    /// - Throws: Exception if the request fails
    /// - Returns: Any
    ///
    open func deleteMembership(
        membershipId: String
    ) async throws -> Any {
        let apiPath: String = "/organization/memberships/{membershipId}"
            .replacingOccurrences(of: "{membershipId}", with: membershipId)

        let apiParams: [String: Any] = [:]

        let apiHeaders: [String: String] = [
            "X-Appwrite-Project": client.config["project"] ?? "",
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

        let apiHeaders: [String: String] = [
            "X-Appwrite-Project": client.config["project"] ?? "",
            "accept": "application/json"
        ]

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
            "X-Appwrite-Project": client.config["project"] ?? "",
            "content-type": "application/json",
            "accept": "application/json"
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

        let apiHeaders: [String: String] = [
            "X-Appwrite-Project": client.config["project"] ?? ""
        ]

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
            "X-Appwrite-Project": client.config["project"] ?? "",
            "content-type": "application/json",
            "accept": "application/json"
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
            "X-Appwrite-Project": client.config["project"] ?? "",
            "content-type": "application/json"
        ]

        return try await client.call(
            method: "DELETE",
            path: apiPath,
            headers: apiHeaders,
            params: apiParams        )
    }


}
