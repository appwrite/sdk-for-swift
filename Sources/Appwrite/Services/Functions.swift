import AsyncHTTPClient
import Foundation
import NIO
import JSONCodable
import AppwriteModels

/// The Functions Service allows you view, create and manage your Cloud Functions.
open class Functions: Service {

    ///
    /// List Functions
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
        let api_path: String = "/functions"

        let params: [String: Any?] = [
            "queries": queries,
            "search": search
        ]

        let headers: [String: String] = [
            "content-type": "application/json"
        ]

        let converter: (Any) -> AppwriteModels.FunctionList = { response in
            return AppwriteModels.FunctionList.from(map: response as! [String: Any])
        }

        return try await client.call(
            method: "GET",
            path: api_path,
            headers: headers,
            params: params,
            converter: converter
        )
    }

    ///
    /// Create Function
    ///
    /// Create a new function. You can pass a list of
    /// [permissions](/docs/permissions) to allow different project users or team
    /// with access to execute the function using the client API.
    ///
    /// @param String functionId
    /// @param String name
    /// @param String runtime
    /// @param [String] execute
    /// @param [String] events
    /// @param String schedule
    /// @param Int timeout
    /// @param Bool enabled
    /// @param Bool logging
    /// @param String entrypoint
    /// @param String commands
    /// @param String installationId
    /// @param String providerRepositoryId
    /// @param String providerBranch
    /// @param Bool providerSilentMode
    /// @param String providerRootDirectory
    /// @param String templateRepository
    /// @param String templateOwner
    /// @param String templateRootDirectory
    /// @param String templateBranch
    /// @throws Exception
    /// @return array
    ///
    open func create(
        functionId: String,
        name: String,
        runtime: String,
        execute: [String]? = nil,
        events: [String]? = nil,
        schedule: String? = nil,
        timeout: Int? = nil,
        enabled: Bool? = nil,
        logging: Bool? = nil,
        entrypoint: String? = nil,
        commands: String? = nil,
        installationId: String? = nil,
        providerRepositoryId: String? = nil,
        providerBranch: String? = nil,
        providerSilentMode: Bool? = nil,
        providerRootDirectory: String? = nil,
        templateRepository: String? = nil,
        templateOwner: String? = nil,
        templateRootDirectory: String? = nil,
        templateBranch: String? = nil
    ) async throws -> AppwriteModels.Function {
        let api_path: String = "/functions"

        let params: [String: Any?] = [
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
            "installationId": installationId,
            "providerRepositoryId": providerRepositoryId,
            "providerBranch": providerBranch,
            "providerSilentMode": providerSilentMode,
            "providerRootDirectory": providerRootDirectory,
            "templateRepository": templateRepository,
            "templateOwner": templateOwner,
            "templateRootDirectory": templateRootDirectory,
            "templateBranch": templateBranch
        ]

        let headers: [String: String] = [
            "content-type": "application/json"
        ]

        let converter: (Any) -> AppwriteModels.Function = { response in
            return AppwriteModels.Function.from(map: response as! [String: Any])
        }

        return try await client.call(
            method: "POST",
            path: api_path,
            headers: headers,
            params: params,
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
        let api_path: String = "/functions/runtimes"

        let params: [String: Any] = [:]

        let headers: [String: String] = [
            "content-type": "application/json"
        ]

        let converter: (Any) -> AppwriteModels.RuntimeList = { response in
            return AppwriteModels.RuntimeList.from(map: response as! [String: Any])
        }

        return try await client.call(
            method: "GET",
            path: api_path,
            headers: headers,
            params: params,
            converter: converter
        )
    }

    ///
    /// Get Function
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
        let api_path: String = "/functions/{functionId}"
            .replacingOccurrences(of: "{functionId}", with: functionId)

        let params: [String: Any] = [:]

        let headers: [String: String] = [
            "content-type": "application/json"
        ]

        let converter: (Any) -> AppwriteModels.Function = { response in
            return AppwriteModels.Function.from(map: response as! [String: Any])
        }

        return try await client.call(
            method: "GET",
            path: api_path,
            headers: headers,
            params: params,
            converter: converter
        )
    }

    ///
    /// Update Function
    ///
    /// Update function by its unique ID.
    ///
    /// @param String functionId
    /// @param String name
    /// @param String runtime
    /// @param [String] execute
    /// @param [String] events
    /// @param String schedule
    /// @param Int timeout
    /// @param Bool enabled
    /// @param Bool logging
    /// @param String entrypoint
    /// @param String commands
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
        runtime: String,
        execute: [String]? = nil,
        events: [String]? = nil,
        schedule: String? = nil,
        timeout: Int? = nil,
        enabled: Bool? = nil,
        logging: Bool? = nil,
        entrypoint: String? = nil,
        commands: String? = nil,
        installationId: String? = nil,
        providerRepositoryId: String? = nil,
        providerBranch: String? = nil,
        providerSilentMode: Bool? = nil,
        providerRootDirectory: String? = nil
    ) async throws -> AppwriteModels.Function {
        let api_path: String = "/functions/{functionId}"
            .replacingOccurrences(of: "{functionId}", with: functionId)

        let params: [String: Any?] = [
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
            "installationId": installationId,
            "providerRepositoryId": providerRepositoryId,
            "providerBranch": providerBranch,
            "providerSilentMode": providerSilentMode,
            "providerRootDirectory": providerRootDirectory
        ]

        let headers: [String: String] = [
            "content-type": "application/json"
        ]

        let converter: (Any) -> AppwriteModels.Function = { response in
            return AppwriteModels.Function.from(map: response as! [String: Any])
        }

        return try await client.call(
            method: "PUT",
            path: api_path,
            headers: headers,
            params: params,
            converter: converter
        )
    }

    ///
    /// Delete Function
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
        let api_path: String = "/functions/{functionId}"
            .replacingOccurrences(of: "{functionId}", with: functionId)

        let params: [String: Any] = [:]

        let headers: [String: String] = [
            "content-type": "application/json"
        ]

        return try await client.call(
            method: "DELETE",
            path: api_path,
            headers: headers,
            params: params        )
    }

    ///
    /// List Deployments
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
        let api_path: String = "/functions/{functionId}/deployments"
            .replacingOccurrences(of: "{functionId}", with: functionId)

        let params: [String: Any?] = [
            "queries": queries,
            "search": search
        ]

        let headers: [String: String] = [
            "content-type": "application/json"
        ]

        let converter: (Any) -> AppwriteModels.DeploymentList = { response in
            return AppwriteModels.DeploymentList.from(map: response as! [String: Any])
        }

        return try await client.call(
            method: "GET",
            path: api_path,
            headers: headers,
            params: params,
            converter: converter
        )
    }

    ///
    /// Create Deployment
    ///
    /// Create a new function code deployment. Use this endpoint to upload a new
    /// version of your code function. To execute your newly uploaded code, you'll
    /// need to update the function's deployment to use your new deployment UID.
    /// 
    /// This endpoint accepts a tar.gz file compressed with your code. Make sure to
    /// include any dependencies your code has within the compressed file. You can
    /// learn more about code packaging in the [Appwrite Cloud Functions
    /// tutorial](/docs/functions).
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
        let api_path: String = "/functions/{functionId}/deployments"
            .replacingOccurrences(of: "{functionId}", with: functionId)

        var params: [String: Any?] = [
            "entrypoint": entrypoint,
            "commands": commands,
            "code": code,
            "activate": activate
        ]

        var headers: [String: String] = [
            "content-type": "multipart/form-data"
        ]

        let converter: (Any) -> AppwriteModels.Deployment = { response in
            return AppwriteModels.Deployment.from(map: response as! [String: Any])
        }

        let idParamName: String? = nil
        let paramName = "code"
        return try await client.chunkedUpload(
            path: api_path,
            headers: &headers,
            params: &params,
            paramName: paramName,
            idParamName: idParamName,
            converter: converter,
            onProgress: onProgress
        )
    }

    ///
    /// Get Deployment
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
        let api_path: String = "/functions/{functionId}/deployments/{deploymentId}"
            .replacingOccurrences(of: "{functionId}", with: functionId)
            .replacingOccurrences(of: "{deploymentId}", with: deploymentId)

        let params: [String: Any] = [:]

        let headers: [String: String] = [
            "content-type": "application/json"
        ]

        let converter: (Any) -> AppwriteModels.Deployment = { response in
            return AppwriteModels.Deployment.from(map: response as! [String: Any])
        }

        return try await client.call(
            method: "GET",
            path: api_path,
            headers: headers,
            params: params,
            converter: converter
        )
    }

    ///
    /// Update Function Deployment
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
        let api_path: String = "/functions/{functionId}/deployments/{deploymentId}"
            .replacingOccurrences(of: "{functionId}", with: functionId)
            .replacingOccurrences(of: "{deploymentId}", with: deploymentId)

        let params: [String: Any] = [:]

        let headers: [String: String] = [
            "content-type": "application/json"
        ]

        let converter: (Any) -> AppwriteModels.Function = { response in
            return AppwriteModels.Function.from(map: response as! [String: Any])
        }

        return try await client.call(
            method: "PATCH",
            path: api_path,
            headers: headers,
            params: params,
            converter: converter
        )
    }

    ///
    /// Delete Deployment
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
        let api_path: String = "/functions/{functionId}/deployments/{deploymentId}"
            .replacingOccurrences(of: "{functionId}", with: functionId)
            .replacingOccurrences(of: "{deploymentId}", with: deploymentId)

        let params: [String: Any] = [:]

        let headers: [String: String] = [
            "content-type": "application/json"
        ]

        return try await client.call(
            method: "DELETE",
            path: api_path,
            headers: headers,
            params: params        )
    }

    ///
    /// Create Build
    ///
    /// Create a new build for an Appwrite Function deployment. This endpoint can
    /// be used to retry a failed build.
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
        buildId: String
    ) async throws -> Any {
        let api_path: String = "/functions/{functionId}/deployments/{deploymentId}/builds/{buildId}"
            .replacingOccurrences(of: "{functionId}", with: functionId)
            .replacingOccurrences(of: "{deploymentId}", with: deploymentId)
            .replacingOccurrences(of: "{buildId}", with: buildId)

        let params: [String: Any] = [:]

        let headers: [String: String] = [
            "content-type": "application/json"
        ]

        return try await client.call(
            method: "POST",
            path: api_path,
            headers: headers,
            params: params        )
    }

    ///
    /// Download Deployment
    ///
    /// @param String functionId
    /// @param String deploymentId
    /// @throws Exception
    /// @return array
    ///
    open func downloadDeployment(
        functionId: String,
        deploymentId: String
    ) async throws -> ByteBuffer {
        let api_path: String = "/functions/{functionId}/deployments/{deploymentId}/download"
            .replacingOccurrences(of: "{functionId}", with: functionId)
            .replacingOccurrences(of: "{deploymentId}", with: deploymentId)

        let params: [String: Any] = [:]

        return try await client.call(
            method: "GET",
            path: api_path,
            params: params
        )
    }

    ///
    /// List Executions
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
        let api_path: String = "/functions/{functionId}/executions"
            .replacingOccurrences(of: "{functionId}", with: functionId)

        let params: [String: Any?] = [
            "queries": queries,
            "search": search
        ]

        let headers: [String: String] = [
            "content-type": "application/json"
        ]

        let converter: (Any) -> AppwriteModels.ExecutionList = { response in
            return AppwriteModels.ExecutionList.from(map: response as! [String: Any])
        }

        return try await client.call(
            method: "GET",
            path: api_path,
            headers: headers,
            params: params,
            converter: converter
        )
    }

    ///
    /// Create Execution
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
    /// @param String method
    /// @param Any headers
    /// @throws Exception
    /// @return array
    ///
    open func createExecution(
        functionId: String,
        body: String? = nil,
        async: Bool? = nil,
        path: String? = nil,
        method: String? = nil,
        headers: Any? = nil
    ) async throws -> AppwriteModels.Execution {
        let api_path: String = "/functions/{functionId}/executions"
            .replacingOccurrences(of: "{functionId}", with: functionId)

        let params: [String: Any?] = [
            "body": body,
            "async": async,
            "path": path,
            "method": method,
            "headers": headers
        ]

        let headers: [String: String] = [
            "content-type": "application/json"
        ]

        let converter: (Any) -> AppwriteModels.Execution = { response in
            return AppwriteModels.Execution.from(map: response as! [String: Any])
        }

        return try await client.call(
            method: "POST",
            path: api_path,
            headers: headers,
            params: params,
            converter: converter
        )
    }

    ///
    /// Get Execution
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
        let api_path: String = "/functions/{functionId}/executions/{executionId}"
            .replacingOccurrences(of: "{functionId}", with: functionId)
            .replacingOccurrences(of: "{executionId}", with: executionId)

        let params: [String: Any] = [:]

        let headers: [String: String] = [
            "content-type": "application/json"
        ]

        let converter: (Any) -> AppwriteModels.Execution = { response in
            return AppwriteModels.Execution.from(map: response as! [String: Any])
        }

        return try await client.call(
            method: "GET",
            path: api_path,
            headers: headers,
            params: params,
            converter: converter
        )
    }

    ///
    /// List Variables
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
        let api_path: String = "/functions/{functionId}/variables"
            .replacingOccurrences(of: "{functionId}", with: functionId)

        let params: [String: Any] = [:]

        let headers: [String: String] = [
            "content-type": "application/json"
        ]

        let converter: (Any) -> AppwriteModels.VariableList = { response in
            return AppwriteModels.VariableList.from(map: response as! [String: Any])
        }

        return try await client.call(
            method: "GET",
            path: api_path,
            headers: headers,
            params: params,
            converter: converter
        )
    }

    ///
    /// Create Variable
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
        let api_path: String = "/functions/{functionId}/variables"
            .replacingOccurrences(of: "{functionId}", with: functionId)

        let params: [String: Any?] = [
            "key": key,
            "value": value
        ]

        let headers: [String: String] = [
            "content-type": "application/json"
        ]

        let converter: (Any) -> AppwriteModels.Variable = { response in
            return AppwriteModels.Variable.from(map: response as! [String: Any])
        }

        return try await client.call(
            method: "POST",
            path: api_path,
            headers: headers,
            params: params,
            converter: converter
        )
    }

    ///
    /// Get Variable
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
        let api_path: String = "/functions/{functionId}/variables/{variableId}"
            .replacingOccurrences(of: "{functionId}", with: functionId)
            .replacingOccurrences(of: "{variableId}", with: variableId)

        let params: [String: Any] = [:]

        let headers: [String: String] = [
            "content-type": "application/json"
        ]

        let converter: (Any) -> AppwriteModels.Variable = { response in
            return AppwriteModels.Variable.from(map: response as! [String: Any])
        }

        return try await client.call(
            method: "GET",
            path: api_path,
            headers: headers,
            params: params,
            converter: converter
        )
    }

    ///
    /// Update Variable
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
        let api_path: String = "/functions/{functionId}/variables/{variableId}"
            .replacingOccurrences(of: "{functionId}", with: functionId)
            .replacingOccurrences(of: "{variableId}", with: variableId)

        let params: [String: Any?] = [
            "key": key,
            "value": value
        ]

        let headers: [String: String] = [
            "content-type": "application/json"
        ]

        let converter: (Any) -> AppwriteModels.Variable = { response in
            return AppwriteModels.Variable.from(map: response as! [String: Any])
        }

        return try await client.call(
            method: "PUT",
            path: api_path,
            headers: headers,
            params: params,
            converter: converter
        )
    }

    ///
    /// Delete Variable
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
        let api_path: String = "/functions/{functionId}/variables/{variableId}"
            .replacingOccurrences(of: "{functionId}", with: functionId)
            .replacingOccurrences(of: "{variableId}", with: variableId)

        let params: [String: Any] = [:]

        let headers: [String: String] = [
            "content-type": "application/json"
        ]

        return try await client.call(
            method: "DELETE",
            path: api_path,
            headers: headers,
            params: params        )
    }


}