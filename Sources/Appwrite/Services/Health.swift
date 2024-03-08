import AsyncHTTPClient
import Foundation
import NIO
import JSONCodable
import AppwriteEnums
import AppwriteModels

/// The Health service allows you to both validate and monitor your Appwrite server&#039;s health.
open class Health: Service {

    ///
    /// Get HTTP
    ///
    /// Check the Appwrite HTTP server is up and responsive.
    ///
    /// @throws Exception
    /// @return array
    ///
    open func get(
    ) async throws -> AppwriteModels.HealthStatus {
        let apiPath: String = "/health"

        let apiParams: [String: Any] = [:]

        let apiHeaders: [String: String] = [
            "content-type": "application/json"
        ]

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
    /// Get antivirus
    ///
    /// Check the Appwrite Antivirus server is up and connection is successful.
    ///
    /// @throws Exception
    /// @return array
    ///
    open func getAntivirus(
    ) async throws -> AppwriteModels.HealthAntivirus {
        let apiPath: String = "/health/anti-virus"

        let apiParams: [String: Any] = [:]

        let apiHeaders: [String: String] = [
            "content-type": "application/json"
        ]

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
    /// Get cache
    ///
    /// Check the Appwrite in-memory cache servers are up and connection is
    /// successful.
    ///
    /// @throws Exception
    /// @return array
    ///
    open func getCache(
    ) async throws -> AppwriteModels.HealthStatus {
        let apiPath: String = "/health/cache"

        let apiParams: [String: Any] = [:]

        let apiHeaders: [String: String] = [
            "content-type": "application/json"
        ]

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
    /// Get the SSL certificate for a domain
    ///
    /// @param String domain
    /// @throws Exception
    /// @return array
    ///
    open func getCertificate(
        domain: String? = nil
    ) async throws -> AppwriteModels.HealthCertificate {
        let apiPath: String = "/health/certificate"

        let apiParams: [String: Any?] = [
            "domain": domain
        ]

        let apiHeaders: [String: String] = [
            "content-type": "application/json"
        ]

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
    /// Get DB
    ///
    /// Check the Appwrite database servers are up and connection is successful.
    ///
    /// @throws Exception
    /// @return array
    ///
    open func getDB(
    ) async throws -> AppwriteModels.HealthStatus {
        let apiPath: String = "/health/db"

        let apiParams: [String: Any] = [:]

        let apiHeaders: [String: String] = [
            "content-type": "application/json"
        ]

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
    /// Get pubsub
    ///
    /// Check the Appwrite pub-sub servers are up and connection is successful.
    ///
    /// @throws Exception
    /// @return array
    ///
    open func getPubSub(
    ) async throws -> AppwriteModels.HealthStatus {
        let apiPath: String = "/health/pubsub"

        let apiParams: [String: Any] = [:]

        let apiHeaders: [String: String] = [
            "content-type": "application/json"
        ]

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
    /// Get queue
    ///
    /// Check the Appwrite queue messaging servers are up and connection is
    /// successful.
    ///
    /// @throws Exception
    /// @return array
    ///
    open func getQueue(
    ) async throws -> AppwriteModels.HealthStatus {
        let apiPath: String = "/health/queue"

        let apiParams: [String: Any] = [:]

        let apiHeaders: [String: String] = [
            "content-type": "application/json"
        ]

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
    /// Get builds queue
    ///
    /// Get the number of builds that are waiting to be processed in the Appwrite
    /// internal queue server.
    ///
    /// @param Int threshold
    /// @throws Exception
    /// @return array
    ///
    open func getQueueBuilds(
        threshold: Int? = nil
    ) async throws -> AppwriteModels.HealthQueue {
        let apiPath: String = "/health/queue/builds"

        let apiParams: [String: Any?] = [
            "threshold": threshold
        ]

        let apiHeaders: [String: String] = [
            "content-type": "application/json"
        ]

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
    /// Get certificates queue
    ///
    /// Get the number of certificates that are waiting to be issued against
    /// [Letsencrypt](https://letsencrypt.org/) in the Appwrite internal queue
    /// server.
    ///
    /// @param Int threshold
    /// @throws Exception
    /// @return array
    ///
    open func getQueueCertificates(
        threshold: Int? = nil
    ) async throws -> AppwriteModels.HealthQueue {
        let apiPath: String = "/health/queue/certificates"

        let apiParams: [String: Any?] = [
            "threshold": threshold
        ]

        let apiHeaders: [String: String] = [
            "content-type": "application/json"
        ]

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
    /// Get databases queue
    ///
    /// Get the number of database changes that are waiting to be processed in the
    /// Appwrite internal queue server.
    ///
    /// @param String name
    /// @param Int threshold
    /// @throws Exception
    /// @return array
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

        let apiHeaders: [String: String] = [
            "content-type": "application/json"
        ]

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
    /// Get deletes queue
    ///
    /// Get the number of background destructive changes that are waiting to be
    /// processed in the Appwrite internal queue server.
    ///
    /// @param Int threshold
    /// @throws Exception
    /// @return array
    ///
    open func getQueueDeletes(
        threshold: Int? = nil
    ) async throws -> AppwriteModels.HealthQueue {
        let apiPath: String = "/health/queue/deletes"

        let apiParams: [String: Any?] = [
            "threshold": threshold
        ]

        let apiHeaders: [String: String] = [
            "content-type": "application/json"
        ]

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
    /// Get number of failed queue jobs
    ///
    /// Returns the amount of failed jobs in a given queue.
    /// 
    ///
    /// @param AppwriteEnums.Name name
    /// @param Int threshold
    /// @throws Exception
    /// @return array
    ///
    open func getFailedJobs(
        name: AppwriteEnums.Name,
        threshold: Int? = nil
    ) async throws -> AppwriteModels.HealthQueue {
        let apiPath: String = "/health/queue/failed/{name}"
            .replacingOccurrences(of: "{name}", with: name.rawValue)

        let apiParams: [String: Any?] = [
            "threshold": threshold
        ]

        let apiHeaders: [String: String] = [
            "content-type": "application/json"
        ]

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
    /// Get functions queue
    ///
    /// Get the number of function executions that are waiting to be processed in
    /// the Appwrite internal queue server.
    ///
    /// @param Int threshold
    /// @throws Exception
    /// @return array
    ///
    open func getQueueFunctions(
        threshold: Int? = nil
    ) async throws -> AppwriteModels.HealthQueue {
        let apiPath: String = "/health/queue/functions"

        let apiParams: [String: Any?] = [
            "threshold": threshold
        ]

        let apiHeaders: [String: String] = [
            "content-type": "application/json"
        ]

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
    /// Get logs queue
    ///
    /// Get the number of logs that are waiting to be processed in the Appwrite
    /// internal queue server.
    ///
    /// @param Int threshold
    /// @throws Exception
    /// @return array
    ///
    open func getQueueLogs(
        threshold: Int? = nil
    ) async throws -> AppwriteModels.HealthQueue {
        let apiPath: String = "/health/queue/logs"

        let apiParams: [String: Any?] = [
            "threshold": threshold
        ]

        let apiHeaders: [String: String] = [
            "content-type": "application/json"
        ]

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
    /// Get mails queue
    ///
    /// Get the number of mails that are waiting to be processed in the Appwrite
    /// internal queue server.
    ///
    /// @param Int threshold
    /// @throws Exception
    /// @return array
    ///
    open func getQueueMails(
        threshold: Int? = nil
    ) async throws -> AppwriteModels.HealthQueue {
        let apiPath: String = "/health/queue/mails"

        let apiParams: [String: Any?] = [
            "threshold": threshold
        ]

        let apiHeaders: [String: String] = [
            "content-type": "application/json"
        ]

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
    /// Get messaging queue
    ///
    /// Get the number of messages that are waiting to be processed in the Appwrite
    /// internal queue server.
    ///
    /// @param Int threshold
    /// @throws Exception
    /// @return array
    ///
    open func getQueueMessaging(
        threshold: Int? = nil
    ) async throws -> AppwriteModels.HealthQueue {
        let apiPath: String = "/health/queue/messaging"

        let apiParams: [String: Any?] = [
            "threshold": threshold
        ]

        let apiHeaders: [String: String] = [
            "content-type": "application/json"
        ]

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
    /// Get migrations queue
    ///
    /// Get the number of migrations that are waiting to be processed in the
    /// Appwrite internal queue server.
    ///
    /// @param Int threshold
    /// @throws Exception
    /// @return array
    ///
    open func getQueueMigrations(
        threshold: Int? = nil
    ) async throws -> AppwriteModels.HealthQueue {
        let apiPath: String = "/health/queue/migrations"

        let apiParams: [String: Any?] = [
            "threshold": threshold
        ]

        let apiHeaders: [String: String] = [
            "content-type": "application/json"
        ]

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
    /// Get usage queue
    ///
    /// Get the number of metrics that are waiting to be processed in the Appwrite
    /// internal queue server.
    ///
    /// @param Int threshold
    /// @throws Exception
    /// @return array
    ///
    open func getQueueUsage(
        threshold: Int? = nil
    ) async throws -> AppwriteModels.HealthQueue {
        let apiPath: String = "/health/queue/usage"

        let apiParams: [String: Any?] = [
            "threshold": threshold
        ]

        let apiHeaders: [String: String] = [
            "content-type": "application/json"
        ]

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
    /// Get usage dump queue
    ///
    /// Get the number of projects containing metrics that are waiting to be
    /// processed in the Appwrite internal queue server.
    ///
    /// @param Int threshold
    /// @throws Exception
    /// @return array
    ///
    open func getQueueUsageDump(
        threshold: Int? = nil
    ) async throws -> AppwriteModels.HealthQueue {
        let apiPath: String = "/health/queue/usage-dump"

        let apiParams: [String: Any?] = [
            "threshold": threshold
        ]

        let apiHeaders: [String: String] = [
            "content-type": "application/json"
        ]

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
    /// Get webhooks queue
    ///
    /// Get the number of webhooks that are waiting to be processed in the Appwrite
    /// internal queue server.
    ///
    /// @param Int threshold
    /// @throws Exception
    /// @return array
    ///
    open func getQueueWebhooks(
        threshold: Int? = nil
    ) async throws -> AppwriteModels.HealthQueue {
        let apiPath: String = "/health/queue/webhooks"

        let apiParams: [String: Any?] = [
            "threshold": threshold
        ]

        let apiHeaders: [String: String] = [
            "content-type": "application/json"
        ]

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
    /// Get storage
    ///
    /// Check the Appwrite storage device is up and connection is successful.
    ///
    /// @throws Exception
    /// @return array
    ///
    open func getStorage(
    ) async throws -> AppwriteModels.HealthStatus {
        let apiPath: String = "/health/storage"

        let apiParams: [String: Any] = [:]

        let apiHeaders: [String: String] = [
            "content-type": "application/json"
        ]

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
    /// Get local storage
    ///
    /// Check the Appwrite local storage device is up and connection is successful.
    ///
    /// @throws Exception
    /// @return array
    ///
    open func getStorageLocal(
    ) async throws -> AppwriteModels.HealthStatus {
        let apiPath: String = "/health/storage/local"

        let apiParams: [String: Any] = [:]

        let apiHeaders: [String: String] = [
            "content-type": "application/json"
        ]

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
    /// Get time
    ///
    /// Check the Appwrite server time is synced with Google remote NTP server. We
    /// use this technology to smoothly handle leap seconds with no disruptive
    /// events. The [Network Time
    /// Protocol](https://en.wikipedia.org/wiki/Network_Time_Protocol) (NTP) is
    /// used by hundreds of millions of computers and devices to synchronize their
    /// clocks over the Internet. If your computer sets its own clock, it likely
    /// uses NTP.
    ///
    /// @throws Exception
    /// @return array
    ///
    open func getTime(
    ) async throws -> AppwriteModels.HealthTime {
        let apiPath: String = "/health/time"

        let apiParams: [String: Any] = [:]

        let apiHeaders: [String: String] = [
            "content-type": "application/json"
        ]

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