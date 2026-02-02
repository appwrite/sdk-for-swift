import AsyncHTTPClient
import Foundation
import NIO
import JSONCodable
import AppwriteEnums
import AppwriteModels

/// The Functions Service allows you view, create and manage your Cloud Functions.
open class Functions: Service {

    ///
    /// Get a list of all the project's functions. You can use the query params to
    /// filter your results.
    ///
    /// - Parameters:
    ///   - queries: [String] (optional)
    ///   - search: String (optional)
    ///   - total: Bool (optional)
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.FunctionList
    ///
    open func list(
        queries: [String]? = nil,
        search: String? = nil,
        total: Bool? = nil
    ) async throws -> AppwriteModels.FunctionList {
        let apiPath: String = "/functions"

        let apiParams: [String: Any?] = [
            "queries": queries,
            "search": search,
            "total": total
        ]

        let apiHeaders: [String: String] = [:]

        let converter: (Any) -> AppwriteModels.FunctionList = { response in
            return AppwriteModels.FunctionList.from(map: response as! [String: Any])
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
    /// Create a new function. You can pass a list of
    /// [permissions](https://appwrite.io/docs/permissions) to allow different
    /// project users or team with access to execute the function using the client
    /// API.
    ///
    /// - Parameters:
    ///   - functionId: String
    ///   - name: String
    ///   - runtime: AppwriteEnums.Runtime
    ///   - execute: [String] (optional)
    ///   - events: [String] (optional)
    ///   - schedule: String (optional)
    ///   - timeout: Int (optional)
    ///   - enabled: Bool (optional)
    ///   - logging: Bool (optional)
    ///   - entrypoint: String (optional)
    ///   - commands: String (optional)
    ///   - scopes: [AppwriteEnums.Scopes] (optional)
    ///   - installationId: String (optional)
    ///   - providerRepositoryId: String (optional)
    ///   - providerBranch: String (optional)
    ///   - providerSilentMode: Bool (optional)
    ///   - providerRootDirectory: String (optional)
    ///   - specification: String (optional)
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.Function
    ///
    open func create(
        functionId: String,
        name: String,
        runtime: AppwriteEnums.Runtime,
        execute: [String]? = nil,
        events: [String]? = nil,
        schedule: String? = nil,
        timeout: Int? = nil,
        enabled: Bool? = nil,
        logging: Bool? = nil,
        entrypoint: String? = nil,
        commands: String? = nil,
        scopes: [AppwriteEnums.Scopes]? = nil,
        installationId: String? = nil,
        providerRepositoryId: String? = nil,
        providerBranch: String? = nil,
        providerSilentMode: Bool? = nil,
        providerRootDirectory: String? = nil,
        specification: String? = nil
    ) async throws -> AppwriteModels.Function {
        let apiPath: String = "/functions"

        let apiParams: [String: Any?] = [
            "functionId": functionId,
            "name": name,
            "runtime": runtime,
            "execute": execute,
            "events": events,
            "schedule": schedule,
            "timeout": timeout,
            "enabled": enabled,
            "logging": logging,
            "entrypoint": entrypoint,
            "commands": commands,
            "scopes": scopes,
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

        let converter: (Any) -> AppwriteModels.Function = { response in
            return AppwriteModels.Function.from(map: response as! [String: Any])
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
    /// Get a list of all runtimes that are currently active on your instance.
    ///
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.RuntimeList
    ///
    open func listRuntimes(
    ) async throws -> AppwriteModels.RuntimeList {
        let apiPath: String = "/functions/runtimes"

        let apiParams: [String: Any] = [:]

        let apiHeaders: [String: String] = [:]

        let converter: (Any) -> AppwriteModels.RuntimeList = { response in
            return AppwriteModels.RuntimeList.from(map: response as! [String: Any])
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
    /// List allowed function specifications for this instance.
    ///
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.SpecificationList
    ///
    open func listSpecifications(
    ) async throws -> AppwriteModels.SpecificationList {
        let apiPath: String = "/functions/specifications"

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
    /// Get a function by its unique ID.
    ///
    /// - Parameters:
    ///   - functionId: String
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.Function
    ///
    open func get(
        functionId: String
    ) async throws -> AppwriteModels.Function {
        let apiPath: String = "/functions/{functionId}"
            .replacingOccurrences(of: "{functionId}", with: functionId)

        let apiParams: [String: Any] = [:]

        let apiHeaders: [String: String] = [:]

        let converter: (Any) -> AppwriteModels.Function = { response in
            return AppwriteModels.Function.from(map: response as! [String: Any])
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
    /// Update function by its unique ID.
    ///
    /// - Parameters:
    ///   - functionId: String
    ///   - name: String
    ///   - runtime: AppwriteEnums.Runtime (optional)
    ///   - execute: [String] (optional)
    ///   - events: [String] (optional)
    ///   - schedule: String (optional)
    ///   - timeout: Int (optional)
    ///   - enabled: Bool (optional)
    ///   - logging: Bool (optional)
    ///   - entrypoint: String (optional)
    ///   - commands: String (optional)
    ///   - scopes: [AppwriteEnums.Scopes] (optional)
    ///   - installationId: String (optional)
    ///   - providerRepositoryId: String (optional)
    ///   - providerBranch: String (optional)
    ///   - providerSilentMode: Bool (optional)
    ///   - providerRootDirectory: String (optional)
    ///   - specification: String (optional)
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.Function
    ///
    open func update(
        functionId: String,
        name: String,
        runtime: AppwriteEnums.Runtime? = nil,
        execute: [String]? = nil,
        events: [String]? = nil,
        schedule: String? = nil,
        timeout: Int? = nil,
        enabled: Bool? = nil,
        logging: Bool? = nil,
        entrypoint: String? = nil,
        commands: String? = nil,
        scopes: [AppwriteEnums.Scopes]? = nil,
        installationId: String? = nil,
        providerRepositoryId: String? = nil,
        providerBranch: String? = nil,
        providerSilentMode: Bool? = nil,
        providerRootDirectory: String? = nil,
        specification: String? = nil
    ) async throws -> AppwriteModels.Function {
        let apiPath: String = "/functions/{functionId}"
            .replacingOccurrences(of: "{functionId}", with: functionId)

        let apiParams: [String: Any?] = [
            "name": name,
            "runtime": runtime,
            "execute": execute,
            "events": events,
            "schedule": schedule,
            "timeout": timeout,
            "enabled": enabled,
            "logging": logging,
            "entrypoint": entrypoint,
            "commands": commands,
            "scopes": scopes,
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

        let converter: (Any) -> AppwriteModels.Function = { response in
            return AppwriteModels.Function.from(map: response as! [String: Any])
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
    /// Delete a function by its unique ID.
    ///
    /// - Parameters:
    ///   - functionId: String
    /// - Throws: Exception if the request fails
    /// - Returns: Any
    ///
    open func delete(
        functionId: String
    ) async throws -> Any {
        let apiPath: String = "/functions/{functionId}"
            .replacingOccurrences(of: "{functionId}", with: functionId)

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
    /// Update the function active deployment. Use this endpoint to switch the code
    /// deployment that should be used when visitor opens your function.
    ///
    /// - Parameters:
    ///   - functionId: String
    ///   - deploymentId: String
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.Function
    ///
    open func updateFunctionDeployment(
        functionId: String,
        deploymentId: String
    ) async throws -> AppwriteModels.Function {
        let apiPath: String = "/functions/{functionId}/deployment"
            .replacingOccurrences(of: "{functionId}", with: functionId)

        let apiParams: [String: Any?] = [
            "deploymentId": deploymentId
        ]

        let apiHeaders: [String: String] = [
            "content-type": "application/json"
        ]

        let converter: (Any) -> AppwriteModels.Function = { response in
            return AppwriteModels.Function.from(map: response as! [String: Any])
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
    /// Get a list of all the function's code deployments. You can use the query
    /// params to filter your results.
    ///
    /// - Parameters:
    ///   - functionId: String
    ///   - queries: [String] (optional)
    ///   - search: String (optional)
    ///   - total: Bool (optional)
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.DeploymentList
    ///
    open func listDeployments(
        functionId: String,
        queries: [String]? = nil,
        search: String? = nil,
        total: Bool? = nil
    ) async throws -> AppwriteModels.DeploymentList {
        let apiPath: String = "/functions/{functionId}/deployments"
            .replacingOccurrences(of: "{functionId}", with: functionId)

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
    /// Create a new function code deployment. Use this endpoint to upload a new
    /// version of your code function. To execute your newly uploaded code, you'll
    /// need to update the function's deployment to use your new deployment UID.
    /// 
    /// This endpoint accepts a tar.gz file compressed with your code. Make sure to
    /// include any dependencies your code has within the compressed file. You can
    /// learn more about code packaging in the [Appwrite Cloud Functions
    /// tutorial](https://appwrite.io/docs/functions).
    /// 
    /// Use the "command" param to set the entrypoint used to execute your code.
    ///
    /// - Parameters:
    ///   - functionId: String
    ///   - code: InputFile
    ///   - activate: Bool
    ///   - entrypoint: String (optional)
    ///   - commands: String (optional)
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.Deployment
    ///
    open func createDeployment(
        functionId: String,
        code: InputFile,
        activate: Bool,
        entrypoint: String? = nil,
        commands: String? = nil,
        onProgress: ((UploadProgress) -> Void)? = nil
    ) async throws -> AppwriteModels.Deployment {
        let apiPath: String = "/functions/{functionId}/deployments"
            .replacingOccurrences(of: "{functionId}", with: functionId)

        var apiParams: [String: Any?] = [
            "entrypoint": entrypoint,
            "commands": commands,
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
    /// Create a new build for an existing function deployment. This endpoint
    /// allows you to rebuild a deployment with the updated function configuration,
    /// including its entrypoint and build commands if they have been modified. The
    /// build process will be queued and executed asynchronously. The original
    /// deployment's code will be preserved and used for the new build.
    ///
    /// - Parameters:
    ///   - functionId: String
    ///   - deploymentId: String
    ///   - buildId: String (optional)
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.Deployment
    ///
    open func createDuplicateDeployment(
        functionId: String,
        deploymentId: String,
        buildId: String? = nil
    ) async throws -> AppwriteModels.Deployment {
        let apiPath: String = "/functions/{functionId}/deployments/duplicate"
            .replacingOccurrences(of: "{functionId}", with: functionId)

        let apiParams: [String: Any?] = [
            "deploymentId": deploymentId,
            "buildId": buildId
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
    /// [listTemplates](https://appwrite.io/docs/products/functions/templates) to
    /// find the template details.
    ///
    /// - Parameters:
    ///   - functionId: String
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
        functionId: String,
        repository: String,
        owner: String,
        rootDirectory: String,
        type: AppwriteEnums.TemplateReferenceType,
        reference: String,
        activate: Bool? = nil
    ) async throws -> AppwriteModels.Deployment {
        let apiPath: String = "/functions/{functionId}/deployments/template"
            .replacingOccurrences(of: "{functionId}", with: functionId)

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
    /// Create a deployment when a function is connected to VCS.
    /// 
    /// This endpoint lets you create deployment from a branch, commit, or a tag.
    ///
    /// - Parameters:
    ///   - functionId: String
    ///   - type: AppwriteEnums.VCSReferenceType
    ///   - reference: String
    ///   - activate: Bool (optional)
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.Deployment
    ///
    open func createVcsDeployment(
        functionId: String,
        type: AppwriteEnums.VCSReferenceType,
        reference: String,
        activate: Bool? = nil
    ) async throws -> AppwriteModels.Deployment {
        let apiPath: String = "/functions/{functionId}/deployments/vcs"
            .replacingOccurrences(of: "{functionId}", with: functionId)

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
    /// Get a function deployment by its unique ID.
    ///
    /// - Parameters:
    ///   - functionId: String
    ///   - deploymentId: String
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.Deployment
    ///
    open func getDeployment(
        functionId: String,
        deploymentId: String
    ) async throws -> AppwriteModels.Deployment {
        let apiPath: String = "/functions/{functionId}/deployments/{deploymentId}"
            .replacingOccurrences(of: "{functionId}", with: functionId)
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
    /// Delete a code deployment by its unique ID.
    ///
    /// - Parameters:
    ///   - functionId: String
    ///   - deploymentId: String
    /// - Throws: Exception if the request fails
    /// - Returns: Any
    ///
    open func deleteDeployment(
        functionId: String,
        deploymentId: String
    ) async throws -> Any {
        let apiPath: String = "/functions/{functionId}/deployments/{deploymentId}"
            .replacingOccurrences(of: "{functionId}", with: functionId)
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
    /// Get a function deployment content by its unique ID. The endpoint response
    /// return with a 'Content-Disposition: attachment' header that tells the
    /// browser to start downloading the file to user downloads directory.
    ///
    /// - Parameters:
    ///   - functionId: String
    ///   - deploymentId: String
    ///   - type: AppwriteEnums.DeploymentDownloadType (optional)
    /// - Throws: Exception if the request fails
    /// - Returns: ByteBuffer
    ///
    open func getDeploymentDownload(
        functionId: String,
        deploymentId: String,
        type: AppwriteEnums.DeploymentDownloadType? = nil
    ) async throws -> ByteBuffer {
        let apiPath: String = "/functions/{functionId}/deployments/{deploymentId}/download"
            .replacingOccurrences(of: "{functionId}", with: functionId)
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
    /// Cancel an ongoing function deployment build. If the build is already in
    /// progress, it will be stopped and marked as canceled. If the build hasn't
    /// started yet, it will be marked as canceled without executing. You cannot
    /// cancel builds that have already completed (status 'ready') or failed. The
    /// response includes the final build status and details.
    ///
    /// - Parameters:
    ///   - functionId: String
    ///   - deploymentId: String
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.Deployment
    ///
    open func updateDeploymentStatus(
        functionId: String,
        deploymentId: String
    ) async throws -> AppwriteModels.Deployment {
        let apiPath: String = "/functions/{functionId}/deployments/{deploymentId}/status"
            .replacingOccurrences(of: "{functionId}", with: functionId)
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
    /// Get a list of all the current user function execution logs. You can use the
    /// query params to filter your results.
    ///
    /// - Parameters:
    ///   - functionId: String
    ///   - queries: [String] (optional)
    ///   - total: Bool (optional)
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.ExecutionList
    ///
    open func listExecutions(
        functionId: String,
        queries: [String]? = nil,
        total: Bool? = nil
    ) async throws -> AppwriteModels.ExecutionList {
        let apiPath: String = "/functions/{functionId}/executions"
            .replacingOccurrences(of: "{functionId}", with: functionId)

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
    /// Trigger a function execution. The returned object will return you the
    /// current execution status. You can ping the `Get Execution` endpoint to get
    /// updates on the current execution status. Once this endpoint is called, your
    /// function execution process will start asynchronously.
    ///
    /// - Parameters:
    ///   - functionId: String
    ///   - body: String (optional)
    ///   - async: Bool (optional)
    ///   - path: String (optional)
    ///   - method: AppwriteEnums.ExecutionMethod (optional)
    ///   - headers: Any (optional)
    ///   - scheduledAt: String (optional)
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.Execution
    ///
    open func createExecution(
        functionId: String,
        body: String? = nil,
        async: Bool? = nil,
        path: String? = nil,
        method: AppwriteEnums.ExecutionMethod? = nil,
        headers: Any? = nil,
        scheduledAt: String? = nil
    ) async throws -> AppwriteModels.Execution {
        let apiPath: String = "/functions/{functionId}/executions"
            .replacingOccurrences(of: "{functionId}", with: functionId)

        let apiParams: [String: Any?] = [
            "body": body,
            "async": async,
            "path": path,
            "method": method,
            "headers": headers,
            "scheduledAt": scheduledAt
        ]

        let apiHeaders: [String: String] = [
            "content-type": "application/json"
        ]

        let converter: (Any) -> AppwriteModels.Execution = { response in
            return AppwriteModels.Execution.from(map: response as! [String: Any])
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
    /// Get a function execution log by its unique ID.
    ///
    /// - Parameters:
    ///   - functionId: String
    ///   - executionId: String
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.Execution
    ///
    open func getExecution(
        functionId: String,
        executionId: String
    ) async throws -> AppwriteModels.Execution {
        let apiPath: String = "/functions/{functionId}/executions/{executionId}"
            .replacingOccurrences(of: "{functionId}", with: functionId)
            .replacingOccurrences(of: "{executionId}", with: executionId)

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
    /// Delete a function execution by its unique ID.
    ///
    /// - Parameters:
    ///   - functionId: String
    ///   - executionId: String
    /// - Throws: Exception if the request fails
    /// - Returns: Any
    ///
    open func deleteExecution(
        functionId: String,
        executionId: String
    ) async throws -> Any {
        let apiPath: String = "/functions/{functionId}/executions/{executionId}"
            .replacingOccurrences(of: "{functionId}", with: functionId)
            .replacingOccurrences(of: "{executionId}", with: executionId)

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
    /// Get a list of all variables of a specific function.
    ///
    /// - Parameters:
    ///   - functionId: String
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.VariableList
    ///
    open func listVariables(
        functionId: String
    ) async throws -> AppwriteModels.VariableList {
        let apiPath: String = "/functions/{functionId}/variables"
            .replacingOccurrences(of: "{functionId}", with: functionId)

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
    /// Create a new function environment variable. These variables can be accessed
    /// in the function at runtime as environment variables.
    ///
    /// - Parameters:
    ///   - functionId: String
    ///   - key: String
    ///   - value: String
    ///   - secret: Bool (optional)
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.Variable
    ///
    open func createVariable(
        functionId: String,
        key: String,
        value: String,
        secret: Bool? = nil
    ) async throws -> AppwriteModels.Variable {
        let apiPath: String = "/functions/{functionId}/variables"
            .replacingOccurrences(of: "{functionId}", with: functionId)

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
    ///   - functionId: String
    ///   - variableId: String
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.Variable
    ///
    open func getVariable(
        functionId: String,
        variableId: String
    ) async throws -> AppwriteModels.Variable {
        let apiPath: String = "/functions/{functionId}/variables/{variableId}"
            .replacingOccurrences(of: "{functionId}", with: functionId)
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
    ///   - functionId: String
    ///   - variableId: String
    ///   - key: String
    ///   - value: String (optional)
    ///   - secret: Bool (optional)
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.Variable
    ///
    open func updateVariable(
        functionId: String,
        variableId: String,
        key: String,
        value: String? = nil,
        secret: Bool? = nil
    ) async throws -> AppwriteModels.Variable {
        let apiPath: String = "/functions/{functionId}/variables/{variableId}"
            .replacingOccurrences(of: "{functionId}", with: functionId)
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
    ///   - functionId: String
    ///   - variableId: String
    /// - Throws: Exception if the request fails
    /// - Returns: Any
    ///
    open func deleteVariable(
        functionId: String,
        variableId: String
    ) async throws -> Any {
        let apiPath: String = "/functions/{functionId}/variables/{variableId}"
            .replacingOccurrences(of: "{functionId}", with: functionId)
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