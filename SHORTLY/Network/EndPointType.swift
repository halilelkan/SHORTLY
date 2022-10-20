//
//  EndPointType.swift
//  SHORTLY
//
//  Created by halil ibrahim Elkan on 20.07.2022.
//

import Foundation

enum EndpointType {
    
    case shorten(link: String)
    case info(link: String)
    
    var endpoint: String{
        switch self {
        case .shorten(let link):
            return "shorten?url="+link
        case .info(let link):
            return "info?code="+link
        }
    }
    
    var method: HttpMethod {
        switch self {
        case .shorten:
            return .GET
        case .info:
            return .GET
        }
    }
    
}
