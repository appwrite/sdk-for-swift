import Foundation
import JSONCodable

/// Site
open class Site: Codable {

    enum CodingKeys: String, CodingKey {
        case id = "$id"
        case createdAt = "$createdAt"
        case updatedAt = "$updatedAt"
        case name = "name"
        case enabled = "enabled"
        case live = "live"
        case logging = "logging"
        case framework = "framework"
        case deploymentId = "deploymentId"
        case deploymentCreatedAt = "deploymentCreatedAt"
        case deploymentScreenshotLight = "deploymentScreenshotLight"
        case deploymentScreenshotDark = "deploymentScreenshotDark"
        case latestDeploymentId = "latestDeploymentId"
        case latestDeploymentCreatedAt = "latestDeploymentCreatedAt"
        case latestDeploymentStatus = "latestDeploymentStatus"
        case vars = "vars"
        case timeout = "timeout"
        case installCommand = "installCommand"
        case buildCommand = "buildCommand"
        case outputDirectory = "outputDirectory"
        case installationId = "installationId"
        case providerRepositoryId = "providerRepositoryId"
        case providerBranch = "providerBranch"
        case providerRootDirectory = "providerRootDirectory"
        case providerSilentMode = "providerSilentMode"
        case specification = "specification"
        case buildRuntime = "buildRuntime"
        case adapter = "adapter"
        case fallbackFile = "fallbackFile"
    }

    /// Site ID.
    public let id: String
    /// Site creation date in ISO 8601 format.
    public let createdAt: String
    /// Site update date in ISO 8601 format.
    public let updatedAt: String
    /// Site name.
    public let name: String
    /// Site enabled.
    public let enabled: Bool
    /// Is the site deployed with the latest configuration? This is set to false if you&#039;ve changed an environment variables, entrypoint, commands, or other settings that needs redeploy to be applied. When the value is false, redeploy the site to update it with the latest configuration.
    public let live: Bool
    /// When disabled, request logs will exclude logs and errors, and site responses will be slightly faster.
    public let logging: Bool
    /// Site framework.
    public let framework: String
    /// Site&#039;s active deployment ID.
    public let deploymentId: String
    /// Active deployment creation date in ISO 8601 format.
    public let deploymentCreatedAt: String
    /// Screenshot of active deployment with light theme preference file ID.
    public let deploymentScreenshotLight: String
    /// Screenshot of active deployment with dark theme preference file ID.
    public let deploymentScreenshotDark: String
    /// Site&#039;s latest deployment ID.
    public let latestDeploymentId: String
    /// Latest deployment creation date in ISO 8601 format.
    public let latestDeploymentCreatedAt: String
    /// Status of latest deployment. Possible values are &quot;waiting&quot;, &quot;processing&quot;, &quot;building&quot;, &quot;ready&quot;, and &quot;failed&quot;.
    public let latestDeploymentStatus: String
    /// Site variables.
    public let vars: [Variable]
    /// Site request timeout in seconds.
    public let timeout: Int
    /// The install command used to install the site dependencies.
    public let installCommand: String
    /// The build command used to build the site.
    public let buildCommand: String
    /// The directory where the site build output is located.
    public let outputDirectory: String
    /// Site VCS (Version Control System) installation id.
    public let installationId: String
    /// VCS (Version Control System) Repository ID
    public let providerRepositoryId: String
    /// VCS (Version Control System) branch name
    public let providerBranch: String
    /// Path to site in VCS (Version Control System) repository
    public let providerRootDirectory: String
    /// Is VCS (Version Control System) connection is in silent mode? When in silence mode, no comments will be posted on the repository pull or merge requests
    public let providerSilentMode: Bool
    /// Machine specification for builds and executions.
    public let specification: String
    /// Site build runtime.
    public let buildRuntime: String
    /// Site framework adapter.
    public let adapter: String
    /// Name of fallback file to use instead of 404 page. If null, Appwrite 404 page will be displayed.
    public let fallbackFile: String

    init(
        id: String,
        createdAt: String,
        updatedAt: String,
        name: String,
        enabled: Bool,
        live: Bool,
        logging: Bool,
        framework: String,
        deploymentId: String,
        deploymentCreatedAt: String,
        deploymentScreenshotLight: String,
        deploymentScreenshotDark: String,
        latestDeploymentId: String,
        latestDeploymentCreatedAt: String,
        latestDeploymentStatus: String,
        vars: [Variable],
        timeout: Int,
        installCommand: String,
        buildCommand: String,
        outputDirectory: String,
        installationId: String,
        providerRepositoryId: String,
        providerBranch: String,
        providerRootDirectory: String,
        providerSilentMode: Bool,
        specification: String,
        buildRuntime: String,
        adapter: String,
        fallbackFile: String
    ) {
        self.id = id
        self.createdAt = createdAt
        self.updatedAt = updatedAt
        self.name = name
        self.enabled = enabled
        self.live = live
        self.logging = logging
        self.framework = framework
        self.deploymentId = deploymentId
        self.deploymentCreatedAt = deploymentCreatedAt
        self.deploymentScreenshotLight = deploymentScreenshotLight
        self.deploymentScreenshotDark = deploymentScreenshotDark
        self.latestDeploymentId = latestDeploymentId
        self.latestDeploymentCreatedAt = latestDeploymentCreatedAt
        self.latestDeploymentStatus = latestDeploymentStatus
        self.vars = vars
        self.timeout = timeout
        self.installCommand = installCommand
        self.buildCommand = buildCommand
        self.outputDirectory = outputDirectory
        self.installationId = installationId
        self.providerRepositoryId = providerRepositoryId
        self.providerBranch = providerBranch
        self.providerRootDirectory = providerRootDirectory
        self.providerSilentMode = providerSilentMode
        self.specification = specification
        self.buildRuntime = buildRuntime
        self.adapter = adapter
        self.fallbackFile = fallbackFile
    }

    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        self.id = try container.decode(String.self, forKey: .id)
        self.createdAt = try container.decode(String.self, forKey: .createdAt)
        self.updatedAt = try container.decode(String.self, forKey: .updatedAt)
        self.name = try container.decode(String.self, forKey: .name)
        self.enabled = try container.decode(Bool.self, forKey: .enabled)
        self.live = try container.decode(Bool.self, forKey: .live)
        self.logging = try container.decode(Bool.self, forKey: .logging)
        self.framework = try container.decode(String.self, forKey: .framework)
        self.deploymentId = try container.decode(String.self, forKey: .deploymentId)
        self.deploymentCreatedAt = try container.decode(String.self, forKey: .deploymentCreatedAt)
        self.deploymentScreenshotLight = try container.decode(String.self, forKey: .deploymentScreenshotLight)
        self.deploymentScreenshotDark = try container.decode(String.self, forKey: .deploymentScreenshotDark)
        self.latestDeploymentId = try container.decode(String.self, forKey: .latestDeploymentId)
        self.latestDeploymentCreatedAt = try container.decode(String.self, forKey: .latestDeploymentCreatedAt)
        self.latestDeploymentStatus = try container.decode(String.self, forKey: .latestDeploymentStatus)
        self.vars = try container.decode([Variable].self, forKey: .vars)
        self.timeout = try container.decode(Int.self, forKey: .timeout)
        self.installCommand = try container.decode(String.self, forKey: .installCommand)
        self.buildCommand = try container.decode(String.self, forKey: .buildCommand)
        self.outputDirectory = try container.decode(String.self, forKey: .outputDirectory)
        self.installationId = try container.decode(String.self, forKey: .installationId)
        self.providerRepositoryId = try container.decode(String.self, forKey: .providerRepositoryId)
        self.providerBranch = try container.decode(String.self, forKey: .providerBranch)
        self.providerRootDirectory = try container.decode(String.self, forKey: .providerRootDirectory)
        self.providerSilentMode = try container.decode(Bool.self, forKey: .providerSilentMode)
        self.specification = try container.decode(String.self, forKey: .specification)
        self.buildRuntime = try container.decode(String.self, forKey: .buildRuntime)
        self.adapter = try container.decode(String.self, forKey: .adapter)
        self.fallbackFile = try container.decode(String.self, forKey: .fallbackFile)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encode(id, forKey: .id)
        try container.encode(createdAt, forKey: .createdAt)
        try container.encode(updatedAt, forKey: .updatedAt)
        try container.encode(name, forKey: .name)
        try container.encode(enabled, forKey: .enabled)
        try container.encode(live, forKey: .live)
        try container.encode(logging, forKey: .logging)
        try container.encode(framework, forKey: .framework)
        try container.encode(deploymentId, forKey: .deploymentId)
        try container.encode(deploymentCreatedAt, forKey: .deploymentCreatedAt)
        try container.encode(deploymentScreenshotLight, forKey: .deploymentScreenshotLight)
        try container.encode(deploymentScreenshotDark, forKey: .deploymentScreenshotDark)
        try container.encode(latestDeploymentId, forKey: .latestDeploymentId)
        try container.encode(latestDeploymentCreatedAt, forKey: .latestDeploymentCreatedAt)
        try container.encode(latestDeploymentStatus, forKey: .latestDeploymentStatus)
        try container.encode(vars, forKey: .vars)
        try container.encode(timeout, forKey: .timeout)
        try container.encode(installCommand, forKey: .installCommand)
        try container.encode(buildCommand, forKey: .buildCommand)
        try container.encode(outputDirectory, forKey: .outputDirectory)
        try container.encode(installationId, forKey: .installationId)
        try container.encode(providerRepositoryId, forKey: .providerRepositoryId)
        try container.encode(providerBranch, forKey: .providerBranch)
        try container.encode(providerRootDirectory, forKey: .providerRootDirectory)
        try container.encode(providerSilentMode, forKey: .providerSilentMode)
        try container.encode(specification, forKey: .specification)
        try container.encode(buildRuntime, forKey: .buildRuntime)
        try container.encode(adapter, forKey: .adapter)
        try container.encode(fallbackFile, forKey: .fallbackFile)
    }

    public func toMap() -> [String: Any] {
        return [
            "$id": id as Any,
            "$createdAt": createdAt as Any,
            "$updatedAt": updatedAt as Any,
            "name": name as Any,
            "enabled": enabled as Any,
            "live": live as Any,
            "logging": logging as Any,
            "framework": framework as Any,
            "deploymentId": deploymentId as Any,
            "deploymentCreatedAt": deploymentCreatedAt as Any,
            "deploymentScreenshotLight": deploymentScreenshotLight as Any,
            "deploymentScreenshotDark": deploymentScreenshotDark as Any,
            "latestDeploymentId": latestDeploymentId as Any,
            "latestDeploymentCreatedAt": latestDeploymentCreatedAt as Any,
            "latestDeploymentStatus": latestDeploymentStatus as Any,
            "vars": vars.map { $0.toMap() } as Any,
            "timeout": timeout as Any,
            "installCommand": installCommand as Any,
            "buildCommand": buildCommand as Any,
            "outputDirectory": outputDirectory as Any,
            "installationId": installationId as Any,
            "providerRepositoryId": providerRepositoryId as Any,
            "providerBranch": providerBranch as Any,
            "providerRootDirectory": providerRootDirectory as Any,
            "providerSilentMode": providerSilentMode as Any,
            "specification": specification as Any,
            "buildRuntime": buildRuntime as Any,
            "adapter": adapter as Any,
            "fallbackFile": fallbackFile as Any
        ]
    }

    public static func from(map: [String: Any] ) -> Site {
        return Site(
            id: map["$id"] as! String,
            createdAt: map["$createdAt"] as! String,
            updatedAt: map["$updatedAt"] as! String,
            name: map["name"] as! String,
            enabled: map["enabled"] as! Bool,
            live: map["live"] as! Bool,
            logging: map["logging"] as! Bool,
            framework: map["framework"] as! String,
            deploymentId: map["deploymentId"] as! String,
            deploymentCreatedAt: map["deploymentCreatedAt"] as! String,
            deploymentScreenshotLight: map["deploymentScreenshotLight"] as! String,
            deploymentScreenshotDark: map["deploymentScreenshotDark"] as! String,
            latestDeploymentId: map["latestDeploymentId"] as! String,
            latestDeploymentCreatedAt: map["latestDeploymentCreatedAt"] as! String,
            latestDeploymentStatus: map["latestDeploymentStatus"] as! String,
            vars: (map["vars"] as! [[String: Any]]).map { Variable.from(map: $0) },
            timeout: map["timeout"] as! Int,
            installCommand: map["installCommand"] as! String,
            buildCommand: map["buildCommand"] as! String,
            outputDirectory: map["outputDirectory"] as! String,
            installationId: map["installationId"] as! String,
            providerRepositoryId: map["providerRepositoryId"] as! String,
            providerBranch: map["providerBranch"] as! String,
            providerRootDirectory: map["providerRootDirectory"] as! String,
            providerSilentMode: map["providerSilentMode"] as! Bool,
            specification: map["specification"] as! String,
            buildRuntime: map["buildRuntime"] as! String,
            adapter: map["adapter"] as! String,
            fallbackFile: map["fallbackFile"] as! String
        )
    }
}
