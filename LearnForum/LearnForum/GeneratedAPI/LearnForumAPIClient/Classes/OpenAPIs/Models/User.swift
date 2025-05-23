//
// User.swift
//
// Generated by openapi-generator
// https://openapi-generator.tech
//

import Foundation
#if canImport(AnyCodable)
import AnyCodable
#endif

public struct User: Codable, JSONEncodable, Hashable {

    public var createTime: Date?
    public var editTime: Date?
    public var id: Int64?
    public var isDelete: Int?
    public var mpOpenId: String?
    public var unionId: String?
    public var updateTime: Date?
    public var userAccount: String?
    public var userAvatar: String?
    public var userName: String?
    public var userPassword: String?
    public var userProfile: String?
    public var userRole: String?
    public var vipCode: String?
    public var vipExpireTime: Date?
    public var vipNumber: Int64?

    public init(createTime: Date? = nil, editTime: Date? = nil, id: Int64? = nil, isDelete: Int? = nil, mpOpenId: String? = nil, unionId: String? = nil, updateTime: Date? = nil, userAccount: String? = nil, userAvatar: String? = nil, userName: String? = nil, userPassword: String? = nil, userProfile: String? = nil, userRole: String? = nil, vipCode: String? = nil, vipExpireTime: Date? = nil, vipNumber: Int64? = nil) {
        self.createTime = createTime
        self.editTime = editTime
        self.id = id
        self.isDelete = isDelete
        self.mpOpenId = mpOpenId
        self.unionId = unionId
        self.updateTime = updateTime
        self.userAccount = userAccount
        self.userAvatar = userAvatar
        self.userName = userName
        self.userPassword = userPassword
        self.userProfile = userProfile
        self.userRole = userRole
        self.vipCode = vipCode
        self.vipExpireTime = vipExpireTime
        self.vipNumber = vipNumber
    }

    public enum CodingKeys: String, CodingKey, CaseIterable {
        case createTime
        case editTime
        case id
        case isDelete
        case mpOpenId
        case unionId
        case updateTime
        case userAccount
        case userAvatar
        case userName
        case userPassword
        case userProfile
        case userRole
        case vipCode
        case vipExpireTime
        case vipNumber
    }

    // Encodable protocol methods

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(createTime, forKey: .createTime)
        try container.encodeIfPresent(editTime, forKey: .editTime)
        try container.encodeIfPresent(id, forKey: .id)
        try container.encodeIfPresent(isDelete, forKey: .isDelete)
        try container.encodeIfPresent(mpOpenId, forKey: .mpOpenId)
        try container.encodeIfPresent(unionId, forKey: .unionId)
        try container.encodeIfPresent(updateTime, forKey: .updateTime)
        try container.encodeIfPresent(userAccount, forKey: .userAccount)
        try container.encodeIfPresent(userAvatar, forKey: .userAvatar)
        try container.encodeIfPresent(userName, forKey: .userName)
        try container.encodeIfPresent(userPassword, forKey: .userPassword)
        try container.encodeIfPresent(userProfile, forKey: .userProfile)
        try container.encodeIfPresent(userRole, forKey: .userRole)
        try container.encodeIfPresent(vipCode, forKey: .vipCode)
        try container.encodeIfPresent(vipExpireTime, forKey: .vipExpireTime)
        try container.encodeIfPresent(vipNumber, forKey: .vipNumber)
    }
}


@available(iOS 13, tvOS 13, watchOS 6, macOS 10.15, *)
extension User: Identifiable {}
