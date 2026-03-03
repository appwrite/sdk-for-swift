import AsyncHTTPClient
import Foundation
import NIO
import JSONCodable
import AppwriteEnums
import AppwriteModels

/// 
open class Backups: Service {

    ///
    /// List all archives for a project.
    ///
    /// - Parameters:
    ///   - queries: [String] (optional)
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.BackupArchiveList
    ///
    open func listArchives(
        queries: [String]? = nil
    ) async throws -> AppwriteModels.BackupArchiveList {
        let apiPath: String = "/backups/archives"

        let apiParams: [String: Any?] = [
            "queries": queries
        ]

        let apiHeaders: [String: String] = [:]

        let converter: (Any) -> AppwriteModels.BackupArchiveList = { response in
            return AppwriteModels.BackupArchiveList.from(map: response as! [String: Any])
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
    /// Create a new archive asynchronously for a project.
    ///
    /// - Parameters:
    ///   - services: [AppwriteEnums.BackupServices]
    ///   - resourceId: String (optional)
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.BackupArchive
    ///
    open func createArchive(
        services: [AppwriteEnums.BackupServices],
        resourceId: String? = nil
    ) async throws -> AppwriteModels.BackupArchive {
        let apiPath: String = "/backups/archives"

        let apiParams: [String: Any?] = [
            "services": services,
            "resourceId": resourceId
        ]

        let apiHeaders: [String: String] = [
            "content-type": "application/json"
        ]

        let converter: (Any) -> AppwriteModels.BackupArchive = { response in
            return AppwriteModels.BackupArchive.from(map: response as! [String: Any])
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
    /// Get a backup archive using it's ID.
    ///
    /// - Parameters:
    ///   - archiveId: String
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.BackupArchive
    ///
    open func getArchive(
        archiveId: String
    ) async throws -> AppwriteModels.BackupArchive {
        let apiPath: String = "/backups/archives/{archiveId}"
            .replacingOccurrences(of: "{archiveId}", with: archiveId)

        let apiParams: [String: Any] = [:]

        let apiHeaders: [String: String] = [:]

        let converter: (Any) -> AppwriteModels.BackupArchive = { response in
            return AppwriteModels.BackupArchive.from(map: response as! [String: Any])
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
    /// Delete an existing archive for a project.
    ///
    /// - Parameters:
    ///   - archiveId: String
    /// - Throws: Exception if the request fails
    /// - Returns: Any
    ///
    open func deleteArchive(
        archiveId: String
    ) async throws -> Any {
        let apiPath: String = "/backups/archives/{archiveId}"
            .replacingOccurrences(of: "{archiveId}", with: archiveId)

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
    /// List all policies for a project.
    ///
    /// - Parameters:
    ///   - queries: [String] (optional)
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.BackupPolicyList
    ///
    open func listPolicies(
        queries: [String]? = nil
    ) async throws -> AppwriteModels.BackupPolicyList {
        let apiPath: String = "/backups/policies"

        let apiParams: [String: Any?] = [
            "queries": queries
        ]

        let apiHeaders: [String: String] = [:]

        let converter: (Any) -> AppwriteModels.BackupPolicyList = { response in
            return AppwriteModels.BackupPolicyList.from(map: response as! [String: Any])
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
    /// Create a new backup policy.
    ///
    /// - Parameters:
    ///   - policyId: String
    ///   - services: [AppwriteEnums.BackupServices]
    ///   - retention: Int
    ///   - schedule: String
    ///   - name: String (optional)
    ///   - resourceId: String (optional)
    ///   - enabled: Bool (optional)
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.BackupPolicy
    ///
    open func createPolicy(
        policyId: String,
        services: [AppwriteEnums.BackupServices],
        retention: Int,
        schedule: String,
        name: String? = nil,
        resourceId: String? = nil,
        enabled: Bool? = nil
    ) async throws -> AppwriteModels.BackupPolicy {
        let apiPath: String = "/backups/policies"

        let apiParams: [String: Any?] = [
            "policyId": policyId,
            "name": name,
            "services": services,
            "resourceId": resourceId,
            "enabled": enabled,
            "retention": retention,
            "schedule": schedule
        ]

        let apiHeaders: [String: String] = [
            "content-type": "application/json"
        ]

        let converter: (Any) -> AppwriteModels.BackupPolicy = { response in
            return AppwriteModels.BackupPolicy.from(map: response as! [String: Any])
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
    /// Get a backup policy using it's ID.
    ///
    /// - Parameters:
    ///   - policyId: String
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.BackupPolicy
    ///
    open func getPolicy(
        policyId: String
    ) async throws -> AppwriteModels.BackupPolicy {
        let apiPath: String = "/backups/policies/{policyId}"
            .replacingOccurrences(of: "{policyId}", with: policyId)

        let apiParams: [String: Any] = [:]

        let apiHeaders: [String: String] = [:]

        let converter: (Any) -> AppwriteModels.BackupPolicy = { response in
            return AppwriteModels.BackupPolicy.from(map: response as! [String: Any])
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
    /// Update an existing policy using it's ID.
    ///
    /// - Parameters:
    ///   - policyId: String
    ///   - name: String (optional)
    ///   - retention: Int (optional)
    ///   - schedule: String (optional)
    ///   - enabled: Bool (optional)
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.BackupPolicy
    ///
    open func updatePolicy(
        policyId: String,
        name: String? = nil,
        retention: Int? = nil,
        schedule: String? = nil,
        enabled: Bool? = nil
    ) async throws -> AppwriteModels.BackupPolicy {
        let apiPath: String = "/backups/policies/{policyId}"
            .replacingOccurrences(of: "{policyId}", with: policyId)

        let apiParams: [String: Any?] = [
            "name": name,
            "retention": retention,
            "schedule": schedule,
            "enabled": enabled
        ]

        let apiHeaders: [String: String] = [
            "content-type": "application/json"
        ]

        let converter: (Any) -> AppwriteModels.BackupPolicy = { response in
            return AppwriteModels.BackupPolicy.from(map: response as! [String: Any])
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
    /// Delete a policy using it's ID.
    ///
    /// - Parameters:
    ///   - policyId: String
    /// - Throws: Exception if the request fails
    /// - Returns: Any
    ///
    open func deletePolicy(
        policyId: String
    ) async throws -> Any {
        let apiPath: String = "/backups/policies/{policyId}"
            .replacingOccurrences(of: "{policyId}", with: policyId)

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
    /// Create and trigger a new restoration for a backup on a project.
    ///
    /// - Parameters:
    ///   - archiveId: String
    ///   - services: [AppwriteEnums.BackupServices]
    ///   - newResourceId: String (optional)
    ///   - newResourceName: String (optional)
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.BackupRestoration
    ///
    open func createRestoration(
        archiveId: String,
        services: [AppwriteEnums.BackupServices],
        newResourceId: String? = nil,
        newResourceName: String? = nil
    ) async throws -> AppwriteModels.BackupRestoration {
        let apiPath: String = "/backups/restoration"

        let apiParams: [String: Any?] = [
            "archiveId": archiveId,
            "services": services,
            "newResourceId": newResourceId,
            "newResourceName": newResourceName
        ]

        let apiHeaders: [String: String] = [
            "content-type": "application/json"
        ]

        let converter: (Any) -> AppwriteModels.BackupRestoration = { response in
            return AppwriteModels.BackupRestoration.from(map: response as! [String: Any])
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
    /// List all backup restorations for a project.
    ///
    /// - Parameters:
    ///   - queries: [String] (optional)
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.BackupRestorationList
    ///
    open func listRestorations(
        queries: [String]? = nil
    ) async throws -> AppwriteModels.BackupRestorationList {
        let apiPath: String = "/backups/restorations"

        let apiParams: [String: Any?] = [
            "queries": queries
        ]

        let apiHeaders: [String: String] = [:]

        let converter: (Any) -> AppwriteModels.BackupRestorationList = { response in
            return AppwriteModels.BackupRestorationList.from(map: response as! [String: Any])
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
    /// Get the current status of a backup restoration.
    ///
    /// - Parameters:
    ///   - restorationId: String
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.BackupRestoration
    ///
    open func getRestoration(
        restorationId: String
    ) async throws -> AppwriteModels.BackupRestoration {
        let apiPath: String = "/backups/restorations/{restorationId}"
            .replacingOccurrences(of: "{restorationId}", with: restorationId)

        let apiParams: [String: Any] = [:]

        let apiHeaders: [String: String] = [:]

        let converter: (Any) -> AppwriteModels.BackupRestoration = { response in
            return AppwriteModels.BackupRestoration.from(map: response as! [String: Any])
        }

        return try await client.call(
            method: "GET",
            path: apiPath,
            headers: apiHeaders,
            params: apiParams,
            converter: converter
        )
    }


}