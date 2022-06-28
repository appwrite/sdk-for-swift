import AsyncHTTPClient
import Foundation
import NIO
import AppwriteModels

open class Functions: Service {
    ///
    /// List Functions
    ///
    /// Get a list of all the project's functions. You can use the query params to
    /// filter your results.
    ///
    /// @param String search
    /// @param Int limit
    /// @param Int offset
    /// @param String cursor
    /// @param String cursorDirection
    /// @param String orderType
    /// @throws Exception
    /// @return array
    ///
    open func list(
        search: String? = nil,
        limit: Int? = nil,
        offset: Int? = nil,
        cursor: String? = nil,
        cursorDirection: String? = nil,
        orderType: String? = nil
    ) async throws -> AppwriteModels.FunctionList {
        let path: String = "/functions"
        let params: [String: Any?] = [
            "search": search,
            "limit": limit,
            "offset": offset,
            "cursor": cursor,
            "cursorDirection": cursorDirection,
            "orderType": orderType
        ]
        let headers: [String: String] = [
            "content-type": "application/json"
        ]
        let converter: ([String: Any]) -> AppwriteModels.FunctionList = { dict in
            return AppwriteModels.FunctionList.from(map: dict)
        }
        return try await client.call(
            method: "GET",
            path: path,
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
    /// @param [Any] execute
    /// @param String runtime
    /// @param Any vars
    /// @param [Any] events
    /// @param String schedule
    /// @param Int timeout
    /// @throws Exception
    /// @return array
    ///
    open func create(
        functionId: String,
        name: String,
        execute: [Any],
        runtime: String,
        vars: Any? = nil,
        events: [Any]? = nil,
        schedule: String? = nil,
        timeout: Int? = nil
    ) async throws -> AppwriteModels.Function {
        let path: String = "/functions"
        let params: [String: Any?] = [
            "functionId": functionId,
            "name": name,
            "execute": execute,
            "runtime": runtime,
            "vars": vars,
            "events": events,
            "schedule": schedule,
            "timeout": timeout
        ]
        let headers: [String: String] = [
            "content-type": "application/json"
        ]
        let converter: ([String: Any]) -> AppwriteModels.Function = { dict in
            return AppwriteModels.Function.from(map: dict)
        }
        return try await client.call(
            method: "POST",
            path: path,
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
        let path: String = "/functions/runtimes"
        let params: [String: Any?] = [:]
        let headers: [String: String] = [
            "content-type": "application/json"
        ]
        let converter: ([String: Any]) -> AppwriteModels.RuntimeList = { dict in
            return AppwriteModels.RuntimeList.from(map: dict)
        }
        return try await client.call(
            method: "GET",
            path: path,
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
        var path: String = "/functions/{functionId}"
        path = path.replacingOccurrences(
          of: "{functionId}",
          with: functionId
        )
        let params: [String: Any?] = [:]
        let headers: [String: String] = [
            "content-type": "application/json"
        ]
        let converter: ([String: Any]) -> AppwriteModels.Function = { dict in
            return AppwriteModels.Function.from(map: dict)
        }
        return try await client.call(
            method: "GET",
            path: path,
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
    /// @param [Any] execute
    /// @param Any vars
    /// @param [Any] events
    /// @param String schedule
    /// @param Int timeout
    /// @throws Exception
    /// @return array
    ///
    open func update(
        functionId: String,
        name: String,
        execute: [Any],
        vars: Any? = nil,
        events: [Any]? = nil,
        schedule: String? = nil,
        timeout: Int? = nil
    ) async throws -> AppwriteModels.Function {
        var path: String = "/functions/{functionId}"
        path = path.replacingOccurrences(
          of: "{functionId}",
          with: functionId
        )
        let params: [String: Any?] = [
            "name": name,
            "execute": execute,
            "vars": vars,
            "events": events,
            "schedule": schedule,
            "timeout": timeout
        ]
        let headers: [String: String] = [
            "content-type": "application/json"
        ]
        let converter: ([String: Any]) -> AppwriteModels.Function = { dict in
            return AppwriteModels.Function.from(map: dict)
        }
        return try await client.call(
            method: "PUT",
            path: path,
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
        var path: String = "/functions/{functionId}"
        path = path.replacingOccurrences(
          of: "{functionId}",
          with: functionId
        )
        let params: [String: Any?] = [:]
        let headers: [String: String] = [
            "content-type": "application/json"
        ]
        return try await client.call(
            method: "DELETE",
            path: path,
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
    /// @param String search
    /// @param Int limit
    /// @param Int offset
    /// @param String cursor
    /// @param String cursorDirection
    /// @param String orderType
    /// @throws Exception
    /// @return array
    ///
    open func listDeployments(
        functionId: String,
        search: String? = nil,
        limit: Int? = nil,
        offset: Int? = nil,
        cursor: String? = nil,
        cursorDirection: String? = nil,
        orderType: String? = nil
    ) async throws -> AppwriteModels.DeploymentList {
        var path: String = "/functions/{functionId}/deployments"
        path = path.replacingOccurrences(
          of: "{functionId}",
          with: functionId
        )
        let params: [String: Any?] = [
            "search": search,
            "limit": limit,
            "offset": offset,
            "cursor": cursor,
            "cursorDirection": cursorDirection,
            "orderType": orderType
        ]
        let headers: [String: String] = [
            "content-type": "application/json"
        ]
        let converter: ([String: Any]) -> AppwriteModels.DeploymentList = { dict in
            return AppwriteModels.DeploymentList.from(map: dict)
        }
        return try await client.call(
            method: "GET",
            path: path,
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
    /// Use the "command" param to set the entry point used to execute your code.
    ///
    /// @param String functionId
    /// @param String entrypoint
    /// @param InputFile code
    /// @param Bool activate
    /// @throws Exception
    /// @return array
    ///
    open func createDeployment(
        functionId: String,
        entrypoint: String,
        code: InputFile,
        activate: Bool,
        onProgress: ((UploadProgress) -> Void)? = nil
    ) async throws -> AppwriteModels.Deployment {
        var path: String = "/functions/{functionId}/deployments"
        path = path.replacingOccurrences(
          of: "{functionId}",
          with: functionId
        )
        var params: [String: Any?] = [
            "entrypoint": entrypoint,
            "code": code,
            "activate": activate
        ]
        var headers: [String: String] = [
            "content-type": "multipart/form-data"
        ]
        let converter: ([String: Any]) -> AppwriteModels.Deployment = { dict in
            return AppwriteModels.Deployment.from(map: dict)
        }
        let idParamName: String? = nil
        let paramName = "code"
        return try await client.chunkedUpload(
            path: path,
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
    ) async throws -> AppwriteModels.DeploymentList {
        var path: String = "/functions/{functionId}/deployments/{deploymentId}"
        path = path.replacingOccurrences(
          of: "{functionId}",
          with: functionId
        )
        path = path.replacingOccurrences(
          of: "{deploymentId}",
          with: deploymentId
        )
        let params: [String: Any?] = [:]
        let headers: [String: String] = [
            "content-type": "application/json"
        ]
        let converter: ([String: Any]) -> AppwriteModels.DeploymentList = { dict in
            return AppwriteModels.DeploymentList.from(map: dict)
        }
        return try await client.call(
            method: "GET",
            path: path,
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
        var path: String = "/functions/{functionId}/deployments/{deploymentId}"
        path = path.replacingOccurrences(
          of: "{functionId}",
          with: functionId
        )
        path = path.replacingOccurrences(
          of: "{deploymentId}",
          with: deploymentId
        )
        let params: [String: Any?] = [:]
        let headers: [String: String] = [
            "content-type": "application/json"
        ]
        let converter: ([String: Any]) -> AppwriteModels.Function = { dict in
            return AppwriteModels.Function.from(map: dict)
        }
        return try await client.call(
            method: "PATCH",
            path: path,
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
        var path: String = "/functions/{functionId}/deployments/{deploymentId}"
        path = path.replacingOccurrences(
          of: "{functionId}",
          with: functionId
        )
        path = path.replacingOccurrences(
          of: "{deploymentId}",
          with: deploymentId
        )
        let params: [String: Any?] = [:]
        let headers: [String: String] = [
            "content-type": "application/json"
        ]
        return try await client.call(
            method: "DELETE",
            path: path,
            headers: headers,
            params: params        )
    }

    ///
    /// Retry Build
    ///
    /// @param String functionId
    /// @param String deploymentId
    /// @param String buildId
    /// @throws Exception
    /// @return array
    ///
    open func retryBuild(
        functionId: String,
        deploymentId: String,
        buildId: String
    ) async throws -> Any {
        var path: String = "/functions/{functionId}/deployments/{deploymentId}/builds/{buildId}"
        path = path.replacingOccurrences(
          of: "{functionId}",
          with: functionId
        )
        path = path.replacingOccurrences(
          of: "{deploymentId}",
          with: deploymentId
        )
        path = path.replacingOccurrences(
          of: "{buildId}",
          with: buildId
        )
        let params: [String: Any?] = [:]
        let headers: [String: String] = [
            "content-type": "application/json"
        ]
        return try await client.call(
            method: "POST",
            path: path,
            headers: headers,
            params: params        )
    }

    ///
    /// List Executions
    ///
    /// Get a list of all the current user function execution logs. You can use the
    /// query params to filter your results. On admin mode, this endpoint will
    /// return a list of all of the project's executions. [Learn more about
    /// different API modes](/docs/admin).
    ///
    /// @param String functionId
    /// @param Int limit
    /// @param Int offset
    /// @param String search
    /// @param String cursor
    /// @param String cursorDirection
    /// @throws Exception
    /// @return array
    ///
    open func listExecutions(
        functionId: String,
        limit: Int? = nil,
        offset: Int? = nil,
        search: String? = nil,
        cursor: String? = nil,
        cursorDirection: String? = nil
    ) async throws -> AppwriteModels.ExecutionList {
        var path: String = "/functions/{functionId}/executions"
        path = path.replacingOccurrences(
          of: "{functionId}",
          with: functionId
        )
        let params: [String: Any?] = [
            "limit": limit,
            "offset": offset,
            "search": search,
            "cursor": cursor,
            "cursorDirection": cursorDirection
        ]
        let headers: [String: String] = [
            "content-type": "application/json"
        ]
        let converter: ([String: Any]) -> AppwriteModels.ExecutionList = { dict in
            return AppwriteModels.ExecutionList.from(map: dict)
        }
        return try await client.call(
            method: "GET",
            path: path,
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
    /// @param String data
    /// @param Bool async
    /// @throws Exception
    /// @return array
    ///
    open func createExecution(
        functionId: String,
        data: String? = nil,
        async: Bool? = nil
    ) async throws -> AppwriteModels.Execution {
        var path: String = "/functions/{functionId}/executions"
        path = path.replacingOccurrences(
          of: "{functionId}",
          with: functionId
        )
        let params: [String: Any?] = [
            "data": data,
            "async": async
        ]
        let headers: [String: String] = [
            "content-type": "application/json"
        ]
        let converter: ([String: Any]) -> AppwriteModels.Execution = { dict in
            return AppwriteModels.Execution.from(map: dict)
        }
        return try await client.call(
            method: "POST",
            path: path,
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
        var path: String = "/functions/{functionId}/executions/{executionId}"
        path = path.replacingOccurrences(
          of: "{functionId}",
          with: functionId
        )
        path = path.replacingOccurrences(
          of: "{executionId}",
          with: executionId
        )
        let params: [String: Any?] = [:]
        let headers: [String: String] = [
            "content-type": "application/json"
        ]
        let converter: ([String: Any]) -> AppwriteModels.Execution = { dict in
            return AppwriteModels.Execution.from(map: dict)
        }
        return try await client.call(
            method: "GET",
            path: path,
            headers: headers,
            params: params,
            converter: converter
        )
    }


    ///
    /// List Functions
    ///
    /// Get a list of all the project's functions. You can use the query params to
    /// filter your results.
    ///
    /// @param String search
    /// @param Int limit
    /// @param Int offset
    /// @param String cursor
    /// @param String cursorDirection
    /// @param String orderType
    /// @throws Exception
    /// @return array
    ///
    @available(*, deprecated, message: "Use the async overload instead")
    open func list(
        search: String? = nil,
        limit: Int? = nil,
        offset: Int? = nil,
        cursor: String? = nil,
        cursorDirection: String? = nil,
        orderType: String? = nil,
        completion: ((Result<AppwriteModels.FunctionList, AppwriteError>) -> Void)? = nil
    ) {
        Task {
            do {
                let result = try await list(
                    search: search,
                    limit: limit,
                    offset: offset,
                    cursor: cursor,
                    cursorDirection: cursorDirection,
                    orderType: orderType
                )
                completion?(.success(result))
            } catch {
                completion?(.failure(error as! AppwriteError))
            }
        }
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
    /// @param [Any] execute
    /// @param String runtime
    /// @param Any vars
    /// @param [Any] events
    /// @param String schedule
    /// @param Int timeout
    /// @throws Exception
    /// @return array
    ///
    @available(*, deprecated, message: "Use the async overload instead")
    open func create(
        functionId: String,
        name: String,
        execute: [Any],
        runtime: String,
        vars: Any? = nil,
        events: [Any]? = nil,
        schedule: String? = nil,
        timeout: Int? = nil,
        completion: ((Result<AppwriteModels.Function, AppwriteError>) -> Void)? = nil
    ) {
        Task {
            do {
                let result = try await create(
                    functionId: functionId,
                    name: name,
                    execute: execute,
                    runtime: runtime,
                    vars: vars,
                    events: events,
                    schedule: schedule,
                    timeout: timeout
                )
                completion?(.success(result))
            } catch {
                completion?(.failure(error as! AppwriteError))
            }
        }
    }

    ///
    /// List runtimes
    ///
    /// Get a list of all runtimes that are currently active on your instance.
    ///
    /// @throws Exception
    /// @return array
    ///
    @available(*, deprecated, message: "Use the async overload instead")
    open func listRuntimes(
        completion: ((Result<AppwriteModels.RuntimeList, AppwriteError>) -> Void)? = nil
    ) {
        Task {
            do {
                let result = try await listRuntimes(
                )
                completion?(.success(result))
            } catch {
                completion?(.failure(error as! AppwriteError))
            }
        }
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
    @available(*, deprecated, message: "Use the async overload instead")
    open func get(
        functionId: String,
        completion: ((Result<AppwriteModels.Function, AppwriteError>) -> Void)? = nil
    ) {
        Task {
            do {
                let result = try await get(
                    functionId: functionId
                )
                completion?(.success(result))
            } catch {
                completion?(.failure(error as! AppwriteError))
            }
        }
    }

    ///
    /// Update Function
    ///
    /// Update function by its unique ID.
    ///
    /// @param String functionId
    /// @param String name
    /// @param [Any] execute
    /// @param Any vars
    /// @param [Any] events
    /// @param String schedule
    /// @param Int timeout
    /// @throws Exception
    /// @return array
    ///
    @available(*, deprecated, message: "Use the async overload instead")
    open func update(
        functionId: String,
        name: String,
        execute: [Any],
        vars: Any? = nil,
        events: [Any]? = nil,
        schedule: String? = nil,
        timeout: Int? = nil,
        completion: ((Result<AppwriteModels.Function, AppwriteError>) -> Void)? = nil
    ) {
        Task {
            do {
                let result = try await update(
                    functionId: functionId,
                    name: name,
                    execute: execute,
                    vars: vars,
                    events: events,
                    schedule: schedule,
                    timeout: timeout
                )
                completion?(.success(result))
            } catch {
                completion?(.failure(error as! AppwriteError))
            }
        }
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
    @available(*, deprecated, message: "Use the async overload instead")
    open func delete(
        functionId: String,
        completion: ((Result<Any, AppwriteError>) -> Void)? = nil
    ) {
        Task {
            do {
                let result = try await delete(
                    functionId: functionId
                )
                completion?(.success(result))
            } catch {
                completion?(.failure(error as! AppwriteError))
            }
        }
    }

    ///
    /// List Deployments
    ///
    /// Get a list of all the project's code deployments. You can use the query
    /// params to filter your results.
    ///
    /// @param String functionId
    /// @param String search
    /// @param Int limit
    /// @param Int offset
    /// @param String cursor
    /// @param String cursorDirection
    /// @param String orderType
    /// @throws Exception
    /// @return array
    ///
    @available(*, deprecated, message: "Use the async overload instead")
    open func listDeployments(
        functionId: String,
        search: String? = nil,
        limit: Int? = nil,
        offset: Int? = nil,
        cursor: String? = nil,
        cursorDirection: String? = nil,
        orderType: String? = nil,
        completion: ((Result<AppwriteModels.DeploymentList, AppwriteError>) -> Void)? = nil
    ) {
        Task {
            do {
                let result = try await listDeployments(
                    functionId: functionId,
                    search: search,
                    limit: limit,
                    offset: offset,
                    cursor: cursor,
                    cursorDirection: cursorDirection,
                    orderType: orderType
                )
                completion?(.success(result))
            } catch {
                completion?(.failure(error as! AppwriteError))
            }
        }
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
    /// Use the "command" param to set the entry point used to execute your code.
    ///
    /// @param String functionId
    /// @param String entrypoint
    /// @param InputFile code
    /// @param Bool activate
    /// @throws Exception
    /// @return array
    ///
    @available(*, deprecated, message: "Use the async overload instead")
    open func createDeployment(
        functionId: String,
        entrypoint: String,
        code: InputFile,
        activate: Bool,
        onProgress: ((UploadProgress) -> Void)? = nil,
        completion: ((Result<AppwriteModels.Deployment, AppwriteError>) -> Void)? = nil
    ) {
        Task {
            do {
                let result = try await createDeployment(
                    functionId: functionId,
                    entrypoint: entrypoint,
                    code: code,
                    activate: activate,
                    onProgress: onProgress
                )
                completion?(.success(result))
            } catch {
                completion?(.failure(error as! AppwriteError))
            }
        }
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
    @available(*, deprecated, message: "Use the async overload instead")
    open func getDeployment(
        functionId: String,
        deploymentId: String,
        completion: ((Result<AppwriteModels.DeploymentList, AppwriteError>) -> Void)? = nil
    ) {
        Task {
            do {
                let result = try await getDeployment(
                    functionId: functionId,
                    deploymentId: deploymentId
                )
                completion?(.success(result))
            } catch {
                completion?(.failure(error as! AppwriteError))
            }
        }
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
    @available(*, deprecated, message: "Use the async overload instead")
    open func updateDeployment(
        functionId: String,
        deploymentId: String,
        completion: ((Result<AppwriteModels.Function, AppwriteError>) -> Void)? = nil
    ) {
        Task {
            do {
                let result = try await updateDeployment(
                    functionId: functionId,
                    deploymentId: deploymentId
                )
                completion?(.success(result))
            } catch {
                completion?(.failure(error as! AppwriteError))
            }
        }
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
    @available(*, deprecated, message: "Use the async overload instead")
    open func deleteDeployment(
        functionId: String,
        deploymentId: String,
        completion: ((Result<Any, AppwriteError>) -> Void)? = nil
    ) {
        Task {
            do {
                let result = try await deleteDeployment(
                    functionId: functionId,
                    deploymentId: deploymentId
                )
                completion?(.success(result))
            } catch {
                completion?(.failure(error as! AppwriteError))
            }
        }
    }

    ///
    /// Retry Build
    ///
    /// @param String functionId
    /// @param String deploymentId
    /// @param String buildId
    /// @throws Exception
    /// @return array
    ///
    @available(*, deprecated, message: "Use the async overload instead")
    open func retryBuild(
        functionId: String,
        deploymentId: String,
        buildId: String,
        completion: ((Result<Any, AppwriteError>) -> Void)? = nil
    ) {
        Task {
            do {
                let result = try await retryBuild(
                    functionId: functionId,
                    deploymentId: deploymentId,
                    buildId: buildId
                )
                completion?(.success(result))
            } catch {
                completion?(.failure(error as! AppwriteError))
            }
        }
    }

    ///
    /// List Executions
    ///
    /// Get a list of all the current user function execution logs. You can use the
    /// query params to filter your results. On admin mode, this endpoint will
    /// return a list of all of the project's executions. [Learn more about
    /// different API modes](/docs/admin).
    ///
    /// @param String functionId
    /// @param Int limit
    /// @param Int offset
    /// @param String search
    /// @param String cursor
    /// @param String cursorDirection
    /// @throws Exception
    /// @return array
    ///
    @available(*, deprecated, message: "Use the async overload instead")
    open func listExecutions(
        functionId: String,
        limit: Int? = nil,
        offset: Int? = nil,
        search: String? = nil,
        cursor: String? = nil,
        cursorDirection: String? = nil,
        completion: ((Result<AppwriteModels.ExecutionList, AppwriteError>) -> Void)? = nil
    ) {
        Task {
            do {
                let result = try await listExecutions(
                    functionId: functionId,
                    limit: limit,
                    offset: offset,
                    search: search,
                    cursor: cursor,
                    cursorDirection: cursorDirection
                )
                completion?(.success(result))
            } catch {
                completion?(.failure(error as! AppwriteError))
            }
        }
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
    /// @param String data
    /// @param Bool async
    /// @throws Exception
    /// @return array
    ///
    @available(*, deprecated, message: "Use the async overload instead")
    open func createExecution(
        functionId: String,
        data: String? = nil,
        async: Bool? = nil,
        completion: ((Result<AppwriteModels.Execution, AppwriteError>) -> Void)? = nil
    ) {
        Task {
            do {
                let result = try await createExecution(
                    functionId: functionId,
                    data: data,
                    async: async
                )
                completion?(.success(result))
            } catch {
                completion?(.failure(error as! AppwriteError))
            }
        }
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
    @available(*, deprecated, message: "Use the async overload instead")
    open func getExecution(
        functionId: String,
        executionId: String,
        completion: ((Result<AppwriteModels.Execution, AppwriteError>) -> Void)? = nil
    ) {
        Task {
            do {
                let result = try await getExecution(
                    functionId: functionId,
                    executionId: executionId
                )
                completion?(.success(result))
            } catch {
                completion?(.failure(error as! AppwriteError))
            }
        }
    }

}
