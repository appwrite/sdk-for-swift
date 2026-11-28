import Foundation

public enum AnalyticsDimension: String, Codable, CustomStringConvertible {
    case country = "country"
    case region = "region"
    case city = "city"
    case browser = "browser"
    case browserVersion = "browserVersion"
    case operatingSystem = "operatingSystem"
    case operatingSystemVersion = "operatingSystemVersion"
    case device = "device"
    case screenSize = "screenSize"
    case referrerSource = "referrerSource"
    case channel = "channel"
    case utmSource = "utmSource"
    case utmMedium = "utmMedium"
    case utmCampaign = "utmCampaign"
    case utmContent = "utmContent"
    case utmTerm = "utmTerm"
    case page = "page"
    case hostname = "hostname"
    case entryPage = "entryPage"
    case exitPage = "exitPage"
    case trafficType = "trafficType"
    case botName = "botName"
    case botCategory = "botCategory"
    case userId = "userId"
    case eventName = "eventName"
    case props = "props"

    public var description: String {
        return rawValue
    }
}
