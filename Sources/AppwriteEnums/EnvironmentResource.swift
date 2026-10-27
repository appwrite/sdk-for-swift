import Foundation

public enum EnvironmentResource: String, Codable, CustomStringConvertible {
    case user = "user"
    case team = "team"
    case membership = "membership"
    case authMethods = "auth-methods"
    case policies = "policies"
    case oauth2Provider = "oauth2-provider"
    case database = "database"
    case documentsdb = "documentsdb"
    case vectorsdb = "vectorsdb"
    case table = "table"
    case collection = "collection"
    case column = "column"
    case attribute = "attribute"
    case index = "index"
    case row = "row"
    case document = "document"
    case bucket = "bucket"
    case file = "file"
    case function = "function"
    case environmentVariable = "environment-variable"
    case deployment = "deployment"
    case site = "site"
    case siteVariable = "site-variable"
    case siteDeployment = "site-deployment"
    case provider = "provider"
    case topic = "topic"
    case subscriber = "subscriber"
    case platform = "platform"
    case smtp = "smtp"
    case projectVariable = "project-variable"
    case projectProtocols = "project-protocols"
    case projectLabels = "project-labels"
    case projectServices = "project-services"
    case projectEmailTemplate = "project-email-template"

    public var description: String {
        return rawValue
    }
}
