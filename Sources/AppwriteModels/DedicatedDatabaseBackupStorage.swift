import Foundation
import JSONCodable

/// BackupStorageConfig
open class DedicatedDatabaseBackupStorage: Codable {

    enum CodingKeys: String, CodingKey {
        case provider = "provider"
        case bucket = "bucket"
        case region = "region"
        case `prefix` = "prefix"
        case endpoint = "endpoint"
    }

    /// Storage provider. Possible values: s3 (Amazon S3 or S3-compatible), gcs (Google Cloud Storage), azure (Azure Blob Storage).
    public let provider: String
    /// Storage bucket or container name.
    public let bucket: String
    /// Storage region.
    public let region: String
    /// Object key prefix for backups.
    public let `prefix`: String
    /// Custom endpoint for S3-compatible storage.
    public let endpoint: String

    init(
        provider: String,
        bucket: String,
        region: String,
        `prefix`: String,
        endpoint: String
    ) {
        self.provider = provider
        self.bucket = bucket
        self.region = region
        self.`prefix` = `prefix`
        self.endpoint = endpoint
    }

    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        self.provider = try container.decode(String.self, forKey: .provider)
        self.bucket = try container.decode(String.self, forKey: .bucket)
        self.region = try container.decode(String.self, forKey: .region)
        self.`prefix` = try container.decode(String.self, forKey: .`prefix`)
        self.endpoint = try container.decode(String.self, forKey: .endpoint)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encode(provider, forKey: .provider)
        try container.encode(bucket, forKey: .bucket)
        try container.encode(region, forKey: .region)
        try container.encode(`prefix`, forKey: .`prefix`)
        try container.encode(endpoint, forKey: .endpoint)
    }

    public func toMap() -> [String: Any] {
        return [
            "provider": provider as Any,
            "bucket": bucket as Any,
            "region": region as Any,
            "prefix": `prefix` as Any,
            "endpoint": endpoint as Any,
        ]
    }

    public static func from(map: [String: Any]) -> DedicatedDatabaseBackupStorage {
        return DedicatedDatabaseBackupStorage(
            provider: map["provider"] as! String,
            bucket: map["bucket"] as! String,
            region: map["region"] as! String,
            prefix: map["prefix"] as! String,
            endpoint: map["endpoint"] as! String
        )
    }
}
