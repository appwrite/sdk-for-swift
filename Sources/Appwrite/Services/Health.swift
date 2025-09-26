import AsyncHTTPClient
import Foundation
import NIO
import JSONCodable
import AppwriteEnums
import AppwriteModels

/// The Health service allows you to both validate and monitor your Appwrite server&#039;s health.
open class Health: Service {

    ///
    /// Check the Appwrite HTTP server is up and responsive.
    ///
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.HealthStatus
    ///
    open func get(
    ) async throws -> AppwriteModels.HealthStatus {
        let apiPath: String = "/health"

        let apiParams: [String: Any] = [:]

        let apiHeaders: [String: String] = [:]

        let converter: (Any) -> AppwriteModels.HealthStatus = { response in
            return AppwriteModels.HealthStatus.from(map: response as! [String: Any])
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
    /// Check the Appwrite Antivirus server is up and connection is successful.
    ///
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.HealthAntivirus
    ///
    open func getAntivirus(
    ) async throws -> AppwriteModels.HealthAntivirus {
        let apiPath: String = "/health/anti-virus"

        let apiParams: [String: Any] = [:]

        let apiHeaders: [String: String] = [:]

        let converter: (Any) -> AppwriteModels.HealthAntivirus = { response in
            return AppwriteModels.HealthAntivirus.from(map: response as! [String: Any])
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
    /// Check the Appwrite in-memory cache servers are up and connection is
    /// successful.
    ///
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.HealthStatus
    ///
    open func getCache(
    ) async throws -> AppwriteModels.HealthStatus {
        let apiPath: String = "/health/cache"

        let apiParams: [String: Any] = [:]

        let apiHeaders: [String: String] = [:]

        let converter: (Any) -> AppwriteModels.HealthStatus = { response in
            return AppwriteModels.HealthStatus.from(map: response as! [String: Any])
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
    /// Get the SSL certificate for a domain
    ///
    /// - Parameters:
    ///   - domain: String (optional)
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.HealthCertificate
    ///
    open func getCertificate(
        domain: String? = nil
    ) async throws -> AppwriteModels.HealthCertificate {
        let apiPath: String = "/health/certificate"

        let apiParams: [String: Any?] = [
            "domain": domain
        ]

        let apiHeaders: [String: String] = [:]

        let converter: (Any) -> AppwriteModels.HealthCertificate = { response in
            return AppwriteModels.HealthCertificate.from(map: response as! [String: Any])
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
    /// Check the Appwrite database servers are up and connection is successful.
    ///
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.HealthStatus
    ///
    open func getDB(
    ) async throws -> AppwriteModels.HealthStatus {
        let apiPath: String = "/health/db"

        let apiParams: [String: Any] = [:]

        let apiHeaders: [String: String] = [:]

        let converter: (Any) -> AppwriteModels.HealthStatus = { response in
            return AppwriteModels.HealthStatus.from(map: response as! [String: Any])
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
    /// Check the Appwrite pub-sub servers are up and connection is successful.
    ///
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.HealthStatus
    ///
    open func getPubSub(
    ) async throws -> AppwriteModels.HealthStatus {
        let apiPath: String = "/health/pubsub"

        let apiParams: [String: Any] = [:]

        let apiHeaders: [String: String] = [:]

        let converter: (Any) -> AppwriteModels.HealthStatus = { response in
            return AppwriteModels.HealthStatus.from(map: response as! [String: Any])
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
    /// Get the number of builds that are waiting to be processed in the Appwrite
    /// internal queue server.
    ///
    /// - Parameters:
    ///   - threshold: Int (optional)
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.HealthQueue
    ///
    open func getQueueBuilds(
        threshold: Int? = nil
    ) async throws -> AppwriteModels.HealthQueue {
        let apiPath: String = "/health/queue/builds"

        let apiParams: [String: Any?] = [
            "threshold": threshold
        ]

        let apiHeaders: [String: String] = [:]

        let converter: (Any) -> AppwriteModels.HealthQueue = { response in
            return AppwriteModels.HealthQueue.from(map: response as! [String: Any])
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
    /// Get the number of certificates that are waiting to be issued against
    /// [Letsencrypt](https://letsencrypt.org/) in the Appwrite internal queue
    /// server.
    ///
    /// - Parameters:
    ///   - threshold: Int (optional)
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.HealthQueue
    ///
    open func getQueueCertificates(
        threshold: Int? = nil
    ) async throws -> AppwriteModels.HealthQueue {
        let apiPath: String = "/health/queue/certificates"

        let apiParams: [String: Any?] = [
            "threshold": threshold
        ]

        let apiHeaders: [String: String] = [:]

        let converter: (Any) -> AppwriteModels.HealthQueue = { response in
            return AppwriteModels.HealthQueue.from(map: response as! [String: Any])
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
    /// Get the number of database changes that are waiting to be processed in the
    /// Appwrite internal queue server.
    ///
    /// - Parameters:
    ///   - name: String (optional)
    ///   - threshold: Int (optional)
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.HealthQueue
    ///
    open func getQueueDatabases(
        name: String? = nil,
        threshold: Int? = nil
    ) async throws -> AppwriteModels.HealthQueue {
        let apiPath: String = "/health/queue/databases"

        let apiParams: [String: Any?] = [
            "name": name,
            "threshold": threshold
        ]

        let apiHeaders: [String: String] = [:]

        let converter: (Any) -> AppwriteModels.HealthQueue = { response in
            return AppwriteModels.HealthQueue.from(map: response as! [String: Any])
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
    /// Get the number of background destructive changes that are waiting to be
    /// processed in the Appwrite internal queue server.
    ///
    /// - Parameters:
    ///   - threshold: Int (optional)
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.HealthQueue
    ///
    open func getQueueDeletes(
        threshold: Int? = nil
    ) async throws -> AppwriteModels.HealthQueue {
        let apiPath: String = "/health/queue/deletes"

        let apiParams: [String: Any?] = [
            "threshold": threshold
        ]

        let apiHeaders: [String: String] = [:]

        let converter: (Any) -> AppwriteModels.HealthQueue = { response in
            return AppwriteModels.HealthQueue.from(map: response as! [String: Any])
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
    /// Returns the amount of failed jobs in a given queue.
    /// 
    ///
    /// - Parameters:
    ///   - name: Name
    ///   - threshold: Int (optional)
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.HealthQueue
    ///
    open func getFailedJobs(
        name: Name,
        threshold: Int? = nil
    ) async throws -> AppwriteModels.HealthQueue {
        let apiPath: String = "/health/queue/failed/{name}"
            .replacingOccurrences(of: "{name}", with: name.rawValue)

        let apiParams: [String: Any?] = [
            "threshold": threshold
        ]

        let apiHeaders: [String: String] = [:]

        let converter: (Any) -> AppwriteModels.HealthQueue = { response in
            return AppwriteModels.HealthQueue.from(map: response as! [String: Any])
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
    /// Get the number of function executions that are waiting to be processed in
    /// the Appwrite internal queue server.
    ///
    /// - Parameters:
    ///   - threshold: Int (optional)
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.HealthQueue
    ///
    open func getQueueFunctions(
        threshold: Int? = nil
    ) async throws -> AppwriteModels.HealthQueue {
        let apiPath: String = "/health/queue/functions"

        let apiParams: [String: Any?] = [
            "threshold": threshold
        ]

        let apiHeaders: [String: String] = [:]

        let converter: (Any) -> AppwriteModels.HealthQueue = { response in
            return AppwriteModels.HealthQueue.from(map: response as! [String: Any])
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
    /// Get the number of logs that are waiting to be processed in the Appwrite
    /// internal queue server.
    ///
    /// - Parameters:
    ///   - threshold: Int (optional)
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.HealthQueue
    ///
    open func getQueueLogs(
        threshold: Int? = nil
    ) async throws -> AppwriteModels.HealthQueue {
        let apiPath: String = "/health/queue/logs"

        let apiParams: [String: Any?] = [
            "threshold": threshold
        ]

        let apiHeaders: [String: String] = [:]

        let converter: (Any) -> AppwriteModels.HealthQueue = { response in
            return AppwriteModels.HealthQueue.from(map: response as! [String: Any])
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
    /// Get the number of mails that are waiting to be processed in the Appwrite
    /// internal queue server.
    ///
    /// - Parameters:
    ///   - threshold: Int (optional)
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.HealthQueue
    ///
    open func getQueueMails(
        threshold: Int? = nil
    ) async throws -> AppwriteModels.HealthQueue {
        let apiPath: String = "/health/queue/mails"

        let apiParams: [String: Any?] = [
            "threshold": threshold
        ]

        let apiHeaders: [String: String] = [:]

        let converter: (Any) -> AppwriteModels.HealthQueue = { response in
            return AppwriteModels.HealthQueue.from(map: response as! [String: Any])
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
    /// Get the number of messages that are waiting to be processed in the Appwrite
    /// internal queue server.
    ///
    /// - Parameters:
    ///   - threshold: Int (optional)
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.HealthQueue
    ///
    open func getQueueMessaging(
        threshold: Int? = nil
    ) async throws -> AppwriteModels.HealthQueue {
        let apiPath: String = "/health/queue/messaging"

        let apiParams: [String: Any?] = [
            "threshold": threshold
        ]

        let apiHeaders: [String: String] = [:]

        let converter: (Any) -> AppwriteModels.HealthQueue = { response in
            return AppwriteModels.HealthQueue.from(map: response as! [String: Any])
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
    /// Get the number of migrations that are waiting to be processed in the
    /// Appwrite internal queue server.
    ///
    /// - Parameters:
    ///   - threshold: Int (optional)
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.HealthQueue
    ///
    open func getQueueMigrations(
        threshold: Int? = nil
    ) async throws -> AppwriteModels.HealthQueue {
        let apiPath: String = "/health/queue/migrations"

        let apiParams: [String: Any?] = [
            "threshold": threshold
        ]

        let apiHeaders: [String: String] = [:]

        let converter: (Any) -> AppwriteModels.HealthQueue = { response in
            return AppwriteModels.HealthQueue.from(map: response as! [String: Any])
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
    /// Get the number of metrics that are waiting to be processed in the Appwrite
    /// stats resources queue.
    ///
    /// - Parameters:
    ///   - threshold: Int (optional)
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.HealthQueue
    ///
    open func getQueueStatsResources(
        threshold: Int? = nil
    ) async throws -> AppwriteModels.HealthQueue {
        let apiPath: String = "/health/queue/stats-resources"

        let apiParams: [String: Any?] = [
            "threshold": threshold
        ]

        let apiHeaders: [String: String] = [:]

        let converter: (Any) -> AppwriteModels.HealthQueue = { response in
            return AppwriteModels.HealthQueue.from(map: response as! [String: Any])
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
    /// Get the number of metrics that are waiting to be processed in the Appwrite
    /// internal queue server.
    ///
    /// - Parameters:
    ///   - threshold: Int (optional)
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.HealthQueue
    ///
    open func getQueueUsage(
        threshold: Int? = nil
    ) async throws -> AppwriteModels.HealthQueue {
        let apiPath: String = "/health/queue/stats-usage"

        let apiParams: [String: Any?] = [
            "threshold": threshold
        ]

        let apiHeaders: [String: String] = [:]

        let converter: (Any) -> AppwriteModels.HealthQueue = { response in
            return AppwriteModels.HealthQueue.from(map: response as! [String: Any])
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
    /// Get the number of webhooks that are waiting to be processed in the Appwrite
    /// internal queue server.
    ///
    /// - Parameters:
    ///   - threshold: Int (optional)
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.HealthQueue
    ///
    open func getQueueWebhooks(
        threshold: Int? = nil
    ) async throws -> AppwriteModels.HealthQueue {
        let apiPath: String = "/health/queue/webhooks"

        let apiParams: [String: Any?] = [
            "threshold": threshold
        ]

        let apiHeaders: [String: String] = [:]

        let converter: (Any) -> AppwriteModels.HealthQueue = { response in
            return AppwriteModels.HealthQueue.from(map: response as! [String: Any])
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
    /// Check the Appwrite storage device is up and connection is successful.
    ///
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.HealthStatus
    ///
    open func getStorage(
    ) async throws -> AppwriteModels.HealthStatus {
        let apiPath: String = "/health/storage"

        let apiParams: [String: Any] = [:]

        let apiHeaders: [String: String] = [:]

        let converter: (Any) -> AppwriteModels.HealthStatus = { response in
            return AppwriteModels.HealthStatus.from(map: response as! [String: Any])
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
    /// Check the Appwrite local storage device is up and connection is successful.
    ///
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.HealthStatus
    ///
    open func getStorageLocal(
    ) async throws -> AppwriteModels.HealthStatus {
        let apiPath: String = "/health/storage/local"

        let apiParams: [String: Any] = [:]

        let apiHeaders: [String: String] = [:]

        let converter: (Any) -> AppwriteModels.HealthStatus = { response in
            return AppwriteModels.HealthStatus.from(map: response as! [String: Any])
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
    /// Check the Appwrite server time is synced with Google remote NTP server. We
    /// use this technology to smoothly handle leap seconds with no disruptive
    /// events. The [Network Time
    /// Protocol](https://en.wikipedia.org/wiki/Network_Time_Protocol) (NTP) is
    /// used by hundreds of millions of computers and devices to synchronize their
    /// clocks over the Internet. If your computer sets its own clock, it likely
    /// uses NTP.
    ///
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.HealthTime
    ///
    open func getTime(
    ) async throws -> AppwriteModels.HealthTime {
        let apiPath: String = "/health/time"

        let apiParams: [String: Any] = [:]

        let apiHeaders: [String: String] = [:]

        let converter: (Any) -> AppwriteModels.HealthTime = { response in
            return AppwriteModels.HealthTime.from(map: response as! [String: Any])
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