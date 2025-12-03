import AsyncHTTPClient
import Foundation
import NIO
import JSONCodable
import AppwriteEnums
import AppwriteModels

/// The Sites Service allows you view, create and manage your web applications.
open class Sites: Service {

    ///
    /// Get a list of all the project's sites. You can use the query params to
    /// filter your results.
    ///
    /// - Parameters:
    ///   - queries: [String] (optional)
    ///   - search: String (optional)
    ///   - total: Bool (optional)
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.SiteList
    ///
    open func list(
        queries: [String]? = nil,
        search: String? = nil,
        total: Bool? = nil
    ) async throws -> AppwriteModels.SiteList {
        let apiPath: String = "/sites"

        let apiParams: [String: Any?] = [
            "queries": queries,
            "search": search,
            "total": total
        ]

        let apiHeaders: [String: String] = [:]

        let converter: (Any) -> AppwriteModels.SiteList = { response in
            return AppwriteModels.SiteList.from(map: response as! [String: Any])
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
    /// Create a new site.
    ///
    /// - Parameters:
    ///   - siteId: String
    ///   - name: String
    ///   - framework: AppwriteEnums.Framework
    ///   - buildRuntime: AppwriteEnums.BuildRuntime
    ///   - enabled: Bool (optional)
    ///   - logging: Bool (optional)
    ///   - timeout: Int (optional)
    ///   - installCommand: String (optional)
    ///   - buildCommand: String (optional)
    ///   - outputDirectory: String (optional)
    ///   - adapter: AppwriteEnums.Adapter (optional)
    ///   - installationId: String (optional)
    ///   - fallbackFile: String (optional)
    ///   - providerRepositoryId: String (optional)
    ///   - providerBranch: String (optional)
    ///   - providerSilentMode: Bool (optional)
    ///   - providerRootDirectory: String (optional)
    ///   - specification: String (optional)
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.Site
    ///
    open func create(
        siteId: String,
        name: String,
        framework: AppwriteEnums.Framework,
        buildRuntime: AppwriteEnums.BuildRuntime,
        enabled: Bool? = nil,
        logging: Bool? = nil,
        timeout: Int? = nil,
        installCommand: String? = nil,
        buildCommand: String? = nil,
        outputDirectory: String? = nil,
        adapter: AppwriteEnums.Adapter? = nil,
        installationId: String? = nil,
        fallbackFile: String? = nil,
        providerRepositoryId: String? = nil,
        providerBranch: String? = nil,
        providerSilentMode: Bool? = nil,
        providerRootDirectory: String? = nil,
        specification: String? = nil
    ) async throws -> AppwriteModels.Site {
        let apiPath: String = "/sites"

        let apiParams: [String: Any?] = [
            "siteId": siteId,
            "name": name,
            "framework": framework,
            "enabled": enabled,
            "logging": logging,
            "timeout": timeout,
            "installCommand": installCommand,
            "buildCommand": buildCommand,
            "outputDirectory": outputDirectory,
            "buildRuntime": buildRuntime,
            "adapter": adapter,
            "installationId": installationId,
            "fallbackFile": fallbackFile,
            "providerRepositoryId": providerRepositoryId,
            "providerBranch": providerBranch,
            "providerSilentMode": providerSilentMode,
            "providerRootDirectory": providerRootDirectory,
            "specification": specification
        ]

        let apiHeaders: [String: String] = [
            "content-type": "application/json"
        ]

        let converter: (Any) -> AppwriteModels.Site = { response in
            return AppwriteModels.Site.from(map: response as! [String: Any])
        }

        return try await client.call(
            method: "POST",
            path: apiPath,
            headers: apiHeaders,
            params: apiParams,
            converter: converter
        )
    }

    ///
    /// Get a list of all frameworks that are currently available on the server
    /// instance.
    ///
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.FrameworkList
    ///
    open func listFrameworks(
    ) async throws -> AppwriteModels.FrameworkList {
        let apiPath: String = "/sites/frameworks"

        let apiParams: [String: Any] = [:]

        let apiHeaders: [String: String] = [:]

        let converter: (Any) -> AppwriteModels.FrameworkList = { response in
            return AppwriteModels.FrameworkList.from(map: response as! [String: Any])
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
    /// List allowed site specifications for this instance.
    ///
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.SpecificationList
    ///
    open func listSpecifications(
    ) async throws -> AppwriteModels.SpecificationList {
        let apiPath: String = "/sites/specifications"

        let apiParams: [String: Any] = [:]

        let apiHeaders: [String: String] = [:]

        let converter: (Any) -> AppwriteModels.SpecificationList = { response in
            return AppwriteModels.SpecificationList.from(map: response as! [String: Any])
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
    /// Get a site by its unique ID.
    ///
    /// - Parameters:
    ///   - siteId: String
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.Site
    ///
    open func get(
        siteId: String
    ) async throws -> AppwriteModels.Site {
        let apiPath: String = "/sites/{siteId}"
            .replacingOccurrences(of: "{siteId}", with: siteId)

        let apiParams: [String: Any] = [:]

        let apiHeaders: [String: String] = [:]

        let converter: (Any) -> AppwriteModels.Site = { response in
            return AppwriteModels.Site.from(map: response as! [String: Any])
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
    /// Update site by its unique ID.
    ///
    /// - Parameters:
    ///   - siteId: String
    ///   - name: String
    ///   - framework: AppwriteEnums.Framework
    ///   - enabled: Bool (optional)
    ///   - logging: Bool (optional)
    ///   - timeout: Int (optional)
    ///   - installCommand: String (optional)
    ///   - buildCommand: String (optional)
    ///   - outputDirectory: String (optional)
    ///   - buildRuntime: AppwriteEnums.BuildRuntime (optional)
    ///   - adapter: AppwriteEnums.Adapter (optional)
    ///   - fallbackFile: String (optional)
    ///   - installationId: String (optional)
    ///   - providerRepositoryId: String (optional)
    ///   - providerBranch: String (optional)
    ///   - providerSilentMode: Bool (optional)
    ///   - providerRootDirectory: String (optional)
    ///   - specification: String (optional)
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.Site
    ///
    open func update(
        siteId: String,
        name: String,
        framework: AppwriteEnums.Framework,
        enabled: Bool? = nil,
        logging: Bool? = nil,
        timeout: Int? = nil,
        installCommand: String? = nil,
        buildCommand: String? = nil,
        outputDirectory: String? = nil,
        buildRuntime: AppwriteEnums.BuildRuntime? = nil,
        adapter: AppwriteEnums.Adapter? = nil,
        fallbackFile: String? = nil,
        installationId: String? = nil,
        providerRepositoryId: String? = nil,
        providerBranch: String? = nil,
        providerSilentMode: Bool? = nil,
        providerRootDirectory: String? = nil,
        specification: String? = nil
    ) async throws -> AppwriteModels.Site {
        let apiPath: String = "/sites/{siteId}"
            .replacingOccurrences(of: "{siteId}", with: siteId)

        let apiParams: [String: Any?] = [
            "name": name,
            "framework": framework,
            "enabled": enabled,
            "logging": logging,
            "timeout": timeout,
            "installCommand": installCommand,
            "buildCommand": buildCommand,
            "outputDirectory": outputDirectory,
            "buildRuntime": buildRuntime,
            "adapter": adapter,
            "fallbackFile": fallbackFile,
            "installationId": installationId,
            "providerRepositoryId": providerRepositoryId,
            "providerBranch": providerBranch,
            "providerSilentMode": providerSilentMode,
            "providerRootDirectory": providerRootDirectory,
            "specification": specification
        ]

        let apiHeaders: [String: String] = [
            "content-type": "application/json"
        ]

        let converter: (Any) -> AppwriteModels.Site = { response in
            return AppwriteModels.Site.from(map: response as! [String: Any])
        }

        return try await client.call(
            method: "PUT",
            path: apiPath,
            headers: apiHeaders,
            params: apiParams,
            converter: converter
        )
    }

    ///
    /// Delete a site by its unique ID.
    ///
    /// - Parameters:
    ///   - siteId: String
    /// - Throws: Exception if the request fails
    /// - Returns: Any
    ///
    open func delete(
        siteId: String
    ) async throws -> Any {
        let apiPath: String = "/sites/{siteId}"
            .replacingOccurrences(of: "{siteId}", with: siteId)

        let apiParams: [String: Any] = [:]

        let apiHeaders: [String: String] = [
            "content-type": "application/json"
        ]

        return try await client.call(
            method: "DELETE",
            path: apiPath,
            headers: apiHeaders,
            params: apiParams        )
    }

    ///
    /// Update the site active deployment. Use this endpoint to switch the code
    /// deployment that should be used when visitor opens your site.
    ///
    /// - Parameters:
    ///   - siteId: String
    ///   - deploymentId: String
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.Site
    ///
    open func updateSiteDeployment(
        siteId: String,
        deploymentId: String
    ) async throws -> AppwriteModels.Site {
        let apiPath: String = "/sites/{siteId}/deployment"
            .replacingOccurrences(of: "{siteId}", with: siteId)

        let apiParams: [String: Any?] = [
            "deploymentId": deploymentId
        ]

        let apiHeaders: [String: String] = [
            "content-type": "application/json"
        ]

        let converter: (Any) -> AppwriteModels.Site = { response in
            return AppwriteModels.Site.from(map: response as! [String: Any])
        }

        return try await client.call(
            method: "PATCH",
            path: apiPath,
            headers: apiHeaders,
            params: apiParams,
            converter: converter
        )
    }

    ///
    /// Get a list of all the site's code deployments. You can use the query params
    /// to filter your results.
    ///
    /// - Parameters:
    ///   - siteId: String
    ///   - queries: [String] (optional)
    ///   - search: String (optional)
    ///   - total: Bool (optional)
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.DeploymentList
    ///
    open func listDeployments(
        siteId: String,
        queries: [String]? = nil,
        search: String? = nil,
        total: Bool? = nil
    ) async throws -> AppwriteModels.DeploymentList {
        let apiPath: String = "/sites/{siteId}/deployments"
            .replacingOccurrences(of: "{siteId}", with: siteId)

        let apiParams: [String: Any?] = [
            "queries": queries,
            "search": search,
            "total": total
        ]

        let apiHeaders: [String: String] = [:]

        let converter: (Any) -> AppwriteModels.DeploymentList = { response in
            return AppwriteModels.DeploymentList.from(map: response as! [String: Any])
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
    /// Create a new site code deployment. Use this endpoint to upload a new
    /// version of your site code. To activate your newly uploaded code, you'll
    /// need to update the site's deployment to use your new deployment ID.
    ///
    /// - Parameters:
    ///   - siteId: String
    ///   - code: InputFile
    ///   - activate: Bool
    ///   - installCommand: String (optional)
    ///   - buildCommand: String (optional)
    ///   - outputDirectory: String (optional)
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.Deployment
    ///
    open func createDeployment(
        siteId: String,
        code: InputFile,
        activate: Bool,
        installCommand: String? = nil,
        buildCommand: String? = nil,
        outputDirectory: String? = nil,
        onProgress: ((UploadProgress) -> Void)? = nil
    ) async throws -> AppwriteModels.Deployment {
        let apiPath: String = "/sites/{siteId}/deployments"
            .replacingOccurrences(of: "{siteId}", with: siteId)

        var apiParams: [String: Any?] = [
            "installCommand": installCommand,
            "buildCommand": buildCommand,
            "outputDirectory": outputDirectory,
            "code": code,
            "activate": activate
        ]

        var apiHeaders: [String: String] = [
            "content-type": "multipart/form-data"
        ]

        let converter: (Any) -> AppwriteModels.Deployment = { response in
            return AppwriteModels.Deployment.from(map: response as! [String: Any])
        }

        let idParamName: String? = nil
        let paramName = "code"
        return try await client.chunkedUpload(
            path: apiPath,
            headers: &apiHeaders,
            params: &apiParams,
            paramName: paramName,
            idParamName: idParamName,
            converter: converter,
            onProgress: onProgress
        )
    }

    ///
    /// Create a new build for an existing site deployment. This endpoint allows
    /// you to rebuild a deployment with the updated site configuration, including
    /// its commands and output directory if they have been modified. The build
    /// process will be queued and executed asynchronously. The original
    /// deployment's code will be preserved and used for the new build.
    ///
    /// - Parameters:
    ///   - siteId: String
    ///   - deploymentId: String
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.Deployment
    ///
    open func createDuplicateDeployment(
        siteId: String,
        deploymentId: String
    ) async throws -> AppwriteModels.Deployment {
        let apiPath: String = "/sites/{siteId}/deployments/duplicate"
            .replacingOccurrences(of: "{siteId}", with: siteId)

        let apiParams: [String: Any?] = [
            "deploymentId": deploymentId
        ]

        let apiHeaders: [String: String] = [
            "content-type": "application/json"
        ]

        let converter: (Any) -> AppwriteModels.Deployment = { response in
            return AppwriteModels.Deployment.from(map: response as! [String: Any])
        }

        return try await client.call(
            method: "POST",
            path: apiPath,
            headers: apiHeaders,
            params: apiParams,
            converter: converter
        )
    }

    ///
    /// Create a deployment based on a template.
    /// 
    /// Use this endpoint with combination of
    /// [listTemplates](https://appwrite.io/docs/products/sites/templates) to find
    /// the template details.
    ///
    /// - Parameters:
    ///   - siteId: String
    ///   - repository: String
    ///   - owner: String
    ///   - rootDirectory: String
    ///   - type: AppwriteEnums.TemplateReferenceType
    ///   - reference: String
    ///   - activate: Bool (optional)
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.Deployment
    ///
    open func createTemplateDeployment(
        siteId: String,
        repository: String,
        owner: String,
        rootDirectory: String,
        type: AppwriteEnums.TemplateReferenceType,
        reference: String,
        activate: Bool? = nil
    ) async throws -> AppwriteModels.Deployment {
        let apiPath: String = "/sites/{siteId}/deployments/template"
            .replacingOccurrences(of: "{siteId}", with: siteId)

        let apiParams: [String: Any?] = [
            "repository": repository,
            "owner": owner,
            "rootDirectory": rootDirectory,
            "type": type,
            "reference": reference,
            "activate": activate
        ]

        let apiHeaders: [String: String] = [
            "content-type": "application/json"
        ]

        let converter: (Any) -> AppwriteModels.Deployment = { response in
            return AppwriteModels.Deployment.from(map: response as! [String: Any])
        }

        return try await client.call(
            method: "POST",
            path: apiPath,
            headers: apiHeaders,
            params: apiParams,
            converter: converter
        )
    }

    ///
    /// Create a deployment when a site is connected to VCS.
    /// 
    /// This endpoint lets you create deployment from a branch, commit, or a tag.
    ///
    /// - Parameters:
    ///   - siteId: String
    ///   - type: AppwriteEnums.VCSReferenceType
    ///   - reference: String
    ///   - activate: Bool (optional)
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.Deployment
    ///
    open func createVcsDeployment(
        siteId: String,
        type: AppwriteEnums.VCSReferenceType,
        reference: String,
        activate: Bool? = nil
    ) async throws -> AppwriteModels.Deployment {
        let apiPath: String = "/sites/{siteId}/deployments/vcs"
            .replacingOccurrences(of: "{siteId}", with: siteId)

        let apiParams: [String: Any?] = [
            "type": type,
            "reference": reference,
            "activate": activate
        ]

        let apiHeaders: [String: String] = [
            "content-type": "application/json"
        ]

        let converter: (Any) -> AppwriteModels.Deployment = { response in
            return AppwriteModels.Deployment.from(map: response as! [String: Any])
        }

        return try await client.call(
            method: "POST",
            path: apiPath,
            headers: apiHeaders,
            params: apiParams,
            converter: converter
        )
    }

    ///
    /// Get a site deployment by its unique ID.
    ///
    /// - Parameters:
    ///   - siteId: String
    ///   - deploymentId: String
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.Deployment
    ///
    open func getDeployment(
        siteId: String,
        deploymentId: String
    ) async throws -> AppwriteModels.Deployment {
        let apiPath: String = "/sites/{siteId}/deployments/{deploymentId}"
            .replacingOccurrences(of: "{siteId}", with: siteId)
            .replacingOccurrences(of: "{deploymentId}", with: deploymentId)

        let apiParams: [String: Any] = [:]

        let apiHeaders: [String: String] = [:]

        let converter: (Any) -> AppwriteModels.Deployment = { response in
            return AppwriteModels.Deployment.from(map: response as! [String: Any])
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
    /// Delete a site deployment by its unique ID.
    ///
    /// - Parameters:
    ///   - siteId: String
    ///   - deploymentId: String
    /// - Throws: Exception if the request fails
    /// - Returns: Any
    ///
    open func deleteDeployment(
        siteId: String,
        deploymentId: String
    ) async throws -> Any {
        let apiPath: String = "/sites/{siteId}/deployments/{deploymentId}"
            .replacingOccurrences(of: "{siteId}", with: siteId)
            .replacingOccurrences(of: "{deploymentId}", with: deploymentId)

        let apiParams: [String: Any] = [:]

        let apiHeaders: [String: String] = [
            "content-type": "application/json"
        ]

        return try await client.call(
            method: "DELETE",
            path: apiPath,
            headers: apiHeaders,
            params: apiParams        )
    }

    ///
    /// Get a site deployment content by its unique ID. The endpoint response
    /// return with a 'Content-Disposition: attachment' header that tells the
    /// browser to start downloading the file to user downloads directory.
    ///
    /// - Parameters:
    ///   - siteId: String
    ///   - deploymentId: String
    ///   - type: AppwriteEnums.DeploymentDownloadType (optional)
    /// - Throws: Exception if the request fails
    /// - Returns: ByteBuffer
    ///
    open func getDeploymentDownload(
        siteId: String,
        deploymentId: String,
        type: AppwriteEnums.DeploymentDownloadType? = nil
    ) async throws -> ByteBuffer {
        let apiPath: String = "/sites/{siteId}/deployments/{deploymentId}/download"
            .replacingOccurrences(of: "{siteId}", with: siteId)
            .replacingOccurrences(of: "{deploymentId}", with: deploymentId)

        let apiParams: [String: Any?] = [
            "type": type,
            "project": client.config["project"],
            "key": client.config["key"]
        ]

        let apiHeaders: [String: String] = [:]

        return try await client.call(
            method: "GET",
            path: apiPath,
            params: apiParams
        )
    }

    ///
    /// Cancel an ongoing site deployment build. If the build is already in
    /// progress, it will be stopped and marked as canceled. If the build hasn't
    /// started yet, it will be marked as canceled without executing. You cannot
    /// cancel builds that have already completed (status 'ready') or failed. The
    /// response includes the final build status and details.
    ///
    /// - Parameters:
    ///   - siteId: String
    ///   - deploymentId: String
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.Deployment
    ///
    open func updateDeploymentStatus(
        siteId: String,
        deploymentId: String
    ) async throws -> AppwriteModels.Deployment {
        let apiPath: String = "/sites/{siteId}/deployments/{deploymentId}/status"
            .replacingOccurrences(of: "{siteId}", with: siteId)
            .replacingOccurrences(of: "{deploymentId}", with: deploymentId)

        let apiParams: [String: Any] = [:]

        let apiHeaders: [String: String] = [
            "content-type": "application/json"
        ]

        let converter: (Any) -> AppwriteModels.Deployment = { response in
            return AppwriteModels.Deployment.from(map: response as! [String: Any])
        }

        return try await client.call(
            method: "PATCH",
            path: apiPath,
            headers: apiHeaders,
            params: apiParams,
            converter: converter
        )
    }

    ///
    /// Get a list of all site logs. You can use the query params to filter your
    /// results.
    ///
    /// - Parameters:
    ///   - siteId: String
    ///   - queries: [String] (optional)
    ///   - total: Bool (optional)
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.ExecutionList
    ///
    open func listLogs(
        siteId: String,
        queries: [String]? = nil,
        total: Bool? = nil
    ) async throws -> AppwriteModels.ExecutionList {
        let apiPath: String = "/sites/{siteId}/logs"
            .replacingOccurrences(of: "{siteId}", with: siteId)

        let apiParams: [String: Any?] = [
            "queries": queries,
            "total": total
        ]

        let apiHeaders: [String: String] = [:]

        let converter: (Any) -> AppwriteModels.ExecutionList = { response in
            return AppwriteModels.ExecutionList.from(map: response as! [String: Any])
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
    /// Get a site request log by its unique ID.
    ///
    /// - Parameters:
    ///   - siteId: String
    ///   - logId: String
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.Execution
    ///
    open func getLog(
        siteId: String,
        logId: String
    ) async throws -> AppwriteModels.Execution {
        let apiPath: String = "/sites/{siteId}/logs/{logId}"
            .replacingOccurrences(of: "{siteId}", with: siteId)
            .replacingOccurrences(of: "{logId}", with: logId)

        let apiParams: [String: Any] = [:]

        let apiHeaders: [String: String] = [:]

        let converter: (Any) -> AppwriteModels.Execution = { response in
            return AppwriteModels.Execution.from(map: response as! [String: Any])
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
    /// Delete a site log by its unique ID.
    ///
    /// - Parameters:
    ///   - siteId: String
    ///   - logId: String
    /// - Throws: Exception if the request fails
    /// - Returns: Any
    ///
    open func deleteLog(
        siteId: String,
        logId: String
    ) async throws -> Any {
        let apiPath: String = "/sites/{siteId}/logs/{logId}"
            .replacingOccurrences(of: "{siteId}", with: siteId)
            .replacingOccurrences(of: "{logId}", with: logId)

        let apiParams: [String: Any] = [:]

        let apiHeaders: [String: String] = [
            "content-type": "application/json"
        ]

        return try await client.call(
            method: "DELETE",
            path: apiPath,
            headers: apiHeaders,
            params: apiParams        )
    }

    ///
    /// Get a list of all variables of a specific site.
    ///
    /// - Parameters:
    ///   - siteId: String
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.VariableList
    ///
    open func listVariables(
        siteId: String
    ) async throws -> AppwriteModels.VariableList {
        let apiPath: String = "/sites/{siteId}/variables"
            .replacingOccurrences(of: "{siteId}", with: siteId)

        let apiParams: [String: Any] = [:]

        let apiHeaders: [String: String] = [:]

        let converter: (Any) -> AppwriteModels.VariableList = { response in
            return AppwriteModels.VariableList.from(map: response as! [String: Any])
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
    /// Create a new site variable. These variables can be accessed during build
    /// and runtime (server-side rendering) as environment variables.
    ///
    /// - Parameters:
    ///   - siteId: String
    ///   - key: String
    ///   - value: String
    ///   - secret: Bool (optional)
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.Variable
    ///
    open func createVariable(
        siteId: String,
        key: String,
        value: String,
        secret: Bool? = nil
    ) async throws -> AppwriteModels.Variable {
        let apiPath: String = "/sites/{siteId}/variables"
            .replacingOccurrences(of: "{siteId}", with: siteId)

        let apiParams: [String: Any?] = [
            "key": key,
            "value": value,
            "secret": secret
        ]

        let apiHeaders: [String: String] = [
            "content-type": "application/json"
        ]

        let converter: (Any) -> AppwriteModels.Variable = { response in
            return AppwriteModels.Variable.from(map: response as! [String: Any])
        }

        return try await client.call(
            method: "POST",
            path: apiPath,
            headers: apiHeaders,
            params: apiParams,
            converter: converter
        )
    }

    ///
    /// Get a variable by its unique ID.
    ///
    /// - Parameters:
    ///   - siteId: String
    ///   - variableId: String
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.Variable
    ///
    open func getVariable(
        siteId: String,
        variableId: String
    ) async throws -> AppwriteModels.Variable {
        let apiPath: String = "/sites/{siteId}/variables/{variableId}"
            .replacingOccurrences(of: "{siteId}", with: siteId)
            .replacingOccurrences(of: "{variableId}", with: variableId)

        let apiParams: [String: Any] = [:]

        let apiHeaders: [String: String] = [:]

        let converter: (Any) -> AppwriteModels.Variable = { response in
            return AppwriteModels.Variable.from(map: response as! [String: Any])
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
    /// Update variable by its unique ID.
    ///
    /// - Parameters:
    ///   - siteId: String
    ///   - variableId: String
    ///   - key: String
    ///   - value: String (optional)
    ///   - secret: Bool (optional)
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.Variable
    ///
    open func updateVariable(
        siteId: String,
        variableId: String,
        key: String,
        value: String? = nil,
        secret: Bool? = nil
    ) async throws -> AppwriteModels.Variable {
        let apiPath: String = "/sites/{siteId}/variables/{variableId}"
            .replacingOccurrences(of: "{siteId}", with: siteId)
            .replacingOccurrences(of: "{variableId}", with: variableId)

        let apiParams: [String: Any?] = [
            "key": key,
            "value": value,
            "secret": secret
        ]

        let apiHeaders: [String: String] = [
            "content-type": "application/json"
        ]

        let converter: (Any) -> AppwriteModels.Variable = { response in
            return AppwriteModels.Variable.from(map: response as! [String: Any])
        }

        return try await client.call(
            method: "PUT",
            path: apiPath,
            headers: apiHeaders,
            params: apiParams,
            converter: converter
        )
    }

    ///
    /// Delete a variable by its unique ID.
    ///
    /// - Parameters:
    ///   - siteId: String
    ///   - variableId: String
    /// - Throws: Exception if the request fails
    /// - Returns: Any
    ///
    open func deleteVariable(
        siteId: String,
        variableId: String
    ) async throws -> Any {
        let apiPath: String = "/sites/{siteId}/variables/{variableId}"
            .replacingOccurrences(of: "{siteId}", with: siteId)
            .replacingOccurrences(of: "{variableId}", with: variableId)

        let apiParams: [String: Any] = [:]

        let apiHeaders: [String: String] = [
            "content-type": "application/json"
        ]

        return try await client.call(
            method: "DELETE",
            path: apiPath,
            headers: apiHeaders,
            params: apiParams        )
    }


}