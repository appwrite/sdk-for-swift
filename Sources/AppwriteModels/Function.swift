import Foundation
import JSONCodable

/// Function
public class Function {

    /// Function ID.
    public let id: String

    /// Function creation date in ISO 8601 format.
    public let createdAt: String

    /// Function update date in ISO 8601 format.
    public let updatedAt: String

    /// Execution permissions.
    public let execute: [Any]

    /// Function name.
    public let name: String

    /// Function enabled.
    public let enabled: Bool

    /// Is the function deployed with the latest configuration? This is set to false if you&#039;ve changed an environment variables, entrypoint, commands, or other settings that needs redeploy to be applied. When the value is false, redeploy the function to update it with the latest configuration.
    public let live: Bool

    /// Whether executions will be logged. When set to false, executions will not be logged, but will reduce resource used by your Appwrite project.
    public let logging: Bool

    /// Function execution runtime.
    public let runtime: String

    /// Function&#039;s active deployment ID.
    public let deployment: String

    /// Function variables.
    public let vars: [Variable]

    /// Function trigger events.
    public let events: [Any]

    /// Function execution schedult in CRON format.
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


    init(
        id: String,
        createdAt: String,
        updatedAt: String,
        execute: [Any],
        name: String,
        enabled: Bool,
        live: Bool,
        logging: Bool,
        runtime: String,
        deployment: String,
        vars: [Variable],
        events: [Any],
        schedule: String,
        timeout: Int,
        entrypoint: String,
        commands: String,
        version: String,
        installationId: String,
        providerRepositoryId: String,
        providerBranch: String,
        providerRootDirectory: String,
        providerSilentMode: Bool
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
        self.deployment = deployment
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
            "deployment": deployment as Any,
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
            "providerSilentMode": providerSilentMode as Any
        ]
    }

    public static func from(map: [String: Any] ) -> Function {
        return Function(
            id: map["$id"] as! String,
            createdAt: map["$createdAt"] as! String,
            updatedAt: map["$updatedAt"] as! String,
            execute: map["execute"] as! [Any],
            name: map["name"] as! String,
            enabled: map["enabled"] as! Bool,
            live: map["live"] as! Bool,
            logging: map["logging"] as! Bool,
            runtime: map["runtime"] as! String,
            deployment: map["deployment"] as! String,
            vars: (map["vars"] as! [[String: Any]]).map { Variable.from(map: $0) },
            events: map["events"] as! [Any],
            schedule: map["schedule"] as! String,
            timeout: map["timeout"] as! Int,
            entrypoint: map["entrypoint"] as! String,
            commands: map["commands"] as! String,
            version: map["version"] as! String,
            installationId: map["installationId"] as! String,
            providerRepositoryId: map["providerRepositoryId"] as! String,
            providerBranch: map["providerBranch"] as! String,
            providerRootDirectory: map["providerRootDirectory"] as! String,
            providerSilentMode: map["providerSilentMode"] as! Bool
        )
    }
}
