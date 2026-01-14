import Foundation
import JSONCodable

/// Function
open class Function: Codable {

    enum CodingKeys: String, CodingKey {
        case id = "$id"
        case createdAt = "$createdAt"
        case updatedAt = "$updatedAt"
        case execute = "execute"
        case name = "name"
        case enabled = "enabled"
        case live = "live"
        case logging = "logging"
        case runtime = "runtime"
        case deploymentId = "deploymentId"
        case deploymentCreatedAt = "deploymentCreatedAt"
        case latestDeploymentId = "latestDeploymentId"
        case latestDeploymentCreatedAt = "latestDeploymentCreatedAt"
        case latestDeploymentStatus = "latestDeploymentStatus"
        case scopes = "scopes"
        case vars = "vars"
        case events = "events"
        case schedule = "schedule"
        case timeout = "timeout"
        case entrypoint = "entrypoint"
        case commands = "commands"
        case version = "version"
        case installationId = "installationId"
        case providerRepositoryId = "providerRepositoryId"
        case providerBranch = "providerBranch"
        case providerRootDirectory = "providerRootDirectory"
        case providerSilentMode = "providerSilentMode"
        case specification = "specification"
    }

    /// Function ID.
    public let id: String
    /// Function creation date in ISO 8601 format.
    public let createdAt: String
    /// Function update date in ISO 8601 format.
    public let updatedAt: String
    /// Execution permissions.
    public let execute: [String]
    /// Function name.
    public let name: String
    /// Function enabled.
    public let enabled: Bool
    /// Is the function deployed with the latest configuration? This is set to false if you&#039;ve changed an environment variables, entrypoint, commands, or other settings that needs redeploy to be applied. When the value is false, redeploy the function to update it with the latest configuration.
    public let live: Bool
    /// When disabled, executions will exclude logs and errors, and will be slightly faster.
    public let logging: Bool
    /// Function execution and build runtime.
    public let runtime: String
    /// Function&#039;s active deployment ID.
    public let deploymentId: String
    /// Active deployment creation date in ISO 8601 format.
    public let deploymentCreatedAt: String
    /// Function&#039;s latest deployment ID.
    public let latestDeploymentId: String
    /// Latest deployment creation date in ISO 8601 format.
    public let latestDeploymentCreatedAt: String
    /// Status of latest deployment. Possible values are &quot;waiting&quot;, &quot;processing&quot;, &quot;building&quot;, &quot;ready&quot;, and &quot;failed&quot;.
    public let latestDeploymentStatus: String
    /// Allowed permission scopes.
    public let scopes: [String]
    /// Function variables.
    public let vars: [Variable]
    /// Function trigger events.
    public let events: [String]
    /// Function execution schedule in CRON format.
    public let schedule: String
    /// Function execution timeout in seconds.
    public let timeout: Int
    /// The entrypoint file used to execute the deployment.
    public let entrypoint: String
    /// The build command used to build the deployment.
    public let commands: String
    /// Version of Open Runtimes used for the function.
    public let version: String
    /// Function VCS (Version Control System) installation id.
    public let installationId: String
    /// VCS (Version Control System) Repository ID
    public let providerRepositoryId: String
    /// VCS (Version Control System) branch name
    public let providerBranch: String
    /// Path to function in VCS (Version Control System) repository
    public let providerRootDirectory: String
    /// Is VCS (Version Control System) connection is in silent mode? When in silence mode, no comments will be posted on the repository pull or merge requests
    public let providerSilentMode: Bool
    /// Machine specification for builds and executions.
    public let specification: String

    init(
        id: String,
        createdAt: String,
        updatedAt: String,
        execute: [String],
        name: String,
        enabled: Bool,
        live: Bool,
        logging: Bool,
        runtime: String,
        deploymentId: String,
        deploymentCreatedAt: String,
        latestDeploymentId: String,
        latestDeploymentCreatedAt: String,
        latestDeploymentStatus: String,
        scopes: [String],
        vars: [Variable],
        events: [String],
        schedule: String,
        timeout: Int,
        entrypoint: String,
        commands: String,
        version: String,
        installationId: String,
        providerRepositoryId: String,
        providerBranch: String,
        providerRootDirectory: String,
        providerSilentMode: Bool,
        specification: String
    ) {
        self.id = id
        self.createdAt = createdAt
        self.updatedAt = updatedAt
        self.execute = execute
        self.name = name
        self.enabled = enabled
        self.live = live
        self.logging = logging
        self.runtime = runtime
        self.deploymentId = deploymentId
        self.deploymentCreatedAt = deploymentCreatedAt
        self.latestDeploymentId = latestDeploymentId
        self.latestDeploymentCreatedAt = latestDeploymentCreatedAt
        self.latestDeploymentStatus = latestDeploymentStatus
        self.scopes = scopes
        self.vars = vars
        self.events = events
        self.schedule = schedule
        self.timeout = timeout
        self.entrypoint = entrypoint
        self.commands = commands
        self.version = version
        self.installationId = installationId
        self.providerRepositoryId = providerRepositoryId
        self.providerBranch = providerBranch
        self.providerRootDirectory = providerRootDirectory
        self.providerSilentMode = providerSilentMode
        self.specification = specification
    }

    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        self.id = try container.decode(String.self, forKey: .id)
        self.createdAt = try container.decode(String.self, forKey: .createdAt)
        self.updatedAt = try container.decode(String.self, forKey: .updatedAt)
        self.execute = try container.decode([String].self, forKey: .execute)
        self.name = try container.decode(String.self, forKey: .name)
        self.enabled = try container.decode(Bool.self, forKey: .enabled)
        self.live = try container.decode(Bool.self, forKey: .live)
        self.logging = try container.decode(Bool.self, forKey: .logging)
        self.runtime = try container.decode(String.self, forKey: .runtime)
        self.deploymentId = try container.decode(String.self, forKey: .deploymentId)
        self.deploymentCreatedAt = try container.decode(String.self, forKey: .deploymentCreatedAt)
        self.latestDeploymentId = try container.decode(String.self, forKey: .latestDeploymentId)
        self.latestDeploymentCreatedAt = try container.decode(String.self, forKey: .latestDeploymentCreatedAt)
        self.latestDeploymentStatus = try container.decode(String.self, forKey: .latestDeploymentStatus)
        self.scopes = try container.decode([String].self, forKey: .scopes)
        self.vars = try container.decode([Variable].self, forKey: .vars)
        self.events = try container.decode([String].self, forKey: .events)
        self.schedule = try container.decode(String.self, forKey: .schedule)
        self.timeout = try container.decode(Int.self, forKey: .timeout)
        self.entrypoint = try container.decode(String.self, forKey: .entrypoint)
        self.commands = try container.decode(String.self, forKey: .commands)
        self.version = try container.decode(String.self, forKey: .version)
        self.installationId = try container.decode(String.self, forKey: .installationId)
        self.providerRepositoryId = try container.decode(String.self, forKey: .providerRepositoryId)
        self.providerBranch = try container.decode(String.self, forKey: .providerBranch)
        self.providerRootDirectory = try container.decode(String.self, forKey: .providerRootDirectory)
        self.providerSilentMode = try container.decode(Bool.self, forKey: .providerSilentMode)
        self.specification = try container.decode(String.self, forKey: .specification)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encode(id, forKey: .id)
        try container.encode(createdAt, forKey: .createdAt)
        try container.encode(updatedAt, forKey: .updatedAt)
        try container.encode(execute, forKey: .execute)
        try container.encode(name, forKey: .name)
        try container.encode(enabled, forKey: .enabled)
        try container.encode(live, forKey: .live)
        try container.encode(logging, forKey: .logging)
        try container.encode(runtime, forKey: .runtime)
        try container.encode(deploymentId, forKey: .deploymentId)
        try container.encode(deploymentCreatedAt, forKey: .deploymentCreatedAt)
        try container.encode(latestDeploymentId, forKey: .latestDeploymentId)
        try container.encode(latestDeploymentCreatedAt, forKey: .latestDeploymentCreatedAt)
        try container.encode(latestDeploymentStatus, forKey: .latestDeploymentStatus)
        try container.encode(scopes, forKey: .scopes)
        try container.encode(vars, forKey: .vars)
        try container.encode(events, forKey: .events)
        try container.encode(schedule, forKey: .schedule)
        try container.encode(timeout, forKey: .timeout)
        try container.encode(entrypoint, forKey: .entrypoint)
        try container.encode(commands, forKey: .commands)
        try container.encode(version, forKey: .version)
        try container.encode(installationId, forKey: .installationId)
        try container.encode(providerRepositoryId, forKey: .providerRepositoryId)
        try container.encode(providerBranch, forKey: .providerBranch)
        try container.encode(providerRootDirectory, forKey: .providerRootDirectory)
        try container.encode(providerSilentMode, forKey: .providerSilentMode)
        try container.encode(specification, forKey: .specification)
    }

    public func toMap() -> [String: Any] {
        return [
            "$id": id as Any,
            "$createdAt": createdAt as Any,
            "$updatedAt": updatedAt as Any,
            "execute": execute as Any,
            "name": name as Any,
            "enabled": enabled as Any,
            "live": live as Any,
            "logging": logging as Any,
            "runtime": runtime as Any,
            "deploymentId": deploymentId as Any,
            "deploymentCreatedAt": deploymentCreatedAt as Any,
            "latestDeploymentId": latestDeploymentId as Any,
            "latestDeploymentCreatedAt": latestDeploymentCreatedAt as Any,
            "latestDeploymentStatus": latestDeploymentStatus as Any,
            "scopes": scopes as Any,
            "vars": vars.map { $0.toMap() } as Any,
            "events": events as Any,
            "schedule": schedule as Any,
            "timeout": timeout as Any,
            "entrypoint": entrypoint as Any,
            "commands": commands as Any,
            "version": version as Any,
            "installationId": installationId as Any,
            "providerRepositoryId": providerRepositoryId as Any,
            "providerBranch": providerBranch as Any,
            "providerRootDirectory": providerRootDirectory as Any,
            "providerSilentMode": providerSilentMode as Any,
            "specification": specification as Any
        ]
    }

    public static func from(map: [String: Any] ) -> Function {
        return Function(
            id: map["$id"] as! String,
            createdAt: map["$createdAt"] as! String,
            updatedAt: map["$updatedAt"] as! String,
            execute: map["execute"] as! [String],
            name: map["name"] as! String,
            enabled: map["enabled"] as! Bool,
            live: map["live"] as! Bool,
            logging: map["logging"] as! Bool,
            runtime: map["runtime"] as! String,
            deploymentId: map["deploymentId"] as! String,
            deploymentCreatedAt: map["deploymentCreatedAt"] as! String,
            latestDeploymentId: map["latestDeploymentId"] as! String,
            latestDeploymentCreatedAt: map["latestDeploymentCreatedAt"] as! String,
            latestDeploymentStatus: map["latestDeploymentStatus"] as! String,
            scopes: map["scopes"] as! [String],
            vars: (map["vars"] as! [[String: Any]]).map { Variable.from(map: $0) },
            events: map["events"] as! [String],
            schedule: map["schedule"] as! String,
            timeout: map["timeout"] as! Int,
            entrypoint: map["entrypoint"] as! String,
            commands: map["commands"] as! String,
            version: map["version"] as! String,
            installationId: map["installationId"] as! String,
            providerRepositoryId: map["providerRepositoryId"] as! String,
            providerBranch: map["providerBranch"] as! String,
            providerRootDirectory: map["providerRootDirectory"] as! String,
            providerSilentMode: map["providerSilentMode"] as! Bool,
            specification: map["specification"] as! String
        )
    }
}
