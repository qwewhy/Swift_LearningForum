//
// QuestionVO.swift
//
// Generated by openapi-generator
// https://openapi-generator.tech
//

import Foundation
#if canImport(AnyCodable)
import AnyCodable
#endif

public struct QuestionVO: Codable, JSONEncodable, Hashable {

    public var answer: String?
    public var content: String?
    public var createTime: Date?
    public var id: String?
    public var tagList: [String]?
    public var title: String?
    public var updateTime: Date?
    public var user: UserVO?
    public var userId: String?

    public init(answer: String? = nil, content: String? = nil, createTime: Date? = nil, id: String? = nil, tagList: [String]? = nil, title: String? = nil, updateTime: Date? = nil, user: UserVO? = nil, userId: String? = nil) {
        self.answer = answer
        self.content = content
        self.createTime = createTime
        self.id = id
        self.tagList = tagList
        self.title = title
        self.updateTime = updateTime
        self.user = user
        self.userId = userId
    }

    public enum CodingKeys: String, CodingKey, CaseIterable {
        case answer
        case content
        case createTime
        case id
        case tagList
        case title
        case updateTime
        case user
        case userId
    }

    // Encodable protocol methods

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(answer, forKey: .answer)
        try container.encodeIfPresent(content, forKey: .content)
        try container.encodeIfPresent(createTime, forKey: .createTime)
        try container.encodeIfPresent(id, forKey: .id)
        try container.encodeIfPresent(tagList, forKey: .tagList)
        try container.encodeIfPresent(title, forKey: .title)
        try container.encodeIfPresent(updateTime, forKey: .updateTime)
        try container.encodeIfPresent(user, forKey: .user)
        try container.encodeIfPresent(userId, forKey: .userId)
    }
}


@available(iOS 13, tvOS 13, watchOS 6, macOS 10.15, *)
extension QuestionVO: Identifiable {}
