import AppwriteEnums
import AppwriteModels
import AsyncHTTPClient
import Foundation
import JSONCodable
import NIO

///
open class Domains: Service {

    ///
    /// List all domains registered for this project. This endpoint supports
    /// pagination.
    ///
    /// - Parameters:
    ///   - queries: [String] (optional)
    ///   - search: String (optional)
    ///   - total: Bool (optional)
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.DomainsList
    ///
    open func list(
        queries: [String]? = nil,
        search: String? = nil,
        total: Bool? = nil
    ) async throws -> AppwriteModels.DomainsList {
        let apiPath: String = "/domains"

        let apiParams: [String: Any?] = [
            "queries": queries,
            "search": search,
            "total": total,
        ]

        let apiHeaders: [String: String] = [
            "X-Appwrite-Project": client.config["project"] ?? "",
            "accept": "application/json",
        ]

        let converter: (Any) throws -> AppwriteModels.DomainsList = { response in
            return AppwriteModels.DomainsList.from(map: response as! [String: Any])
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
    /// Create a new domain. Before creating a domain, you need to ensure that your
    /// DNS provider is properly configured. After creating the domain, you can use
    /// the verification endpoint to check if the domain is ready to be used.
    ///
    /// - Parameters:
    ///   - teamId: String
    ///   - domain: String
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.Domain
    ///
    open func create(
        teamId: String,
        domain: String
    ) async throws -> AppwriteModels.Domain {
        let apiPath: String = "/domains"

        let apiParams: [String: Any?] = [
            "teamId": teamId,
            "domain": domain,
        ]

        let apiHeaders: [String: String] = [
            "X-Appwrite-Project": client.config["project"] ?? "",
            "content-type": "application/json",
            "accept": "application/json",
        ]

        let converter: (Any) throws -> AppwriteModels.Domain = { response in
            return AppwriteModels.Domain.from(map: response as! [String: Any])
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
    /// Get the registration price for a domain name.
    ///
    /// - Parameters:
    ///   - domain: String
    ///   - periodYears: Int (optional)
    ///   - registrationType: AppwriteEnums.DomainRegistrationType (optional)
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.DomainPrice
    ///
    @available(*, deprecated, message: "This API has been deprecated since 2.0.0. Please use `Domains.listPrices` instead.")
    open func getPrice(
        domain: String,
        periodYears: Int? = nil,
        registrationType: AppwriteEnums.DomainRegistrationType? = nil
    ) async throws -> AppwriteModels.DomainPrice {
        let apiPath: String = "/domains/price"

        let apiParams: [String: Any?] = [
            "domain": domain,
            "periodYears": periodYears,
            "registrationType": registrationType?.rawValue,
        ]

        let apiHeaders: [String: String] = [
            "X-Appwrite-Project": client.config["project"] ?? "",
            "accept": "application/json",
        ]

        let converter: (Any) throws -> AppwriteModels.DomainPrice = { response in
            return AppwriteModels.DomainPrice.from(map: response as! [String: Any])
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
    /// Check availability and get the requested registration price for one or more
    /// domain names. Availability is resolved for all domains in a single
    /// registrar lookup. Unavailable domains have a null price for new
    /// registrations, but can still be priced for renewal, transfer, or trade.
    /// Every priced domain also carries its renewal price for the same period, so
    /// a separate renewal lookup is not needed. A domain whose price could not be
    /// resolved, for example because its TLD is not supported, is returned with a
    /// null price.
    ///
    /// - Parameters:
    ///   - domains: [String]
    ///   - periodYears: Int (optional)
    ///   - registrationType: AppwriteEnums.DomainRegistrationType (optional)
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.DomainPricesList
    ///
    open func listPrices(
        domains: [String],
        periodYears: Int? = nil,
        registrationType: AppwriteEnums.DomainRegistrationType? = nil
    ) async throws -> AppwriteModels.DomainPricesList {
        let apiPath: String = "/domains/prices"

        let apiParams: [String: Any?] = [
            "domains": domains,
            "periodYears": periodYears,
            "registrationType": registrationType?.rawValue,
        ]

        let apiHeaders: [String: String] = [
            "X-Appwrite-Project": client.config["project"] ?? "",
            "accept": "application/json",
        ]

        let converter: (Any) throws -> AppwriteModels.DomainPricesList = { response in
            return AppwriteModels.DomainPricesList.from(map: response as! [String: Any])
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
    /// Get a domain by its unique ID.
    ///
    /// - Parameters:
    ///   - domainId: String
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.Domain
    ///
    open func get(
        domainId: String
    ) async throws -> AppwriteModels.Domain {
        if domainId.isEmpty {
            throw AppwriteError(message: "Missing required parameter: \"domainId\"")
        }

        let apiPath: String = "/domains/{domainId}"
            .replacingOccurrences(of: "{domainId}", with: domainId)

        let apiParams: [String: Any] = [:]

        let apiHeaders: [String: String] = [
            "X-Appwrite-Project": client.config["project"] ?? "",
            "accept": "application/json",
        ]

        let converter: (Any) throws -> AppwriteModels.Domain = { response in
            return AppwriteModels.Domain.from(map: response as! [String: Any])
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
    /// Delete a domain by its unique ID. This endpoint can be used to delete a
    /// domain from your project.
    /// Once deleted, the domain will no longer be available for use and all
    /// associated resources will be removed.
    ///
    /// - Parameters:
    ///   - domainId: String
    /// - Throws: Exception if the request fails
    /// - Returns: Any
    ///
    open func delete(
        domainId: String
    ) async throws -> Any {
        if domainId.isEmpty {
            throw AppwriteError(message: "Missing required parameter: \"domainId\"")
        }

        let apiPath: String = "/domains/{domainId}"
            .replacingOccurrences(of: "{domainId}", with: domainId)

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
    ///
    /// Update the registrar nameservers for the given domain. When nameservers are
    /// not provided,
    /// the domain will be updated to use Appwrite nameservers.
    ///
    /// - Parameters:
    ///   - domainId: String
    ///   - nameservers: [String] (optional)
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.Domain
    ///
    open func updateNameservers(
        domainId: String,
        nameservers: [String]? = nil
    ) async throws -> AppwriteModels.Domain {
        if domainId.isEmpty {
            throw AppwriteError(message: "Missing required parameter: \"domainId\"")
        }

        let apiPath: String = "/domains/{domainId}/nameservers"
            .replacingOccurrences(of: "{domainId}", with: domainId)

        let apiParams: [String: Any?] = [
            "nameservers": nameservers
        ]

        let apiHeaders: [String: String] = [
            "X-Appwrite-Project": client.config["project"] ?? "",
            "content-type": "application/json",
            "accept": "application/json",
        ]

        let converter: (Any) throws -> AppwriteModels.Domain = { response in
            return AppwriteModels.Domain.from(map: response as! [String: Any])
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
    /// Verify which NS records are used and update the domain accordingly. This
    /// will check the domain's
    /// nameservers and update the domain's status based on whether the nameservers
    /// match the expected
    /// Appwrite nameservers.
    ///
    /// - Parameters:
    ///   - domainId: String
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.Domain
    ///
    open func verifyNameservers(
        domainId: String
    ) async throws -> AppwriteModels.Domain {
        if domainId.isEmpty {
            throw AppwriteError(message: "Missing required parameter: \"domainId\"")
        }

        let apiPath: String = "/domains/{domainId}/nameservers/verification"
            .replacingOccurrences(of: "{domainId}", with: domainId)

        let apiParams: [String: Any] = [:]

        let apiHeaders: [String: String] = [
            "X-Appwrite-Project": client.config["project"] ?? "",
            "content-type": "application/json",
            "accept": "application/json",
        ]

        let converter: (Any) throws -> AppwriteModels.Domain = { response in
            return AppwriteModels.Domain.from(map: response as! [String: Any])
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
    /// List Google Workspace DNS records.
    ///
    /// - Parameters:
    ///   - domainId: String
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.DnsRecordsList
    ///
    open func getPresetGoogleWorkspace(
        domainId: String
    ) async throws -> AppwriteModels.DnsRecordsList {
        if domainId.isEmpty {
            throw AppwriteError(message: "Missing required parameter: \"domainId\"")
        }

        let apiPath: String = "/domains/{domainId}/presets/google-workspace"
            .replacingOccurrences(of: "{domainId}", with: domainId)

        let apiParams: [String: Any] = [:]

        let apiHeaders: [String: String] = [
            "X-Appwrite-Project": client.config["project"] ?? "",
            "accept": "application/json",
        ]

        let converter: (Any) throws -> AppwriteModels.DnsRecordsList = { response in
            return AppwriteModels.DnsRecordsList.from(map: response as! [String: Any])
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
    /// Add Google Workspace DNS records to the domain. This will create the
    /// required MX records
    /// for Google Workspace email hosting.
    ///
    /// - Parameters:
    ///   - domainId: String
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.DnsRecordsList
    ///
    open func createPresetGoogleWorkspace(
        domainId: String
    ) async throws -> AppwriteModels.DnsRecordsList {
        if domainId.isEmpty {
            throw AppwriteError(message: "Missing required parameter: \"domainId\"")
        }

        let apiPath: String = "/domains/{domainId}/presets/google-workspace"
            .replacingOccurrences(of: "{domainId}", with: domainId)

        let apiParams: [String: Any] = [:]

        let apiHeaders: [String: String] = [
            "X-Appwrite-Project": client.config["project"] ?? "",
            "content-type": "application/json",
            "accept": "application/json",
        ]

        let converter: (Any) throws -> AppwriteModels.DnsRecordsList = { response in
            return AppwriteModels.DnsRecordsList.from(map: response as! [String: Any])
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
    /// List iCloud DNS records.
    ///
    /// - Parameters:
    ///   - domainId: String
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.DnsRecordsList
    ///
    open func getPresetICloud(
        domainId: String
    ) async throws -> AppwriteModels.DnsRecordsList {
        if domainId.isEmpty {
            throw AppwriteError(message: "Missing required parameter: \"domainId\"")
        }

        let apiPath: String = "/domains/{domainId}/presets/icloud"
            .replacingOccurrences(of: "{domainId}", with: domainId)

        let apiParams: [String: Any] = [:]

        let apiHeaders: [String: String] = [
            "X-Appwrite-Project": client.config["project"] ?? "",
            "accept": "application/json",
        ]

        let converter: (Any) throws -> AppwriteModels.DnsRecordsList = { response in
            return AppwriteModels.DnsRecordsList.from(map: response as! [String: Any])
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
    /// Add iCloud DNS records to the domain. This will create the required MX and
    /// SPF records
    /// for using iCloud email services with your domain.
    ///
    /// - Parameters:
    ///   - domainId: String
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.DnsRecordsList
    ///
    open func createPresetICloud(
        domainId: String
    ) async throws -> AppwriteModels.DnsRecordsList {
        if domainId.isEmpty {
            throw AppwriteError(message: "Missing required parameter: \"domainId\"")
        }

        let apiPath: String = "/domains/{domainId}/presets/icloud"
            .replacingOccurrences(of: "{domainId}", with: domainId)

        let apiParams: [String: Any] = [:]

        let apiHeaders: [String: String] = [
            "X-Appwrite-Project": client.config["project"] ?? "",
            "content-type": "application/json",
            "accept": "application/json",
        ]

        let converter: (Any) throws -> AppwriteModels.DnsRecordsList = { response in
            return AppwriteModels.DnsRecordsList.from(map: response as! [String: Any])
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
    /// List Mailgun DNS records.
    ///
    /// - Parameters:
    ///   - domainId: String
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.DnsRecordsList
    ///
    open func getPresetMailgun(
        domainId: String
    ) async throws -> AppwriteModels.DnsRecordsList {
        if domainId.isEmpty {
            throw AppwriteError(message: "Missing required parameter: \"domainId\"")
        }

        let apiPath: String = "/domains/{domainId}/presets/mailgun"
            .replacingOccurrences(of: "{domainId}", with: domainId)

        let apiParams: [String: Any] = [:]

        let apiHeaders: [String: String] = [
            "X-Appwrite-Project": client.config["project"] ?? "",
            "accept": "application/json",
        ]

        let converter: (Any) throws -> AppwriteModels.DnsRecordsList = { response in
            return AppwriteModels.DnsRecordsList.from(map: response as! [String: Any])
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
    /// Add Mailgun DNS records to the domain. This endpoint will create the
    /// required DNS records
    /// for Mailgun in the specified domain.
    ///
    /// - Parameters:
    ///   - domainId: String
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.DnsRecordsList
    ///
    open func createPresetMailgun(
        domainId: String
    ) async throws -> AppwriteModels.DnsRecordsList {
        if domainId.isEmpty {
            throw AppwriteError(message: "Missing required parameter: \"domainId\"")
        }

        let apiPath: String = "/domains/{domainId}/presets/mailgun"
            .replacingOccurrences(of: "{domainId}", with: domainId)

        let apiParams: [String: Any] = [:]

        let apiHeaders: [String: String] = [
            "X-Appwrite-Project": client.config["project"] ?? "",
            "content-type": "application/json",
            "accept": "application/json",
        ]

        let converter: (Any) throws -> AppwriteModels.DnsRecordsList = { response in
            return AppwriteModels.DnsRecordsList.from(map: response as! [String: Any])
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
    /// List Outlook DNS records.
    ///
    /// - Parameters:
    ///   - domainId: String
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.DnsRecordsList
    ///
    open func getPresetOutlook(
        domainId: String
    ) async throws -> AppwriteModels.DnsRecordsList {
        if domainId.isEmpty {
            throw AppwriteError(message: "Missing required parameter: \"domainId\"")
        }

        let apiPath: String = "/domains/{domainId}/presets/outlook"
            .replacingOccurrences(of: "{domainId}", with: domainId)

        let apiParams: [String: Any] = [:]

        let apiHeaders: [String: String] = [
            "X-Appwrite-Project": client.config["project"] ?? "",
            "accept": "application/json",
        ]

        let converter: (Any) throws -> AppwriteModels.DnsRecordsList = { response in
            return AppwriteModels.DnsRecordsList.from(map: response as! [String: Any])
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
    /// Add Outlook DNS records to the domain. This will create the required MX
    /// records
    /// for setting up Outlook email hosting for your domain.
    ///
    /// - Parameters:
    ///   - domainId: String
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.DnsRecordsList
    ///
    open func createPresetOutlook(
        domainId: String
    ) async throws -> AppwriteModels.DnsRecordsList {
        if domainId.isEmpty {
            throw AppwriteError(message: "Missing required parameter: \"domainId\"")
        }

        let apiPath: String = "/domains/{domainId}/presets/outlook"
            .replacingOccurrences(of: "{domainId}", with: domainId)

        let apiParams: [String: Any] = [:]

        let apiHeaders: [String: String] = [
            "X-Appwrite-Project": client.config["project"] ?? "",
            "content-type": "application/json",
            "accept": "application/json",
        ]

        let converter: (Any) throws -> AppwriteModels.DnsRecordsList = { response in
            return AppwriteModels.DnsRecordsList.from(map: response as! [String: Any])
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
    /// List ProtonMail DNS records.
    ///
    /// - Parameters:
    ///   - domainId: String
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.DnsRecordsList
    ///
    open func getPresetProtonMail(
        domainId: String
    ) async throws -> AppwriteModels.DnsRecordsList {
        if domainId.isEmpty {
            throw AppwriteError(message: "Missing required parameter: \"domainId\"")
        }

        let apiPath: String = "/domains/{domainId}/presets/proton-mail"
            .replacingOccurrences(of: "{domainId}", with: domainId)

        let apiParams: [String: Any] = [:]

        let apiHeaders: [String: String] = [
            "X-Appwrite-Project": client.config["project"] ?? "",
            "accept": "application/json",
        ]

        let converter: (Any) throws -> AppwriteModels.DnsRecordsList = { response in
            return AppwriteModels.DnsRecordsList.from(map: response as! [String: Any])
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
    /// Add ProtonMail DNS records to the domain. This will create the required MX
    /// records
    /// for using ProtonMail with your custom domain.
    ///
    /// - Parameters:
    ///   - domainId: String
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.DnsRecordsList
    ///
    open func createPresetProtonMail(
        domainId: String
    ) async throws -> AppwriteModels.DnsRecordsList {
        if domainId.isEmpty {
            throw AppwriteError(message: "Missing required parameter: \"domainId\"")
        }

        let apiPath: String = "/domains/{domainId}/presets/proton-mail"
            .replacingOccurrences(of: "{domainId}", with: domainId)

        let apiParams: [String: Any] = [:]

        let apiHeaders: [String: String] = [
            "X-Appwrite-Project": client.config["project"] ?? "",
            "content-type": "application/json",
            "accept": "application/json",
        ]

        let converter: (Any) throws -> AppwriteModels.DnsRecordsList = { response in
            return AppwriteModels.DnsRecordsList.from(map: response as! [String: Any])
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
    /// List Zoho DNS records.
    ///
    /// - Parameters:
    ///   - domainId: String
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.DnsRecordsList
    ///
    open func getPresetZoho(
        domainId: String
    ) async throws -> AppwriteModels.DnsRecordsList {
        if domainId.isEmpty {
            throw AppwriteError(message: "Missing required parameter: \"domainId\"")
        }

        let apiPath: String = "/domains/{domainId}/presets/zoho"
            .replacingOccurrences(of: "{domainId}", with: domainId)

        let apiParams: [String: Any] = [:]

        let apiHeaders: [String: String] = [
            "X-Appwrite-Project": client.config["project"] ?? "",
            "accept": "application/json",
        ]

        let converter: (Any) throws -> AppwriteModels.DnsRecordsList = { response in
            return AppwriteModels.DnsRecordsList.from(map: response as! [String: Any])
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
    /// Add Zoho Mail DNS records to the domain. This will create the required MX
    /// records
    /// for setting up Zoho Mail on your domain.
    ///
    /// - Parameters:
    ///   - domainId: String
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.DnsRecordsList
    ///
    open func createPresetZoho(
        domainId: String
    ) async throws -> AppwriteModels.DnsRecordsList {
        if domainId.isEmpty {
            throw AppwriteError(message: "Missing required parameter: \"domainId\"")
        }

        let apiPath: String = "/domains/{domainId}/presets/zoho"
            .replacingOccurrences(of: "{domainId}", with: domainId)

        let apiParams: [String: Any] = [:]

        let apiHeaders: [String: String] = [
            "X-Appwrite-Project": client.config["project"] ?? "",
            "content-type": "application/json",
            "accept": "application/json",
        ]

        let converter: (Any) throws -> AppwriteModels.DnsRecordsList = { response in
            return AppwriteModels.DnsRecordsList.from(map: response as! [String: Any])
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
    /// List DNS records for a given domain. You can use this endpoint to list all
    /// the DNS records
    /// associated with your domain.
    ///
    /// - Parameters:
    ///   - domainId: String
    ///   - queries: [String] (optional)
    ///   - total: Bool (optional)
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.DnsRecordsList
    ///
    open func listRecords(
        domainId: String,
        queries: [String]? = nil,
        total: Bool? = nil
    ) async throws -> AppwriteModels.DnsRecordsList {
        if domainId.isEmpty {
            throw AppwriteError(message: "Missing required parameter: \"domainId\"")
        }

        let apiPath: String = "/domains/{domainId}/records"
            .replacingOccurrences(of: "{domainId}", with: domainId)

        let apiParams: [String: Any?] = [
            "queries": queries,
            "total": total,
        ]

        let apiHeaders: [String: String] = [
            "X-Appwrite-Project": client.config["project"] ?? "",
            "accept": "application/json",
        ]

        let converter: (Any) throws -> AppwriteModels.DnsRecordsList = { response in
            return AppwriteModels.DnsRecordsList.from(map: response as! [String: Any])
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
    /// Create a new A record for the given domain. A records are used to point a
    /// domain name
    /// to an IPv4 address. The record value should be a valid IPv4 address.
    ///
    /// - Parameters:
    ///   - domainId: String
    ///   - name: String
    ///   - value: String
    ///   - ttl: Int
    ///   - comment: String (optional)
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.DnsRecord
    ///
    open func createRecordA(
        domainId: String,
        name: String,
        value: String,
        ttl: Int,
        comment: String? = nil
    ) async throws -> AppwriteModels.DnsRecord {
        if domainId.isEmpty {
            throw AppwriteError(message: "Missing required parameter: \"domainId\"")
        }

        let apiPath: String = "/domains/{domainId}/records/a"
            .replacingOccurrences(of: "{domainId}", with: domainId)

        let apiParams: [String: Any?] = [
            "name": name,
            "value": value,
            "ttl": ttl,
            "comment": comment,
        ]

        let apiHeaders: [String: String] = [
            "X-Appwrite-Project": client.config["project"] ?? "",
            "content-type": "application/json",
            "accept": "application/json",
        ]

        let converter: (Any) throws -> AppwriteModels.DnsRecord = { response in
            return AppwriteModels.DnsRecord.from(map: response as! [String: Any])
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
    /// Update an existing A record for the given domain. This endpoint allows you
    /// to modify
    /// the properties of an A record including its name (subdomain), IPv4 address,
    /// TTL,
    /// and optional comment.
    ///
    /// - Parameters:
    ///   - domainId: String
    ///   - recordId: String
    ///   - name: String
    ///   - value: String
    ///   - ttl: Int
    ///   - comment: String (optional)
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.DnsRecord
    ///
    open func updateRecordA(
        domainId: String,
        recordId: String,
        name: String,
        value: String,
        ttl: Int,
        comment: String? = nil
    ) async throws -> AppwriteModels.DnsRecord {
        if domainId.isEmpty {
            throw AppwriteError(message: "Missing required parameter: \"domainId\"")
        }
        if recordId.isEmpty {
            throw AppwriteError(message: "Missing required parameter: \"recordId\"")
        }

        let apiPath: String = "/domains/{domainId}/records/a/{recordId}"
            .replacingOccurrences(of: "{domainId}", with: domainId)
            .replacingOccurrences(of: "{recordId}", with: recordId)

        let apiParams: [String: Any?] = [
            "name": name,
            "value": value,
            "ttl": ttl,
            "comment": comment,
        ]

        let apiHeaders: [String: String] = [
            "X-Appwrite-Project": client.config["project"] ?? "",
            "content-type": "application/json",
            "accept": "application/json",
        ]

        let converter: (Any) throws -> AppwriteModels.DnsRecord = { response in
            return AppwriteModels.DnsRecord.from(map: response as! [String: Any])
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
    /// Create a new AAAA record for the given domain. This endpoint allows you to
    /// add a new IPv6 DNS record
    /// to your domain. The record will be used to point a hostname to an IPv6
    /// address.
    ///
    /// - Parameters:
    ///   - domainId: String
    ///   - name: String
    ///   - value: String
    ///   - ttl: Int
    ///   - comment: String (optional)
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.DnsRecord
    ///
    open func createRecordAAAA(
        domainId: String,
        name: String,
        value: String,
        ttl: Int,
        comment: String? = nil
    ) async throws -> AppwriteModels.DnsRecord {
        if domainId.isEmpty {
            throw AppwriteError(message: "Missing required parameter: \"domainId\"")
        }

        let apiPath: String = "/domains/{domainId}/records/aaaa"
            .replacingOccurrences(of: "{domainId}", with: domainId)

        let apiParams: [String: Any?] = [
            "name": name,
            "value": value,
            "ttl": ttl,
            "comment": comment,
        ]

        let apiHeaders: [String: String] = [
            "X-Appwrite-Project": client.config["project"] ?? "",
            "content-type": "application/json",
            "accept": "application/json",
        ]

        let converter: (Any) throws -> AppwriteModels.DnsRecord = { response in
            return AppwriteModels.DnsRecord.from(map: response as! [String: Any])
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
    /// Update an existing AAAA record for the given domain. This endpoint allows
    /// you to modify
    /// the properties of an existing AAAA record, including its name (subdomain),
    /// IPv6 address,
    /// TTL, and optional comment.
    ///
    /// - Parameters:
    ///   - domainId: String
    ///   - recordId: String
    ///   - name: String
    ///   - value: String
    ///   - ttl: Int
    ///   - comment: String (optional)
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.DnsRecord
    ///
    open func updateRecordAAAA(
        domainId: String,
        recordId: String,
        name: String,
        value: String,
        ttl: Int,
        comment: String? = nil
    ) async throws -> AppwriteModels.DnsRecord {
        if domainId.isEmpty {
            throw AppwriteError(message: "Missing required parameter: \"domainId\"")
        }
        if recordId.isEmpty {
            throw AppwriteError(message: "Missing required parameter: \"recordId\"")
        }

        let apiPath: String = "/domains/{domainId}/records/aaaa/{recordId}"
            .replacingOccurrences(of: "{domainId}", with: domainId)
            .replacingOccurrences(of: "{recordId}", with: recordId)

        let apiParams: [String: Any?] = [
            "name": name,
            "value": value,
            "ttl": ttl,
            "comment": comment,
        ]

        let apiHeaders: [String: String] = [
            "X-Appwrite-Project": client.config["project"] ?? "",
            "content-type": "application/json",
            "accept": "application/json",
        ]

        let converter: (Any) throws -> AppwriteModels.DnsRecord = { response in
            return AppwriteModels.DnsRecord.from(map: response as! [String: Any])
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
    /// Create a new ALIAS record for the given domain. This record type can be
    /// used to point your domain
    /// to another domain name that will serve as an alias. This is particularly
    /// useful when you want to
    /// map your domain to a target domain that may change its IP address.
    ///
    /// - Parameters:
    ///   - domainId: String
    ///   - name: String
    ///   - value: String
    ///   - ttl: Int
    ///   - comment: String (optional)
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.DnsRecord
    ///
    open func createRecordAlias(
        domainId: String,
        name: String,
        value: String,
        ttl: Int,
        comment: String? = nil
    ) async throws -> AppwriteModels.DnsRecord {
        if domainId.isEmpty {
            throw AppwriteError(message: "Missing required parameter: \"domainId\"")
        }

        let apiPath: String = "/domains/{domainId}/records/alias"
            .replacingOccurrences(of: "{domainId}", with: domainId)

        let apiParams: [String: Any?] = [
            "name": name,
            "value": value,
            "ttl": ttl,
            "comment": comment,
        ]

        let apiHeaders: [String: String] = [
            "X-Appwrite-Project": client.config["project"] ?? "",
            "content-type": "application/json",
            "accept": "application/json",
        ]

        let converter: (Any) throws -> AppwriteModels.DnsRecord = { response in
            return AppwriteModels.DnsRecord.from(map: response as! [String: Any])
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
    /// Update an existing ALIAS record for the specified domain. This endpoint
    /// allows you to modify
    /// the properties of an existing ALIAS record including its name, target
    /// domain, TTL, and comment.
    ///
    /// The ALIAS record type is similar to a CNAME record but can be used at the
    /// zone apex (root domain).
    /// It provides a way to map one domain name to another.
    ///
    /// - Parameters:
    ///   - domainId: String
    ///   - recordId: String
    ///   - name: String
    ///   - value: String
    ///   - ttl: Int
    ///   - comment: String (optional)
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.DnsRecord
    ///
    open func updateRecordAlias(
        domainId: String,
        recordId: String,
        name: String,
        value: String,
        ttl: Int,
        comment: String? = nil
    ) async throws -> AppwriteModels.DnsRecord {
        if domainId.isEmpty {
            throw AppwriteError(message: "Missing required parameter: \"domainId\"")
        }
        if recordId.isEmpty {
            throw AppwriteError(message: "Missing required parameter: \"recordId\"")
        }

        let apiPath: String = "/domains/{domainId}/records/alias/{recordId}"
            .replacingOccurrences(of: "{domainId}", with: domainId)
            .replacingOccurrences(of: "{recordId}", with: recordId)

        let apiParams: [String: Any?] = [
            "name": name,
            "value": value,
            "ttl": ttl,
            "comment": comment,
        ]

        let apiHeaders: [String: String] = [
            "X-Appwrite-Project": client.config["project"] ?? "",
            "content-type": "application/json",
            "accept": "application/json",
        ]

        let converter: (Any) throws -> AppwriteModels.DnsRecord = { response in
            return AppwriteModels.DnsRecord.from(map: response as! [String: Any])
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
    /// Create a new CAA record for the given domain. CAA records are used to
    /// specify which
    /// Certificate Authorities (CAs) are allowed to issue SSL/TLS certificates for
    /// your domain.
    ///
    /// - Parameters:
    ///   - domainId: String
    ///   - name: String
    ///   - value: String
    ///   - ttl: Int
    ///   - comment: String (optional)
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.DnsRecord
    ///
    open func createRecordCAA(
        domainId: String,
        name: String,
        value: String,
        ttl: Int,
        comment: String? = nil
    ) async throws -> AppwriteModels.DnsRecord {
        if domainId.isEmpty {
            throw AppwriteError(message: "Missing required parameter: \"domainId\"")
        }

        let apiPath: String = "/domains/{domainId}/records/caa"
            .replacingOccurrences(of: "{domainId}", with: domainId)

        let apiParams: [String: Any?] = [
            "name": name,
            "value": value,
            "ttl": ttl,
            "comment": comment,
        ]

        let apiHeaders: [String: String] = [
            "X-Appwrite-Project": client.config["project"] ?? "",
            "content-type": "application/json",
            "accept": "application/json",
        ]

        let converter: (Any) throws -> AppwriteModels.DnsRecord = { response in
            return AppwriteModels.DnsRecord.from(map: response as! [String: Any])
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
    /// Update an existing CAA record for the given domain. A CAA (Certification
    /// Authority Authorization)
    /// record is used to specify which certificate authorities (CAs) are
    /// authorized to issue certificates
    /// for a domain.
    ///
    /// - Parameters:
    ///   - domainId: String
    ///   - recordId: String
    ///   - name: String
    ///   - value: String
    ///   - ttl: Int
    ///   - comment: String (optional)
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.DnsRecord
    ///
    open func updateRecordCAA(
        domainId: String,
        recordId: String,
        name: String,
        value: String,
        ttl: Int,
        comment: String? = nil
    ) async throws -> AppwriteModels.DnsRecord {
        if domainId.isEmpty {
            throw AppwriteError(message: "Missing required parameter: \"domainId\"")
        }
        if recordId.isEmpty {
            throw AppwriteError(message: "Missing required parameter: \"recordId\"")
        }

        let apiPath: String = "/domains/{domainId}/records/caa/{recordId}"
            .replacingOccurrences(of: "{domainId}", with: domainId)
            .replacingOccurrences(of: "{recordId}", with: recordId)

        let apiParams: [String: Any?] = [
            "name": name,
            "value": value,
            "ttl": ttl,
            "comment": comment,
        ]

        let apiHeaders: [String: String] = [
            "X-Appwrite-Project": client.config["project"] ?? "",
            "content-type": "application/json",
            "accept": "application/json",
        ]

        let converter: (Any) throws -> AppwriteModels.DnsRecord = { response in
            return AppwriteModels.DnsRecord.from(map: response as! [String: Any])
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
    /// Create a new CNAME record for the given domain.
    ///
    /// A CNAME record maps a subdomain to another domain name, allowing you to
    /// create aliases
    /// for your domain. For example, you can create a CNAME record to point
    /// 'blog.example.com'
    /// to 'example.wordpress.com'.
    ///
    /// - Parameters:
    ///   - domainId: String
    ///   - name: String
    ///   - value: String
    ///   - ttl: Int
    ///   - comment: String (optional)
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.DnsRecord
    ///
    open func createRecordCNAME(
        domainId: String,
        name: String,
        value: String,
        ttl: Int,
        comment: String? = nil
    ) async throws -> AppwriteModels.DnsRecord {
        if domainId.isEmpty {
            throw AppwriteError(message: "Missing required parameter: \"domainId\"")
        }

        let apiPath: String = "/domains/{domainId}/records/cname"
            .replacingOccurrences(of: "{domainId}", with: domainId)

        let apiParams: [String: Any?] = [
            "name": name,
            "value": value,
            "ttl": ttl,
            "comment": comment,
        ]

        let apiHeaders: [String: String] = [
            "X-Appwrite-Project": client.config["project"] ?? "",
            "content-type": "application/json",
            "accept": "application/json",
        ]

        let converter: (Any) throws -> AppwriteModels.DnsRecord = { response in
            return AppwriteModels.DnsRecord.from(map: response as! [String: Any])
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
    /// Update an existing CNAME record for the given domain.
    ///
    /// - Parameters:
    ///   - domainId: String
    ///   - recordId: String
    ///   - name: String
    ///   - value: String
    ///   - ttl: Int
    ///   - comment: String (optional)
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.DnsRecord
    ///
    open func updateRecordCNAME(
        domainId: String,
        recordId: String,
        name: String,
        value: String,
        ttl: Int,
        comment: String? = nil
    ) async throws -> AppwriteModels.DnsRecord {
        if domainId.isEmpty {
            throw AppwriteError(message: "Missing required parameter: \"domainId\"")
        }
        if recordId.isEmpty {
            throw AppwriteError(message: "Missing required parameter: \"recordId\"")
        }

        let apiPath: String = "/domains/{domainId}/records/cname/{recordId}"
            .replacingOccurrences(of: "{domainId}", with: domainId)
            .replacingOccurrences(of: "{recordId}", with: recordId)

        let apiParams: [String: Any?] = [
            "name": name,
            "value": value,
            "ttl": ttl,
            "comment": comment,
        ]

        let apiHeaders: [String: String] = [
            "X-Appwrite-Project": client.config["project"] ?? "",
            "content-type": "application/json",
            "accept": "application/json",
        ]

        let converter: (Any) throws -> AppwriteModels.DnsRecord = { response in
            return AppwriteModels.DnsRecord.from(map: response as! [String: Any])
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
    /// Create a new HTTPS record for the given domain. This record is used to
    /// configure HTTPS
    /// settings for your domain, enabling secure communication over SSL/TLS.
    ///
    /// - Parameters:
    ///   - domainId: String
    ///   - name: String
    ///   - value: String
    ///   - ttl: Int
    ///   - comment: String (optional)
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.DnsRecord
    ///
    open func createRecordHTTPS(
        domainId: String,
        name: String,
        value: String,
        ttl: Int,
        comment: String? = nil
    ) async throws -> AppwriteModels.DnsRecord {
        if domainId.isEmpty {
            throw AppwriteError(message: "Missing required parameter: \"domainId\"")
        }

        let apiPath: String = "/domains/{domainId}/records/https"
            .replacingOccurrences(of: "{domainId}", with: domainId)

        let apiParams: [String: Any?] = [
            "name": name,
            "value": value,
            "ttl": ttl,
            "comment": comment,
        ]

        let apiHeaders: [String: String] = [
            "X-Appwrite-Project": client.config["project"] ?? "",
            "content-type": "application/json",
            "accept": "application/json",
        ]

        let converter: (Any) throws -> AppwriteModels.DnsRecord = { response in
            return AppwriteModels.DnsRecord.from(map: response as! [String: Any])
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
    /// Update an existing HTTPS record for the given domain. This endpoint allows
    /// you to modify
    /// the properties of an HTTPS record associated with your domain, including
    /// the name (subdomain),
    /// target value, TTL, and optional comment.
    ///
    /// - Parameters:
    ///   - domainId: String
    ///   - recordId: String
    ///   - name: String
    ///   - value: String
    ///   - ttl: Int
    ///   - comment: String (optional)
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.DnsRecord
    ///
    open func updateRecordHTTPS(
        domainId: String,
        recordId: String,
        name: String,
        value: String,
        ttl: Int,
        comment: String? = nil
    ) async throws -> AppwriteModels.DnsRecord {
        if domainId.isEmpty {
            throw AppwriteError(message: "Missing required parameter: \"domainId\"")
        }
        if recordId.isEmpty {
            throw AppwriteError(message: "Missing required parameter: \"recordId\"")
        }

        let apiPath: String = "/domains/{domainId}/records/https/{recordId}"
            .replacingOccurrences(of: "{domainId}", with: domainId)
            .replacingOccurrences(of: "{recordId}", with: recordId)

        let apiParams: [String: Any?] = [
            "name": name,
            "value": value,
            "ttl": ttl,
            "comment": comment,
        ]

        let apiHeaders: [String: String] = [
            "X-Appwrite-Project": client.config["project"] ?? "",
            "content-type": "application/json",
            "accept": "application/json",
        ]

        let converter: (Any) throws -> AppwriteModels.DnsRecord = { response in
            return AppwriteModels.DnsRecord.from(map: response as! [String: Any])
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
    /// Create a new MX record for the given domain. MX records are used to define
    /// the mail servers responsible
    /// for accepting email messages for the domain. Multiple MX records can be
    /// created with different priorities.
    /// The priority parameter determines the order in which mail servers are used,
    /// with lower values indicating
    /// higher priority.
    ///
    /// - Parameters:
    ///   - domainId: String
    ///   - name: String
    ///   - value: String
    ///   - ttl: Int
    ///   - priority: Int
    ///   - comment: String (optional)
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.DnsRecord
    ///
    open func createRecordMX(
        domainId: String,
        name: String,
        value: String,
        ttl: Int,
        priority: Int,
        comment: String? = nil
    ) async throws -> AppwriteModels.DnsRecord {
        if domainId.isEmpty {
            throw AppwriteError(message: "Missing required parameter: \"domainId\"")
        }

        let apiPath: String = "/domains/{domainId}/records/mx"
            .replacingOccurrences(of: "{domainId}", with: domainId)

        let apiParams: [String: Any?] = [
            "name": name,
            "value": value,
            "ttl": ttl,
            "priority": priority,
            "comment": comment,
        ]

        let apiHeaders: [String: String] = [
            "X-Appwrite-Project": client.config["project"] ?? "",
            "content-type": "application/json",
            "accept": "application/json",
        ]

        let converter: (Any) throws -> AppwriteModels.DnsRecord = { response in
            return AppwriteModels.DnsRecord.from(map: response as! [String: Any])
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
    /// Update an existing MX record for the given domain.
    ///
    /// - Parameters:
    ///   - domainId: String
    ///   - recordId: String
    ///   - name: String
    ///   - value: String
    ///   - ttl: Int
    ///   - priority: Int
    ///   - comment: String (optional)
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.DnsRecord
    ///
    open func updateRecordMX(
        domainId: String,
        recordId: String,
        name: String,
        value: String,
        ttl: Int,
        priority: Int,
        comment: String? = nil
    ) async throws -> AppwriteModels.DnsRecord {
        if domainId.isEmpty {
            throw AppwriteError(message: "Missing required parameter: \"domainId\"")
        }
        if recordId.isEmpty {
            throw AppwriteError(message: "Missing required parameter: \"recordId\"")
        }

        let apiPath: String = "/domains/{domainId}/records/mx/{recordId}"
            .replacingOccurrences(of: "{domainId}", with: domainId)
            .replacingOccurrences(of: "{recordId}", with: recordId)

        let apiParams: [String: Any?] = [
            "name": name,
            "value": value,
            "ttl": ttl,
            "priority": priority,
            "comment": comment,
        ]

        let apiHeaders: [String: String] = [
            "X-Appwrite-Project": client.config["project"] ?? "",
            "content-type": "application/json",
            "accept": "application/json",
        ]

        let converter: (Any) throws -> AppwriteModels.DnsRecord = { response in
            return AppwriteModels.DnsRecord.from(map: response as! [String: Any])
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
    /// Create a new NS record for the given domain. NS records specify the
    /// nameservers that are used
    /// to resolve the domain name to IP addresses. Each domain can have multiple
    /// NS records.
    ///
    /// - Parameters:
    ///   - domainId: String
    ///   - name: String
    ///   - value: String
    ///   - ttl: Int
    ///   - comment: String (optional)
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.DnsRecord
    ///
    open func createRecordNS(
        domainId: String,
        name: String,
        value: String,
        ttl: Int,
        comment: String? = nil
    ) async throws -> AppwriteModels.DnsRecord {
        if domainId.isEmpty {
            throw AppwriteError(message: "Missing required parameter: \"domainId\"")
        }

        let apiPath: String = "/domains/{domainId}/records/ns"
            .replacingOccurrences(of: "{domainId}", with: domainId)

        let apiParams: [String: Any?] = [
            "name": name,
            "value": value,
            "ttl": ttl,
            "comment": comment,
        ]

        let apiHeaders: [String: String] = [
            "X-Appwrite-Project": client.config["project"] ?? "",
            "content-type": "application/json",
            "accept": "application/json",
        ]

        let converter: (Any) throws -> AppwriteModels.DnsRecord = { response in
            return AppwriteModels.DnsRecord.from(map: response as! [String: Any])
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
    /// Update an existing NS record for the given domain. This endpoint allows you
    /// to modify
    /// the properties of an NS (nameserver) record associated with your domain.
    /// You can update
    /// the record name (subdomain), target nameserver value, TTL, and add or
    /// modify comments
    /// for better record management.
    ///
    /// - Parameters:
    ///   - domainId: String
    ///   - recordId: String
    ///   - name: String
    ///   - value: String
    ///   - ttl: Int
    ///   - comment: String (optional)
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.DnsRecord
    ///
    open func updateRecordNS(
        domainId: String,
        recordId: String,
        name: String,
        value: String,
        ttl: Int,
        comment: String? = nil
    ) async throws -> AppwriteModels.DnsRecord {
        if domainId.isEmpty {
            throw AppwriteError(message: "Missing required parameter: \"domainId\"")
        }
        if recordId.isEmpty {
            throw AppwriteError(message: "Missing required parameter: \"recordId\"")
        }

        let apiPath: String = "/domains/{domainId}/records/ns/{recordId}"
            .replacingOccurrences(of: "{domainId}", with: domainId)
            .replacingOccurrences(of: "{recordId}", with: recordId)

        let apiParams: [String: Any?] = [
            "name": name,
            "value": value,
            "ttl": ttl,
            "comment": comment,
        ]

        let apiHeaders: [String: String] = [
            "X-Appwrite-Project": client.config["project"] ?? "",
            "content-type": "application/json",
            "accept": "application/json",
        ]

        let converter: (Any) throws -> AppwriteModels.DnsRecord = { response in
            return AppwriteModels.DnsRecord.from(map: response as! [String: Any])
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
    /// Create a new SRV record for the given domain. SRV records are used to
    /// define the location
    /// of servers for specific services. For example, they can be used to specify
    /// which server
    /// handles a specific service like SIP or XMPP for the domain.
    ///
    /// - Parameters:
    ///   - domainId: String
    ///   - name: String
    ///   - value: String
    ///   - ttl: Int
    ///   - priority: Int
    ///   - weight: Int
    ///   - port: Int
    ///   - comment: String (optional)
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.DnsRecord
    ///
    open func createRecordSRV(
        domainId: String,
        name: String,
        value: String,
        ttl: Int,
        priority: Int,
        weight: Int,
        port: Int,
        comment: String? = nil
    ) async throws -> AppwriteModels.DnsRecord {
        if domainId.isEmpty {
            throw AppwriteError(message: "Missing required parameter: \"domainId\"")
        }

        let apiPath: String = "/domains/{domainId}/records/srv"
            .replacingOccurrences(of: "{domainId}", with: domainId)

        let apiParams: [String: Any?] = [
            "name": name,
            "value": value,
            "ttl": ttl,
            "priority": priority,
            "weight": weight,
            "port": port,
            "comment": comment,
        ]

        let apiHeaders: [String: String] = [
            "X-Appwrite-Project": client.config["project"] ?? "",
            "content-type": "application/json",
            "accept": "application/json",
        ]

        let converter: (Any) throws -> AppwriteModels.DnsRecord = { response in
            return AppwriteModels.DnsRecord.from(map: response as! [String: Any])
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
    /// Update an existing SRV record for the given domain.
    ///
    /// Required parameters:
    /// - domainId: Domain unique ID
    /// - recordId: DNS record unique ID
    /// - name: Record name (service name)
    /// - value: Target hostname for this SRV record
    /// - ttl: Time to live, in seconds
    /// - priority: Record priority
    /// - weight: Record weight
    /// - port: Port number for the service
    ///
    /// Optional parameters:
    /// - comment: A comment for this record
    ///
    /// - Parameters:
    ///   - domainId: String
    ///   - recordId: String
    ///   - name: String
    ///   - value: String
    ///   - ttl: Int
    ///   - priority: Int
    ///   - weight: Int
    ///   - port: Int
    ///   - comment: String (optional)
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.DnsRecord
    ///
    open func updateRecordSRV(
        domainId: String,
        recordId: String,
        name: String,
        value: String,
        ttl: Int,
        priority: Int,
        weight: Int,
        port: Int,
        comment: String? = nil
    ) async throws -> AppwriteModels.DnsRecord {
        if domainId.isEmpty {
            throw AppwriteError(message: "Missing required parameter: \"domainId\"")
        }
        if recordId.isEmpty {
            throw AppwriteError(message: "Missing required parameter: \"recordId\"")
        }

        let apiPath: String = "/domains/{domainId}/records/srv/{recordId}"
            .replacingOccurrences(of: "{domainId}", with: domainId)
            .replacingOccurrences(of: "{recordId}", with: recordId)

        let apiParams: [String: Any?] = [
            "name": name,
            "value": value,
            "ttl": ttl,
            "priority": priority,
            "weight": weight,
            "port": port,
            "comment": comment,
        ]

        let apiHeaders: [String: String] = [
            "X-Appwrite-Project": client.config["project"] ?? "",
            "content-type": "application/json",
            "accept": "application/json",
        ]

        let converter: (Any) throws -> AppwriteModels.DnsRecord = { response in
            return AppwriteModels.DnsRecord.from(map: response as! [String: Any])
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
    /// Create a new TXT record for the given domain. TXT records can be used
    /// to provide additional information about your domain, such as domain
    /// verification records, SPF records, or DKIM records.
    ///
    /// - Parameters:
    ///   - domainId: String
    ///   - name: String
    ///   - ttl: Int
    ///   - value: String (optional)
    ///   - comment: String (optional)
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.DnsRecord
    ///
    open func createRecordTXT(
        domainId: String,
        name: String,
        ttl: Int,
        value: String? = nil,
        comment: String? = nil
    ) async throws -> AppwriteModels.DnsRecord {
        if domainId.isEmpty {
            throw AppwriteError(message: "Missing required parameter: \"domainId\"")
        }

        let apiPath: String = "/domains/{domainId}/records/txt"
            .replacingOccurrences(of: "{domainId}", with: domainId)

        let apiParams: [String: Any?] = [
            "name": name,
            "value": value,
            "ttl": ttl,
            "comment": comment,
        ]

        let apiHeaders: [String: String] = [
            "X-Appwrite-Project": client.config["project"] ?? "",
            "content-type": "application/json",
            "accept": "application/json",
        ]

        let converter: (Any) throws -> AppwriteModels.DnsRecord = { response in
            return AppwriteModels.DnsRecord.from(map: response as! [String: Any])
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
    /// Update an existing TXT record for the given domain.
    ///
    /// Update the TXT record details for a specific domain by providing the domain
    /// ID,
    /// record ID, and the new record configuration including name, value, TTL, and
    /// an optional comment.
    ///
    /// - Parameters:
    ///   - domainId: String
    ///   - recordId: String
    ///   - name: String
    ///   - value: String
    ///   - ttl: Int
    ///   - comment: String (optional)
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.DnsRecord
    ///
    open func updateRecordTXT(
        domainId: String,
        recordId: String,
        name: String,
        value: String,
        ttl: Int,
        comment: String? = nil
    ) async throws -> AppwriteModels.DnsRecord {
        if domainId.isEmpty {
            throw AppwriteError(message: "Missing required parameter: \"domainId\"")
        }
        if recordId.isEmpty {
            throw AppwriteError(message: "Missing required parameter: \"recordId\"")
        }

        let apiPath: String = "/domains/{domainId}/records/txt/{recordId}"
            .replacingOccurrences(of: "{domainId}", with: domainId)
            .replacingOccurrences(of: "{recordId}", with: recordId)

        let apiParams: [String: Any?] = [
            "name": name,
            "value": value,
            "ttl": ttl,
            "comment": comment,
        ]

        let apiHeaders: [String: String] = [
            "X-Appwrite-Project": client.config["project"] ?? "",
            "content-type": "application/json",
            "accept": "application/json",
        ]

        let converter: (Any) throws -> AppwriteModels.DnsRecord = { response in
            return AppwriteModels.DnsRecord.from(map: response as! [String: Any])
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
    /// Get a single DNS record for a given domain by record ID.
    ///
    /// This endpoint allows you to retrieve a specific DNS record associated with
    /// a domain
    /// using its unique identifier. The record contains information about the DNS
    /// configuration
    /// such as type, value, and TTL settings.
    ///
    /// - Parameters:
    ///   - domainId: String
    ///   - recordId: String
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.DnsRecord
    ///
    open func getRecord(
        domainId: String,
        recordId: String
    ) async throws -> AppwriteModels.DnsRecord {
        if domainId.isEmpty {
            throw AppwriteError(message: "Missing required parameter: \"domainId\"")
        }
        if recordId.isEmpty {
            throw AppwriteError(message: "Missing required parameter: \"recordId\"")
        }

        let apiPath: String = "/domains/{domainId}/records/{recordId}"
            .replacingOccurrences(of: "{domainId}", with: domainId)
            .replacingOccurrences(of: "{recordId}", with: recordId)

        let apiParams: [String: Any] = [:]

        let apiHeaders: [String: String] = [
            "X-Appwrite-Project": client.config["project"] ?? "",
            "accept": "application/json",
        ]

        let converter: (Any) throws -> AppwriteModels.DnsRecord = { response in
            return AppwriteModels.DnsRecord.from(map: response as! [String: Any])
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
    /// Delete a DNS record for the given domain. This endpoint allows you to
    /// delete an existing DNS record
    /// from a specific domain.
    ///
    /// - Parameters:
    ///   - domainId: String
    ///   - recordId: String
    /// - Throws: Exception if the request fails
    /// - Returns: Any
    ///
    open func deleteRecord(
        domainId: String,
        recordId: String
    ) async throws -> Any {
        if domainId.isEmpty {
            throw AppwriteError(message: "Missing required parameter: \"domainId\"")
        }
        if recordId.isEmpty {
            throw AppwriteError(message: "Missing required parameter: \"recordId\"")
        }

        let apiPath: String = "/domains/{domainId}/records/{recordId}"
            .replacingOccurrences(of: "{domainId}", with: domainId)
            .replacingOccurrences(of: "{recordId}", with: recordId)

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
    ///
    /// Update the team ID for a specific domain. The caller must administer the
    /// current
    /// team and be an owner of the destination team.
    ///
    /// Updating the team ID will transfer ownership and access control of the
    /// domain
    /// and all its DNS records to the new team.
    ///
    /// - Parameters:
    ///   - domainId: String
    ///   - teamId: String
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.Domain
    ///
    open func updateTeam(
        domainId: String,
        teamId: String
    ) async throws -> AppwriteModels.Domain {
        if domainId.isEmpty {
            throw AppwriteError(message: "Missing required parameter: \"domainId\"")
        }

        let apiPath: String = "/domains/{domainId}/team"
            .replacingOccurrences(of: "{domainId}", with: domainId)

        let apiParams: [String: Any?] = [
            "teamId": teamId
        ]

        let apiHeaders: [String: String] = [
            "X-Appwrite-Project": client.config["project"] ?? "",
            "content-type": "application/json",
            "accept": "application/json",
        ]

        let converter: (Any) throws -> AppwriteModels.Domain = { response in
            return AppwriteModels.Domain.from(map: response as! [String: Any])
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
    /// Retrieve the current transfer status for a domain. Returns the status, an
    /// optional reason, and a timestamp of the last status change.
    ///
    /// - Parameters:
    ///   - domainId: String
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.DomainTransferStatus
    ///
    open func getTransferStatus(
        domainId: String
    ) async throws -> AppwriteModels.DomainTransferStatus {
        if domainId.isEmpty {
            throw AppwriteError(message: "Missing required parameter: \"domainId\"")
        }

        let apiPath: String = "/domains/{domainId}/transfers/status"
            .replacingOccurrences(of: "{domainId}", with: domainId)

        let apiParams: [String: Any] = [:]

        let apiHeaders: [String: String] = [
            "X-Appwrite-Project": client.config["project"] ?? "",
            "accept": "application/json",
        ]

        let converter: (Any) throws -> AppwriteModels.DomainTransferStatus = { response in
            return AppwriteModels.DomainTransferStatus.from(map: response as! [String: Any])
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
    /// Retrieve the DNS zone file for the given domain. This endpoint will return
    /// the DNS
    /// zone file in a standardized format that can be used to configure DNS
    /// servers.
    ///
    /// - Parameters:
    ///   - domainId: String
    /// - Throws: Exception if the request fails
    /// - Returns: String
    ///
    open func getZone(
        domainId: String
    ) async throws -> String {
        if domainId.isEmpty {
            throw AppwriteError(message: "Missing required parameter: \"domainId\"")
        }

        let apiPath: String = "/domains/{domainId}/zone"
            .replacingOccurrences(of: "{domainId}", with: domainId)

        let apiParams: [String: Any] = [:]

        let apiHeaders: [String: String] = [
            "X-Appwrite-Project": client.config["project"] ?? "",
            "accept": "text/plain",
        ]

        return try await client.call(
            method: "GET",
            path: apiPath,
            headers: apiHeaders,
            params: apiParams
        )
    }
    ///
    /// Update the DNS zone for the given domain using the provided zone file
    /// content.
    /// All parsed records are imported and then the main domain document is
    /// returned.
    ///
    /// - Parameters:
    ///   - domainId: String
    ///   - content: String
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.Domain
    ///
    open func updateZone(
        domainId: String,
        content: String
    ) async throws -> AppwriteModels.Domain {
        if domainId.isEmpty {
            throw AppwriteError(message: "Missing required parameter: \"domainId\"")
        }

        let apiPath: String = "/domains/{domainId}/zone"
            .replacingOccurrences(of: "{domainId}", with: domainId)

        let apiParams: [String: Any?] = [
            "content": content
        ]

        let apiHeaders: [String: String] = [
            "X-Appwrite-Project": client.config["project"] ?? "",
            "content-type": "application/json",
            "accept": "application/json",
        ]

        let converter: (Any) throws -> AppwriteModels.Domain = { response in
            return AppwriteModels.Domain.from(map: response as! [String: Any])
        }

        return try await client.call(
            method: "PUT",
            path: apiPath,
            headers: apiHeaders,
            params: apiParams,
            converter: converter
        )
    }
}
