import AppwriteEnums
import AppwriteModels
import AsyncHTTPClient
import Foundation
import JSONCodable
import NIO

///
open class Waf: Service {

    ///
    /// List WAF rules for the current project.
    ///
    /// - Parameters:
    ///   - queries: [String] (optional)
    ///   - search: String (optional)
    ///   - total: Bool (optional)
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.WafRuleList
    ///
    open func listRules(
        queries: [String]? = nil,
        search: String? = nil,
        total: Bool? = nil
    ) async throws -> AppwriteModels.WafRuleList {
        let apiPath: String = "/waf/rules"

        let apiParams: [String: Any?] = [
            "queries": queries,
            "search": search,
            "total": total,
        ]

        let apiHeaders: [String: String] = [
            "X-Appwrite-Project": client.config["project"] ?? "",
            "accept": "application/json",
        ]

        let converter: (Any) throws -> AppwriteModels.WafRuleList = { response in
            return AppwriteModels.WafRuleList.from(map: response as! [String: Any])
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
    /// Create a bypass WAF rule. Conditions can match request attributes including
    /// `ip` (plain IPs or CIDR blocks like `10.0.0.0/8`), `method`, `path`,
    /// `host`, `country`, `continent`, `headers.<name>`, `query.<key>`,
    /// `queryKeys`, `accept`, `acceptLanguage`, `cookie`, `userAgent`, `os`,
    /// `osVersion`, `browser`, and `browserVersion`. Conditions on `city` and
    /// `state` require the premium Geo DB addon.
    ///
    /// - Parameters:
    ///   - ruleId: String
    ///   - resourceType: String
    ///   - name: String
    ///   - resourceId: String (optional)
    ///   - description: String (optional)
    ///   - priority: Int (optional)
    ///   - enabled: Bool (optional)
    ///   - conditions: [String] (optional)
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.WafRuleBypass
    ///
    open func createBypassRule(
        ruleId: String,
        resourceType: String,
        name: String,
        resourceId: String? = nil,
        description: String? = nil,
        priority: Int? = nil,
        enabled: Bool? = nil,
        conditions: [String]? = nil
    ) async throws -> AppwriteModels.WafRuleBypass {
        let apiPath: String = "/waf/rules/bypass"

        let apiParams: [String: Any?] = [
            "ruleId": ruleId,
            "resourceType": resourceType,
            "resourceId": resourceId,
            "name": name,
            "description": description,
            "priority": priority,
            "enabled": enabled,
            "conditions": conditions,
        ]

        let apiHeaders: [String: String] = [
            "X-Appwrite-Project": client.config["project"] ?? "",
            "content-type": "application/json",
            "accept": "application/json",
        ]

        let converter: (Any) throws -> AppwriteModels.WafRuleBypass = { response in
            return AppwriteModels.WafRuleBypass.from(map: response as! [String: Any])
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
    /// Update a bypass WAF rule. Conditions can match request attributes including
    /// `ip` (plain IPs or CIDR blocks like `10.0.0.0/8`), `method`, `path`,
    /// `host`, `country`, `continent`, `headers.<name>`, `query.<key>`,
    /// `queryKeys`, `accept`, `acceptLanguage`, `cookie`, `userAgent`, `os`,
    /// `osVersion`, `browser`, and `browserVersion`. Conditions on `city` and
    /// `state` require the premium Geo DB addon.
    ///
    /// - Parameters:
    ///   - ruleId: String
    ///   - resourceType: String (optional)
    ///   - resourceId: String (optional)
    ///   - name: String (optional)
    ///   - description: String (optional)
    ///   - priority: Int (optional)
    ///   - enabled: Bool (optional)
    ///   - conditions: [String] (optional)
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.WafRuleBypass
    ///
    open func updateBypassRule(
        ruleId: String,
        resourceType: String? = nil,
        resourceId: String? = nil,
        name: String? = nil,
        description: String? = nil,
        priority: Int? = nil,
        enabled: Bool? = nil,
        conditions: [String]? = nil
    ) async throws -> AppwriteModels.WafRuleBypass {
        if ruleId.isEmpty {
            throw AppwriteError(message: "Missing required parameter: \"ruleId\"")
        }

        let apiPath: String = "/waf/rules/bypass/{ruleId}"
            .replacingOccurrences(of: "{ruleId}", with: try Client.encodePath(ruleId))

        let apiParams: [String: Any?] = [
            "resourceType": resourceType,
            "resourceId": resourceId,
            "name": name,
            "description": description,
            "priority": priority,
            "enabled": enabled,
            "conditions": conditions,
        ]

        let apiHeaders: [String: String] = [
            "X-Appwrite-Project": client.config["project"] ?? "",
            "content-type": "application/json",
            "accept": "application/json",
        ]

        let converter: (Any) throws -> AppwriteModels.WafRuleBypass = { response in
            return AppwriteModels.WafRuleBypass.from(map: response as! [String: Any])
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
    /// Create a challenge WAF rule. Use `difficulty` (1 easiest to 5 hardest) to
    /// tune the client-side proof-of-work cost, and `ttl` to control how long, in
    /// seconds, a visitor stays cleared after passing the challenge before being
    /// challenged again. Conditions can match request attributes including `ip`
    /// (plain IPs or CIDR blocks like `10.0.0.0/8`), `method`, `path`, `host`,
    /// `country`, `continent`, `headers.<name>`, `query.<key>`, `queryKeys`,
    /// `accept`, `acceptLanguage`, `cookie`, `userAgent`, `os`, `osVersion`,
    /// `browser`, and `browserVersion`. Conditions on `city` and `state` require
    /// the premium Geo DB addon.
    ///
    /// - Parameters:
    ///   - ruleId: String
    ///   - resourceType: String
    ///   - name: String
    ///   - resourceId: String (optional)
    ///   - description: String (optional)
    ///   - challengeType: String (optional)
    ///   - priority: Int (optional)
    ///   - enabled: Bool (optional)
    ///   - conditions: [String] (optional)
    ///   - difficulty: Int (optional)
    ///   - ttl: Int (optional)
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.WafRuleChallenge
    ///
    open func createChallengeRule(
        ruleId: String,
        resourceType: String,
        name: String,
        resourceId: String? = nil,
        description: String? = nil,
        challengeType: String? = nil,
        priority: Int? = nil,
        enabled: Bool? = nil,
        conditions: [String]? = nil,
        difficulty: Int? = nil,
        ttl: Int? = nil
    ) async throws -> AppwriteModels.WafRuleChallenge {
        let apiPath: String = "/waf/rules/challenge"

        let apiParams: [String: Any?] = [
            "ruleId": ruleId,
            "resourceType": resourceType,
            "resourceId": resourceId,
            "name": name,
            "description": description,
            "challengeType": challengeType,
            "priority": priority,
            "enabled": enabled,
            "conditions": conditions,
            "difficulty": difficulty,
            "ttl": ttl,
        ]

        let apiHeaders: [String: String] = [
            "X-Appwrite-Project": client.config["project"] ?? "",
            "content-type": "application/json",
            "accept": "application/json",
        ]

        let converter: (Any) throws -> AppwriteModels.WafRuleChallenge = { response in
            return AppwriteModels.WafRuleChallenge.from(map: response as! [String: Any])
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
    /// Update a challenge WAF rule. Use `difficulty` (1 easiest to 5 hardest) to
    /// tune the client-side proof-of-work cost, and `ttl` to control how long, in
    /// seconds, a visitor stays cleared after passing the challenge before being
    /// challenged again. Conditions can match request attributes including `ip`
    /// (plain IPs or CIDR blocks like `10.0.0.0/8`), `method`, `path`, `host`,
    /// `country`, `continent`, `headers.<name>`, `query.<key>`, `queryKeys`,
    /// `accept`, `acceptLanguage`, `cookie`, `userAgent`, `os`, `osVersion`,
    /// `browser`, and `browserVersion`. Conditions on `city` and `state` require
    /// the premium Geo DB addon.
    ///
    /// - Parameters:
    ///   - ruleId: String
    ///   - resourceType: String (optional)
    ///   - resourceId: String (optional)
    ///   - name: String (optional)
    ///   - description: String (optional)
    ///   - challengeType: String (optional)
    ///   - priority: Int (optional)
    ///   - enabled: Bool (optional)
    ///   - conditions: [String] (optional)
    ///   - difficulty: Int (optional)
    ///   - ttl: Int (optional)
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.WafRuleChallenge
    ///
    open func updateChallengeRule(
        ruleId: String,
        resourceType: String? = nil,
        resourceId: String? = nil,
        name: String? = nil,
        description: String? = nil,
        challengeType: String? = nil,
        priority: Int? = nil,
        enabled: Bool? = nil,
        conditions: [String]? = nil,
        difficulty: Int? = nil,
        ttl: Int? = nil
    ) async throws -> AppwriteModels.WafRuleChallenge {
        if ruleId.isEmpty {
            throw AppwriteError(message: "Missing required parameter: \"ruleId\"")
        }

        let apiPath: String = "/waf/rules/challenge/{ruleId}"
            .replacingOccurrences(of: "{ruleId}", with: try Client.encodePath(ruleId))

        let apiParams: [String: Any?] = [
            "resourceType": resourceType,
            "resourceId": resourceId,
            "name": name,
            "description": description,
            "challengeType": challengeType,
            "priority": priority,
            "enabled": enabled,
            "conditions": conditions,
            "difficulty": difficulty,
            "ttl": ttl,
        ]

        let apiHeaders: [String: String] = [
            "X-Appwrite-Project": client.config["project"] ?? "",
            "content-type": "application/json",
            "accept": "application/json",
        ]

        let converter: (Any) throws -> AppwriteModels.WafRuleChallenge = { response in
            return AppwriteModels.WafRuleChallenge.from(map: response as! [String: Any])
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
    /// Create a deny WAF rule. Conditions can match request attributes including
    /// `ip` (plain IPs or CIDR blocks like `10.0.0.0/8`), `method`, `path`,
    /// `host`, `country`, `continent`, `headers.<name>`, `query.<key>`,
    /// `queryKeys`, `accept`, `acceptLanguage`, `cookie`, `userAgent`, `os`,
    /// `osVersion`, `browser`, and `browserVersion`. Conditions on `city` and
    /// `state` require the premium Geo DB addon. `sessionAge` and `mfaAge` hold
    /// the seconds since the request's session was created and since its last MFA
    /// challenge. Both are null for requests without a session, such as guests and
    /// API keys, while a request authenticated with the `x-appwrite-jwt` header
    /// carries the age of the session its token is bound to; on `functions` rules
    /// the session comes from the `x-appwrite-user-jwt` header, and `mfaAge` is
    /// null when the session never completed MFA. A deny matching on `mfaAge`
    /// returns `user_challenge_required` and one matching on `sessionAge` returns
    /// `user_reauthentication_required`, both with status 401, so the user can
    /// sign in again and retry. To also deny requests without a session, combine
    /// `isNull` and `greaterThan` in an `or` condition.
    ///
    /// - Parameters:
    ///   - ruleId: String
    ///   - resourceType: String
    ///   - name: String
    ///   - resourceId: String (optional)
    ///   - description: String (optional)
    ///   - priority: Int (optional)
    ///   - enabled: Bool (optional)
    ///   - conditions: [String] (optional)
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.WafRuleDeny
    ///
    open func createDenyRule(
        ruleId: String,
        resourceType: String,
        name: String,
        resourceId: String? = nil,
        description: String? = nil,
        priority: Int? = nil,
        enabled: Bool? = nil,
        conditions: [String]? = nil
    ) async throws -> AppwriteModels.WafRuleDeny {
        let apiPath: String = "/waf/rules/deny"

        let apiParams: [String: Any?] = [
            "ruleId": ruleId,
            "resourceType": resourceType,
            "resourceId": resourceId,
            "name": name,
            "description": description,
            "priority": priority,
            "enabled": enabled,
            "conditions": conditions,
        ]

        let apiHeaders: [String: String] = [
            "X-Appwrite-Project": client.config["project"] ?? "",
            "content-type": "application/json",
            "accept": "application/json",
        ]

        let converter: (Any) throws -> AppwriteModels.WafRuleDeny = { response in
            return AppwriteModels.WafRuleDeny.from(map: response as! [String: Any])
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
    /// Update a deny WAF rule. Conditions can match request attributes including
    /// `ip` (plain IPs or CIDR blocks like `10.0.0.0/8`), `method`, `path`,
    /// `host`, `country`, `continent`, `headers.<name>`, `query.<key>`,
    /// `queryKeys`, `accept`, `acceptLanguage`, `cookie`, `userAgent`, `os`,
    /// `osVersion`, `browser`, and `browserVersion`. Conditions on `city` and
    /// `state` require the premium Geo DB addon. `sessionAge` and `mfaAge` hold
    /// the seconds since the request's session was created and since its last MFA
    /// challenge. Both are null for requests without a session, such as guests and
    /// API keys, while a request authenticated with the `x-appwrite-jwt` header
    /// carries the age of the session its token is bound to; on `functions` rules
    /// the session comes from the `x-appwrite-user-jwt` header, and `mfaAge` is
    /// null when the session never completed MFA. A deny matching on `mfaAge`
    /// returns `user_challenge_required` and one matching on `sessionAge` returns
    /// `user_reauthentication_required`, both with status 401, so the user can
    /// sign in again and retry. To also deny requests without a session, combine
    /// `isNull` and `greaterThan` in an `or` condition.
    ///
    /// - Parameters:
    ///   - ruleId: String
    ///   - resourceType: String (optional)
    ///   - resourceId: String (optional)
    ///   - name: String (optional)
    ///   - description: String (optional)
    ///   - priority: Int (optional)
    ///   - enabled: Bool (optional)
    ///   - conditions: [String] (optional)
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.WafRuleDeny
    ///
    open func updateDenyRule(
        ruleId: String,
        resourceType: String? = nil,
        resourceId: String? = nil,
        name: String? = nil,
        description: String? = nil,
        priority: Int? = nil,
        enabled: Bool? = nil,
        conditions: [String]? = nil
    ) async throws -> AppwriteModels.WafRuleDeny {
        if ruleId.isEmpty {
            throw AppwriteError(message: "Missing required parameter: \"ruleId\"")
        }

        let apiPath: String = "/waf/rules/deny/{ruleId}"
            .replacingOccurrences(of: "{ruleId}", with: try Client.encodePath(ruleId))

        let apiParams: [String: Any?] = [
            "resourceType": resourceType,
            "resourceId": resourceId,
            "name": name,
            "description": description,
            "priority": priority,
            "enabled": enabled,
            "conditions": conditions,
        ]

        let apiHeaders: [String: String] = [
            "X-Appwrite-Project": client.config["project"] ?? "",
            "content-type": "application/json",
            "accept": "application/json",
        ]

        let converter: (Any) throws -> AppwriteModels.WafRuleDeny = { response in
            return AppwriteModels.WafRuleDeny.from(map: response as! [String: Any])
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
    /// Create a rate limit WAF rule. Use `key` to choose the counter: `ip` limits
    /// per client IP, while `userId` limits per authenticated user (requests
    /// without an authenticated user skip `userId` rules). Conditions can match
    /// request attributes including `ip` (plain IPs or CIDR blocks like
    /// `10.0.0.0/8`), `method`, `path`, `host`, `country`, `continent`,
    /// `headers.<name>`, `query.<key>`, `queryKeys`, `accept`, `acceptLanguage`,
    /// `cookie`, `userAgent`, `os`, `osVersion`, `browser`, and `browserVersion`.
    /// Conditions on `city` and `state` require the premium Geo DB addon.
    ///
    /// - Parameters:
    ///   - ruleId: String
    ///   - resourceType: String
    ///   - name: String
    ///   - limit: Int
    ///   - interval: Int
    ///   - resourceId: String (optional)
    ///   - description: String (optional)
    ///   - key: String (optional)
    ///   - strategy: String (optional)
    ///   - maxBucketSize: Int (optional)
    ///   - priority: Int (optional)
    ///   - enabled: Bool (optional)
    ///   - conditions: [String] (optional)
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.WafRuleRateLimit
    ///
    open func createRateLimitRule(
        ruleId: String,
        resourceType: String,
        name: String,
        limit: Int,
        interval: Int,
        resourceId: String? = nil,
        description: String? = nil,
        key: String? = nil,
        strategy: String? = nil,
        maxBucketSize: Int? = nil,
        priority: Int? = nil,
        enabled: Bool? = nil,
        conditions: [String]? = nil
    ) async throws -> AppwriteModels.WafRuleRateLimit {
        let apiPath: String = "/waf/rules/rate-limit"

        let apiParams: [String: Any?] = [
            "ruleId": ruleId,
            "resourceType": resourceType,
            "resourceId": resourceId,
            "name": name,
            "description": description,
            "limit": limit,
            "interval": interval,
            "key": key,
            "strategy": strategy,
            "maxBucketSize": maxBucketSize,
            "priority": priority,
            "enabled": enabled,
            "conditions": conditions,
        ]

        let apiHeaders: [String: String] = [
            "X-Appwrite-Project": client.config["project"] ?? "",
            "content-type": "application/json",
            "accept": "application/json",
        ]

        let converter: (Any) throws -> AppwriteModels.WafRuleRateLimit = { response in
            return AppwriteModels.WafRuleRateLimit.from(map: response as! [String: Any])
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
    /// Update a rate limit WAF rule. Use `key` to choose the counter: `ip` limits
    /// per client IP, while `userId` limits per authenticated user (requests
    /// without an authenticated user skip `userId` rules). Conditions can match
    /// request attributes including `ip` (plain IPs or CIDR blocks like
    /// `10.0.0.0/8`), `method`, `path`, `host`, `country`, `continent`,
    /// `headers.<name>`, `query.<key>`, `queryKeys`, `accept`, `acceptLanguage`,
    /// `cookie`, `userAgent`, `os`, `osVersion`, `browser`, and `browserVersion`.
    /// Conditions on `city` and `state` require the premium Geo DB addon.
    ///
    /// - Parameters:
    ///   - ruleId: String
    ///   - resourceType: String (optional)
    ///   - resourceId: String (optional)
    ///   - name: String (optional)
    ///   - description: String (optional)
    ///   - limit: Int (optional)
    ///   - interval: Int (optional)
    ///   - key: String (optional)
    ///   - maxBucketSize: Int (optional)
    ///   - priority: Int (optional)
    ///   - enabled: Bool (optional)
    ///   - conditions: [String] (optional)
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.WafRuleRateLimit
    ///
    open func updateRateLimitRule(
        ruleId: String,
        resourceType: String? = nil,
        resourceId: String? = nil,
        name: String? = nil,
        description: String? = nil,
        limit: Int? = nil,
        interval: Int? = nil,
        key: String? = nil,
        maxBucketSize: Int? = nil,
        priority: Int? = nil,
        enabled: Bool? = nil,
        conditions: [String]? = nil
    ) async throws -> AppwriteModels.WafRuleRateLimit {
        if ruleId.isEmpty {
            throw AppwriteError(message: "Missing required parameter: \"ruleId\"")
        }

        let apiPath: String = "/waf/rules/rate-limit/{ruleId}"
            .replacingOccurrences(of: "{ruleId}", with: try Client.encodePath(ruleId))

        let apiParams: [String: Any?] = [
            "resourceType": resourceType,
            "resourceId": resourceId,
            "name": name,
            "description": description,
            "limit": limit,
            "interval": interval,
            "key": key,
            "maxBucketSize": maxBucketSize,
            "priority": priority,
            "enabled": enabled,
            "conditions": conditions,
        ]

        let apiHeaders: [String: String] = [
            "X-Appwrite-Project": client.config["project"] ?? "",
            "content-type": "application/json",
            "accept": "application/json",
        ]

        let converter: (Any) throws -> AppwriteModels.WafRuleRateLimit = { response in
            return AppwriteModels.WafRuleRateLimit.from(map: response as! [String: Any])
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
    /// Create a redirect WAF rule. Conditions can match request attributes
    /// including `ip` (plain IPs or CIDR blocks like `10.0.0.0/8`), `method`,
    /// `path`, `host`, `country`, `continent`, `headers.<name>`, `query.<key>`,
    /// `queryKeys`, `accept`, `acceptLanguage`, `cookie`, `userAgent`, `os`,
    /// `osVersion`, `browser`, and `browserVersion`. Conditions on `city` and
    /// `state` require the premium Geo DB addon.
    ///
    /// - Parameters:
    ///   - ruleId: String
    ///   - resourceType: String
    ///   - name: String
    ///   - location: String
    ///   - statusCode: Int
    ///   - resourceId: String (optional)
    ///   - description: String (optional)
    ///   - priority: Int (optional)
    ///   - enabled: Bool (optional)
    ///   - conditions: [String] (optional)
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.WafRuleRedirect
    ///
    open func createRedirectRule(
        ruleId: String,
        resourceType: String,
        name: String,
        location: String,
        statusCode: Int,
        resourceId: String? = nil,
        description: String? = nil,
        priority: Int? = nil,
        enabled: Bool? = nil,
        conditions: [String]? = nil
    ) async throws -> AppwriteModels.WafRuleRedirect {
        let apiPath: String = "/waf/rules/redirect"

        let apiParams: [String: Any?] = [
            "ruleId": ruleId,
            "resourceType": resourceType,
            "resourceId": resourceId,
            "name": name,
            "description": description,
            "location": location,
            "statusCode": statusCode,
            "priority": priority,
            "enabled": enabled,
            "conditions": conditions,
        ]

        let apiHeaders: [String: String] = [
            "X-Appwrite-Project": client.config["project"] ?? "",
            "content-type": "application/json",
            "accept": "application/json",
        ]

        let converter: (Any) throws -> AppwriteModels.WafRuleRedirect = { response in
            return AppwriteModels.WafRuleRedirect.from(map: response as! [String: Any])
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
    /// Update a redirect WAF rule. Conditions can match request attributes
    /// including `ip` (plain IPs or CIDR blocks like `10.0.0.0/8`), `method`,
    /// `path`, `host`, `country`, `continent`, `headers.<name>`, `query.<key>`,
    /// `queryKeys`, `accept`, `acceptLanguage`, `cookie`, `userAgent`, `os`,
    /// `osVersion`, `browser`, and `browserVersion`. Conditions on `city` and
    /// `state` require the premium Geo DB addon.
    ///
    /// - Parameters:
    ///   - ruleId: String
    ///   - resourceType: String (optional)
    ///   - resourceId: String (optional)
    ///   - name: String (optional)
    ///   - description: String (optional)
    ///   - location: String (optional)
    ///   - statusCode: Int (optional)
    ///   - priority: Int (optional)
    ///   - enabled: Bool (optional)
    ///   - conditions: [String] (optional)
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.WafRuleRedirect
    ///
    open func updateRedirectRule(
        ruleId: String,
        resourceType: String? = nil,
        resourceId: String? = nil,
        name: String? = nil,
        description: String? = nil,
        location: String? = nil,
        statusCode: Int? = nil,
        priority: Int? = nil,
        enabled: Bool? = nil,
        conditions: [String]? = nil
    ) async throws -> AppwriteModels.WafRuleRedirect {
        if ruleId.isEmpty {
            throw AppwriteError(message: "Missing required parameter: \"ruleId\"")
        }

        let apiPath: String = "/waf/rules/redirect/{ruleId}"
            .replacingOccurrences(of: "{ruleId}", with: try Client.encodePath(ruleId))

        let apiParams: [String: Any?] = [
            "resourceType": resourceType,
            "resourceId": resourceId,
            "name": name,
            "description": description,
            "location": location,
            "statusCode": statusCode,
            "priority": priority,
            "enabled": enabled,
            "conditions": conditions,
        ]

        let apiHeaders: [String: String] = [
            "X-Appwrite-Project": client.config["project"] ?? "",
            "content-type": "application/json",
            "accept": "application/json",
        ]

        let converter: (Any) throws -> AppwriteModels.WafRuleRedirect = { response in
            return AppwriteModels.WafRuleRedirect.from(map: response as! [String: Any])
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
    /// Get a WAF rule by its ID.
    ///
    /// - Parameters:
    ///   - ruleId: String
    /// - Throws: Exception if the request fails
    /// - Returns: Any
    ///
    open func getRule(
        ruleId: String
    ) async throws -> Any {
        if ruleId.isEmpty {
            throw AppwriteError(message: "Missing required parameter: \"ruleId\"")
        }

        let apiPath: String = "/waf/rules/{ruleId}"
            .replacingOccurrences(of: "{ruleId}", with: try Client.encodePath(ruleId))

        let apiParams: [String: Any] = [:]

        let apiHeaders: [String: String] = [
            "X-Appwrite-Project": client.config["project"] ?? "",
            "accept": "application/json",
        ]

        let converter: (Any) throws -> Any = { response in
            guard let responseMap = response as? [String: Any] else {
                throw AppwriteError(message: "Expected object response when hydrating a response model")
            }
            if String(describing: responseMap["action"] ?? "") == "bypass" {
                return AppwriteModels.WafRuleBypass.from(map: responseMap)
            }
            if String(describing: responseMap["action"] ?? "") == "deny" {
                return AppwriteModels.WafRuleDeny.from(map: responseMap)
            }
            if String(describing: responseMap["action"] ?? "") == "challenge" {
                return AppwriteModels.WafRuleChallenge.from(map: responseMap)
            }
            if String(describing: responseMap["action"] ?? "") == "rateLimit" {
                return AppwriteModels.WafRuleRateLimit.from(map: responseMap)
            }
            if String(describing: responseMap["action"] ?? "") == "redirect" {
                return AppwriteModels.WafRuleRedirect.from(map: responseMap)
            }
            throw AppwriteError(message: "Unable to match response to any expected response model")
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
    /// Delete a WAF rule.
    ///
    /// - Parameters:
    ///   - ruleId: String
    /// - Throws: Exception if the request fails
    /// - Returns: Any
    ///
    open func deleteRule(
        ruleId: String
    ) async throws -> Any {
        if ruleId.isEmpty {
            throw AppwriteError(message: "Missing required parameter: \"ruleId\"")
        }

        let apiPath: String = "/waf/rules/{ruleId}"
            .replacingOccurrences(of: "{ruleId}", with: try Client.encodePath(ruleId))

        let apiParams: [String: Any] = [:]

        let apiHeaders: [String: String] = [
            "X-Appwrite-Project": client.config["project"] ?? "",
            "content-type": "application/json",
            "accept": "application/json",
        ]

        return try await client.call(
            method: "DELETE",
            path: apiPath,
            headers: apiHeaders,
            params: apiParams
        )
    }
}
