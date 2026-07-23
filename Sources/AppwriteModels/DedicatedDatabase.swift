import Foundation
import JSONCodable

/// DedicatedDatabase
open class DedicatedDatabase: Codable {

    enum CodingKeys: String, CodingKey {
        case id = "$id"
        case createdAt = "$createdAt"
        case updatedAt = "$updatedAt"
        case projectId = "projectId"
        case name = "name"
        case api = "api"
        case engine = "engine"
        case version = "version"
        case specification = "specification"
        case backend = "backend"
        case hostname = "hostname"
        case connectionPort = "connectionPort"
        case connectionUser = "connectionUser"
        case connectionPassword = "connectionPassword"
        case connectionString = "connectionString"
        case ssl = "ssl"
        case status = "status"
        case containerStatus = "containerStatus"
        case lastAccessedAt = "lastAccessedAt"
        case idleUntil = "idleUntil"
        case lifecycleState = "lifecycleState"
        case idleTimeoutMinutes = "idleTimeoutMinutes"
        case cpu = "cpu"
        case memory = "memory"
        case storage = "storage"
        case storageClass = "storageClass"
        case storageMaxGb = "storageMaxGb"
        case nodePool = "nodePool"
        case replicas = "replicas"
        case syncMode = "syncMode"
        case crossRegionReplicas = "crossRegionReplicas"
        case networkMaxConnections = "networkMaxConnections"
        case networkIdleTimeoutSeconds = "networkIdleTimeoutSeconds"
        case networkIPAllowlist = "networkIPAllowlist"
        case backupEnabled = "backupEnabled"
        case pitr = "pitr"
        case pitrRetentionDays = "pitrRetentionDays"
        case storageAutoscaling = "storageAutoscaling"
        case storageAutoscalingThresholdPercent = "storageAutoscalingThresholdPercent"
        case storageAutoscalingMaxGb = "storageAutoscalingMaxGb"
        case maintenanceWindowDay = "maintenanceWindowDay"
        case maintenanceWindowHourUtc = "maintenanceWindowHourUtc"
        case metricsEnabled = "metricsEnabled"
        case sqlApiEnabled = "sqlApiEnabled"
        case sqlApiAllowedStatements = "sqlApiAllowedStatements"
        case sqlApiMaxRows = "sqlApiMaxRows"
        case sqlApiMaxBytes = "sqlApiMaxBytes"
        case sqlApiTimeoutSeconds = "sqlApiTimeoutSeconds"
        case error = "error"
    }

    /// Dedicated database ID.
    public let id: String
    /// Database creation time in ISO 8601 format.
    public let createdAt: String
    /// Database update date in ISO 8601 format.
    public let updatedAt: String
    /// Project ID that owns this database.
    public let projectId: String
    /// Database display name.
    public let name: String
    /// Product API that owns this database: tablesdb, documentsdb, vectorsdb, mysql, postgresql, or mongodb.
    public let api: String
    /// Database engine: postgresql, mysql, mariadb, or mongodb.
    public let engine: String
    /// Database engine version.
    public let version: String
    /// Specification identifier.
    public let specification: String
    /// Database backend provider. Possible values: prisma, edge.
    public let backend: String
    /// Database hostname for connections.
    public let hostname: String
    /// Database port for connections.
    public let connectionPort: Int
    /// Database username for connections.
    public let connectionUser: String
    /// Database password for connections.
    public let connectionPassword: String
    /// Full database connection string (URI format).
    public let connectionString: String
    /// Whether SSL/TLS is required for client connections.
    public let ssl: Bool
    /// Database status. Possible values: provisioning, ready, inactive, paused, failed, deleted, restoring, scaling.
    public let status: String
    /// Container status for lifecycle-managed database runtimes: active or inactive.
    public let containerStatus: String
    /// Last activity timestamp in ISO 8601 format.
    public let lastAccessedAt: String?
    /// Display-only timestamp when the database is expected to be considered idle (ISO 8601 format). Derived from last activity; lifecycle transitions are driven by lifecycleState.
    public let idleUntil: String?
    /// Idle-lifecycle state of the database. Possible values: active, warm, cold, hibernated.
    public let lifecycleState: String
    /// Minutes of inactivity before container scales to zero.
    public let idleTimeoutMinutes: Int
    /// CPU allocated in millicores.
    public let cpu: Int
    /// Memory allocated in MB.
    public let memory: Int
    /// Storage allocated in GB.
    public let storage: Int
    /// Storage class. Currently always &#039;ssd&#039;; DigitalOcean exposes a single block-storage class.
    public let storageClass: String
    /// Maximum storage allowed in GB. 0 means use system default.
    public let storageMaxGb: Int
    /// Kubernetes node pool where the database is scheduled.
    public let nodePool: String
    /// Number of high availability replicas. High availability is enabled when greater than 0.
    public let replicas: Int
    /// Replication sync mode: async, sync, or quorum.
    public let syncMode: String
    /// Number of cross-region replicas. Cross-region availability is enabled when greater than 0.
    public let crossRegionReplicas: Int
    /// Maximum concurrent connections.
    public let networkMaxConnections: Int
    /// Connection idle timeout in seconds.
    public let networkIdleTimeoutSeconds: Int
    /// IP addresses/CIDR ranges allowed to connect.
    public let networkIPAllowlist: [String]
    /// Whether automatic backups are enabled.
    public let backupEnabled: Bool
    /// Whether point-in-time recovery is enabled.
    public let pitr: Bool
    /// Number of days to retain PITR data.
    public let pitrRetentionDays: Int
    /// Whether automatic storage expansion is enabled.
    public let storageAutoscaling: Bool
    /// Storage usage percentage that triggers automatic expansion.
    public let storageAutoscalingThresholdPercent: Int
    /// Maximum storage size in GB for autoscaling. 0 means no limit.
    public let storageAutoscalingMaxGb: Int
    /// Day of the week for the maintenance window. Possible values: sun, mon, tue, wed, thu, fri, sat.
    public let maintenanceWindowDay: String
    /// Hour in UTC (0-23) when the maintenance window starts.
    public let maintenanceWindowHourUtc: Int
    /// Whether metrics collection is enabled.
    public let metricsEnabled: Bool
    /// Whether the SQL API sidecar is enabled for this database.
    public let sqlApiEnabled: Bool
    /// Statement types accepted by the SQL API. Defaults to read/write DML only; DDL/DCL types (CREATE, ALTER, DROP, TRUNCATE, GRANT, REVOKE) are opt-in per database. Allowed values: SELECT, INSERT, UPDATE, DELETE, CREATE, ALTER, DROP, TRUNCATE, GRANT, REVOKE.
    public let sqlApiAllowedStatements: [String]
    /// Maximum rows returned per SQL API execution. Results larger than this are truncated.
    public let sqlApiMaxRows: Int
    /// Maximum serialised SQL API result payload in bytes. Results larger than this are truncated.
    public let sqlApiMaxBytes: Int
    /// Maximum server-side SQL API execution time in seconds before the query is cancelled.
    public let sqlApiTimeoutSeconds: Int
    /// Error message if status is failed.
    public let error: String

    init(
        id: String,
        createdAt: String,
        updatedAt: String,
        projectId: String,
        name: String,
        api: String,
        engine: String,
        version: String,
        specification: String,
        backend: String,
        hostname: String,
        connectionPort: Int,
        connectionUser: String,
        connectionPassword: String,
        connectionString: String,
        ssl: Bool,
        status: String,
        containerStatus: String,
        lastAccessedAt: String?,
        idleUntil: String?,
        lifecycleState: String,
        idleTimeoutMinutes: Int,
        cpu: Int,
        memory: Int,
        storage: Int,
        storageClass: String,
        storageMaxGb: Int,
        nodePool: String,
        replicas: Int,
        syncMode: String,
        crossRegionReplicas: Int,
        networkMaxConnections: Int,
        networkIdleTimeoutSeconds: Int,
        networkIPAllowlist: [String],
        backupEnabled: Bool,
        pitr: Bool,
        pitrRetentionDays: Int,
        storageAutoscaling: Bool,
        storageAutoscalingThresholdPercent: Int,
        storageAutoscalingMaxGb: Int,
        maintenanceWindowDay: String,
        maintenanceWindowHourUtc: Int,
        metricsEnabled: Bool,
        sqlApiEnabled: Bool,
        sqlApiAllowedStatements: [String],
        sqlApiMaxRows: Int,
        sqlApiMaxBytes: Int,
        sqlApiTimeoutSeconds: Int,
        error: String
    ) {
        self.id = id
        self.createdAt = createdAt
        self.updatedAt = updatedAt
        self.projectId = projectId
        self.name = name
        self.api = api
        self.engine = engine
        self.version = version
        self.specification = specification
        self.backend = backend
        self.hostname = hostname
        self.connectionPort = connectionPort
        self.connectionUser = connectionUser
        self.connectionPassword = connectionPassword
        self.connectionString = connectionString
        self.ssl = ssl
        self.status = status
        self.containerStatus = containerStatus
        self.lastAccessedAt = lastAccessedAt
        self.idleUntil = idleUntil
        self.lifecycleState = lifecycleState
        self.idleTimeoutMinutes = idleTimeoutMinutes
        self.cpu = cpu
        self.memory = memory
        self.storage = storage
        self.storageClass = storageClass
        self.storageMaxGb = storageMaxGb
        self.nodePool = nodePool
        self.replicas = replicas
        self.syncMode = syncMode
        self.crossRegionReplicas = crossRegionReplicas
        self.networkMaxConnections = networkMaxConnections
        self.networkIdleTimeoutSeconds = networkIdleTimeoutSeconds
        self.networkIPAllowlist = networkIPAllowlist
        self.backupEnabled = backupEnabled
        self.pitr = pitr
        self.pitrRetentionDays = pitrRetentionDays
        self.storageAutoscaling = storageAutoscaling
        self.storageAutoscalingThresholdPercent = storageAutoscalingThresholdPercent
        self.storageAutoscalingMaxGb = storageAutoscalingMaxGb
        self.maintenanceWindowDay = maintenanceWindowDay
        self.maintenanceWindowHourUtc = maintenanceWindowHourUtc
        self.metricsEnabled = metricsEnabled
        self.sqlApiEnabled = sqlApiEnabled
        self.sqlApiAllowedStatements = sqlApiAllowedStatements
        self.sqlApiMaxRows = sqlApiMaxRows
        self.sqlApiMaxBytes = sqlApiMaxBytes
        self.sqlApiTimeoutSeconds = sqlApiTimeoutSeconds
        self.error = error
    }

    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        self.id = try container.decode(String.self, forKey: .id)
        self.createdAt = try container.decode(String.self, forKey: .createdAt)
        self.updatedAt = try container.decode(String.self, forKey: .updatedAt)
        self.projectId = try container.decode(String.self, forKey: .projectId)
        self.name = try container.decode(String.self, forKey: .name)
        self.api = try container.decode(String.self, forKey: .api)
        self.engine = try container.decode(String.self, forKey: .engine)
        self.version = try container.decode(String.self, forKey: .version)
        self.specification = try container.decode(String.self, forKey: .specification)
        self.backend = try container.decode(String.self, forKey: .backend)
        self.hostname = try container.decode(String.self, forKey: .hostname)
        self.connectionPort = try container.decode(Int.self, forKey: .connectionPort)
        self.connectionUser = try container.decode(String.self, forKey: .connectionUser)
        self.connectionPassword = try container.decode(String.self, forKey: .connectionPassword)
        self.connectionString = try container.decode(String.self, forKey: .connectionString)
        self.ssl = try container.decode(Bool.self, forKey: .ssl)
        self.status = try container.decode(String.self, forKey: .status)
        self.containerStatus = try container.decode(String.self, forKey: .containerStatus)
        self.lastAccessedAt = try container.decodeIfPresent(String.self, forKey: .lastAccessedAt)
        self.idleUntil = try container.decodeIfPresent(String.self, forKey: .idleUntil)
        self.lifecycleState = try container.decode(String.self, forKey: .lifecycleState)
        self.idleTimeoutMinutes = try container.decode(Int.self, forKey: .idleTimeoutMinutes)
        self.cpu = try container.decode(Int.self, forKey: .cpu)
        self.memory = try container.decode(Int.self, forKey: .memory)
        self.storage = try container.decode(Int.self, forKey: .storage)
        self.storageClass = try container.decode(String.self, forKey: .storageClass)
        self.storageMaxGb = try container.decode(Int.self, forKey: .storageMaxGb)
        self.nodePool = try container.decode(String.self, forKey: .nodePool)
        self.replicas = try container.decode(Int.self, forKey: .replicas)
        self.syncMode = try container.decode(String.self, forKey: .syncMode)
        self.crossRegionReplicas = try container.decode(Int.self, forKey: .crossRegionReplicas)
        self.networkMaxConnections = try container.decode(Int.self, forKey: .networkMaxConnections)
        self.networkIdleTimeoutSeconds = try container.decode(Int.self, forKey: .networkIdleTimeoutSeconds)
        self.networkIPAllowlist = try container.decode([String].self, forKey: .networkIPAllowlist)
        self.backupEnabled = try container.decode(Bool.self, forKey: .backupEnabled)
        self.pitr = try container.decode(Bool.self, forKey: .pitr)
        self.pitrRetentionDays = try container.decode(Int.self, forKey: .pitrRetentionDays)
        self.storageAutoscaling = try container.decode(Bool.self, forKey: .storageAutoscaling)
        self.storageAutoscalingThresholdPercent = try container.decode(Int.self, forKey: .storageAutoscalingThresholdPercent)
        self.storageAutoscalingMaxGb = try container.decode(Int.self, forKey: .storageAutoscalingMaxGb)
        self.maintenanceWindowDay = try container.decode(String.self, forKey: .maintenanceWindowDay)
        self.maintenanceWindowHourUtc = try container.decode(Int.self, forKey: .maintenanceWindowHourUtc)
        self.metricsEnabled = try container.decode(Bool.self, forKey: .metricsEnabled)
        self.sqlApiEnabled = try container.decode(Bool.self, forKey: .sqlApiEnabled)
        self.sqlApiAllowedStatements = try container.decode([String].self, forKey: .sqlApiAllowedStatements)
        self.sqlApiMaxRows = try container.decode(Int.self, forKey: .sqlApiMaxRows)
        self.sqlApiMaxBytes = try container.decode(Int.self, forKey: .sqlApiMaxBytes)
        self.sqlApiTimeoutSeconds = try container.decode(Int.self, forKey: .sqlApiTimeoutSeconds)
        self.error = try container.decode(String.self, forKey: .error)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encode(id, forKey: .id)
        try container.encode(createdAt, forKey: .createdAt)
        try container.encode(updatedAt, forKey: .updatedAt)
        try container.encode(projectId, forKey: .projectId)
        try container.encode(name, forKey: .name)
        try container.encode(api, forKey: .api)
        try container.encode(engine, forKey: .engine)
        try container.encode(version, forKey: .version)
        try container.encode(specification, forKey: .specification)
        try container.encode(backend, forKey: .backend)
        try container.encode(hostname, forKey: .hostname)
        try container.encode(connectionPort, forKey: .connectionPort)
        try container.encode(connectionUser, forKey: .connectionUser)
        try container.encode(connectionPassword, forKey: .connectionPassword)
        try container.encode(connectionString, forKey: .connectionString)
        try container.encode(ssl, forKey: .ssl)
        try container.encode(status, forKey: .status)
        try container.encode(containerStatus, forKey: .containerStatus)
        try container.encodeIfPresent(lastAccessedAt, forKey: .lastAccessedAt)
        try container.encodeIfPresent(idleUntil, forKey: .idleUntil)
        try container.encode(lifecycleState, forKey: .lifecycleState)
        try container.encode(idleTimeoutMinutes, forKey: .idleTimeoutMinutes)
        try container.encode(cpu, forKey: .cpu)
        try container.encode(memory, forKey: .memory)
        try container.encode(storage, forKey: .storage)
        try container.encode(storageClass, forKey: .storageClass)
        try container.encode(storageMaxGb, forKey: .storageMaxGb)
        try container.encode(nodePool, forKey: .nodePool)
        try container.encode(replicas, forKey: .replicas)
        try container.encode(syncMode, forKey: .syncMode)
        try container.encode(crossRegionReplicas, forKey: .crossRegionReplicas)
        try container.encode(networkMaxConnections, forKey: .networkMaxConnections)
        try container.encode(networkIdleTimeoutSeconds, forKey: .networkIdleTimeoutSeconds)
        try container.encode(networkIPAllowlist, forKey: .networkIPAllowlist)
        try container.encode(backupEnabled, forKey: .backupEnabled)
        try container.encode(pitr, forKey: .pitr)
        try container.encode(pitrRetentionDays, forKey: .pitrRetentionDays)
        try container.encode(storageAutoscaling, forKey: .storageAutoscaling)
        try container.encode(storageAutoscalingThresholdPercent, forKey: .storageAutoscalingThresholdPercent)
        try container.encode(storageAutoscalingMaxGb, forKey: .storageAutoscalingMaxGb)
        try container.encode(maintenanceWindowDay, forKey: .maintenanceWindowDay)
        try container.encode(maintenanceWindowHourUtc, forKey: .maintenanceWindowHourUtc)
        try container.encode(metricsEnabled, forKey: .metricsEnabled)
        try container.encode(sqlApiEnabled, forKey: .sqlApiEnabled)
        try container.encode(sqlApiAllowedStatements, forKey: .sqlApiAllowedStatements)
        try container.encode(sqlApiMaxRows, forKey: .sqlApiMaxRows)
        try container.encode(sqlApiMaxBytes, forKey: .sqlApiMaxBytes)
        try container.encode(sqlApiTimeoutSeconds, forKey: .sqlApiTimeoutSeconds)
        try container.encode(error, forKey: .error)
    }

    public func toMap() -> [String: Any] {
        return [
            "$id": id as Any,
            "$createdAt": createdAt as Any,
            "$updatedAt": updatedAt as Any,
            "projectId": projectId as Any,
            "name": name as Any,
            "api": api as Any,
            "engine": engine as Any,
            "version": version as Any,
            "specification": specification as Any,
            "backend": backend as Any,
            "hostname": hostname as Any,
            "connectionPort": connectionPort as Any,
            "connectionUser": connectionUser as Any,
            "connectionPassword": connectionPassword as Any,
            "connectionString": connectionString as Any,
            "ssl": ssl as Any,
            "status": status as Any,
            "containerStatus": containerStatus as Any,
            "lastAccessedAt": lastAccessedAt as Any,
            "idleUntil": idleUntil as Any,
            "lifecycleState": lifecycleState as Any,
            "idleTimeoutMinutes": idleTimeoutMinutes as Any,
            "cpu": cpu as Any,
            "memory": memory as Any,
            "storage": storage as Any,
            "storageClass": storageClass as Any,
            "storageMaxGb": storageMaxGb as Any,
            "nodePool": nodePool as Any,
            "replicas": replicas as Any,
            "syncMode": syncMode as Any,
            "crossRegionReplicas": crossRegionReplicas as Any,
            "networkMaxConnections": networkMaxConnections as Any,
            "networkIdleTimeoutSeconds": networkIdleTimeoutSeconds as Any,
            "networkIPAllowlist": networkIPAllowlist as Any,
            "backupEnabled": backupEnabled as Any,
            "pitr": pitr as Any,
            "pitrRetentionDays": pitrRetentionDays as Any,
            "storageAutoscaling": storageAutoscaling as Any,
            "storageAutoscalingThresholdPercent": storageAutoscalingThresholdPercent as Any,
            "storageAutoscalingMaxGb": storageAutoscalingMaxGb as Any,
            "maintenanceWindowDay": maintenanceWindowDay as Any,
            "maintenanceWindowHourUtc": maintenanceWindowHourUtc as Any,
            "metricsEnabled": metricsEnabled as Any,
            "sqlApiEnabled": sqlApiEnabled as Any,
            "sqlApiAllowedStatements": sqlApiAllowedStatements as Any,
            "sqlApiMaxRows": sqlApiMaxRows as Any,
            "sqlApiMaxBytes": sqlApiMaxBytes as Any,
            "sqlApiTimeoutSeconds": sqlApiTimeoutSeconds as Any,
            "error": error as Any
        ]
    }

    public static func from(map: [String: Any] ) -> DedicatedDatabase {
        return DedicatedDatabase(
            id: map["$id"] as! String,
            createdAt: map["$createdAt"] as! String,
            updatedAt: map["$updatedAt"] as! String,
            projectId: map["projectId"] as! String,
            name: map["name"] as! String,
            api: map["api"] as! String,
            engine: map["engine"] as! String,
            version: map["version"] as! String,
            specification: map["specification"] as! String,
            backend: map["backend"] as! String,
            hostname: map["hostname"] as! String,
            connectionPort: map["connectionPort"] as! Int,
            connectionUser: map["connectionUser"] as! String,
            connectionPassword: map["connectionPassword"] as! String,
            connectionString: map["connectionString"] as! String,
            ssl: map["ssl"] as! Bool,
            status: map["status"] as! String,
            containerStatus: map["containerStatus"] as! String,
            lastAccessedAt: map["lastAccessedAt"] as? String,
            idleUntil: map["idleUntil"] as? String,
            lifecycleState: map["lifecycleState"] as! String,
            idleTimeoutMinutes: map["idleTimeoutMinutes"] as! Int,
            cpu: map["cpu"] as! Int,
            memory: map["memory"] as! Int,
            storage: map["storage"] as! Int,
            storageClass: map["storageClass"] as! String,
            storageMaxGb: map["storageMaxGb"] as! Int,
            nodePool: map["nodePool"] as! String,
            replicas: map["replicas"] as! Int,
            syncMode: map["syncMode"] as! String,
            crossRegionReplicas: map["crossRegionReplicas"] as! Int,
            networkMaxConnections: map["networkMaxConnections"] as! Int,
            networkIdleTimeoutSeconds: map["networkIdleTimeoutSeconds"] as! Int,
            networkIPAllowlist: map["networkIPAllowlist"] as! [String],
            backupEnabled: map["backupEnabled"] as! Bool,
            pitr: map["pitr"] as! Bool,
            pitrRetentionDays: map["pitrRetentionDays"] as! Int,
            storageAutoscaling: map["storageAutoscaling"] as! Bool,
            storageAutoscalingThresholdPercent: map["storageAutoscalingThresholdPercent"] as! Int,
            storageAutoscalingMaxGb: map["storageAutoscalingMaxGb"] as! Int,
            maintenanceWindowDay: map["maintenanceWindowDay"] as! String,
            maintenanceWindowHourUtc: map["maintenanceWindowHourUtc"] as! Int,
            metricsEnabled: map["metricsEnabled"] as! Bool,
            sqlApiEnabled: map["sqlApiEnabled"] as! Bool,
            sqlApiAllowedStatements: map["sqlApiAllowedStatements"] as! [String],
            sqlApiMaxRows: map["sqlApiMaxRows"] as! Int,
            sqlApiMaxBytes: map["sqlApiMaxBytes"] as! Int,
            sqlApiTimeoutSeconds: map["sqlApiTimeoutSeconds"] as! Int,
            error: map["error"] as! String
        )
    }
}
