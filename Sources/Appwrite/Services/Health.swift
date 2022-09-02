import AsyncHTTPClient
import Foundation
import NIO
import AppwriteModels

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
        let path: String = "/health"
        let params: [String: Any?] = [:]

        let headers: [String: String] = [
            "content-type": "application/json"
        ]
        let converter: ([String: Any]) -> AppwriteModels.HealthStatus = { dict in
            return AppwriteModels.HealthStatus.from(map: dict)
        }
        return try await client.call(
            method: "GET",
            path: path,
            headers: headers,
            params: params,
            converter: converter
        )
    }

    ///
    /// Get Antivirus
    ///
    /// Check the Appwrite Antivirus server is up and connection is successful.
    ///
    /// @throws Exception
    /// @return array
    ///
    open func getAntivirus(
    ) async throws -> AppwriteModels.HealthAntivirus {
        let path: String = "/health/anti-virus"
        let params: [String: Any?] = [:]

        let headers: [String: String] = [
            "content-type": "application/json"
        ]
        let converter: ([String: Any]) -> AppwriteModels.HealthAntivirus = { dict in
            return AppwriteModels.HealthAntivirus.from(map: dict)
        }
        return try await client.call(
            method: "GET",
            path: path,
            headers: headers,
            params: params,
            converter: converter
        )
    }

    ///
    /// Get Cache
    ///
    /// Check the Appwrite in-memory cache server is up and connection is
    /// successful.
    ///
    /// @throws Exception
    /// @return array
    ///
    open func getCache(
    ) async throws -> AppwriteModels.HealthStatus {
        let path: String = "/health/cache"
        let params: [String: Any?] = [:]

        let headers: [String: String] = [
            "content-type": "application/json"
        ]
        let converter: ([String: Any]) -> AppwriteModels.HealthStatus = { dict in
            return AppwriteModels.HealthStatus.from(map: dict)
        }
        return try await client.call(
            method: "GET",
            path: path,
            headers: headers,
            params: params,
            converter: converter
        )
    }

    ///
    /// Get DB
    ///
    /// Check the Appwrite database server is up and connection is successful.
    ///
    /// @throws Exception
    /// @return array
    ///
    open func getDB(
    ) async throws -> AppwriteModels.HealthStatus {
        let path: String = "/health/db"
        let params: [String: Any?] = [:]

        let headers: [String: String] = [
            "content-type": "application/json"
        ]
        let converter: ([String: Any]) -> AppwriteModels.HealthStatus = { dict in
            return AppwriteModels.HealthStatus.from(map: dict)
        }
        return try await client.call(
            method: "GET",
            path: path,
            headers: headers,
            params: params,
            converter: converter
        )
    }

    ///
    /// Get Certificates Queue
    ///
    /// Get the number of certificates that are waiting to be issued against
    /// [Letsencrypt](https://letsencrypt.org/) in the Appwrite internal queue
    /// server.
    ///
    /// @throws Exception
    /// @return array
    ///
    open func getQueueCertificates(
    ) async throws -> AppwriteModels.HealthQueue {
        let path: String = "/health/queue/certificates"
        let params: [String: Any?] = [:]

        let headers: [String: String] = [
            "content-type": "application/json"
        ]
        let converter: ([String: Any]) -> AppwriteModels.HealthQueue = { dict in
            return AppwriteModels.HealthQueue.from(map: dict)
        }
        return try await client.call(
            method: "GET",
            path: path,
            headers: headers,
            params: params,
            converter: converter
        )
    }

    ///
    /// Get Functions Queue
    ///
    /// @throws Exception
    /// @return array
    ///
    open func getQueueFunctions(
    ) async throws -> AppwriteModels.HealthQueue {
        let path: String = "/health/queue/functions"
        let params: [String: Any?] = [:]

        let headers: [String: String] = [
            "content-type": "application/json"
        ]
        let converter: ([String: Any]) -> AppwriteModels.HealthQueue = { dict in
            return AppwriteModels.HealthQueue.from(map: dict)
        }
        return try await client.call(
            method: "GET",
            path: path,
            headers: headers,
            params: params,
            converter: converter
        )
    }

    ///
    /// Get Logs Queue
    ///
    /// Get the number of logs that are waiting to be processed in the Appwrite
    /// internal queue server.
    ///
    /// @throws Exception
    /// @return array
    ///
    open func getQueueLogs(
    ) async throws -> AppwriteModels.HealthQueue {
        let path: String = "/health/queue/logs"
        let params: [String: Any?] = [:]

        let headers: [String: String] = [
            "content-type": "application/json"
        ]
        let converter: ([String: Any]) -> AppwriteModels.HealthQueue = { dict in
            return AppwriteModels.HealthQueue.from(map: dict)
        }
        return try await client.call(
            method: "GET",
            path: path,
            headers: headers,
            params: params,
            converter: converter
        )
    }

    ///
    /// Get Webhooks Queue
    ///
    /// Get the number of webhooks that are waiting to be processed in the Appwrite
    /// internal queue server.
    ///
    /// @throws Exception
    /// @return array
    ///
    open func getQueueWebhooks(
    ) async throws -> AppwriteModels.HealthQueue {
        let path: String = "/health/queue/webhooks"
        let params: [String: Any?] = [:]

        let headers: [String: String] = [
            "content-type": "application/json"
        ]
        let converter: ([String: Any]) -> AppwriteModels.HealthQueue = { dict in
            return AppwriteModels.HealthQueue.from(map: dict)
        }
        return try await client.call(
            method: "GET",
            path: path,
            headers: headers,
            params: params,
            converter: converter
        )
    }

    ///
    /// Get Local Storage
    ///
    /// Check the Appwrite local storage device is up and connection is successful.
    ///
    /// @throws Exception
    /// @return array
    ///
    open func getStorageLocal(
    ) async throws -> AppwriteModels.HealthStatus {
        let path: String = "/health/storage/local"
        let params: [String: Any?] = [:]

        let headers: [String: String] = [
            "content-type": "application/json"
        ]
        let converter: ([String: Any]) -> AppwriteModels.HealthStatus = { dict in
            return AppwriteModels.HealthStatus.from(map: dict)
        }
        return try await client.call(
            method: "GET",
            path: path,
            headers: headers,
            params: params,
            converter: converter
        )
    }

    ///
    /// Get Time
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
        let path: String = "/health/time"
        let params: [String: Any?] = [:]

        let headers: [String: String] = [
            "content-type": "application/json"
        ]
        let converter: ([String: Any]) -> AppwriteModels.HealthTime = { dict in
            return AppwriteModels.HealthTime.from(map: dict)
        }
        return try await client.call(
            method: "GET",
            path: path,
            headers: headers,
            params: params,
            converter: converter
        )
    }


    ///
    /// Get HTTP
    ///
    /// Check the Appwrite HTTP server is up and responsive.
    ///
    /// @throws Exception
    /// @return array
    ///
    @available(*, deprecated, message: "Use the async overload instead")
    open func get(
        completion: ((Result<AppwriteModels.HealthStatus, AppwriteError>) -> Void)? = nil
    ) {
        Task {
            do {
                let result = try await get(
                )
                completion?(.success(result))
            } catch {
                completion?(.failure(error as! AppwriteError))
            }
        }
    }

    ///
    /// Get Antivirus
    ///
    /// Check the Appwrite Antivirus server is up and connection is successful.
    ///
    /// @throws Exception
    /// @return array
    ///
    @available(*, deprecated, message: "Use the async overload instead")
    open func getAntivirus(
        completion: ((Result<AppwriteModels.HealthAntivirus, AppwriteError>) -> Void)? = nil
    ) {
        Task {
            do {
                let result = try await getAntivirus(
                )
                completion?(.success(result))
            } catch {
                completion?(.failure(error as! AppwriteError))
            }
        }
    }

    ///
    /// Get Cache
    ///
    /// Check the Appwrite in-memory cache server is up and connection is
    /// successful.
    ///
    /// @throws Exception
    /// @return array
    ///
    @available(*, deprecated, message: "Use the async overload instead")
    open func getCache(
        completion: ((Result<AppwriteModels.HealthStatus, AppwriteError>) -> Void)? = nil
    ) {
        Task {
            do {
                let result = try await getCache(
                )
                completion?(.success(result))
            } catch {
                completion?(.failure(error as! AppwriteError))
            }
        }
    }

    ///
    /// Get DB
    ///
    /// Check the Appwrite database server is up and connection is successful.
    ///
    /// @throws Exception
    /// @return array
    ///
    @available(*, deprecated, message: "Use the async overload instead")
    open func getDB(
        completion: ((Result<AppwriteModels.HealthStatus, AppwriteError>) -> Void)? = nil
    ) {
        Task {
            do {
                let result = try await getDB(
                )
                completion?(.success(result))
            } catch {
                completion?(.failure(error as! AppwriteError))
            }
        }
    }

    ///
    /// Get Certificates Queue
    ///
    /// Get the number of certificates that are waiting to be issued against
    /// [Letsencrypt](https://letsencrypt.org/) in the Appwrite internal queue
    /// server.
    ///
    /// @throws Exception
    /// @return array
    ///
    @available(*, deprecated, message: "Use the async overload instead")
    open func getQueueCertificates(
        completion: ((Result<AppwriteModels.HealthQueue, AppwriteError>) -> Void)? = nil
    ) {
        Task {
            do {
                let result = try await getQueueCertificates(
                )
                completion?(.success(result))
            } catch {
                completion?(.failure(error as! AppwriteError))
            }
        }
    }

    ///
    /// Get Functions Queue
    ///
    /// @throws Exception
    /// @return array
    ///
    @available(*, deprecated, message: "Use the async overload instead")
    open func getQueueFunctions(
        completion: ((Result<AppwriteModels.HealthQueue, AppwriteError>) -> Void)? = nil
    ) {
        Task {
            do {
                let result = try await getQueueFunctions(
                )
                completion?(.success(result))
            } catch {
                completion?(.failure(error as! AppwriteError))
            }
        }
    }

    ///
    /// Get Logs Queue
    ///
    /// Get the number of logs that are waiting to be processed in the Appwrite
    /// internal queue server.
    ///
    /// @throws Exception
    /// @return array
    ///
    @available(*, deprecated, message: "Use the async overload instead")
    open func getQueueLogs(
        completion: ((Result<AppwriteModels.HealthQueue, AppwriteError>) -> Void)? = nil
    ) {
        Task {
            do {
                let result = try await getQueueLogs(
                )
                completion?(.success(result))
            } catch {
                completion?(.failure(error as! AppwriteError))
            }
        }
    }

    ///
    /// Get Webhooks Queue
    ///
    /// Get the number of webhooks that are waiting to be processed in the Appwrite
    /// internal queue server.
    ///
    /// @throws Exception
    /// @return array
    ///
    @available(*, deprecated, message: "Use the async overload instead")
    open func getQueueWebhooks(
        completion: ((Result<AppwriteModels.HealthQueue, AppwriteError>) -> Void)? = nil
    ) {
        Task {
            do {
                let result = try await getQueueWebhooks(
                )
                completion?(.success(result))
            } catch {
                completion?(.failure(error as! AppwriteError))
            }
        }
    }

    ///
    /// Get Local Storage
    ///
    /// Check the Appwrite local storage device is up and connection is successful.
    ///
    /// @throws Exception
    /// @return array
    ///
    @available(*, deprecated, message: "Use the async overload instead")
    open func getStorageLocal(
        completion: ((Result<AppwriteModels.HealthStatus, AppwriteError>) -> Void)? = nil
    ) {
        Task {
            do {
                let result = try await getStorageLocal(
                )
                completion?(.success(result))
            } catch {
                completion?(.failure(error as! AppwriteError))
            }
        }
    }

    ///
    /// Get Time
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
    @available(*, deprecated, message: "Use the async overload instead")
    open func getTime(
        completion: ((Result<AppwriteModels.HealthTime, AppwriteError>) -> Void)? = nil
    ) {
        Task {
            do {
                let result = try await getTime(
                )
                completion?(.success(result))
            } catch {
                completion?(.failure(error as! AppwriteError))
            }
        }
    }

}
