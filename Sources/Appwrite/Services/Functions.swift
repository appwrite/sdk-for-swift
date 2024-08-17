import AsyncHTTPClient
import Foundation
import NIO
import JSONCodable
import AppwriteEnums
import AppwriteModels

/// The Functions Service allows you view, create and manage your Cloud Functions.
open class Functions: Service {

    ///
    /// List functions
    ///
    /// Get a list of all the project's functions. You can use the query params to
    /// filter your results.
    ///
    /// @param [String] queries
    /// @param String search
    /// @throws Exception
    /// @return array
    ///
    open func list(
        queries: [String]? = nil,
        search: String? = nil
    ) async throws -> AppwriteModels.FunctionList {
        let apiPath: String = "/functions"

        let apiParams: [String: Any?] = [
            "queries": queries,
            "search": search
        ]

        let apiHeaders: [String: String] = [
            "content-type": "application/json"
        ]

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
    /// Create function
    ///
    /// Create a new function. You can pass a list of
    /// [permissions](https://appwrite.io/docs/permissions) to allow different
    /// project users or team with access to execute the function using the client
    /// API.
    ///
    /// @param String functionId
    /// @param String name
    /// @param AppwriteEnums.Runtime runtime
    /// @param [String] execute
    /// @param [String] events
    /// @param String schedule
    /// @param Int timeout
    /// @param Bool enabled
    /// @param Bool logging
    /// @param String entrypoint
    /// @param String commands
    /// @param [String] scopes
    /// @param String installationId
    /// @param String providerRepositoryId
    /// @param String providerBranch
    /// @param Bool providerSilentMode
    /// @param String providerRootDirectory
    /// @param String templateRepository
    /// @param String templateOwner
    /// @param String templateRootDirectory
    /// @param String templateVersion
    /// @throws Exception
    /// @return array
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
        scopes: [String]? = nil,
        installationId: String? = nil,
        providerRepositoryId: String? = nil,
        providerBranch: String? = nil,
        providerSilentMode: Bool? = nil,
        providerRootDirectory: String? = nil,
        templateRepository: String? = nil,
        templateOwner: String? = nil,
        templateRootDirectory: String? = nil,
        templateVersion: String? = nil
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
            "templateRepository": templateRepository,
            "templateOwner": templateOwner,
            "templateRootDirectory": templateRootDirectory,
            "templateVersion": templateVersion
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
    /// List runtimes
    ///
    /// Get a list of all runtimes that are currently active on your instance.
    ///
    /// @throws Exception
    /// @return array
    ///
    open func listRuntimes(
    ) async throws -> AppwriteModels.RuntimeList {
        let apiPath: String = "/functions/runtimes"

        let apiParams: [String: Any] = [:]

        let apiHeaders: [String: String] = [
            "content-type": "application/json"
        ]

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
    /// List function templates
    ///
    /// List available function templates. You can use template details in
    /// [createFunction](/docs/references/cloud/server-nodejs/functions#create)
    /// method.
    ///
    /// @param [String] runtimes
    /// @param [String] useCases
    /// @param Int limit
    /// @param Int offset
    /// @throws Exception
    /// @return array
    ///
    open func listTemplates(
        runtimes: [String]? = nil,
        useCases: [String]? = nil,
        limit: Int? = nil,
        offset: Int? = nil
    ) async throws -> AppwriteModels.TemplateFunctionList {
        let apiPath: String = "/functions/templates"

        let apiParams: [String: Any?] = [
            "runtimes": runtimes,
            "useCases": useCases,
            "limit": limit,
            "offset": offset
        ]

        let apiHeaders: [String: String] = [
            "content-type": "application/json"
        ]

        let converter: (Any) -> AppwriteModels.TemplateFunctionList = { response in
            return AppwriteModels.TemplateFunctionList.from(map: response as! [String: Any])
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
    /// Get function template
    ///
    /// Get a function template using ID. You can use template details in
    /// [createFunction](/docs/references/cloud/server-nodejs/functions#create)
    /// method.
    ///
    /// @param String templateId
    /// @throws Exception
    /// @return array
    ///
    open func getTemplate(
        templateId: String
    ) async throws -> AppwriteModels.TemplateFunction {
        let apiPath: String = "/functions/templates/{templateId}"
            .replacingOccurrences(of: "{templateId}", with: templateId)

        let apiParams: [String: Any] = [:]

        let apiHeaders: [String: String] = [
            "content-type": "application/json"
        ]

        let converter: (Any) -> AppwriteModels.TemplateFunction = { response in
            return AppwriteModels.TemplateFunction.from(map: response as! [String: Any])
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
    /// Get function
    ///
    /// Get a function by its unique ID.
    ///
    /// @param String functionId
    /// @throws Exception
    /// @return array
    ///
    open func get(
        functionId: String
    ) async throws -> AppwriteModels.Function {
        let apiPath: String = "/functions/{functionId}"
            .replacingOccurrences(of: "{functionId}", with: functionId)

        let apiParams: [String: Any] = [:]

        let apiHeaders: [String: String] = [
            "content-type": "application/json"
        ]

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
    /// Update function
    ///
    /// Update function by its unique ID.
    ///
    /// @param String functionId
    /// @param String name
    /// @param AppwriteEnums.Runtime runtime
    /// @param [String] execute
    /// @param [String] events
    /// @param String schedule
    /// @param Int timeout
    /// @param Bool enabled
    /// @param Bool logging
    /// @param String entrypoint
    /// @param String commands
    /// @param [String] scopes
    /// @param String installationId
    /// @param String providerRepositoryId
    /// @param String providerBranch
    /// @param Bool providerSilentMode
    /// @param String providerRootDirectory
    /// @throws Exception
    /// @return array
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
        scopes: [String]? = nil,
        installationId: String? = nil,
        providerRepositoryId: String? = nil,
        providerBranch: String? = nil,
        providerSilentMode: Bool? = nil,
        providerRootDirectory: String? = nil
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
            "providerRootDirectory": providerRootDirectory
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
    /// Delete function
    ///
    /// Delete a function by its unique ID.
    ///
    /// @param String functionId
    /// @throws Exception
    /// @return array
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
    /// List deployments
    ///
    /// Get a list of all the project's code deployments. You can use the query
    /// params to filter your results.
    ///
    /// @param String functionId
    /// @param [String] queries
    /// @param String search
    /// @throws Exception
    /// @return array
    ///
    open func listDeployments(
        functionId: String,
        queries: [String]? = nil,
        search: String? = nil
    ) async throws -> AppwriteModels.DeploymentList {
        let apiPath: String = "/functions/{functionId}/deployments"
            .replacingOccurrences(of: "{functionId}", with: functionId)

        let apiParams: [String: Any?] = [
            "queries": queries,
            "search": search
        ]

        let apiHeaders: [String: String] = [
            "content-type": "application/json"
        ]

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
    /// Create deployment
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
    /// @param String functionId
    /// @param InputFile code
    /// @param Bool activate
    /// @param String entrypoint
    /// @param String commands
    /// @throws Exception
    /// @return array
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
    /// Get deployment
    ///
    /// Get a code deployment by its unique ID.
    ///
    /// @param String functionId
    /// @param String deploymentId
    /// @throws Exception
    /// @return array
    ///
    open func getDeployment(
        functionId: String,
        deploymentId: String
    ) async throws -> AppwriteModels.Deployment {
        let apiPath: String = "/functions/{functionId}/deployments/{deploymentId}"
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
            method: "GET",
            path: apiPath,
            headers: apiHeaders,
            params: apiParams,
            converter: converter
        )
    }

    ///
    /// Update deployment
    ///
    /// Update the function code deployment ID using the unique function ID. Use
    /// this endpoint to switch the code deployment that should be executed by the
    /// execution endpoint.
    ///
    /// @param String functionId
    /// @param String deploymentId
    /// @throws Exception
    /// @return array
    ///
    open func updateDeployment(
        functionId: String,
        deploymentId: String
    ) async throws -> AppwriteModels.Function {
        let apiPath: String = "/functions/{functionId}/deployments/{deploymentId}"
            .replacingOccurrences(of: "{functionId}", with: functionId)
            .replacingOccurrences(of: "{deploymentId}", with: deploymentId)

        let apiParams: [String: Any] = [:]

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
    /// Delete deployment
    ///
    /// Delete a code deployment by its unique ID.
    ///
    /// @param String functionId
    /// @param String deploymentId
    /// @throws Exception
    /// @return array
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
    /// Rebuild deployment
    ///
    /// @param String functionId
    /// @param String deploymentId
    /// @param String buildId
    /// @throws Exception
    /// @return array
    ///
    open func createBuild(
        functionId: String,
        deploymentId: String,
        buildId: String? = nil
    ) async throws -> Any {
        let apiPath: String = "/functions/{functionId}/deployments/{deploymentId}/build"
            .replacingOccurrences(of: "{functionId}", with: functionId)
            .replacingOccurrences(of: "{deploymentId}", with: deploymentId)

        let apiParams: [String: Any?] = [
            "buildId": buildId
        ]

        let apiHeaders: [String: String] = [
            "content-type": "application/json"
        ]

        return try await client.call(
            method: "POST",
            path: apiPath,
            headers: apiHeaders,
            params: apiParams        )
    }

    ///
    /// Cancel deployment
    ///
    /// @param String functionId
    /// @param String deploymentId
    /// @throws Exception
    /// @return array
    ///
    open func updateDeploymentBuild(
        functionId: String,
        deploymentId: String
    ) async throws -> AppwriteModels.Build {
        let apiPath: String = "/functions/{functionId}/deployments/{deploymentId}/build"
            .replacingOccurrences(of: "{functionId}", with: functionId)
            .replacingOccurrences(of: "{deploymentId}", with: deploymentId)

        let apiParams: [String: Any] = [:]

        let apiHeaders: [String: String] = [
            "content-type": "application/json"
        ]

        let converter: (Any) -> AppwriteModels.Build = { response in
            return AppwriteModels.Build.from(map: response as! [String: Any])
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
    /// Download deployment
    ///
    /// Get a Deployment's contents by its unique ID. This endpoint supports range
    /// requests for partial or streaming file download.
    ///
    /// @param String functionId
    /// @param String deploymentId
    /// @throws Exception
    /// @return array
    ///
    open func getDeploymentDownload(
        functionId: String,
        deploymentId: String
    ) async throws -> ByteBuffer {
        let apiPath: String = "/functions/{functionId}/deployments/{deploymentId}/download"
            .replacingOccurrences(of: "{functionId}", with: functionId)
            .replacingOccurrences(of: "{deploymentId}", with: deploymentId)

        let apiParams: [String: Any] = [:]

        let apiHeaders: [String: String] = [
            "content-type": "application/json"
        ]

        return try await client.call(
            method: "GET",
            path: apiPath,
            params: apiParams
        )
    }

    ///
    /// List executions
    ///
    /// Get a list of all the current user function execution logs. You can use the
    /// query params to filter your results.
    ///
    /// @param String functionId
    /// @param [String] queries
    /// @param String search
    /// @throws Exception
    /// @return array
    ///
    open func listExecutions(
        functionId: String,
        queries: [String]? = nil,
        search: String? = nil
    ) async throws -> AppwriteModels.ExecutionList {
        let apiPath: String = "/functions/{functionId}/executions"
            .replacingOccurrences(of: "{functionId}", with: functionId)

        let apiParams: [String: Any?] = [
            "queries": queries,
            "search": search
        ]

        let apiHeaders: [String: String] = [
            "content-type": "application/json"
        ]

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
    /// Create execution
    ///
    /// Trigger a function execution. The returned object will return you the
    /// current execution status. You can ping the `Get Execution` endpoint to get
    /// updates on the current execution status. Once this endpoint is called, your
    /// function execution process will start asynchronously.
    ///
    /// @param String functionId
    /// @param String body
    /// @param Bool async
    /// @param String path
    /// @param AppwriteEnums.ExecutionMethod method
    /// @param Any headers
    /// @param String scheduledAt
    /// @throws Exception
    /// @return array
    ///
    open func createExecution(
        functionId: String,
        body: String? = nil,
        async: Bool? = nil,
        path: String? = nil,
        method: AppwriteEnums.ExecutionMethod? = nil,
        headers: Any? = nil,
        scheduledAt: String? = nil,
        onProgress: ((UploadProgress) -> Void)? = nil
    ) async throws -> AppwriteModels.Execution {
        let apiPath: String = "/functions/{functionId}/executions"
            .replacingOccurrences(of: "{functionId}", with: functionId)

        var apiParams: [String: Any?] = [
            "body": body,
            "async": async,
            "path": path,
            "method": method,
            "headers": headers,
            "scheduledAt": scheduledAt
        ]

        var apiHeaders: [String: String] = [
            "content-type": "multipart/form-data"
        ]

        let converter: (Any) -> AppwriteModels.Execution = { response in
            return AppwriteModels.Execution.from(map: response as! [String: Any])
        }

        let idParamName: String? = nil
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
    /// Get execution
    ///
    /// Get a function execution log by its unique ID.
    ///
    /// @param String functionId
    /// @param String executionId
    /// @throws Exception
    /// @return array
    ///
    open func getExecution(
        functionId: String,
        executionId: String
    ) async throws -> AppwriteModels.Execution {
        let apiPath: String = "/functions/{functionId}/executions/{executionId}"
            .replacingOccurrences(of: "{functionId}", with: functionId)
            .replacingOccurrences(of: "{executionId}", with: executionId)

        let apiParams: [String: Any] = [:]

        let apiHeaders: [String: String] = [
            "content-type": "application/json"
        ]

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
    /// Delete execution
    ///
    /// Delete a function execution by its unique ID.
    /// 
    ///
    /// @param String functionId
    /// @param String executionId
    /// @throws Exception
    /// @return array
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
    /// List variables
    ///
    /// Get a list of all variables of a specific function.
    ///
    /// @param String functionId
    /// @throws Exception
    /// @return array
    ///
    open func listVariables(
        functionId: String
    ) async throws -> AppwriteModels.VariableList {
        let apiPath: String = "/functions/{functionId}/variables"
            .replacingOccurrences(of: "{functionId}", with: functionId)

        let apiParams: [String: Any] = [:]

        let apiHeaders: [String: String] = [
            "content-type": "application/json"
        ]

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
    /// Create variable
    ///
    /// Create a new function environment variable. These variables can be accessed
    /// in the function at runtime as environment variables.
    ///
    /// @param String functionId
    /// @param String key
    /// @param String value
    /// @throws Exception
    /// @return array
    ///
    open func createVariable(
        functionId: String,
        key: String,
        value: String
    ) async throws -> AppwriteModels.Variable {
        let apiPath: String = "/functions/{functionId}/variables"
            .replacingOccurrences(of: "{functionId}", with: functionId)

        let apiParams: [String: Any?] = [
            "key": key,
            "value": value
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
    /// Get variable
    ///
    /// Get a variable by its unique ID.
    ///
    /// @param String functionId
    /// @param String variableId
    /// @throws Exception
    /// @return array
    ///
    open func getVariable(
        functionId: String,
        variableId: String
    ) async throws -> AppwriteModels.Variable {
        let apiPath: String = "/functions/{functionId}/variables/{variableId}"
            .replacingOccurrences(of: "{functionId}", with: functionId)
            .replacingOccurrences(of: "{variableId}", with: variableId)

        let apiParams: [String: Any] = [:]

        let apiHeaders: [String: String] = [
            "content-type": "application/json"
        ]

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
    /// Update variable
    ///
    /// Update variable by its unique ID.
    ///
    /// @param String functionId
    /// @param String variableId
    /// @param String key
    /// @param String value
    /// @throws Exception
    /// @return array
    ///
    open func updateVariable(
        functionId: String,
        variableId: String,
        key: String,
        value: String? = nil
    ) async throws -> AppwriteModels.Variable {
        let apiPath: String = "/functions/{functionId}/variables/{variableId}"
            .replacingOccurrences(of: "{functionId}", with: functionId)
            .replacingOccurrences(of: "{variableId}", with: variableId)

        let apiParams: [String: Any?] = [
            "key": key,
            "value": value
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
    /// Delete variable
    ///
    /// Delete a variable by its unique ID.
    ///
    /// @param String functionId
    /// @param String variableId
    /// @throws Exception
    /// @return array
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