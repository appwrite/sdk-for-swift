import AsyncHTTPClient
import Foundation
import NIO
import JSONCodable
import AppwriteEnums
import AppwriteModels

/// 
open class Organizations: Service {

    ///
    /// Delete an organization.
    ///
    /// - Parameters:
    ///   - organizationId: String
    /// - Throws: Exception if the request fails
    /// - Returns: Any
    ///
    open func delete(
        organizationId: String
    ) async throws -> Any {
        let apiPath: String = "/organizations/{organizationId}"
            .replacingOccurrences(of: "{organizationId}", with: organizationId)

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
    /// Get estimation for deleting an organization.
    ///
    /// - Parameters:
    ///   - organizationId: String
    /// - Throws: Exception if the request fails
    /// - Returns: AppwriteModels.EstimationDeleteOrganization
    ///
    open func estimationDeleteOrganization(
        organizationId: String
    ) async throws -> AppwriteModels.EstimationDeleteOrganization {
        let apiPath: String = "/organizations/{organizationId}/estimations/delete-organization"
            .replacingOccurrences(of: "{organizationId}", with: organizationId)

        let apiParams: [String: Any] = [:]

        let apiHeaders: [String: String] = [
            "content-type": "application/json"
        ]

        let converter: (Any) -> AppwriteModels.EstimationDeleteOrganization = { response in
            return AppwriteModels.EstimationDeleteOrganization.from(map: response as! [String: Any])
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