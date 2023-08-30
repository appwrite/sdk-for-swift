import AsyncHTTPClient
import Foundation
import NIO
import JSONCodable
import AppwriteModels

/// The Proxy Service allows you to configure actions for your domains beyond DNS configuration.
open class Proxy: Service {

    ///
    /// List Rules
    ///
    /// Get a list of all the proxy rules. You can use the query params to filter
    /// your results.
    ///
    /// @param [String] queries
    /// @param String search
    /// @throws Exception
    /// @return array
    ///
    open func listRules(
        queries: [String]? = nil,
        search: String? = nil
    ) async throws -> AppwriteModels.ProxyRuleList {
        let api_path: String = "/proxy/rules"

        let params: [String: Any?] = [
            "queries": queries,
            "search": search
        ]

        let headers: [String: String] = [
            "content-type": "application/json"
        ]

        let converter: (Any) -> AppwriteModels.ProxyRuleList = { response in
            return AppwriteModels.ProxyRuleList.from(map: response as! [String: Any])
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
    /// Create Rule
    ///
    /// Create a new proxy rule.
    ///
    /// @param String domain
    /// @param String resourceType
    /// @param String resourceId
    /// @throws Exception
    /// @return array
    ///
    open func createRule(
        domain: String,
        resourceType: String,
        resourceId: String? = nil
    ) async throws -> AppwriteModels.ProxyRule {
        let api_path: String = "/proxy/rules"

        let params: [String: Any?] = [
            "domain": domain,
            "resourceType": resourceType,
            "resourceId": resourceId
        ]

        let headers: [String: String] = [
            "content-type": "application/json"
        ]

        let converter: (Any) -> AppwriteModels.ProxyRule = { response in
            return AppwriteModels.ProxyRule.from(map: response as! [String: Any])
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
    /// Get Rule
    ///
    /// Get a proxy rule by its unique ID.
    ///
    /// @param String ruleId
    /// @throws Exception
    /// @return array
    ///
    open func getRule(
        ruleId: String
    ) async throws -> AppwriteModels.ProxyRule {
        let api_path: String = "/proxy/rules/{ruleId}"
            .replacingOccurrences(of: "{ruleId}", with: ruleId)

        let params: [String: Any] = [:]

        let headers: [String: String] = [
            "content-type": "application/json"
        ]

        let converter: (Any) -> AppwriteModels.ProxyRule = { response in
            return AppwriteModels.ProxyRule.from(map: response as! [String: Any])
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
    /// Delete Rule
    ///
    /// Delete a proxy rule by its unique ID.
    ///
    /// @param String ruleId
    /// @throws Exception
    /// @return array
    ///
    open func deleteRule(
        ruleId: String
    ) async throws -> Any {
        let api_path: String = "/proxy/rules/{ruleId}"
            .replacingOccurrences(of: "{ruleId}", with: ruleId)

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
    /// Update Rule Verification Status
    ///
    /// @param String ruleId
    /// @throws Exception
    /// @return array
    ///
    open func updateRuleVerification(
        ruleId: String
    ) async throws -> AppwriteModels.ProxyRule {
        let api_path: String = "/proxy/rules/{ruleId}/verification"
            .replacingOccurrences(of: "{ruleId}", with: ruleId)

        let params: [String: Any] = [:]

        let headers: [String: String] = [
            "content-type": "application/json"
        ]

        let converter: (Any) -> AppwriteModels.ProxyRule = { response in
            return AppwriteModels.ProxyRule.from(map: response as! [String: Any])
        }

        return try await client.call(
            method: "PATCH",
            path: api_path,
            headers: headers,
            params: params,
            converter: converter
        )
    }


}