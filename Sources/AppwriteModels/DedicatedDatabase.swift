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
        case credentialGeneration = "credentialGeneration"
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
        case storageStatus = "storageStatus"
        case storageTargetGb = "storageTargetGb"
        case storageResizeStartedAt = "storageResizeStartedAt"
        case storageClass = "storageClass"
        case storageMaxGb = "storageMaxGb"
        case nodePool = "nodePool"
        case replicas = "replicas"
        case syncMode = "syncMode"
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
    public let api: String?
    /// Database engine: postgresql, mysql, or mongodb. Null until the backing reports one.
    public let engine: String?
    /// Database engine version.
    public let version: String
    /// Specification identifier.
    public let specification: String
    /// Database backend provider. Possible values: edge.
    public let backend: String
    /// Database hostname for connections.
    public let hostname: String
    /// Database port for connections. Derived from the engine when the backing has not reported one yet.
    public let connectionPort: Int?
    /// Database username for connections.
    public let connectionUser: String
    /// Database password for connections.
    public let connectionPassword: String
    /// Committed generation of the primary connection credentials. Null until the rotation contract has been initialized.
    public let credentialGeneration: Int?
    /// Full database connection string (URI format).
    public let connectionString: String
    /// Whether SSL/TLS is required for client connections.
    public let ssl: Bool
    /// Database status. Possible values: provisioning, ready, inactive, paused, failed, deleted, restoring, scaling.
    public let status: String
    /// Container status for lifecycle-managed database runtimes: active, inactive, or failed (a wake was declined because the backing namespace is gone).
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
    /// Storage resize status. Possible values: idle (no resize in flight), resizing (the volume is growing towards storageTargetGb).
    public let storageStatus: String
    /// Size in GB the volume is growing towards while storageStatus is resizing. 0 when no resize is in flight.
    public let storageTargetGb: Int
    /// Time the in-flight storage resize started, in ISO 8601 format.
    public let storageResizeStartedAt: String?
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
    /// Maximum concurrent client connections. This is the limit a client pool may reach; the engine&#039;s own max_connections reported by the status endpoint is a smaller backend limit the pooler multiplexes onto and does not constrain a client pool.
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
    /// Maximum storage size in GB for autoscaling. Defaults to 3 times the specification&#039;s storage. 0 means no limit.
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
        api: String?,
        engine: String?,
        version: String,
        specification: String,
        backend: String,
        hostname: String,
        connectionPort: Int?,
        connectionUser: String,
        connectionPassword: String,
        credentialGeneration: Int?,
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
        storageStatus: String,
        storageTargetGb: Int,
        storageResizeStartedAt: String?,
        storageClass: String,
        storageMaxGb: Int,
        nodePool: String,
        replicas: Int,
        syncMode: String,
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
        self.credentialGeneration = credentialGeneration
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
        self.storageStatus = storageStatus
        self.storageTargetGb = storageTargetGb
        self.storageResizeStartedAt = storageResizeStartedAt
        self.storageClass = storageClass
        self.storageMaxGb = storageMaxGb
        self.nodePool = nodePool
        self.replicas = replicas
        self.syncMode = syncMode
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

        self.id = try container.contains(.id) ? container.decode(String.self, forKey: .id) : ""
        self.createdAt = try container.contains(.createdAt) ? container.decode(String.self, forKey: .createdAt) : ""
        self.updatedAt = try container.contains(.updatedAt) ? container.decode(String.self, forKey: .updatedAt) : ""
        self.projectId = try container.contains(.projectId) ? container.decode(String.self, forKey: .projectId) : ""
        self.name = try container.contains(.name) ? container.decode(String.self, forKey: .name) : ""
        self.api = try container.decodeIfPresent(String.self, forKey: .api)
        self.engine = try container.decodeIfPresent(String.self, forKey: .engine)
        self.version = try container.contains(.version) ? container.decode(String.self, forKey: .version) : ""
        self.specification = try container.contains(.specification) ? container.decode(String.self, forKey: .specification) : ""
        self.backend = try container.contains(.backend) ? container.decode(String.self, forKey: .backend) : ""
        self.hostname = try container.contains(.hostname) ? container.decode(String.self, forKey: .hostname) : ""
        self.connectionPort = try container.decodeIfPresent(Int.self, forKey: .connectionPort)
        self.connectionUser = try container.contains(.connectionUser) ? container.decode(String.self, forKey: .connectionUser) : ""
        self.connectionPassword = try container.contains(.connectionPassword) ? container.decode(String.self, forKey: .connectionPassword) : ""
        self.credentialGeneration = try container.decodeIfPresent(Int.self, forKey: .credentialGeneration)
        self.connectionString = try container.contains(.connectionString) ? container.decode(String.self, forKey: .connectionString) : ""
        self.ssl = try container.contains(.ssl) ? container.decode(Bool.self, forKey: .ssl) : false
        self.status = try container.contains(.status) ? container.decode(String.self, forKey: .status) : "provisioning"
        self.containerStatus = try container.contains(.containerStatus) ? container.decode(String.self, forKey: .containerStatus) : ""
        self.lastAccessedAt = try container.decodeIfPresent(String.self, forKey: .lastAccessedAt)
        self.idleUntil = try container.decodeIfPresent(String.self, forKey: .idleUntil)
        self.lifecycleState = try container.contains(.lifecycleState) ? container.decode(String.self, forKey: .lifecycleState) : ""
        self.idleTimeoutMinutes = try container.contains(.idleTimeoutMinutes) ? container.decode(Int.self, forKey: .idleTimeoutMinutes) : 15
        self.cpu = try container.contains(.cpu) ? container.decode(Int.self, forKey: .cpu) : 500
        self.memory = try container.contains(.memory) ? container.decode(Int.self, forKey: .memory) : 512
        self.storage = try container.contains(.storage) ? container.decode(Int.self, forKey: .storage) : 10
        self.storageStatus = try container.contains(.storageStatus) ? container.decode(String.self, forKey: .storageStatus) : "idle"
        self.storageTargetGb = try container.contains(.storageTargetGb) ? container.decode(Int.self, forKey: .storageTargetGb) : 0
        self.storageResizeStartedAt = try container.decodeIfPresent(String.self, forKey: .storageResizeStartedAt)
        self.storageClass = try container.contains(.storageClass) ? container.decode(String.self, forKey: .storageClass) : "ssd"
        self.storageMaxGb = try container.contains(.storageMaxGb) ? container.decode(Int.self, forKey: .storageMaxGb) : 0
        self.nodePool = try container.contains(.nodePool) ? container.decode(String.self, forKey: .nodePool) : ""
        self.replicas = try container.contains(.replicas) ? container.decode(Int.self, forKey: .replicas) : 0
        self.syncMode = try container.contains(.syncMode) ? container.decode(String.self, forKey: .syncMode) : ""
        self.networkMaxConnections = try container.contains(.networkMaxConnections) ? container.decode(Int.self, forKey: .networkMaxConnections) : 100
        self.networkIdleTimeoutSeconds = try container.contains(.networkIdleTimeoutSeconds) ? container.decode(Int.self, forKey: .networkIdleTimeoutSeconds) : 900
        self.networkIPAllowlist = try container.contains(.networkIPAllowlist) ? container.decode([String].self, forKey: .networkIPAllowlist) : []
        self.backupEnabled = try container.contains(.backupEnabled) ? container.decode(Bool.self, forKey: .backupEnabled) : true
        self.pitr = try container.contains(.pitr) ? container.decode(Bool.self, forKey: .pitr) : true
        self.pitrRetentionDays = try container.contains(.pitrRetentionDays) ? container.decode(Int.self, forKey: .pitrRetentionDays) : 7
        self.storageAutoscaling = try container.contains(.storageAutoscaling) ? container.decode(Bool.self, forKey: .storageAutoscaling) : true
        self.storageAutoscalingThresholdPercent = try container.contains(.storageAutoscalingThresholdPercent) ? container.decode(Int.self, forKey: .storageAutoscalingThresholdPercent) : 85
        self.storageAutoscalingMaxGb = try container.contains(.storageAutoscalingMaxGb) ? container.decode(Int.self, forKey: .storageAutoscalingMaxGb) : 0
        self.maintenanceWindowDay = try container.contains(.maintenanceWindowDay) ? container.decode(String.self, forKey: .maintenanceWindowDay) : "sun"
        self.maintenanceWindowHourUtc = try container.contains(.maintenanceWindowHourUtc) ? container.decode(Int.self, forKey: .maintenanceWindowHourUtc) : 3
        self.metricsEnabled = try container.contains(.metricsEnabled) ? container.decode(Bool.self, forKey: .metricsEnabled) : false
        self.sqlApiEnabled = try container.contains(.sqlApiEnabled) ? container.decode(Bool.self, forKey: .sqlApiEnabled) : true
        self.sqlApiAllowedStatements = try container.contains(.sqlApiAllowedStatements) ? container.decode([String].self, forKey: .sqlApiAllowedStatements) : [
        "SELECT",
        "INSERT",
        "UPDATE",
        "DELETE"
    ]
        self.sqlApiMaxRows = try container.contains(.sqlApiMaxRows) ? container.decode(Int.self, forKey: .sqlApiMaxRows) : 10000
        self.sqlApiMaxBytes = try container.contains(.sqlApiMaxBytes) ? container.decode(Int.self, forKey: .sqlApiMaxBytes) : 10485760
        self.sqlApiTimeoutSeconds = try container.contains(.sqlApiTimeoutSeconds) ? container.decode(Int.self, forKey: .sqlApiTimeoutSeconds) : 30
        self.error = try container.contains(.error) ? container.decode(String.self, forKey: .error) : ""
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encode(id, forKey: .id)
        try container.encode(createdAt, forKey: .createdAt)
        try container.encode(updatedAt, forKey: .updatedAt)
        try container.encode(projectId, forKey: .projectId)
        try container.encode(name, forKey: .name)
        try container.encodeIfPresent(api, forKey: .api)
        try container.encodeIfPresent(engine, forKey: .engine)
        try container.encode(version, forKey: .version)
        try container.encode(specification, forKey: .specification)
        try container.encode(backend, forKey: .backend)
        try container.encode(hostname, forKey: .hostname)
        try container.encodeIfPresent(connectionPort, forKey: .connectionPort)
        try container.encode(connectionUser, forKey: .connectionUser)
        try container.encode(connectionPassword, forKey: .connectionPassword)
        try container.encodeIfPresent(credentialGeneration, forKey: .credentialGeneration)
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
        try container.encode(storageStatus, forKey: .storageStatus)
        try container.encode(storageTargetGb, forKey: .storageTargetGb)
        try container.encodeIfPresent(storageResizeStartedAt, forKey: .storageResizeStartedAt)
        try container.encode(storageClass, forKey: .storageClass)
        try container.encode(storageMaxGb, forKey: .storageMaxGb)
        try container.encode(nodePool, forKey: .nodePool)
        try container.encode(replicas, forKey: .replicas)
        try container.encode(syncMode, forKey: .syncMode)
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
            "credentialGeneration": credentialGeneration as Any,
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
            "storageStatus": storageStatus as Any,
            "storageTargetGb": storageTargetGb as Any,
            "storageResizeStartedAt": storageResizeStartedAt as Any,
            "storageClass": storageClass as Any,
            "storageMaxGb": storageMaxGb as Any,
            "nodePool": nodePool as Any,
            "replicas": replicas as Any,
            "syncMode": syncMode as Any,
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
            "error": error as Any,
        ]
    }

    public static func from(map: [String: Any]) -> DedicatedDatabase {
        let defaults: [String: Any] = [
            "$id": "",
            "$createdAt": "",
            "$updatedAt": "",
            "projectId": "",
            "name": "",
            "version": "",
            "specification": "",
            "backend": "",
            "hostname": "",
            "connectionUser": "",
            "connectionPassword": "",
            "connectionString": "",
            "ssl": false,
            "status": "provisioning",
            "containerStatus": "",
            "lifecycleState": "",
            "idleTimeoutMinutes": 15,
            "cpu": 500,
            "memory": 512,
            "storage": 10,
            "storageStatus": "idle",
            "storageTargetGb": 0,
            "storageClass": "ssd",
            "storageMaxGb": 0,
            "nodePool": "",
            "replicas": 0,
            "syncMode": "",
            "networkMaxConnections": 100,
            "networkIdleTimeoutSeconds": 900,
            "networkIPAllowlist": [Any](),
            "backupEnabled": true,
            "pitr": true,
            "pitrRetentionDays": 7,
            "storageAutoscaling": true,
            "storageAutoscalingThresholdPercent": 85,
            "storageAutoscalingMaxGb": 0,
            "maintenanceWindowDay": "sun",
            "maintenanceWindowHourUtc": 3,
            "metricsEnabled": false,
            "sqlApiEnabled": true,
            "sqlApiAllowedStatements": ["SELECT", "INSERT", "UPDATE", "DELETE"] as [Any],
            "sqlApiMaxRows": 10000,
            "sqlApiMaxBytes": 10485760,
            "sqlApiTimeoutSeconds": 30,
            "error": "",
        ]
        let map = defaults.merging(map) { _, new in new }

        return DedicatedDatabase(
            id: map["$id"] as! String,
            createdAt: map["$createdAt"] as! String,
            updatedAt: map["$updatedAt"] as! String,
            projectId: map["projectId"] as! String,
            name: map["name"] as! String,
            api: map["api"] as? String,
            engine: map["engine"] as? String,
            version: map["version"] as! String,
            specification: map["specification"] as! String,
            backend: map["backend"] as! String,
            hostname: map["hostname"] as! String,
            connectionPort: map["connectionPort"] as? Int,
            connectionUser: map["connectionUser"] as! String,
            connectionPassword: map["connectionPassword"] as! String,
            credentialGeneration: map["credentialGeneration"] as? Int,
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
            storageStatus: map["storageStatus"] as! String,
            storageTargetGb: map["storageTargetGb"] as! Int,
            storageResizeStartedAt: map["storageResizeStartedAt"] as? String,
            storageClass: map["storageClass"] as! String,
            storageMaxGb: map["storageMaxGb"] as! Int,
            nodePool: map["nodePool"] as! String,
            replicas: map["replicas"] as! Int,
            syncMode: map["syncMode"] as! String,
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
