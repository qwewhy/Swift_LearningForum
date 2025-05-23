//
// UserAddRequest.swift
//
// Generated by openapi-generator
// https://openapi-generator.tech
//

import Foundation
#if canImport(AnyCodable)
import AnyCodable
#endif

public struct UserAddRequest: Codable, JSONEncodable, Hashable {

    public var userAccount: String?
    public var userAvatar: String?
    public var userName: String?
    public var userRole: String?

    public init(userAccount: String? = nil, userAvatar: String? = nil, userName: String? = nil, userRole: String? = nil) {
        self.userAccount = userAccount
        self.userAvatar = userAvatar
        self.userName = userName
        self.userRole = userRole
    }

    public enum CodingKeys: String, CodingKey, CaseIterable {
        case userAccount
        case userAvatar
        case userName
        case userRole
    }

    // Encodable protocol methods

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(userAccount, forKey: .userAccount)
        try container.encodeIfPresent(userAvatar, forKey: .userAvatar)
        try container.encodeIfPresent(userName, forKey: .userName)
        try container.encodeIfPresent(userRole, forKey: .userRole)
    }
}

