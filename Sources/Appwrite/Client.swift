import NIO
import NIOCore
import NIOFoundationCompat
import NIOSSL
import Foundation
import AsyncHTTPClient
@_exported import AppwriteModels

let DASHDASH = "--"
let CRLF = "\r\n"

open class Client {

    // MARK: Properties
    public static var chunkSize = 5 * 1024 * 1024 // 5MB

    open var endPoint = "https://cloud.appwrite.io/v1"

    open var headers: [String: String] = [
        "content-type": "application/json",
        "x-sdk-name": "Swift",
        "x-sdk-platform": "server",
        "x-sdk-language": "swift",
        "x-sdk-version": "10.1.0",
        "x-appwrite-response-format": "1.7.0"
    ]

    internal var config: [String: String] = [:]

    internal var selfSigned: Bool = false

    internal var http: HTTPClient

    internal var httpForRedirect: HTTPClient

    private static let boundaryChars = "abcdefghijklmnopqrstuvwxyz1234567890"

    private static let boundary = randomBoundary()

    private static var eventLoopGroupProvider = HTTPClient.EventLoopGroupProvider.singleton

    // MARK: Methods

    public init() {
        http = Client.createHTTP()
        httpForRedirect = Client.createHTTP(redirectConfiguration: .disallow)
        addUserAgentHeader()
        addOriginHeader()
    }

    private static func createHTTP(
        selfSigned: Bool = false,
        redirectConfiguration: HTTPClient.Configuration.RedirectConfiguration = .follow(max: 5, allowCycles: false),
        connectTimeout: TimeAmount = .seconds(30),
        readTimeout: TimeAmount = .seconds(30)
    ) -> HTTPClient {
        let timeout = HTTPClient.Configuration.Timeout(
            connect: connectTimeout,
            read: readTimeout
        )
        var tls = TLSConfiguration
            .makeClientConfiguration()

        if selfSigned {
            tls.certificateVerification = .none
        }

        return HTTPClient(
            eventLoopGroupProvider: eventLoopGroupProvider,
            configuration: HTTPClient.Configuration(
                tlsConfiguration: tls,
                redirectConfiguration: redirectConfiguration,
                timeout: timeout,
                decompression: .enabled(limit: .none)
            )
        )

    }

    deinit {
        do {
            try http.syncShutdown()
            try httpForRedirect.syncShutdown()
        } catch {
            print(error)
        }
    }

    ///
    /// Set Project
    ///
    /// Your project ID
    ///
    /// @param String value
    ///
    /// @return Client
    ///
    open func setProject(_ value: String) -> Client {
        config["project"] = value
        _ = addHeader(key: "X-Appwrite-Project", value: value)
        return self
    }

    ///
    /// Set Key
    ///
    /// Your secret API key
    ///
    /// @param String value
    ///
    /// @return Client
    ///
    open func setKey(_ value: String) -> Client {
        config["key"] = value
        _ = addHeader(key: "X-Appwrite-Key", value: value)
        return self
    }

    ///
    /// Set JWT
    ///
    /// Your secret JSON Web Token
    ///
    /// @param String value
    ///
    /// @return Client
    ///
    open func setJWT(_ value: String) -> Client {
        config["jwt"] = value
        _ = addHeader(key: "X-Appwrite-JWT", value: value)
        return self
    }

    ///
    /// Set Locale
    ///
    /// @param String value
    ///
    /// @return Client
    ///
    open func setLocale(_ value: String) -> Client {
        config["locale"] = value
        _ = addHeader(key: "X-Appwrite-Locale", value: value)
        return self
    }

    ///
    /// Set Session
    ///
    /// The user session to authenticate with
    ///
    /// @param String value
    ///
    /// @return Client
    ///
    open func setSession(_ value: String) -> Client {
        config["session"] = value
        _ = addHeader(key: "X-Appwrite-Session", value: value)
        return self
    }

    ///
    /// Set ForwardedUserAgent
    ///
    /// The user agent string of the client that made the request
    ///
    /// @param String value
    ///
    /// @return Client
    ///
    open func setForwardedUserAgent(_ value: String) -> Client {
        config["forwardeduseragent"] = value
        _ = addHeader(key: "X-Forwarded-User-Agent", value: value)
        return self
    }


    ///
    /// Set self signed
    ///
    /// @param Bool status
    ///
    /// @return Client
    ///
    open func setSelfSigned(_ status: Bool = true) -> Client {
        self.selfSigned = status
        try! http.syncShutdown()
        http = Client.createHTTP(selfSigned: status)
        return self
    }

    ///
    /// Set endpoint
    ///
    /// @param String endPoint
    ///
    /// @return Client
    ///
    open func setEndpoint(_ endPoint: String) -> Client {
        if !endPoint.hasPrefix("http://") && !endPoint.hasPrefix("https://") {
            fatalError("Invalid endpoint URL: \(endPoint)")
        }

        self.endPoint = endPoint
        return self
    }

    ///
    /// Add header
    ///
    /// @param String key
    /// @param String value
    ///
    /// @return Client
    ///
    open func addHeader(key: String, value: String) -> Client {
        self.headers[key] = value
        return self
    }

   ///
   /// Builds a query string from parameters
   ///
   /// @param Dictionary<String, Any?> params
   /// @param String prefix
   ///
   /// @return String
   ///
   open func parametersToQueryString(params: [String: Any?]) -> String {
       var output: String = ""

       func appendWhenNotLast(_ index: Int, ofTotal count: Int, outerIndex: Int? = nil, outerCount: Int? = nil) {
           if (index != count - 1 || (outerIndex != nil
               && outerCount != nil
               && index == count - 1
               && outerIndex! != outerCount! - 1)) {
               output += "&"
           }
       }

       for (parameterIndex, element) in params.enumerated() {
           switch element.value {
           case nil:
               break
           case is Array<Any?>:
               let list = element.value as! Array<Any?>
               for (nestedIndex, item) in list.enumerated() {
                   output += "\(element.key)[]=\(item!)"
                   appendWhenNotLast(nestedIndex, ofTotal: list.count, outerIndex: parameterIndex, outerCount: params.count)
               }
               appendWhenNotLast(parameterIndex, ofTotal: params.count)
           default:
               output += "\(element.key)=\(element.value!)"
               appendWhenNotLast(parameterIndex, ofTotal: params.count)
           }
       }

       return output.addingPercentEncoding(
           withAllowedCharacters: .urlHostAllowed
       )?.replacingOccurrences(of: "+", with: "%2B") ?? "" // since urlHostAllowed doesn't include +
   }

    ///
    /// Sends a "ping" request to Appwrite to verify connectivity.
    ///
    /// @return String
    /// @throws Exception
    ///
   open func ping() async throws -> String {
       let apiPath: String = "/ping"

       let apiHeaders: [String: String] = [
           "content-type": "application/json"
       ]

       return try await call(
           method: "GET",
           path: apiPath,
           headers: apiHeaders
       )
    }

    ///
    /// Make an API call
    ///
    /// @param String method
    /// @param String path
    /// @param Dictionary<String, Any?> params
    /// @param Dictionary<String, String> headers
    /// @return Response
    /// @throws Exception
    ///
    open func call<T>(
        method: String,
        path: String = "",
        headers: [String: String] = [:],
        params: [String: Any?] = [:],
        sink: ((ByteBuffer) -> Void)? = nil,
        converter: ((Any) -> T)? = nil
    ) async throws -> T {
        let request = try prepareRequest(
            method: method,
            path: path,
            headers: headers,
            params: params
        )

        return try await execute(request, converter: converter)
    }

    ///
    /// Make an redirect API call
    ///
    /// @param String method
    /// @param String path
    /// @param Dictionary<String, Any?> params
    /// @param Dictionary<String, String> headers
    /// @return String
    /// @throws Exception
    ///
    open func redirect(
        method: String,
        path: String = "",
        headers: [String: String] = [:],
        params: [String: Any?] = [:]
    ) async throws -> String? {
        let request = try prepareRequest(
            method: method,
            path: path,
            headers: headers,
            params: params
        )

        let response = try await httpForRedirect.execute(
            request,
            timeout: .seconds(30)
        )

        if response.status.code >= 400 {
            var message = ""
            var data = try await response.body.collect(upTo: Int.max)
            var type = ""
            var responseString = ""

            do {
                let dict = try JSONSerialization.jsonObject(with: data) as? [String: Any]

                message = dict?["message"] as? String ?? response.status.reasonPhrase
                type = dict?["type"] as? String ?? ""
                responseString = String(decoding: data.readableBytesView, as: UTF8.self)
            } catch {
                message =  data.readString(length: data.readableBytes)!
                responseString = message
            }

            throw AppwriteError(
                message: message,
                code: Int(response.status.code),
                type: type,
                response: responseString
            )
        }

        return response.headers["location"].first
    }

    private func prepareRequest(
        method: String,
        path: String = "",
        headers: [String: String] = [:],
        params: [String: Any?] = [:]
    ) throws -> HTTPClientRequest {
        let validParams = params.filter { $0.value != nil }

        let queryParameters = method == "GET" && !validParams.isEmpty
            ? "?" + parametersToQueryString(params: validParams)
            : ""

        var request = HTTPClientRequest(url: endPoint + path + queryParameters)
        request.method = .RAW(value: method)


        for (key, value) in self.headers.merging(headers, uniquingKeysWith: { $1 }) {
            request.headers.add(name: key, value: value)
        }

        request.addDomainCookies()

        if "GET" != method {
            try buildBody(for: &request, with: validParams)
        }

        return request
    }

    private func buildBody(
        for request: inout HTTPClientRequest,
        with params: [String: Any?]
    ) throws {
        if request.headers["content-type"][0] == "multipart/form-data" {
            buildMultipart(&request, with: params, chunked: !request.headers["content-range"].isEmpty)
        } else {
            try buildJSON(&request, with: params)
        }
    }

    private func execute<T>(
        _ request: HTTPClientRequest,
        converter: ((Any) -> T)? = nil
    ) async throws -> T {
        let response = try await http.execute(
            request,
            timeout: .seconds(30)
        )

        if let warning = response.headers["x-appwrite-warning"].first {
            warning.split(separator: ";").forEach { warning in
                print("Warning: \(warning)")
            }
        }

        var data = try await response.body.collect(upTo: Int.max)

        switch response.status.code {
        case 0..<400:
            switch T.self {
            case is Bool.Type:
                return true as! T
            case is String.Type:
                return (data.readString(length: data.readableBytes) ?? "") as! T
            case is ByteBuffer.Type:
                return data as! T
            default:
                if data.readableBytes == 0 {
                    return true as! T
                }
                let dict = try JSONSerialization.jsonObject(with: data) as? [String: Any]

                return converter?(dict!) ?? dict! as! T
            }
        default:
            var message = ""
            var type = ""
            var responseString = ""

            do {
                let dict = try JSONSerialization.jsonObject(with: data) as? [String: Any]

                message = dict?["message"] as? String ?? response.status.reasonPhrase
                type = dict?["type"] as? String ?? ""
                responseString = String(decoding: data.readableBytesView, as: UTF8.self)
            } catch {
                message =  data.readString(length: data.readableBytes)!
                responseString = message
            }

            throw AppwriteError(
                message: message,
                code: Int(response.status.code),
                type: type,
                response: responseString
            )
        }
    }

    func chunkedUpload<T>(
        path: String,
        headers: inout [String: String],
        params: inout [String: Any?],
        paramName: String,
        idParamName: String? = nil,
        converter: ((Any) -> T)? = nil,
        onProgress: ((UploadProgress) -> Void)? = nil
    ) async throws -> T {
        let input = params[paramName] as! InputFile

        switch(input.sourceType) {
        case "path":
            input.data = ByteBuffer(data: try! Data(contentsOf: URL(fileURLWithPath: input.path)))
        case "data":
            input.data = ByteBuffer(data: input.data as! Data)
        default:
            break
        }

        let size = (input.data as! ByteBuffer).readableBytes

        if size < Client.chunkSize {
            params[paramName] = input
            return try await call(
                method: "POST",
                path: path,
                headers: headers,
                params: params,
                converter: converter
            )
        }

        var offset = 0
        var result = [String:Any]()

        if idParamName != nil {
            // Make a request to check if a file already exists
            do {
                let map = try await call(
                    method: "GET",
                    path: path + "/" + (params[idParamName!] as! String),
                    headers: headers,
                    params: [:],
                    converter: { return $0 as! [String: Any] }
                )
                let chunksUploaded = map["chunksUploaded"] as! Int
                offset = chunksUploaded * Client.chunkSize
            } catch {
                // File does not exist yet, swallow exception
            }
        }

        while offset < size {
            let slice = (input.data as! ByteBuffer).getSlice(at: offset, length: Client.chunkSize)
                ?? (input.data as! ByteBuffer).getSlice(at: offset, length: Int(size - offset))

            params[paramName] = InputFile.fromBuffer(slice!, filename: input.filename, mimeType: input.mimeType)
            headers["content-range"] = "bytes \(offset)-\(min((offset + Client.chunkSize) - 1, size - 1))/\(size)"

            result = try await call(
                method: "POST",
                path: path,
                headers: headers,
                params: params,
                converter: { return $0 as! [String: Any] }
            )

            offset += Client.chunkSize
            headers["x-appwrite-id"] = result["$id"] as? String
            onProgress?(UploadProgress(
                id: result["$id"] as? String ?? "",
                progress: Double(min(offset, size))/Double(size) * 100.0,
                sizeUploaded: min(offset, size),
                chunksTotal: result["chunksTotal"] as? Int ?? -1,
                chunksUploaded: result["chunksUploaded"] as? Int ?? -1
            ))
        }

        return converter!(result)
    }

    private static func randomBoundary() -> String {
        var string = ""
        for _ in 0..<16 {
            string.append(Client.boundaryChars.randomElement()!)
        }
        return string
    }

    private func buildJSON(
        _ request: inout HTTPClientRequest,
        with params: [String: Any?] = [:]
    ) throws {
        var encodedParams = [String:Any]()

        for (key, param) in params {
            if param is String
                || param is Int
                || param is Float
                || param is Double
                || param is Bool
                || param is [String]
                || param is [Int]
                || param is [Float]
                || param is [Double]
                || param is [Bool]
                || param is [String: Any]
                || param is [Int: Any]
                || param is [Float: Any]
                || param is [Double: Any]
                || param is [Bool: Any] {
                encodedParams[key] = param
            } else if let encodable = param as? Encodable {
                encodedParams[key] = try encodable.toJson()
            } else if let param = param {
                encodedParams[key] = String(describing: param)
            }
        }

        let json = try JSONSerialization.data(withJSONObject: encodedParams, options: [])

        request.body = .bytes(json)
    }

    private func buildMultipart(
        _ request: inout HTTPClientRequest,
        with params: [String: Any?] = [:],
        chunked: Bool = false
    ) {
        func addPart(name: String, value: Any) {
            bodyBuffer.writeString(DASHDASH)
            bodyBuffer.writeString(Client.boundary)
            bodyBuffer.writeString(CRLF)
            bodyBuffer.writeString("Content-Disposition: form-data; name=\"\(name)\"")

            if let file = value as? InputFile {
                bodyBuffer.writeString("; filename=\"\(file.filename)\"")
                bodyBuffer.writeString(CRLF)
                bodyBuffer.writeString("Content-Length: \(bodyBuffer.readableBytes)")
                bodyBuffer.writeString(CRLF+CRLF)

                var buffer = file.data! as! ByteBuffer

                bodyBuffer.writeBuffer(&buffer)
                bodyBuffer.writeString(CRLF)
                return
            }

            let string = String(describing: value)
            bodyBuffer.writeString(CRLF)
            bodyBuffer.writeString("Content-Length: \(string.count)")
            bodyBuffer.writeString(CRLF+CRLF)
            bodyBuffer.writeString(string)
            bodyBuffer.writeString(CRLF)
        }

        var bodyBuffer = ByteBuffer()

        for (key, value) in params {
            switch key {
            case "file":
                addPart(name: key, value: value!)
            default:
                if let list = value as? [Any] {
                    for listValue in list {
                        addPart(name: "\(key)[]", value: listValue)
                    }
                    continue
                }
                addPart(name: key, value: value!)
            }
        }

        bodyBuffer.writeString(DASHDASH)
        bodyBuffer.writeString(Client.boundary)
        bodyBuffer.writeString(DASHDASH)
        bodyBuffer.writeString(CRLF)

        request.headers.remove(name: "content-type")
        if !chunked {
            request.headers.add(name: "Content-Length", value: bodyBuffer.readableBytes.description)
        }
        request.headers.add(name: "Content-Type", value: "multipart/form-data;boundary=\"\(Client.boundary)\"")
        request.body = .bytes(bodyBuffer)
    }

    private func addUserAgentHeader() {
        let packageInfo = OSPackageInfo.get()
        let device = Client.getDevice()

        #if !os(Linux) && !os(Windows)
        _ = addHeader(
            key: "user-agent",
            value: "\(packageInfo.packageName)/\(packageInfo.version) \(device)"
        )
        #endif
    }

    private func addOriginHeader() {
        let packageInfo = OSPackageInfo.get()
        let operatingSystem = Client.getOperatingSystem()
        _ = addHeader(
            key: "origin",
            value: "appwrite-\(operatingSystem)://\(packageInfo.packageName)"
        )
    }
}

extension Client {
    private static func getOperatingSystem() -> String {
        #if os(iOS)
        return "ios"
        #elseif os(watchOS)
        return "watchos"
        #elseif os(tvOS)
        return "tvos"
        #elseif os(macOS)
        return "macos"
        #elseif os(visionOS)
        return "visionos"
        #elseif os(Linux)
        return "linux"
        #elseif os(Windows)
        return "windows"
        #endif
    }

    private static func getDevice() -> String {
        let deviceInfo = OSDeviceInfo()
        var device = ""

        #if os(iOS)
        let info = deviceInfo.iOSInfo
        device = "\(info!.modelIdentifier) iOS/\(info!.systemVersion)"
        #elseif os(watchOS)
        let info = deviceInfo.watchOSInfo
        device = "\(info!.modelIdentifier) watchOS/\(info!.systemVersion)"
        #elseif os(tvOS)
        let info = deviceInfo.iOSInfo
        device = "\(info!.modelIdentifier) tvOS/\(info!.systemVersion)"
        #elseif os(macOS)
        let info = deviceInfo.macOSInfo
        device = "(Macintosh; \(info!.model))"
        #elseif os(visionOS)
        let info = deviceInfo.iOSInfo
        device = "\(info!.modelIdentifier) visionOS/\(info!.systemVersion)"
        #elseif os(Linux)
        let info = deviceInfo.linuxInfo
        device = "(Linux; U; \(info!.id) \(info!.version))"
        #elseif os(Windows)
        let info = deviceInfo.windowsInfo
        device = "(Windows NT; \(info!.computerName))"
        #endif

        return device
    }
}
