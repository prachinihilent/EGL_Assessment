//
//  NetworkConstants.swift
//  EGL_Assessment
//
//  Created by Prachi Rajput on 12/12/22.
//

import Foundation

enum EnvironmentKeys: String {
    case production = "Production"
    case dev = "Dev"
    case preprod = "PreProd"
}

struct APIPath {
    static let getData = "https://run.mocky.io/v3/2f06b453-8375-43cf-861a-06e95a951328"
}

struct NetworkConstants {
    var method = "get"

    static func getUrl(url: String) -> URL? {
        if let baseUrl = getBaseUrl(envId: EnvironmentKeys.dev.rawValue),
            let url = URL(string: "\(baseUrl)\(url)") {
            return url
        }
        return URL(string: "")
    }
    
    static func getBaseUrl(envId: String) -> String? {
        switch envId.lowercased() {
        case "production": return ""
        case "preprod": return ""
        case "dev": return ""
        default:
            return ""
        }
    }
    static var currentEnvironmentID: String {
        return EnvironmentKeys.dev.rawValue
    }
}

