import Foundation
import JSONCodable

/// EmailTemplate
open class EmailTemplate: Codable {

    enum CodingKeys: String, CodingKey {
        case templateId = "templateId"
        case locale = "locale"
        case message = "message"
        case senderName = "senderName"
        case senderEmail = "senderEmail"
        case replyToEmail = "replyToEmail"
        case replyToName = "replyToName"
        case subject = "subject"
    }

    /// Template type
    public let templateId: String
    /// Template locale
    public let locale: String
    /// Template message
    public let message: String
    /// Name of the sender
    public let senderName: String
    /// Email of the sender
    public let senderEmail: String
    /// Reply to email address
    public let replyToEmail: String
    /// Reply to name
    public let replyToName: String
    /// Email subject
    public let subject: String

    init(
        templateId: String,
        locale: String,
        message: String,
        senderName: String,
        senderEmail: String,
        replyToEmail: String,
        replyToName: String,
        subject: String
    ) {
        self.templateId = templateId
        self.locale = locale
        self.message = message
        self.senderName = senderName
        self.senderEmail = senderEmail
        self.replyToEmail = replyToEmail
        self.replyToName = replyToName
        self.subject = subject
    }

    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        self.templateId = try container.decode(String.self, forKey: .templateId)
        self.locale = try container.decode(String.self, forKey: .locale)
        self.message = try container.decode(String.self, forKey: .message)
        self.senderName = try container.decode(String.self, forKey: .senderName)
        self.senderEmail = try container.decode(String.self, forKey: .senderEmail)
        self.replyToEmail = try container.decode(String.self, forKey: .replyToEmail)
        self.replyToName = try container.decode(String.self, forKey: .replyToName)
        self.subject = try container.decode(String.self, forKey: .subject)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encode(templateId, forKey: .templateId)
        try container.encode(locale, forKey: .locale)
        try container.encode(message, forKey: .message)
        try container.encode(senderName, forKey: .senderName)
        try container.encode(senderEmail, forKey: .senderEmail)
        try container.encode(replyToEmail, forKey: .replyToEmail)
        try container.encode(replyToName, forKey: .replyToName)
        try container.encode(subject, forKey: .subject)
    }

    public func toMap() -> [String: Any] {
        return [
            "templateId": templateId as Any,
            "locale": locale as Any,
            "message": message as Any,
            "senderName": senderName as Any,
            "senderEmail": senderEmail as Any,
            "replyToEmail": replyToEmail as Any,
            "replyToName": replyToName as Any,
            "subject": subject as Any
        ]
    }

    public static func from(map: [String: Any] ) -> EmailTemplate {
        return EmailTemplate(
            templateId: map["templateId"] as! String,
            locale: map["locale"] as! String,
            message: map["message"] as! String,
            senderName: map["senderName"] as! String,
            senderEmail: map["senderEmail"] as! String,
            replyToEmail: map["replyToEmail"] as! String,
            replyToName: map["replyToName"] as! String,
            subject: map["subject"] as! String
        )
    }
}
