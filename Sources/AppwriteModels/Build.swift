import Foundation
import JSONCodable

/// Build
public class Build {

    /// Build ID.
    public let id: String

    /// The deployment that created this build.
    public let deploymentId: String

    /// The build status. There are a few different types and each one means something different. \nFailed - The deployment build has failed. More details can usually be found in buildStderr\nReady - The deployment build was successful and the deployment is ready to be deployed\nProcessing - The deployment is currently waiting to have a build triggered\nBuilding - The deployment is currently being built
    public let status: String

    /// The stdout of the build.
    public let stdout: String

    /// The stderr of the build.
    public let stderr: String

    /// The deployment creation date in ISO 8601 format.
    public let startTime: String

    /// The time the build was finished in ISO 8601 format.
    public let endTime: String

    /// The build duration in seconds.
    public let duration: Int

    /// The code size in bytes.
    public let size: Int


    init(
        id: String,
        deploymentId: String,
        status: String,
        stdout: String,
        stderr: String,
        startTime: String,
        endTime: String,
        duration: Int,
        size: Int
    ) {
        self.id = id
        self.deploymentId = deploymentId
        self.status = status
        self.stdout = stdout
        self.stderr = stderr
        self.startTime = startTime
        self.endTime = endTime
        self.duration = duration
        self.size = size
    }

    public func toMap() -> [String: Any] {
        return [
            "$id": id as Any,
            "deploymentId": deploymentId as Any,
            "status": status as Any,
            "stdout": stdout as Any,
            "stderr": stderr as Any,
            "startTime": startTime as Any,
            "endTime": endTime as Any,
            "duration": duration as Any,
            "size": size as Any
        ]
    }

    public static func from(map: [String: Any] ) -> Build {
        return Build(
            id: map["$id"] as! String,
            deploymentId: map["deploymentId"] as! String,
            status: map["status"] as! String,
            stdout: map["stdout"] as! String,
            stderr: map["stderr"] as! String,
            startTime: map["startTime"] as! String,
            endTime: map["endTime"] as! String,
            duration: map["duration"] as! Int,
            size: map["size"] as! Int
        )
    }
}
