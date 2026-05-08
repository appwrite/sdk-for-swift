import AsyncHTTPClient
import Foundation
import NIO
import JSONCodable
import AppwriteEnums
import AppwriteModels

/// The Proxy Service allows you to configure actions for your domains beyond DNS configuration.
open class Proxy: Service {

    ///
    /// Get a list of all the proxy rules. You can use the query params to filter
    /// your results.
    ///
    /// - Parameters:
    ///   - queries: [String] (optional)
    ///   - total: Bool (optional)
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.ProxyRuleList
    ///
    open func listRules(
        queries: [String]? = nil,
        total: Bool? = nil
    ) async throws -> AppwriteModels.ProxyRuleList {
        let apiPath: String = "/proxy/rules"

        let apiParams: [String: Any?] = [
            "queries": queries,
            "total": total
        ]

        let apiHeaders: [String: String] = [:]

        let converter: (Any) throws -> AppwriteModels.ProxyRuleList = { response in
            return AppwriteModels.ProxyRuleList.from(map: response as! [String: Any])
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
    /// Create a new proxy rule for serving Appwrite's API on custom domain.
    /// 
    /// Rule ID is automatically generated as MD5 hash of a rule domain for
    /// performance purposes.
    ///
    /// - Parameters:
    ///   - domain: String
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.ProxyRule
    ///
    open func createAPIRule(
        domain: String
    ) async throws -> AppwriteModels.ProxyRule {
        let apiPath: String = "/proxy/rules/api"

        let apiParams: [String: Any?] = [
            "domain": domain
        ]

        let apiHeaders: [String: String] = [
            "content-type": "application/json"
        ]

        let converter: (Any) throws -> AppwriteModels.ProxyRule = { response in
            return AppwriteModels.ProxyRule.from(map: response as! [String: Any])
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
    /// Create a new proxy rule for executing Appwrite Function on custom domain.
    /// 
    /// Rule ID is automatically generated as MD5 hash of a rule domain for
    /// performance purposes.
    ///
    /// - Parameters:
    ///   - domain: String
    ///   - functionId: String
    ///   - branch: String (optional)
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.ProxyRule
    ///
    open func createFunctionRule(
        domain: String,
        functionId: String,
        branch: String? = nil
    ) async throws -> AppwriteModels.ProxyRule {
        let apiPath: String = "/proxy/rules/function"

        let apiParams: [String: Any?] = [
            "domain": domain,
            "functionId": functionId,
            "branch": branch
        ]

        let apiHeaders: [String: String] = [
            "content-type": "application/json"
        ]

        let converter: (Any) throws -> AppwriteModels.ProxyRule = { response in
            return AppwriteModels.ProxyRule.from(map: response as! [String: Any])
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
    /// Create a new proxy rule for to redirect from custom domain to another
    /// domain.
    /// 
    /// Rule ID is automatically generated as MD5 hash of a rule domain for
    /// performance purposes.
    ///
    /// - Parameters:
    ///   - domain: String
    ///   - url: String
    ///   - statusCode: AppwriteEnums.StatusCode
    ///   - resourceId: String
    ///   - resourceType: AppwriteEnums.ProxyResourceType
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.ProxyRule
    ///
    open func createRedirectRule(
        domain: String,
        url: String,
        statusCode: AppwriteEnums.StatusCode,
        resourceId: String,
        resourceType: AppwriteEnums.ProxyResourceType
    ) async throws -> AppwriteModels.ProxyRule {
        let apiPath: String = "/proxy/rules/redirect"

        let apiParams: [String: Any?] = [
            "domain": domain,
            "url": url,
            "statusCode": statusCode,
            "resourceId": resourceId,
            "resourceType": resourceType
        ]

        let apiHeaders: [String: String] = [
            "content-type": "application/json"
        ]

        let converter: (Any) throws -> AppwriteModels.ProxyRule = { response in
            return AppwriteModels.ProxyRule.from(map: response as! [String: Any])
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
    /// Create a new proxy rule for serving Appwrite Site on custom domain.
    /// 
    /// Rule ID is automatically generated as MD5 hash of a rule domain for
    /// performance purposes.
    ///
    /// - Parameters:
    ///   - domain: String
    ///   - siteId: String
    ///   - branch: String (optional)
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.ProxyRule
    ///
    open func createSiteRule(
        domain: String,
        siteId: String,
        branch: String? = nil
    ) async throws -> AppwriteModels.ProxyRule {
        let apiPath: String = "/proxy/rules/site"

        let apiParams: [String: Any?] = [
            "domain": domain,
            "siteId": siteId,
            "branch": branch
        ]

        let apiHeaders: [String: String] = [
            "content-type": "application/json"
        ]

        let converter: (Any) throws -> AppwriteModels.ProxyRule = { response in
            return AppwriteModels.ProxyRule.from(map: response as! [String: Any])
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
    /// Get a proxy rule by its unique ID.
    ///
    /// - Parameters:
    ///   - ruleId: String
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.ProxyRule
    ///
    open func getRule(
        ruleId: String
    ) async throws -> AppwriteModels.ProxyRule {
        let apiPath: String = "/proxy/rules/{ruleId}"
            .replacingOccurrences(of: "{ruleId}", with: ruleId)

        let apiParams: [String: Any] = [:]

        let apiHeaders: [String: String] = [:]

        let converter: (Any) throws -> AppwriteModels.ProxyRule = { response in
            return AppwriteModels.ProxyRule.from(map: response as! [String: Any])
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
    /// Delete a proxy rule by its unique ID.
    ///
    /// - Parameters:
    ///   - ruleId: String
    /// - Throws: Exception if the request fails
    /// - Returns: Any
    ///
    open func deleteRule(
        ruleId: String
    ) async throws -> Any {
        let apiPath: String = "/proxy/rules/{ruleId}"
            .replacingOccurrences(of: "{ruleId}", with: ruleId)

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
    /// If not succeeded yet, retry verification process of a proxy rule domain.
    /// This endpoint triggers domain verification by checking DNS records. If
    /// verification is successful, a TLS certificate will be automatically
    /// provisioned for the domain asynchronously in the background.
    ///
    /// - Parameters:
    ///   - ruleId: String
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.ProxyRule
    ///
    open func updateRuleStatus(
        ruleId: String
    ) async throws -> AppwriteModels.ProxyRule {
        let apiPath: String = "/proxy/rules/{ruleId}/status"
            .replacingOccurrences(of: "{ruleId}", with: ruleId)

        let apiParams: [String: Any] = [:]

        let apiHeaders: [String: String] = [
            "content-type": "application/json"
        ]

        let converter: (Any) throws -> AppwriteModels.ProxyRule = { response in
            return AppwriteModels.ProxyRule.from(map: response as! [String: Any])
        }

        return try await client.call(
            method: "PATCH",
            path: apiPath,
            headers: apiHeaders,
            params: apiParams,
            converter: converter
        )
    }


}
