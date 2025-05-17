import Foundation

public enum Framework: String, CustomStringConvertible {
    case analog = "analog"
    case angular = "angular"
    case nextjs = "nextjs"
    case react = "react"
    case nuxt = "nuxt"
    case vue = "vue"
    case sveltekit = "sveltekit"
    case astro = "astro"
    case remix = "remix"
    case lynx = "lynx"
    case flutter = "flutter"
    case reactNative = "react-native"
    case vite = "vite"
    case other = "other"

    public var description: String {
        return rawValue
    }
}
