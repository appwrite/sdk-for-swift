import AppwriteEnums
import AppwriteModels
import AsyncHTTPClient
import Foundation
import JSONCodable
import NIO

///
open class Postgresql: Service {

    ///
    /// List all dedicated databases. Results support pagination.
    ///
    /// - Parameters:
    ///   - queries: [String] (optional)
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.DedicatedDatabaseList
    ///
    open func list(
        queries: [String]? = nil
    ) async throws -> AppwriteModels.DedicatedDatabaseList {
        let apiPath: String = "/postgresql"

        let apiParams: [String: Any?] = [
            "queries": queries
        ]

        let apiHeaders: [String: String] = [
            "X-Appwrite-Project": client.config["project"] ?? "",
            "accept": "application/json",
        ]

        let converter: (Any) throws -> AppwriteModels.DedicatedDatabaseList = { response in
            return AppwriteModels.DedicatedDatabaseList.from(map: response as! [String: Any])
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
    /// Create a new dedicated database with the chosen engine and configuration.
    /// Status will be 'provisioning' until the database is ready.
    ///
    /// - Parameters:
    ///   - databaseId: String
    ///   - name: String
    ///   - version: String (optional)
    ///   - specification: String (optional)
    ///   - replicas: Int (optional)
    ///   - syncMode: String (optional)
    ///   - networkIdleTimeoutSeconds: Int (optional)
    ///   - networkIPAllowlist: [String] (optional)
    ///   - idleTimeoutMinutes: Int (optional)
    ///   - pitr: Bool (optional)
    ///   - pitrRetentionDays: Int (optional)
    ///   - storageAutoscaling: Bool (optional)
    ///   - storageAutoscalingThresholdPercent: Int (optional)
    ///   - storageAutoscalingMaxGb: Int (optional)
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.DedicatedDatabase
    ///
    open func create(
        databaseId: String,
        name: String,
        version: String? = nil,
        specification: String? = nil,
        replicas: Int? = nil,
        syncMode: String? = nil,
        networkIdleTimeoutSeconds: Int? = nil,
        networkIPAllowlist: [String]? = nil,
        idleTimeoutMinutes: Int? = nil,
        pitr: Bool? = nil,
        pitrRetentionDays: Int? = nil,
        storageAutoscaling: Bool? = nil,
        storageAutoscalingThresholdPercent: Int? = nil,
        storageAutoscalingMaxGb: Int? = nil
    ) async throws -> AppwriteModels.DedicatedDatabase {
        let apiPath: String = "/postgresql"

        let apiParams: [String: Any?] = [
            "databaseId": databaseId,
            "name": name,
            "version": version,
            "specification": specification,
            "replicas": replicas,
            "syncMode": syncMode,
            "networkIdleTimeoutSeconds": networkIdleTimeoutSeconds,
            "networkIPAllowlist": networkIPAllowlist,
            "idleTimeoutMinutes": idleTimeoutMinutes,
            "pitr": pitr,
            "pitrRetentionDays": pitrRetentionDays,
            "storageAutoscaling": storageAutoscaling,
            "storageAutoscalingThresholdPercent": storageAutoscalingThresholdPercent,
            "storageAutoscalingMaxGb": storageAutoscalingMaxGb,
        ]

        let apiHeaders: [String: String] = [
            "X-Appwrite-Project": client.config["project"] ?? "",
            "content-type": "application/json",
            "accept": "application/json",
        ]

        let converter: (Any) throws -> AppwriteModels.DedicatedDatabase = { response in
            return AppwriteModels.DedicatedDatabase.from(map: response as! [String: Any])
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
    /// List the dedicated database specifications available on the current plan.
    /// Each specification reports its resource limits, pricing, and whether it is
    /// enabled for the organization.
    ///
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.DedicatedDatabaseSpecificationList
    ///
    open func listSpecifications() async throws -> AppwriteModels.DedicatedDatabaseSpecificationList {
        let apiPath: String = "/postgresql/specifications"

        let apiParams: [String: Any] = [:]

        let apiHeaders: [String: String] = [
            "X-Appwrite-Project": client.config["project"] ?? "",
            "accept": "application/json",
        ]

        let converter: (Any) throws -> AppwriteModels.DedicatedDatabaseSpecificationList = { response in
            return AppwriteModels.DedicatedDatabaseSpecificationList.from(map: response as! [String: Any])
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
    /// Get a dedicated database by its unique ID. Returns the database
    /// configuration and current status.
    ///
    /// - Parameters:
    ///   - databaseId: String
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.DedicatedDatabase
    ///
    open func get(
        databaseId: String
    ) async throws -> AppwriteModels.DedicatedDatabase {
        let apiPath: String = "/postgresql/{databaseId}"
            .replacingOccurrences(of: "{databaseId}", with: databaseId)

        let apiParams: [String: Any] = [:]

        let apiHeaders: [String: String] = [
            "X-Appwrite-Project": client.config["project"] ?? "",
            "accept": "application/json",
        ]

        let converter: (Any) throws -> AppwriteModels.DedicatedDatabase = { response in
            return AppwriteModels.DedicatedDatabase.from(map: response as! [String: Any])
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
    /// Update a dedicated database configuration. All changes are applied with
    /// zero downtime. Specification changes (cpu, memory, storage) are handled via
    /// rolling cutover. Storage expansion is done online. All other settings are
    /// applied in-place.
    ///
    /// - Parameters:
    ///   - databaseId: String
    ///   - name: String (optional)
    ///   - status: String (optional)
    ///   - specification: String (optional)
    ///   - replicas: Int (optional)
    ///   - syncMode: String (optional)
    ///   - networkIdleTimeoutSeconds: Int (optional)
    ///   - networkIPAllowlist: [String] (optional)
    ///   - idleTimeoutMinutes: Int (optional)
    ///   - pitr: Bool (optional)
    ///   - pitrRetentionDays: Int (optional)
    ///   - storageAutoscaling: Bool (optional)
    ///   - storageAutoscalingThresholdPercent: Int (optional)
    ///   - storageAutoscalingMaxGb: Int (optional)
    ///   - metricsTraceSampleRate: Double (optional)
    ///   - metricsSlowQueryLogThresholdMs: Int (optional)
    ///   - sqlApiEnabled: Bool (optional)
    ///   - sqlApiAllowedStatements: [String] (optional)
    ///   - sqlApiMaxRows: Int (optional)
    ///   - sqlApiMaxBytes: Int (optional)
    ///   - sqlApiTimeoutSeconds: Int (optional)
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.DedicatedDatabase
    ///
    open func update(
        databaseId: String,
        name: String? = nil,
        status: String? = nil,
        specification: String? = nil,
        replicas: Int? = nil,
        syncMode: String? = nil,
        networkIdleTimeoutSeconds: Int? = nil,
        networkIPAllowlist: [String]? = nil,
        idleTimeoutMinutes: Int? = nil,
        pitr: Bool? = nil,
        pitrRetentionDays: Int? = nil,
        storageAutoscaling: Bool? = nil,
        storageAutoscalingThresholdPercent: Int? = nil,
        storageAutoscalingMaxGb: Int? = nil,
        metricsTraceSampleRate: Double? = nil,
        metricsSlowQueryLogThresholdMs: Int? = nil,
        sqlApiEnabled: Bool? = nil,
        sqlApiAllowedStatements: [String]? = nil,
        sqlApiMaxRows: Int? = nil,
        sqlApiMaxBytes: Int? = nil,
        sqlApiTimeoutSeconds: Int? = nil
    ) async throws -> AppwriteModels.DedicatedDatabase {
        let apiPath: String = "/postgresql/{databaseId}"
            .replacingOccurrences(of: "{databaseId}", with: databaseId)

        let apiParams: [String: Any?] = [
            "name": name,
            "status": status,
            "specification": specification,
            "replicas": replicas,
            "syncMode": syncMode,
            "networkIdleTimeoutSeconds": networkIdleTimeoutSeconds,
            "networkIPAllowlist": networkIPAllowlist,
            "idleTimeoutMinutes": idleTimeoutMinutes,
            "pitr": pitr,
            "pitrRetentionDays": pitrRetentionDays,
            "storageAutoscaling": storageAutoscaling,
            "storageAutoscalingThresholdPercent": storageAutoscalingThresholdPercent,
            "storageAutoscalingMaxGb": storageAutoscalingMaxGb,
            "metricsTraceSampleRate": metricsTraceSampleRate,
            "metricsSlowQueryLogThresholdMs": metricsSlowQueryLogThresholdMs,
            "sqlApiEnabled": sqlApiEnabled,
            "sqlApiAllowedStatements": sqlApiAllowedStatements,
            "sqlApiMaxRows": sqlApiMaxRows,
            "sqlApiMaxBytes": sqlApiMaxBytes,
            "sqlApiTimeoutSeconds": sqlApiTimeoutSeconds,
        ]

        let apiHeaders: [String: String] = [
            "X-Appwrite-Project": client.config["project"] ?? "",
            "content-type": "application/json",
            "accept": "application/json",
        ]

        let converter: (Any) throws -> AppwriteModels.DedicatedDatabase = { response in
            return AppwriteModels.DedicatedDatabase.from(map: response as! [String: Any])
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
    /// Delete a dedicated database. This action is irreversible. The database
    /// status will be set to 'deleting' and all resources will be cleaned up.
    /// Deletion is allowed from any state, and repeating the call re-dispatches
    /// the cleanup.
    ///
    /// - Parameters:
    ///   - databaseId: String
    /// - Throws: Exception if the request fails
    /// - Returns: Any
    ///
    open func delete(
        databaseId: String
    ) async throws -> Any {
        let apiPath: String = "/postgresql/{databaseId}"
            .replacingOccurrences(of: "{databaseId}", with: databaseId)

        let apiParams: [String: Any] = [:]

        let apiHeaders: [String: String] = [
            "X-Appwrite-Project": client.config["project"] ?? "",
            "content-type": "application/json",
            "accept": "application/json",
        ]

        return try await client.call(
            method: "DELETE",
            path: apiPath,
            headers: apiHeaders,
            params: apiParams
        )
    }
    ///
    /// List all backups for a dedicated database. Results can be filtered by
    /// status and type.
    ///
    /// - Parameters:
    ///   - databaseId: String
    ///   - queries: [String] (optional)
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.DedicatedDatabaseBackupList
    ///
    open func listBackups(
        databaseId: String,
        queries: [String]? = nil
    ) async throws -> AppwriteModels.DedicatedDatabaseBackupList {
        let apiPath: String = "/postgresql/{databaseId}/backups"
            .replacingOccurrences(of: "{databaseId}", with: databaseId)

        let apiParams: [String: Any?] = [
            "queries": queries
        ]

        let apiHeaders: [String: String] = [
            "X-Appwrite-Project": client.config["project"] ?? "",
            "accept": "application/json",
        ]

        let converter: (Any) throws -> AppwriteModels.DedicatedDatabaseBackupList = { response in
            return AppwriteModels.DedicatedDatabaseBackupList.from(map: response as! [String: Any])
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
    /// Create a manual backup of a dedicated database. The backup will be created
    /// asynchronously and its status can be checked via the get backup endpoint.
    ///
    /// - Parameters:
    ///   - databaseId: String
    ///   - type: String (optional)
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.DedicatedDatabaseBackup
    ///
    open func createBackup(
        databaseId: String,
        type: String? = nil
    ) async throws -> AppwriteModels.DedicatedDatabaseBackup {
        let apiPath: String = "/postgresql/{databaseId}/backups"
            .replacingOccurrences(of: "{databaseId}", with: databaseId)

        let apiParams: [String: Any?] = [
            "type": type
        ]

        let apiHeaders: [String: String] = [
            "X-Appwrite-Project": client.config["project"] ?? "",
            "content-type": "application/json",
            "accept": "application/json",
        ]

        let converter: (Any) throws -> AppwriteModels.DedicatedDatabaseBackup = { response in
            return AppwriteModels.DedicatedDatabaseBackup.from(map: response as! [String: Any])
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
    /// List scheduled backup policies for a dedicated database.
    ///
    /// - Parameters:
    ///   - databaseId: String
    ///   - queries: [String] (optional)
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.BackupPolicyList
    ///
    open func listBackupPolicies(
        databaseId: String,
        queries: [String]? = nil
    ) async throws -> AppwriteModels.BackupPolicyList {
        let apiPath: String = "/postgresql/{databaseId}/backups/policies"
            .replacingOccurrences(of: "{databaseId}", with: databaseId)

        let apiParams: [String: Any?] = [
            "queries": queries
        ]

        let apiHeaders: [String: String] = [
            "X-Appwrite-Project": client.config["project"] ?? "",
            "accept": "application/json",
        ]

        let converter: (Any) throws -> AppwriteModels.BackupPolicyList = { response in
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
    /// Create a scheduled backup policy for a dedicated database.
    ///
    /// - Parameters:
    ///   - databaseId: String
    ///   - policyId: String
    ///   - name: String
    ///   - schedule: String
    ///   - retention: Int
    ///   - type: String (optional)
    ///   - enabled: Bool (optional)
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.BackupPolicy
    ///
    open func createBackupPolicy(
        databaseId: String,
        policyId: String,
        name: String,
        schedule: String,
        retention: Int,
        type: String? = nil,
        enabled: Bool? = nil
    ) async throws -> AppwriteModels.BackupPolicy {
        let apiPath: String = "/postgresql/{databaseId}/backups/policies"
            .replacingOccurrences(of: "{databaseId}", with: databaseId)

        let apiParams: [String: Any?] = [
            "policyId": policyId,
            "name": name,
            "schedule": schedule,
            "retention": retention,
            "type": type,
            "enabled": enabled,
        ]

        let apiHeaders: [String: String] = [
            "X-Appwrite-Project": client.config["project"] ?? "",
            "content-type": "application/json",
            "accept": "application/json",
        ]

        let converter: (Any) throws -> AppwriteModels.BackupPolicy = { response in
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
    /// Get a scheduled backup policy for a dedicated database.
    ///
    /// - Parameters:
    ///   - databaseId: String
    ///   - policyId: String
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.BackupPolicy
    ///
    open func getBackupPolicy(
        databaseId: String,
        policyId: String
    ) async throws -> AppwriteModels.BackupPolicy {
        let apiPath: String = "/postgresql/{databaseId}/backups/policies/{policyId}"
            .replacingOccurrences(of: "{databaseId}", with: databaseId)
            .replacingOccurrences(of: "{policyId}", with: policyId)

        let apiParams: [String: Any] = [:]

        let apiHeaders: [String: String] = [
            "X-Appwrite-Project": client.config["project"] ?? "",
            "accept": "application/json",
        ]

        let converter: (Any) throws -> AppwriteModels.BackupPolicy = { response in
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
    /// Update a scheduled backup policy for a dedicated database.
    ///
    /// - Parameters:
    ///   - databaseId: String
    ///   - policyId: String
    ///   - name: String (optional)
    ///   - schedule: String (optional)
    ///   - retention: Int (optional)
    ///   - enabled: Bool (optional)
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.BackupPolicy
    ///
    open func updateBackupPolicy(
        databaseId: String,
        policyId: String,
        name: String? = nil,
        schedule: String? = nil,
        retention: Int? = nil,
        enabled: Bool? = nil
    ) async throws -> AppwriteModels.BackupPolicy {
        let apiPath: String = "/postgresql/{databaseId}/backups/policies/{policyId}"
            .replacingOccurrences(of: "{databaseId}", with: databaseId)
            .replacingOccurrences(of: "{policyId}", with: policyId)

        let apiParams: [String: Any?] = [
            "name": name,
            "schedule": schedule,
            "retention": retention,
            "enabled": enabled,
        ]

        let apiHeaders: [String: String] = [
            "X-Appwrite-Project": client.config["project"] ?? "",
            "content-type": "application/json",
            "accept": "application/json",
        ]

        let converter: (Any) throws -> AppwriteModels.BackupPolicy = { response in
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
    /// Delete a scheduled backup policy for a dedicated database. Backups already
    /// taken by the policy are kept until their retention expires.
    ///
    /// - Parameters:
    ///   - databaseId: String
    ///   - policyId: String
    /// - Throws: Exception if the request fails
    /// - Returns: Any
    ///
    open func deleteBackupPolicy(
        databaseId: String,
        policyId: String
    ) async throws -> Any {
        let apiPath: String = "/postgresql/{databaseId}/backups/policies/{policyId}"
            .replacingOccurrences(of: "{databaseId}", with: databaseId)
            .replacingOccurrences(of: "{policyId}", with: policyId)

        let apiParams: [String: Any] = [:]

        let apiHeaders: [String: String] = [
            "X-Appwrite-Project": client.config["project"] ?? "",
            "content-type": "application/json",
            "accept": "application/json",
        ]

        return try await client.call(
            method: "DELETE",
            path: apiPath,
            headers: apiHeaders,
            params: apiParams
        )
    }
    ///
    /// Configure off-cluster backup storage for a dedicated database. Supports S3,
    /// GCS, and Azure Blob Storage destinations. Backups will be stored to the
    /// configured destination in addition to on-cluster storage.
    ///
    /// - Parameters:
    ///   - databaseId: String
    ///   - provider: String
    ///   - bucket: String
    ///   - accessKey: String
    ///   - secretKey: String
    ///   - region: String (optional)
    ///   - prefix: String (optional)
    ///   - endpoint: String (optional)
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.DedicatedDatabaseBackupStorage
    ///
    open func updateBackupStorage(
        databaseId: String,
        provider: String,
        bucket: String,
        accessKey: String,
        secretKey: String,
        region: String? = nil,
        `prefix`: String? = nil,
        endpoint: String? = nil
    ) async throws -> AppwriteModels.DedicatedDatabaseBackupStorage {
        let apiPath: String = "/postgresql/{databaseId}/backups/storage"
            .replacingOccurrences(of: "{databaseId}", with: databaseId)

        let apiParams: [String: Any?] = [
            "provider": provider,
            "bucket": bucket,
            "region": region,
            "prefix": `prefix`,
            "endpoint": endpoint,
            "accessKey": accessKey,
            "secretKey": secretKey,
        ]

        let apiHeaders: [String: String] = [
            "X-Appwrite-Project": client.config["project"] ?? "",
            "content-type": "application/json",
            "accept": "application/json",
        ]

        let converter: (Any) throws -> AppwriteModels.DedicatedDatabaseBackupStorage = { response in
            return AppwriteModels.DedicatedDatabaseBackupStorage.from(map: response as! [String: Any])
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
    /// Get details of a specific database backup including its status, size, and
    /// timestamps.
    ///
    /// - Parameters:
    ///   - databaseId: String
    ///   - backupId: String
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.DedicatedDatabaseBackup
    ///
    open func getBackup(
        databaseId: String,
        backupId: String
    ) async throws -> AppwriteModels.DedicatedDatabaseBackup {
        let apiPath: String = "/postgresql/{databaseId}/backups/{backupId}"
            .replacingOccurrences(of: "{databaseId}", with: databaseId)
            .replacingOccurrences(of: "{backupId}", with: backupId)

        let apiParams: [String: Any] = [:]

        let apiHeaders: [String: String] = [
            "X-Appwrite-Project": client.config["project"] ?? "",
            "accept": "application/json",
        ]

        let converter: (Any) throws -> AppwriteModels.DedicatedDatabaseBackup = { response in
            return AppwriteModels.DedicatedDatabaseBackup.from(map: response as! [String: Any])
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
    /// Delete a database backup. This will permanently remove the backup from
    /// storage and cannot be undone.
    ///
    /// - Parameters:
    ///   - databaseId: String
    ///   - backupId: String
    /// - Throws: Exception if the request fails
    /// - Returns: Any
    ///
    open func deleteBackup(
        databaseId: String,
        backupId: String
    ) async throws -> Any {
        let apiPath: String = "/postgresql/{databaseId}/backups/{backupId}"
            .replacingOccurrences(of: "{databaseId}", with: databaseId)
            .replacingOccurrences(of: "{backupId}", with: backupId)

        let apiParams: [String: Any] = [:]

        let apiHeaders: [String: String] = [
            "X-Appwrite-Project": client.config["project"] ?? "",
            "content-type": "application/json",
            "accept": "application/json",
        ]

        return try await client.call(
            method: "DELETE",
            path: apiPath,
            headers: apiHeaders,
            params: apiParams
        )
    }
    ///
    /// List all ephemeral branches for a dedicated database. Returns branch
    /// metadata including ID, name, namespace, and expiration time.
    ///
    /// - Parameters:
    ///   - databaseId: String
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.DedicatedDatabaseBranchList
    ///
    open func listBranches(
        databaseId: String
    ) async throws -> AppwriteModels.DedicatedDatabaseBranchList {
        let apiPath: String = "/postgresql/{databaseId}/branches"
            .replacingOccurrences(of: "{databaseId}", with: databaseId)

        let apiParams: [String: Any] = [:]

        let apiHeaders: [String: String] = [
            "X-Appwrite-Project": client.config["project"] ?? "",
            "accept": "application/json",
        ]

        let converter: (Any) throws -> AppwriteModels.DedicatedDatabaseBranchList = { response in
            return AppwriteModels.DedicatedDatabaseBranchList.from(map: response as! [String: Any])
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
    /// Create an ephemeral database branch from the primary via PVC snapshot. The
    /// branch is a full copy of the database at the current point in time, useful
    /// for testing schema migrations or running experiments without affecting
    /// production data. Branches expire after the configured TTL (default 24
    /// hours). The branch is created asynchronously.
    ///
    /// - Parameters:
    ///   - databaseId: String
    ///   - branchId: String (optional)
    ///   - ttl: Int (optional)
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.DedicatedDatabase
    ///
    open func createBranch(
        databaseId: String,
        branchId: String? = nil,
        ttl: Int? = nil
    ) async throws -> AppwriteModels.DedicatedDatabase {
        let apiPath: String = "/postgresql/{databaseId}/branches"
            .replacingOccurrences(of: "{databaseId}", with: databaseId)

        let apiParams: [String: Any?] = [
            "branchId": branchId,
            "ttl": ttl,
        ]

        let apiHeaders: [String: String] = [
            "X-Appwrite-Project": client.config["project"] ?? "",
            "content-type": "application/json",
            "accept": "application/json",
        ]

        let converter: (Any) throws -> AppwriteModels.DedicatedDatabase = { response in
            return AppwriteModels.DedicatedDatabase.from(map: response as! [String: Any])
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
    /// Delete an ephemeral database branch. This removes the branch namespace, its
    /// PVC, and the associated VolumeSnapshot. The deletion runs asynchronously
    /// and is irreversible.
    ///
    /// - Parameters:
    ///   - databaseId: String
    ///   - branchId: String
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.DedicatedDatabase
    ///
    open func deleteBranch(
        databaseId: String,
        branchId: String
    ) async throws -> AppwriteModels.DedicatedDatabase {
        let apiPath: String = "/postgresql/{databaseId}/branches/{branchId}"
            .replacingOccurrences(of: "{databaseId}", with: databaseId)
            .replacingOccurrences(of: "{branchId}", with: branchId)

        let apiParams: [String: Any] = [:]

        let apiHeaders: [String: String] = [
            "X-Appwrite-Project": client.config["project"] ?? "",
            "content-type": "application/json",
            "accept": "application/json",
        ]

        let converter: (Any) throws -> AppwriteModels.DedicatedDatabase = { response in
            return AppwriteModels.DedicatedDatabase.from(map: response as! [String: Any])
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
    /// Rotate the primary connection credentials for a dedicated database.
    /// Generates a new password and updates the database atomically. Previous
    /// credentials stop working immediately. Returns the database with a refreshed
    /// connection string carrying the new password.
    ///
    /// - Parameters:
    ///   - databaseId: String
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.DedicatedDatabase
    ///
    open func updateCredentials(
        databaseId: String
    ) async throws -> AppwriteModels.DedicatedDatabase {
        let apiPath: String = "/postgresql/{databaseId}/credentials"
            .replacingOccurrences(of: "{databaseId}", with: databaseId)

        let apiParams: [String: Any] = [:]

        let apiHeaders: [String: String] = [
            "X-Appwrite-Project": client.config["project"] ?? "",
            "content-type": "application/json",
            "accept": "application/json",
        ]

        let converter: (Any) throws -> AppwriteModels.DedicatedDatabase = { response in
            return AppwriteModels.DedicatedDatabase.from(map: response as! [String: Any])
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
    /// Execute SQL through the console-facing Cloud endpoint. Cloud proxies
    /// through the edge platform to the per-database SQL API sidecar. Application
    /// traffic should bypass cloud entirely and POST directly to the per-database
    /// hostname:
    /// `https://db-{project}-{db}.{region}.appwrite.center/v1/sql/executions` with
    /// an `X-Appwrite-Key` header — that path scales to the whole DB fleet
    /// without a per-query cloud round-trip. The statement type must be on the
    /// database's configured allow-list. Use bound parameters for any
    /// user-supplied values — the API does not interpolate raw strings.
    ///
    /// - Parameters:
    ///   - databaseId: String
    ///   - sql: String
    ///   - bindings: Any (optional)
    ///   - timeoutSeconds: Int (optional)
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.DedicatedDatabaseExecution
    ///
    open func createExecution(
        databaseId: String,
        sql: String,
        bindings: Any? = nil,
        timeoutSeconds: Int? = nil
    ) async throws -> AppwriteModels.DedicatedDatabaseExecution {
        let apiPath: String = "/postgresql/{databaseId}/executions"
            .replacingOccurrences(of: "{databaseId}", with: databaseId)

        let apiParams: [String: Any?] = [
            "sql": sql,
            "bindings": bindings,
            "timeoutSeconds": timeoutSeconds,
        ]

        let apiHeaders: [String: String] = [
            "X-Appwrite-Project": client.config["project"] ?? "",
            "content-type": "application/json",
            "accept": "application/json",
        ]

        let converter: (Any) throws -> AppwriteModels.DedicatedDatabaseExecution = { response in
            return AppwriteModels.DedicatedDatabaseExecution.from(map: response as! [String: Any])
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
    /// List installed and available extensions for a PostgreSQL database.
    ///
    /// - Parameters:
    ///   - databaseId: String
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.DedicatedDatabaseExtensions
    ///
    open func listExtensions(
        databaseId: String
    ) async throws -> AppwriteModels.DedicatedDatabaseExtensions {
        let apiPath: String = "/postgresql/{databaseId}/extensions"
            .replacingOccurrences(of: "{databaseId}", with: databaseId)

        let apiParams: [String: Any] = [:]

        let apiHeaders: [String: String] = [
            "X-Appwrite-Project": client.config["project"] ?? "",
            "accept": "application/json",
        ]

        let converter: (Any) throws -> AppwriteModels.DedicatedDatabaseExtensions = { response in
            return AppwriteModels.DedicatedDatabaseExtensions.from(map: response as! [String: Any])
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
    /// Install a database extension. Only available for PostgreSQL databases. The
    /// install runs asynchronously; poll the extensions list endpoint for status.
    ///
    /// - Parameters:
    ///   - databaseId: String
    ///   - name: String
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.DedicatedDatabase
    ///
    open func createExtension(
        databaseId: String,
        name: String
    ) async throws -> AppwriteModels.DedicatedDatabase {
        let apiPath: String = "/postgresql/{databaseId}/extensions"
            .replacingOccurrences(of: "{databaseId}", with: databaseId)

        let apiParams: [String: Any?] = [
            "name": name
        ]

        let apiHeaders: [String: String] = [
            "X-Appwrite-Project": client.config["project"] ?? "",
            "content-type": "application/json",
            "accept": "application/json",
        ]

        let converter: (Any) throws -> AppwriteModels.DedicatedDatabase = { response in
            return AppwriteModels.DedicatedDatabase.from(map: response as! [String: Any])
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
    /// Uninstall a database extension from a PostgreSQL database. The uninstall
    /// runs asynchronously; poll the extensions list endpoint for status.
    ///
    /// - Parameters:
    ///   - databaseId: String
    ///   - extensionName: String
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.DedicatedDatabase
    ///
    open func deleteExtension(
        databaseId: String,
        extensionName: String
    ) async throws -> AppwriteModels.DedicatedDatabase {
        let apiPath: String = "/postgresql/{databaseId}/extensions/{extensionName}"
            .replacingOccurrences(of: "{databaseId}", with: databaseId)
            .replacingOccurrences(of: "{extensionName}", with: extensionName)

        let apiParams: [String: Any] = [:]

        let apiHeaders: [String: String] = [
            "X-Appwrite-Project": client.config["project"] ?? "",
            "content-type": "application/json",
            "accept": "application/json",
        ]

        let converter: (Any) throws -> AppwriteModels.DedicatedDatabase = { response in
            return AppwriteModels.DedicatedDatabase.from(map: response as! [String: Any])
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
    /// Trigger a manual failover for a dedicated database with high availability
    /// enabled. Promotes a replica to primary. The failover runs asynchronously;
    /// poll the database document for status updates. A database left
    /// mid-operation also accepts this call as a repair once nothing is driving
    /// the operation it is stuck in. Repairing a failover that did not finish, a
    /// `failed` database, a stranded upgrade or migrate, or a stranded compute
    /// resize additionally requires `targetReplicaId` to name the member to
    /// promote, because the default target may be the member that operation
    /// already promoted.
    ///
    /// - Parameters:
    ///   - databaseId: String
    ///   - targetReplicaId: String (optional)
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.DedicatedDatabase
    ///
    open func createFailover(
        databaseId: String,
        targetReplicaId: String? = nil
    ) async throws -> AppwriteModels.DedicatedDatabase {
        let apiPath: String = "/postgresql/{databaseId}/failovers"
            .replacingOccurrences(of: "{databaseId}", with: databaseId)

        let apiParams: [String: Any?] = [
            "targetReplicaId": targetReplicaId
        ]

        let apiHeaders: [String: String] = [
            "X-Appwrite-Project": client.config["project"] ?? "",
            "content-type": "application/json",
            "accept": "application/json",
        ]

        let converter: (Any) throws -> AppwriteModels.DedicatedDatabase = { response in
            return AppwriteModels.DedicatedDatabase.from(map: response as! [String: Any])
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
    /// Update the maintenance window for a dedicated database. Maintenance
    /// operations like minor version upgrades will be performed during this
    /// window.
    ///
    /// - Parameters:
    ///   - databaseId: String
    ///   - day: String
    ///   - hourUtc: Int
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.DedicatedDatabase
    ///
    open func updateMaintenance(
        databaseId: String,
        day: String,
        hourUtc: Int
    ) async throws -> AppwriteModels.DedicatedDatabase {
        let apiPath: String = "/postgresql/{databaseId}/maintenance"
            .replacingOccurrences(of: "{databaseId}", with: databaseId)

        let apiParams: [String: Any?] = [
            "day": day,
            "hourUtc": hourUtc,
        ]

        let apiHeaders: [String: String] = [
            "X-Appwrite-Project": client.config["project"] ?? "",
            "content-type": "application/json",
            "accept": "application/json",
        ]

        let converter: (Any) throws -> AppwriteModels.DedicatedDatabase = { response in
            return AppwriteModels.DedicatedDatabase.from(map: response as! [String: Any])
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
    /// Migrate a database between shared and dedicated types. Shared to dedicated
    /// provisions an always-on dedicated instance; dedicated to shared converts to
    /// a serverless instance that scales to zero when idle. Data is copied to the
    /// target with a brief read-only window during cutover.
    ///
    /// - Parameters:
    ///   - databaseId: String
    ///   - targetType: String
    ///   - specification: String (optional)
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.DedicatedDatabase
    ///
    open func createMigration(
        databaseId: String,
        targetType: String,
        specification: String? = nil
    ) async throws -> AppwriteModels.DedicatedDatabase {
        let apiPath: String = "/postgresql/{databaseId}/migrations"
            .replacingOccurrences(of: "{databaseId}", with: databaseId)

        let apiParams: [String: Any?] = [
            "targetType": targetType,
            "specification": specification,
        ]

        let apiHeaders: [String: String] = [
            "X-Appwrite-Project": client.config["project"] ?? "",
            "content-type": "application/json",
            "accept": "application/json",
        ]

        let converter: (Any) throws -> AppwriteModels.DedicatedDatabase = { response in
            return AppwriteModels.DedicatedDatabase.from(map: response as! [String: Any])
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
    /// List the lifecycle operations recorded for a dedicated database, newest
    /// first. Every provision, update, restore, backup and replication action is
    /// recorded here with its outcome, including an attempt that was abandoned
    /// because another worker took over the database.
    ///
    /// - Parameters:
    ///   - databaseId: String
    ///   - status: String (optional)
    ///   - limit: Int (optional)
    ///   - offset: Int (optional)
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.DedicatedDatabaseOperationList
    ///
    open func listOperations(
        databaseId: String,
        status: String? = nil,
        limit: Int? = nil,
        offset: Int? = nil
    ) async throws -> AppwriteModels.DedicatedDatabaseOperationList {
        let apiPath: String = "/postgresql/{databaseId}/operations"
            .replacingOccurrences(of: "{databaseId}", with: databaseId)

        let apiParams: [String: Any?] = [
            "status": status,
            "limit": limit,
            "offset": offset,
        ]

        let apiHeaders: [String: String] = [
            "X-Appwrite-Project": client.config["project"] ?? "",
            "accept": "application/json",
        ]

        let converter: (Any) throws -> AppwriteModels.DedicatedDatabaseOperationList = { response in
            return AppwriteModels.DedicatedDatabaseOperationList.from(map: response as! [String: Any])
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
    /// Get available point-in-time recovery windows for a dedicated database.
    /// Returns the earliest and latest recovery points.
    ///
    /// - Parameters:
    ///   - databaseId: String
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.DedicatedDatabasePITRWindows
    ///
    open func getPitr(
        databaseId: String
    ) async throws -> AppwriteModels.DedicatedDatabasePITRWindows {
        let apiPath: String = "/postgresql/{databaseId}/pitr"
            .replacingOccurrences(of: "{databaseId}", with: databaseId)

        let apiParams: [String: Any] = [:]

        let apiHeaders: [String: String] = [
            "X-Appwrite-Project": client.config["project"] ?? "",
            "accept": "application/json",
        ]

        let converter: (Any) throws -> AppwriteModels.DedicatedDatabasePITRWindows = { response in
            return AppwriteModels.DedicatedDatabasePITRWindows.from(map: response as! [String: Any])
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
    /// Get the connection pooler configuration for a dedicated database. Returns
    /// pooler mode, max connections, and pool size settings.
    ///
    /// - Parameters:
    ///   - databaseId: String
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.DedicatedDatabasePooler
    ///
    open func getPooler(
        databaseId: String
    ) async throws -> AppwriteModels.DedicatedDatabasePooler {
        let apiPath: String = "/postgresql/{databaseId}/pooler"
            .replacingOccurrences(of: "{databaseId}", with: databaseId)

        let apiParams: [String: Any] = [:]

        let apiHeaders: [String: String] = [
            "X-Appwrite-Project": client.config["project"] ?? "",
            "accept": "application/json",
        ]

        let converter: (Any) throws -> AppwriteModels.DedicatedDatabasePooler = { response in
            return AppwriteModels.DedicatedDatabasePooler.from(map: response as! [String: Any])
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
    /// Update the connection pooler configuration for a dedicated database.
    /// Configure pool mode, max connections, and pool sizes.
    ///
    /// - Parameters:
    ///   - databaseId: String
    ///   - mode: String (optional)
    ///   - maxConnections: Int (optional)
    ///   - defaultPoolSize: Int (optional)
    ///   - readWriteSplitting: Bool (optional)
    ///   - poolerCpuRequest: String (optional)
    ///   - poolerCpuLimit: String (optional)
    ///   - poolerMemoryRequest: String (optional)
    ///   - poolerMemoryLimit: String (optional)
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.DedicatedDatabasePooler
    ///
    open func updatePooler(
        databaseId: String,
        mode: String? = nil,
        maxConnections: Int? = nil,
        defaultPoolSize: Int? = nil,
        readWriteSplitting: Bool? = nil,
        poolerCpuRequest: String? = nil,
        poolerCpuLimit: String? = nil,
        poolerMemoryRequest: String? = nil,
        poolerMemoryLimit: String? = nil
    ) async throws -> AppwriteModels.DedicatedDatabasePooler {
        let apiPath: String = "/postgresql/{databaseId}/pooler"
            .replacingOccurrences(of: "{databaseId}", with: databaseId)

        let apiParams: [String: Any?] = [
            "mode": mode,
            "maxConnections": maxConnections,
            "defaultPoolSize": defaultPoolSize,
            "readWriteSplitting": readWriteSplitting,
            "poolerCpuRequest": poolerCpuRequest,
            "poolerCpuLimit": poolerCpuLimit,
            "poolerMemoryRequest": poolerMemoryRequest,
            "poolerMemoryLimit": poolerMemoryLimit,
        ]

        let apiHeaders: [String: String] = [
            "X-Appwrite-Project": client.config["project"] ?? "",
            "content-type": "application/json",
            "accept": "application/json",
        ]

        let converter: (Any) throws -> AppwriteModels.DedicatedDatabasePooler = { response in
            return AppwriteModels.DedicatedDatabasePooler.from(map: response as! [String: Any])
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
    /// Get high availability status for a dedicated database. Returns replica
    /// statuses, replication lag, and sync mode.
    ///
    /// - Parameters:
    ///   - databaseId: String
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.DedicatedDatabaseReplicas
    ///
    open func getReplicas(
        databaseId: String
    ) async throws -> AppwriteModels.DedicatedDatabaseReplicas {
        let apiPath: String = "/postgresql/{databaseId}/replicas"
            .replacingOccurrences(of: "{databaseId}", with: databaseId)

        let apiParams: [String: Any] = [:]

        let apiHeaders: [String: String] = [
            "X-Appwrite-Project": client.config["project"] ?? "",
            "accept": "application/json",
        ]

        let converter: (Any) throws -> AppwriteModels.DedicatedDatabaseReplicas = { response in
            return AppwriteModels.DedicatedDatabaseReplicas.from(map: response as! [String: Any])
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
    /// List all restorations for a dedicated database. Results can be filtered by
    /// status and type.
    ///
    /// - Parameters:
    ///   - databaseId: String
    ///   - status: String (optional)
    ///   - type: String (optional)
    ///   - limit: Int (optional)
    ///   - offset: Int (optional)
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.DedicatedDatabaseRestorationList
    ///
    open func listRestorations(
        databaseId: String,
        status: String? = nil,
        type: String? = nil,
        limit: Int? = nil,
        offset: Int? = nil
    ) async throws -> AppwriteModels.DedicatedDatabaseRestorationList {
        let apiPath: String = "/postgresql/{databaseId}/restorations"
            .replacingOccurrences(of: "{databaseId}", with: databaseId)

        let apiParams: [String: Any?] = [
            "status": status,
            "type": type,
            "limit": limit,
            "offset": offset,
        ]

        let apiHeaders: [String: String] = [
            "X-Appwrite-Project": client.config["project"] ?? "",
            "accept": "application/json",
        ]

        let converter: (Any) throws -> AppwriteModels.DedicatedDatabaseRestorationList = { response in
            return AppwriteModels.DedicatedDatabaseRestorationList.from(map: response as! [String: Any])
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
    /// Restore a database from a backup or to a specific point in time (PITR). For
    /// backup restoration, provide a backupId. For PITR, provide a targetTime as
    /// an ISO 8601 datetime. PITR requires the database to have PITR enabled and
    /// is only available for enterprise databases.
    ///
    /// - Parameters:
    ///   - databaseId: String
    ///   - type: String (optional)
    ///   - backupId: String (optional)
    ///   - targetDatabaseId: String (optional)
    ///   - targetTime: String (optional)
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.DedicatedDatabaseRestoration
    ///
    open func createRestoration(
        databaseId: String,
        type: String? = nil,
        backupId: String? = nil,
        targetDatabaseId: String? = nil,
        targetTime: String? = nil
    ) async throws -> AppwriteModels.DedicatedDatabaseRestoration {
        let apiPath: String = "/postgresql/{databaseId}/restorations"
            .replacingOccurrences(of: "{databaseId}", with: databaseId)

        let apiParams: [String: Any?] = [
            "type": type,
            "backupId": backupId,
            "targetDatabaseId": targetDatabaseId,
            "targetTime": targetTime,
        ]

        let apiHeaders: [String: String] = [
            "X-Appwrite-Project": client.config["project"] ?? "",
            "content-type": "application/json",
            "accept": "application/json",
        ]

        let converter: (Any) throws -> AppwriteModels.DedicatedDatabaseRestoration = { response in
            return AppwriteModels.DedicatedDatabaseRestoration.from(map: response as! [String: Any])
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
    /// Get details of a specific database restoration including its status, type,
    /// and timestamps.
    ///
    /// - Parameters:
    ///   - databaseId: String
    ///   - restorationId: String
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.DedicatedDatabaseRestoration
    ///
    open func getRestoration(
        databaseId: String,
        restorationId: String
    ) async throws -> AppwriteModels.DedicatedDatabaseRestoration {
        let apiPath: String = "/postgresql/{databaseId}/restorations/{restorationId}"
            .replacingOccurrences(of: "{databaseId}", with: databaseId)
            .replacingOccurrences(of: "{restorationId}", with: restorationId)

        let apiParams: [String: Any] = [:]

        let apiHeaders: [String: String] = [
            "X-Appwrite-Project": client.config["project"] ?? "",
            "accept": "application/json",
        ]

        let converter: (Any) throws -> AppwriteModels.DedicatedDatabaseRestoration = { response in
            return AppwriteModels.DedicatedDatabaseRestoration.from(map: response as! [String: Any])
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
    /// Get real-time health and status information for a dedicated database.
    /// Returns health status, readiness, uptime, connection info, replica status,
    /// and volume information.
    ///
    /// - Parameters:
    ///   - databaseId: String
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.DatabaseStatus
    ///
    open func getStatus(
        databaseId: String
    ) async throws -> AppwriteModels.DatabaseStatus {
        let apiPath: String = "/postgresql/{databaseId}/status"
            .replacingOccurrences(of: "{databaseId}", with: databaseId)

        let apiParams: [String: Any] = [:]

        let apiHeaders: [String: String] = [
            "X-Appwrite-Project": client.config["project"] ?? "",
            "accept": "application/json",
        ]

        let converter: (Any) throws -> AppwriteModels.DatabaseStatus = { response in
            return AppwriteModels.DatabaseStatus.from(map: response as! [String: Any])
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
    /// Upgrade a dedicated database to a new engine version. Uses blue-green
    /// deployment for zero-downtime cutover.
    ///
    /// - Parameters:
    ///   - databaseId: String
    ///   - targetVersion: String
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.DedicatedDatabase
    ///
    open func createUpgrade(
        databaseId: String,
        targetVersion: String
    ) async throws -> AppwriteModels.DedicatedDatabase {
        let apiPath: String = "/postgresql/{databaseId}/upgrades"
            .replacingOccurrences(of: "{databaseId}", with: databaseId)

        let apiParams: [String: Any?] = [
            "targetVersion": targetVersion
        ]

        let apiHeaders: [String: String] = [
            "X-Appwrite-Project": client.config["project"] ?? "",
            "content-type": "application/json",
            "accept": "application/json",
        ]

        let converter: (Any) throws -> AppwriteModels.DedicatedDatabase = { response in
            return AppwriteModels.DedicatedDatabase.from(map: response as! [String: Any])
        }

        return try await client.call(
            method: "POST",
            path: apiPath,
            headers: apiHeaders,
            params: apiParams,
            converter: converter
        )
    }
}
