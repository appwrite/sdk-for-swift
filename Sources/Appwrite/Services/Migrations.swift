import AppwriteEnums
import AppwriteModels
import AsyncHTTPClient
import Foundation
import JSONCodable
import NIO

/// The Migrations service allows you to migrate third-party data to your Appwrite project.
open class Migrations: Service {

    ///
    /// List all migrations in the current project. This endpoint returns a list of
    /// all migrations including their status, progress, and any errors that
    /// occurred during the migration process.
    ///
    /// - Parameters:
    ///   - queries: [String] (optional)
    ///   - search: String (optional)
    ///   - total: Bool (optional)
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.MigrationList
    ///
    open func list(
        queries: [String]? = nil,
        search: String? = nil,
        total: Bool? = nil
    ) async throws -> AppwriteModels.MigrationList {
        let apiPath: String = "/migrations"

        let apiParams: [String: Any?] = [
            "queries": queries,
            "search": search,
            "total": total,
        ]

        let apiHeaders: [String: String] = [
            "X-Appwrite-Project": client.config["project"] ?? "",
            "accept": "application/json",
        ]

        let converter: (Any) throws -> AppwriteModels.MigrationList = { response in
            return AppwriteModels.MigrationList.from(map: response as! [String: Any])
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
    /// Migrate data from another Appwrite project to your current project. This
    /// endpoint allows you to migrate resources like databases, collections,
    /// documents, users, and files from an existing Appwrite project.
    ///
    /// - Parameters:
    ///   - resources: [AppwriteEnums.AppwriteMigrationResource]
    ///   - endpoint: String
    ///   - projectId: String
    ///   - apiKey: String
    ///   - onDuplicate: AppwriteEnums.OnDuplicate (optional)
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.Migration
    ///
    open func createAppwriteMigration(
        resources: [AppwriteEnums.AppwriteMigrationResource],
        endpoint: String,
        projectId: String,
        apiKey: String,
        onDuplicate: AppwriteEnums.OnDuplicate? = nil
    ) async throws -> AppwriteModels.Migration {
        let apiPath: String = "/migrations/appwrite"

        let apiParams: [String: Any?] = [
            "resources": resources.map { $0.rawValue },
            "endpoint": endpoint,
            "projectId": projectId,
            "apiKey": apiKey,
            "onDuplicate": onDuplicate?.rawValue,
        ]

        let apiHeaders: [String: String] = [
            "X-Appwrite-Project": client.config["project"] ?? "",
            "content-type": "application/json",
            "accept": "application/json",
        ]

        let converter: (Any) throws -> AppwriteModels.Migration = { response in
            return AppwriteModels.Migration.from(map: response as! [String: Any])
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
    /// Export documents to a CSV file from your Appwrite database. This endpoint
    /// allows you to export documents to a CSV file stored in a secure internal
    /// bucket. You'll receive an email with a download link when the export is
    /// complete.
    ///
    /// - Parameters:
    ///   - databaseId: String
    ///   - collectionId: String
    ///   - filename: String
    ///   - columns: [String] (optional)
    ///   - queries: [String] (optional)
    ///   - delimiter: String (optional)
    ///   - enclosure: String (optional)
    ///   - escape: String (optional)
    ///   - header: Bool (optional)
    ///   - notify: Bool (optional)
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.Migration
    ///
    open func createCSVExport(
        databaseId: String,
        collectionId: String,
        filename: String,
        columns: [String]? = nil,
        queries: [String]? = nil,
        delimiter: String? = nil,
        enclosure: String? = nil,
        escape: String? = nil,
        header: Bool? = nil,
        notify: Bool? = nil
    ) async throws -> AppwriteModels.Migration {
        let apiPath: String = "/migrations/csv/exports"

        let apiParams: [String: Any?] = [
            "databaseId": databaseId,
            "collectionId": collectionId,
            "filename": filename,
            "columns": columns,
            "queries": queries,
            "delimiter": delimiter,
            "enclosure": enclosure,
            "escape": escape,
            "header": header,
            "notify": notify,
        ]

        let apiHeaders: [String: String] = [
            "X-Appwrite-Project": client.config["project"] ?? "",
            "content-type": "application/json",
            "accept": "application/json",
        ]

        let converter: (Any) throws -> AppwriteModels.Migration = { response in
            return AppwriteModels.Migration.from(map: response as! [String: Any])
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
    /// Import documents from a CSV file into your Appwrite database. This endpoint
    /// allows you to import documents from a CSV file uploaded to Appwrite Storage
    /// bucket.
    ///
    /// - Parameters:
    ///   - bucketId: String
    ///   - fileId: String
    ///   - databaseId: String
    ///   - collectionId: String
    ///   - internalFile: Bool (optional)
    ///   - onDuplicate: AppwriteEnums.OnDuplicate (optional)
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.Migration
    ///
    open func createCSVImport(
        bucketId: String,
        fileId: String,
        databaseId: String,
        collectionId: String,
        internalFile: Bool? = nil,
        onDuplicate: AppwriteEnums.OnDuplicate? = nil
    ) async throws -> AppwriteModels.Migration {
        let apiPath: String = "/migrations/csv/imports"

        let apiParams: [String: Any?] = [
            "bucketId": bucketId,
            "fileId": fileId,
            "databaseId": databaseId,
            "collectionId": collectionId,
            "internalFile": internalFile,
            "onDuplicate": onDuplicate?.rawValue,
        ]

        let apiHeaders: [String: String] = [
            "X-Appwrite-Project": client.config["project"] ?? "",
            "content-type": "application/json",
            "accept": "application/json",
        ]

        let converter: (Any) throws -> AppwriteModels.Migration = { response in
            return AppwriteModels.Migration.from(map: response as! [String: Any])
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
    /// Migrate data from a Firebase project to your Appwrite project. This
    /// endpoint allows you to migrate resources like authentication and other
    /// supported services from a Firebase project.
    ///
    /// - Parameters:
    ///   - resources: [AppwriteEnums.FirebaseMigrationResource]
    ///   - serviceAccount: String
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.Migration
    ///
    open func createFirebaseMigration(
        resources: [AppwriteEnums.FirebaseMigrationResource],
        serviceAccount: String
    ) async throws -> AppwriteModels.Migration {
        let apiPath: String = "/migrations/firebase"

        let apiParams: [String: Any?] = [
            "resources": resources.map { $0.rawValue },
            "serviceAccount": serviceAccount,
        ]

        let apiHeaders: [String: String] = [
            "X-Appwrite-Project": client.config["project"] ?? "",
            "content-type": "application/json",
            "accept": "application/json",
        ]

        let converter: (Any) throws -> AppwriteModels.Migration = { response in
            return AppwriteModels.Migration.from(map: response as! [String: Any])
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
    /// Generate a report of the data in a Firebase project before migrating. This
    /// endpoint analyzes the source project and returns information about the
    /// resources that can be migrated.
    ///
    /// - Parameters:
    ///   - resources: [AppwriteEnums.FirebaseMigrationResource]
    ///   - serviceAccount: String
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.MigrationReport
    ///
    open func getFirebaseReport(
        resources: [AppwriteEnums.FirebaseMigrationResource],
        serviceAccount: String
    ) async throws -> AppwriteModels.MigrationReport {
        let apiPath: String = "/migrations/firebase/report"

        let apiParams: [String: Any?] = [
            "resources": resources.map { $0.rawValue },
            "serviceAccount": serviceAccount,
        ]

        let apiHeaders: [String: String] = [
            "X-Appwrite-Project": client.config["project"] ?? "",
            "accept": "application/json",
        ]

        let converter: (Any) throws -> AppwriteModels.MigrationReport = { response in
            return AppwriteModels.MigrationReport.from(map: response as! [String: Any])
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
    /// Export documents to a JSON file from your Appwrite database. This endpoint
    /// allows you to export documents to a JSON file stored in a secure internal
    /// bucket. You'll receive an email with a download link when the export is
    /// complete.
    ///
    /// - Parameters:
    ///   - databaseId: String
    ///   - collectionId: String
    ///   - filename: String
    ///   - columns: [String] (optional)
    ///   - queries: [String] (optional)
    ///   - notify: Bool (optional)
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.Migration
    ///
    open func createJSONExport(
        databaseId: String,
        collectionId: String,
        filename: String,
        columns: [String]? = nil,
        queries: [String]? = nil,
        notify: Bool? = nil
    ) async throws -> AppwriteModels.Migration {
        let apiPath: String = "/migrations/json/exports"

        let apiParams: [String: Any?] = [
            "databaseId": databaseId,
            "collectionId": collectionId,
            "filename": filename,
            "columns": columns,
            "queries": queries,
            "notify": notify,
        ]

        let apiHeaders: [String: String] = [
            "X-Appwrite-Project": client.config["project"] ?? "",
            "content-type": "application/json",
            "accept": "application/json",
        ]

        let converter: (Any) throws -> AppwriteModels.Migration = { response in
            return AppwriteModels.Migration.from(map: response as! [String: Any])
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
    /// Import documents from a JSON file into your Appwrite database. This
    /// endpoint allows you to import documents from a JSON file uploaded to
    /// Appwrite Storage bucket.
    ///
    /// - Parameters:
    ///   - bucketId: String
    ///   - fileId: String
    ///   - databaseId: String
    ///   - collectionId: String
    ///   - internalFile: Bool (optional)
    ///   - onDuplicate: AppwriteEnums.OnDuplicate (optional)
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.Migration
    ///
    open func createJSONImport(
        bucketId: String,
        fileId: String,
        databaseId: String,
        collectionId: String,
        internalFile: Bool? = nil,
        onDuplicate: AppwriteEnums.OnDuplicate? = nil
    ) async throws -> AppwriteModels.Migration {
        let apiPath: String = "/migrations/json/imports"

        let apiParams: [String: Any?] = [
            "bucketId": bucketId,
            "fileId": fileId,
            "databaseId": databaseId,
            "collectionId": collectionId,
            "internalFile": internalFile,
            "onDuplicate": onDuplicate?.rawValue,
        ]

        let apiHeaders: [String: String] = [
            "X-Appwrite-Project": client.config["project"] ?? "",
            "content-type": "application/json",
            "accept": "application/json",
        ]

        let converter: (Any) throws -> AppwriteModels.Migration = { response in
            return AppwriteModels.Migration.from(map: response as! [String: Any])
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
    /// Migrate data from an NHost project to your Appwrite project. This endpoint
    /// allows you to migrate resources like authentication, databases, and other
    /// supported services from an NHost project.
    ///
    /// - Parameters:
    ///   - resources: [AppwriteEnums.NHostMigrationResource]
    ///   - subdomain: String
    ///   - region: String
    ///   - adminSecret: String
    ///   - database: String
    ///   - username: String
    ///   - password: String
    ///   - port: Int (optional)
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.Migration
    ///
    open func createNHostMigration(
        resources: [AppwriteEnums.NHostMigrationResource],
        subdomain: String,
        region: String,
        adminSecret: String,
        database: String,
        username: String,
        password: String,
        port: Int? = nil
    ) async throws -> AppwriteModels.Migration {
        let apiPath: String = "/migrations/nhost"

        let apiParams: [String: Any?] = [
            "resources": resources.map { $0.rawValue },
            "subdomain": subdomain,
            "region": region,
            "adminSecret": adminSecret,
            "database": database,
            "username": username,
            "password": password,
            "port": port,
        ]

        let apiHeaders: [String: String] = [
            "X-Appwrite-Project": client.config["project"] ?? "",
            "content-type": "application/json",
            "accept": "application/json",
        ]

        let converter: (Any) throws -> AppwriteModels.Migration = { response in
            return AppwriteModels.Migration.from(map: response as! [String: Any])
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
    /// Generate a detailed report of the data in an NHost project before
    /// migrating. This endpoint analyzes the source project and returns
    /// information about the resources that can be migrated.
    ///
    /// - Parameters:
    ///   - resources: [AppwriteEnums.NHostMigrationResource]
    ///   - subdomain: String
    ///   - region: String
    ///   - adminSecret: String
    ///   - database: String
    ///   - username: String
    ///   - password: String
    ///   - port: Int (optional)
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.MigrationReport
    ///
    open func getNHostReport(
        resources: [AppwriteEnums.NHostMigrationResource],
        subdomain: String,
        region: String,
        adminSecret: String,
        database: String,
        username: String,
        password: String,
        port: Int? = nil
    ) async throws -> AppwriteModels.MigrationReport {
        let apiPath: String = "/migrations/nhost/report"

        let apiParams: [String: Any?] = [
            "resources": resources.map { $0.rawValue },
            "subdomain": subdomain,
            "region": region,
            "adminSecret": adminSecret,
            "database": database,
            "username": username,
            "password": password,
            "port": port,
        ]

        let apiHeaders: [String: String] = [
            "X-Appwrite-Project": client.config["project"] ?? "",
            "accept": "application/json",
        ]

        let converter: (Any) throws -> AppwriteModels.MigrationReport = { response in
            return AppwriteModels.MigrationReport.from(map: response as! [String: Any])
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
    /// Migrate data from a Supabase project to your Appwrite project. This
    /// endpoint allows you to migrate resources like authentication, databases,
    /// and other supported services from a Supabase project.
    ///
    /// - Parameters:
    ///   - resources: [AppwriteEnums.SupabaseMigrationResource]
    ///   - endpoint: String
    ///   - apiKey: String
    ///   - databaseHost: String
    ///   - username: String
    ///   - password: String
    ///   - port: Int (optional)
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.Migration
    ///
    open func createSupabaseMigration(
        resources: [AppwriteEnums.SupabaseMigrationResource],
        endpoint: String,
        apiKey: String,
        databaseHost: String,
        username: String,
        password: String,
        port: Int? = nil
    ) async throws -> AppwriteModels.Migration {
        let apiPath: String = "/migrations/supabase"

        let apiParams: [String: Any?] = [
            "resources": resources.map { $0.rawValue },
            "endpoint": endpoint,
            "apiKey": apiKey,
            "databaseHost": databaseHost,
            "username": username,
            "password": password,
            "port": port,
        ]

        let apiHeaders: [String: String] = [
            "X-Appwrite-Project": client.config["project"] ?? "",
            "content-type": "application/json",
            "accept": "application/json",
        ]

        let converter: (Any) throws -> AppwriteModels.Migration = { response in
            return AppwriteModels.Migration.from(map: response as! [String: Any])
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
    /// Generate a report of the data in a Supabase project before migrating. This
    /// endpoint analyzes the source project and returns information about the
    /// resources that can be migrated.
    ///
    /// - Parameters:
    ///   - resources: [AppwriteEnums.SupabaseMigrationResource]
    ///   - endpoint: String
    ///   - apiKey: String
    ///   - databaseHost: String
    ///   - username: String
    ///   - password: String
    ///   - port: Int (optional)
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.MigrationReport
    ///
    open func getSupabaseReport(
        resources: [AppwriteEnums.SupabaseMigrationResource],
        endpoint: String,
        apiKey: String,
        databaseHost: String,
        username: String,
        password: String,
        port: Int? = nil
    ) async throws -> AppwriteModels.MigrationReport {
        let apiPath: String = "/migrations/supabase/report"

        let apiParams: [String: Any?] = [
            "resources": resources.map { $0.rawValue },
            "endpoint": endpoint,
            "apiKey": apiKey,
            "databaseHost": databaseHost,
            "username": username,
            "password": password,
            "port": port,
        ]

        let apiHeaders: [String: String] = [
            "X-Appwrite-Project": client.config["project"] ?? "",
            "accept": "application/json",
        ]

        let converter: (Any) throws -> AppwriteModels.MigrationReport = { response in
            return AppwriteModels.MigrationReport.from(map: response as! [String: Any])
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
    /// Get a migration by its unique ID. This endpoint returns detailed
    /// information about a specific migration including its current status,
    /// progress, and any errors that occurred during the migration process.
    ///
    /// - Parameters:
    ///   - migrationId: String
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.Migration
    ///
    open func get(
        migrationId: String
    ) async throws -> AppwriteModels.Migration {
        if migrationId.isEmpty {
            throw AppwriteError(message: "Missing required parameter: \"migrationId\"")
        }

        let apiPath: String = "/migrations/{migrationId}"
            .replacingOccurrences(of: "{migrationId}", with: try Client.encodePath(migrationId))

        let apiParams: [String: Any] = [:]

        let apiHeaders: [String: String] = [
            "X-Appwrite-Project": client.config["project"] ?? "",
            "accept": "application/json",
        ]

        let converter: (Any) throws -> AppwriteModels.Migration = { response in
            return AppwriteModels.Migration.from(map: response as! [String: Any])
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
    /// Retry a failed migration. This endpoint allows you to retry a migration
    /// that has previously failed.
    ///
    /// - Parameters:
    ///   - migrationId: String
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.Migration
    ///
    open func retry(
        migrationId: String
    ) async throws -> AppwriteModels.Migration {
        if migrationId.isEmpty {
            throw AppwriteError(message: "Missing required parameter: \"migrationId\"")
        }

        let apiPath: String = "/migrations/{migrationId}"
            .replacingOccurrences(of: "{migrationId}", with: try Client.encodePath(migrationId))

        let apiParams: [String: Any] = [:]

        let apiHeaders: [String: String] = [
            "X-Appwrite-Project": client.config["project"] ?? "",
            "content-type": "application/json",
            "accept": "application/json",
        ]

        let converter: (Any) throws -> AppwriteModels.Migration = { response in
            return AppwriteModels.Migration.from(map: response as! [String: Any])
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
    /// Delete a migration by its unique ID. This endpoint allows you to remove a
    /// migration from your project's migration history.
    ///
    /// - Parameters:
    ///   - migrationId: String
    /// - Throws: Exception if the request fails
    /// - Returns: Any
    ///
    open func delete(
        migrationId: String
    ) async throws -> Any {
        if migrationId.isEmpty {
            throw AppwriteError(message: "Missing required parameter: \"migrationId\"")
        }

        let apiPath: String = "/migrations/{migrationId}"
            .replacingOccurrences(of: "{migrationId}", with: try Client.encodePath(migrationId))

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
}
