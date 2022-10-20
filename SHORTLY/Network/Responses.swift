//
//  Responses.swift
//  SHORTLY
//
//  Created by halil ibrahim Elkan on 20.07.2022.
//

import Foundation

struct BaseResponse<T: Decodable> : Decodable {
    let ok: Bool?
    let result: T?
    let error: String?
    let error_code: Int?
}

struct shortLinkResponse: Decodable {
    let code: String?
    let short_link: String?
    let original_link: String?
}

struct CustomError: Error {
    let message: String
}
