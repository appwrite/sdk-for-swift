import Foundation
import JSONCodable

/// Branch
open class DedicatedDatabaseBranch: Codable {

    enum CodingKeys: String, CodingKey {
        case branchId = "branchId"
        case branchName = "branchName"
        case namespace = "namespace"
        case expiresAt = "expiresAt"
        case host = "host"
        case port = "port"
        case database = "database"
        case username = "username"
        case password = "password"
        case ssl = "ssl"
        case engine = "engine"
        case connectionString = "connectionString"
    }

    /// Branch identifier.
    public let branchId: String
    /// Branch name.
    public let branchName: String
    /// Kubernetes namespace where the branch is deployed.
    public let namespace: String
    /// Unix timestamp when the branch expires.
    public let expiresAt: Int
    /// Branch hostname for direct connections.
    public let host: String
    /// Branch port. Null until the backing reports one.
    public let port: Int
    /// Advertised catalog the client connects to. MySQL/MariaDB use default; Postgres uses the routing label.
    public let database: String
    /// Database username. Shared with the parent database.
    public let username: String
    /// Database password. Shared with the parent database.
    public let password: String
    /// Whether SSL is required.
    public let ssl: Bool
    /// Database engine. Possible values: postgresql, mysql, mongodb.
    public let engine: String
    /// Full connection string for the branch.
    public let connectionString: String

    init(
        branchId: String,
        branchName: String,
        namespace: String,
        expiresAt: Int,
        host: String,
        port: Int,
        database: String,
        username: String,
        password: String,
        ssl: Bool,
        engine: String,
        connectionString: String
    ) {
        self.branchId = branchId
        self.branchName = branchName
        self.namespace = namespace
        self.expiresAt = expiresAt
        self.host = host
        self.port = port
        self.database = database
        self.username = username
        self.password = password
        self.ssl = ssl
        self.engine = engine
        self.connectionString = connectionString
    }

    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        self.branchId = try container.decode(String.self, forKey: .branchId)
        self.branchName = try container.decode(String.self, forKey: .branchName)
        self.namespace = try container.decode(String.self, forKey: .namespace)
        self.expiresAt = try container.decode(Int.self, forKey: .expiresAt)
        self.host = try container.decode(String.self, forKey: .host)
        self.port = try container.decode(Int.self, forKey: .port)
        self.database = try container.decode(String.self, forKey: .database)
        self.username = try container.decode(String.self, forKey: .username)
        self.password = try container.decode(String.self, forKey: .password)
        self.ssl = try container.decode(Bool.self, forKey: .ssl)
        self.engine = try container.decode(String.self, forKey: .engine)
        self.connectionString = try container.decode(String.self, forKey: .connectionString)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encode(branchId, forKey: .branchId)
        try container.encode(branchName, forKey: .branchName)
        try container.encode(namespace, forKey: .namespace)
        try container.encode(expiresAt, forKey: .expiresAt)
        try container.encode(host, forKey: .host)
        try container.encode(port, forKey: .port)
        try container.encode(database, forKey: .database)
        try container.encode(username, forKey: .username)
        try container.encode(password, forKey: .password)
        try container.encode(ssl, forKey: .ssl)
        try container.encode(engine, forKey: .engine)
        try container.encode(connectionString, forKey: .connectionString)
    }

    public func toMap() -> [String: Any] {
        return [
            "branchId": branchId as Any,
            "branchName": branchName as Any,
            "namespace": namespace as Any,
            "expiresAt": expiresAt as Any,
            "host": host as Any,
            "port": port as Any,
            "database": database as Any,
            "username": username as Any,
            "password": password as Any,
            "ssl": ssl as Any,
            "engine": engine as Any,
            "connectionString": connectionString as Any,
        ]
    }

    public static func from(map: [String: Any]) -> DedicatedDatabaseBranch {
        return DedicatedDatabaseBranch(
            branchId: map["branchId"] as! String,
            branchName: map["branchName"] as! String,
            namespace: map["namespace"] as! String,
            expiresAt: map["expiresAt"] as! Int,
            host: map["host"] as! String,
            port: map["port"] as! Int,
            database: map["database"] as! String,
            username: map["username"] as! String,
            password: map["password"] as! String,
            ssl: map["ssl"] as! Bool,
            engine: map["engine"] as! String,
            connectionString: map["connectionString"] as! String
        )
    }
}
